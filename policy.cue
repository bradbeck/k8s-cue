package policy

import (
    "github.com/sigstore/k8s-manifest-sigstore/pkg/util/mapnode"
)

nodeValue?: [Name=_]: mapnode.#NodeValue & {
    metdata: name: *Name | string
}

nodeValue: "example": {}
