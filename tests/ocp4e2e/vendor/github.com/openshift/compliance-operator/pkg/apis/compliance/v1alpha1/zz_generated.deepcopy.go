// +build !ignore_autogenerated

// Code generated by operator-sdk. DO NOT EDIT.

package v1alpha1

import (
	runtime "k8s.io/apimachinery/pkg/runtime"
)

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceRemediation) DeepCopyInto(out *ComplianceRemediation) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ObjectMeta.DeepCopyInto(&out.ObjectMeta)
	in.Spec.DeepCopyInto(&out.Spec)
	out.Status = in.Status
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceRemediation.
func (in *ComplianceRemediation) DeepCopy() *ComplianceRemediation {
	if in == nil {
		return nil
	}
	out := new(ComplianceRemediation)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyObject is an autogenerated deepcopy function, copying the receiver, creating a new runtime.Object.
func (in *ComplianceRemediation) DeepCopyObject() runtime.Object {
	if c := in.DeepCopy(); c != nil {
		return c
	}
	return nil
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceRemediationList) DeepCopyInto(out *ComplianceRemediationList) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ListMeta.DeepCopyInto(&out.ListMeta)
	if in.Items != nil {
		in, out := &in.Items, &out.Items
		*out = make([]ComplianceRemediation, len(*in))
		for i := range *in {
			(*in)[i].DeepCopyInto(&(*out)[i])
		}
	}
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceRemediationList.
func (in *ComplianceRemediationList) DeepCopy() *ComplianceRemediationList {
	if in == nil {
		return nil
	}
	out := new(ComplianceRemediationList)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyObject is an autogenerated deepcopy function, copying the receiver, creating a new runtime.Object.
func (in *ComplianceRemediationList) DeepCopyObject() runtime.Object {
	if c := in.DeepCopy(); c != nil {
		return c
	}
	return nil
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceRemediationNameStatus) DeepCopyInto(out *ComplianceRemediationNameStatus) {
	*out = *in
	out.ComplianceRemediationSpecMeta = in.ComplianceRemediationSpecMeta
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceRemediationNameStatus.
func (in *ComplianceRemediationNameStatus) DeepCopy() *ComplianceRemediationNameStatus {
	if in == nil {
		return nil
	}
	out := new(ComplianceRemediationNameStatus)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceRemediationSpec) DeepCopyInto(out *ComplianceRemediationSpec) {
	*out = *in
	out.ComplianceRemediationSpecMeta = in.ComplianceRemediationSpecMeta
	in.MachineConfigContents.DeepCopyInto(&out.MachineConfigContents)
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceRemediationSpec.
func (in *ComplianceRemediationSpec) DeepCopy() *ComplianceRemediationSpec {
	if in == nil {
		return nil
	}
	out := new(ComplianceRemediationSpec)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceRemediationSpecMeta) DeepCopyInto(out *ComplianceRemediationSpecMeta) {
	*out = *in
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceRemediationSpecMeta.
func (in *ComplianceRemediationSpecMeta) DeepCopy() *ComplianceRemediationSpecMeta {
	if in == nil {
		return nil
	}
	out := new(ComplianceRemediationSpecMeta)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceRemediationStatus) DeepCopyInto(out *ComplianceRemediationStatus) {
	*out = *in
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceRemediationStatus.
func (in *ComplianceRemediationStatus) DeepCopy() *ComplianceRemediationStatus {
	if in == nil {
		return nil
	}
	out := new(ComplianceRemediationStatus)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceScan) DeepCopyInto(out *ComplianceScan) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ObjectMeta.DeepCopyInto(&out.ObjectMeta)
	in.Spec.DeepCopyInto(&out.Spec)
	out.Status = in.Status
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceScan.
func (in *ComplianceScan) DeepCopy() *ComplianceScan {
	if in == nil {
		return nil
	}
	out := new(ComplianceScan)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyObject is an autogenerated deepcopy function, copying the receiver, creating a new runtime.Object.
func (in *ComplianceScan) DeepCopyObject() runtime.Object {
	if c := in.DeepCopy(); c != nil {
		return c
	}
	return nil
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceScanList) DeepCopyInto(out *ComplianceScanList) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ListMeta.DeepCopyInto(&out.ListMeta)
	if in.Items != nil {
		in, out := &in.Items, &out.Items
		*out = make([]ComplianceScan, len(*in))
		for i := range *in {
			(*in)[i].DeepCopyInto(&(*out)[i])
		}
	}
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceScanList.
func (in *ComplianceScanList) DeepCopy() *ComplianceScanList {
	if in == nil {
		return nil
	}
	out := new(ComplianceScanList)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyObject is an autogenerated deepcopy function, copying the receiver, creating a new runtime.Object.
func (in *ComplianceScanList) DeepCopyObject() runtime.Object {
	if c := in.DeepCopy(); c != nil {
		return c
	}
	return nil
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceScanSpec) DeepCopyInto(out *ComplianceScanSpec) {
	*out = *in
	if in.NodeSelector != nil {
		in, out := &in.NodeSelector, &out.NodeSelector
		*out = make(map[string]string, len(*in))
		for key, val := range *in {
			(*out)[key] = val
		}
	}
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceScanSpec.
func (in *ComplianceScanSpec) DeepCopy() *ComplianceScanSpec {
	if in == nil {
		return nil
	}
	out := new(ComplianceScanSpec)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceScanSpecWrapper) DeepCopyInto(out *ComplianceScanSpecWrapper) {
	*out = *in
	in.ComplianceScanSpec.DeepCopyInto(&out.ComplianceScanSpec)
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceScanSpecWrapper.
func (in *ComplianceScanSpecWrapper) DeepCopy() *ComplianceScanSpecWrapper {
	if in == nil {
		return nil
	}
	out := new(ComplianceScanSpecWrapper)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceScanStatus) DeepCopyInto(out *ComplianceScanStatus) {
	*out = *in
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceScanStatus.
func (in *ComplianceScanStatus) DeepCopy() *ComplianceScanStatus {
	if in == nil {
		return nil
	}
	out := new(ComplianceScanStatus)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceScanStatusWrapper) DeepCopyInto(out *ComplianceScanStatusWrapper) {
	*out = *in
	out.ComplianceScanStatus = in.ComplianceScanStatus
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceScanStatusWrapper.
func (in *ComplianceScanStatusWrapper) DeepCopy() *ComplianceScanStatusWrapper {
	if in == nil {
		return nil
	}
	out := new(ComplianceScanStatusWrapper)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceSuite) DeepCopyInto(out *ComplianceSuite) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ObjectMeta.DeepCopyInto(&out.ObjectMeta)
	in.Spec.DeepCopyInto(&out.Spec)
	in.Status.DeepCopyInto(&out.Status)
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceSuite.
func (in *ComplianceSuite) DeepCopy() *ComplianceSuite {
	if in == nil {
		return nil
	}
	out := new(ComplianceSuite)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyObject is an autogenerated deepcopy function, copying the receiver, creating a new runtime.Object.
func (in *ComplianceSuite) DeepCopyObject() runtime.Object {
	if c := in.DeepCopy(); c != nil {
		return c
	}
	return nil
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceSuiteList) DeepCopyInto(out *ComplianceSuiteList) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ListMeta.DeepCopyInto(&out.ListMeta)
	if in.Items != nil {
		in, out := &in.Items, &out.Items
		*out = make([]ComplianceSuite, len(*in))
		for i := range *in {
			(*in)[i].DeepCopyInto(&(*out)[i])
		}
	}
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceSuiteList.
func (in *ComplianceSuiteList) DeepCopy() *ComplianceSuiteList {
	if in == nil {
		return nil
	}
	out := new(ComplianceSuiteList)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyObject is an autogenerated deepcopy function, copying the receiver, creating a new runtime.Object.
func (in *ComplianceSuiteList) DeepCopyObject() runtime.Object {
	if c := in.DeepCopy(); c != nil {
		return c
	}
	return nil
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceSuiteSpec) DeepCopyInto(out *ComplianceSuiteSpec) {
	*out = *in
	if in.Scans != nil {
		in, out := &in.Scans, &out.Scans
		*out = make([]ComplianceScanSpecWrapper, len(*in))
		for i := range *in {
			(*in)[i].DeepCopyInto(&(*out)[i])
		}
	}
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceSuiteSpec.
func (in *ComplianceSuiteSpec) DeepCopy() *ComplianceSuiteSpec {
	if in == nil {
		return nil
	}
	out := new(ComplianceSuiteSpec)
	in.DeepCopyInto(out)
	return out
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *ComplianceSuiteStatus) DeepCopyInto(out *ComplianceSuiteStatus) {
	*out = *in
	if in.ScanStatuses != nil {
		in, out := &in.ScanStatuses, &out.ScanStatuses
		*out = make([]ComplianceScanStatusWrapper, len(*in))
		copy(*out, *in)
	}
	if in.RemediationOverview != nil {
		in, out := &in.RemediationOverview, &out.RemediationOverview
		*out = make([]ComplianceRemediationNameStatus, len(*in))
		copy(*out, *in)
	}
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new ComplianceSuiteStatus.
func (in *ComplianceSuiteStatus) DeepCopy() *ComplianceSuiteStatus {
	if in == nil {
		return nil
	}
	out := new(ComplianceSuiteStatus)
	in.DeepCopyInto(out)
	return out
}
