package policy

import (
	kyvernoV1 "github.com/kyverno/kyverno/api/kyverno/v1"
)

clusterPolicy?: [Name=_]: kyvernoV1.#ClusterPolicy & {
	apiVersion: "kyverno.io/v1"
	kind:       "ClusterPolicy"
	metadata: name: *Name | string
}

clusterPolicy: "attest-image": {}

// examplePolicy?: [Name=_]: {
//     apiVersion: "example.org/v1"
//     kind: "ExamplePolicy"
//     metadata: name: *Name | string
// }

// examplePolicy: "attest-image": {}
