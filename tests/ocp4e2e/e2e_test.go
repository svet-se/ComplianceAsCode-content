package ocp4e2e

import (
	"testing"
	"time"
)

func TestE2e(t *testing.T) {
	ctx := newE2EContext(t)
	t.Run("Parameter setup and validation", func(t *testing.T) {
		ctx.assertRootdir(t)
		ctx.assertProfile(t)
		ctx.assertContentImage(t)
		ctx.assertKubeClient(t)
	})

	t.Run("Operator setup", func(t *testing.T) {
		ctx.ensureNamespaceExistsAndSet(t)
		if ctx.installOperator {
			ctx.ensureCatalogSourceExists(t)
			ctx.ensureOperatorGroupExists(t)
			ctx.ensureSubscriptionExists(t)
			ctx.waitForOperatorToBeReady(t)
		} else {
			t.Logf("Skipping operator install as requested")
		}
		ctx.resetClientMappings()
	})

	t.Run("Prereqs setup", func(t *testing.T) {
		ctx.ensureTestProfileBundle(t)
		ctx.ensureTestSettings(t)
	})

	// Remediations
	var numberOfRemediations int

	// Failures
	var numberOfFailuresInit int
	var numberOfFailuresEnd int

	// Check Results
	var numberOfCheckResultsInit int
	var numberOfCheckResultsEnd int

	// Invalid check results
	var numberOfInvalidResults int

	// suite name
	var suite string

	var manualRemediations []string

	t.Run("Run first compliance scan", func(t *testing.T) {
		// Create suite and auto-apply remediations
		suite = ctx.createBindingForProfile(t)
		ctx.waitForComplianceSuite(t, suite)
		numberOfRemediations = ctx.getRemediationsForSuite(t, suite)
		numberOfFailuresInit = ctx.getFailuresForSuite(t, suite)
		numberOfCheckResultsInit, manualRemediations = ctx.verifyCheckResultsForSuite(t, suite, false)
		numberOfInvalidResults = ctx.getInvalidResultsFromSuite(t, suite)
	})

	if numberOfRemediations > 0 || len(manualRemediations) > 0 {
		if len(manualRemediations) > 0 {
			t.Run("Apply manual remediations", func(t *testing.T) {
				ctx.applyManualRemediations(t, manualRemediations)
			})
		}
		t.Run("Wait for Remediations to apply", func(t *testing.T) {
			// Lets wait for the MachineConfigs to start applying
			time.Sleep(30 * time.Second)
			ctx.waitForMachinePoolUpdate(t, "master")
			ctx.waitForMachinePoolUpdate(t, "worker")
		})

		t.Run("Run second compliance scan", func(t *testing.T) {
			ctx.doRescan(t, suite)
			ctx.waitForComplianceSuite(t, suite)
			numberOfFailuresEnd = ctx.getFailuresForSuite(t, suite)
			numberOfCheckResultsEnd, _ = ctx.verifyCheckResultsForSuite(t, suite, true)
		})

		t.Run("We should have the same number of check results in each scan", func(t *testing.T) {
			if numberOfCheckResultsInit != numberOfCheckResultsEnd {
				t.Errorf("The amount of check results are NOT the same: init -> %d  end %d",
					numberOfCheckResultsInit, numberOfCheckResultsEnd)
			} else {
				t.Logf("There amount of check results are the same: init -> %d  end %d",
					numberOfCheckResultsInit, numberOfCheckResultsEnd)
			}
		})

		t.Run("We should have less failures", func(t *testing.T) {
			if numberOfFailuresInit <= numberOfFailuresEnd {
				t.Errorf("The failures didn't diminish: init -> %d  end %d",
					numberOfFailuresInit, numberOfFailuresEnd)
			} else {
				t.Logf("There are less failures now: init -> %d  end %d",
					numberOfFailuresInit, numberOfFailuresEnd)
			}
		})
	} else {
		t.Logf("No remediations were generated from this profile")
	}

	t.Run("We should have no errors or invalid results", func(t *testing.T) {
		if numberOfInvalidResults > 0 {
			t.Errorf("Expected Pass, Fail, Info, or Skip results from platform scans. Got %d Error/None results", numberOfInvalidResults)
		}
	})
}
