# CUE Generation Error

## Generating the Project

```shell
cue mod init github.com/bradbeck/k8s-cue
go mod init github.com/bradbeck/k8s-cue

cat <<EOF > dependencies.go
package policy

// Declared dependencies for CUE code generation.
import (
    _ "github.com/sigstore/k8s-manifest-sigstore/pkg/util/mapnode"
)
EOF

go mod tidy

cue get go github.com/sigstore/k8s-manifest-sigstore/pkg/util/mapnode

cat <<EOF > policy.cue
package policy

import (
    "github.com/sigstore/k8s-manifest-sigstore/pkg/util/mapnode"
)

nodeValue?: [Name=_]: mapnode.#NodeValue & {
    metdata: name: *Name | string
}

nodeValue: "example": {}
EOF
```

## The Error

```shell
$ cue eval
builtin package "reflect" undefined:
    ./cue.mod/gen/github.com/sigstore/k8s-manifest-sigstore/pkg/util/mapnode/node_go_gen.cue:7:8
```

## References

- <https://github.com/cue-lang/cue/issues/648>
