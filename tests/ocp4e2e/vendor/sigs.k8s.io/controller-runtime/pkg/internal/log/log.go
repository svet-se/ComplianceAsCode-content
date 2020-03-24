/*
Copyright 2018 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Package log contains utilities for fetching a new logger
// when one is not already available.
// Deprecated: use pkg/log
package log

import (
	"github.com/go-logr/logr"

	"sigs.k8s.io/controller-runtime/pkg/log"
)

var (
	// RuntimeLog is a base parent logger for use inside controller-runtime.
	RuntimeLog logr.Logger
)

func init() {
	RuntimeLog = log.Log.WithName("controller-runtime")
}
