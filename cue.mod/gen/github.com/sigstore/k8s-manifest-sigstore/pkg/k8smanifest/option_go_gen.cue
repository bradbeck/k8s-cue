// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/sigstore/k8s-manifest-sigstore/pkg/k8smanifest

package k8smanifest

// option for Sign()
#SignOption: {
}

// option for VerifyResource()
#VerifyResourceOption: {
	skipObjects?: #ObjectReferenceList @go(SkipObjects)
}

// common options for verify functions
// this verifyOption should not be used directly by those functions
_#verifyOption: {
	ignoreFields?: #ObjectFieldBindingList @go(IgnoreFields)
	signers?:      #SignerList             @go(Signers)

	// the maximum number of resource manifests to be checked against single resource. If empty, use 3 as default.
	maxResourceManifestNum?: int @go(MaxResourceManifestNum)
}

// common options
_#commonOption: {
	AnnotationConfig: #AnnotationConfig
}

// cosign sign option
_#cosignSignOption: {
}

// cosign verify option
_#cosignVerifyOption: {
}

// annotation config for signing and verification
#AnnotationConfig: {
	// default "cosign.sigstore.dev"
	annotationKeyDomain?:       string @go(AnnotationKeyDomain)
	resourceBundleRefBaseName?: string @go(ResourceBundleRefBaseName)
	signatureBaseName?:         string @go(SignatureBaseName)
	certificateBaseName?:       string @go(CertificateBaseName)
	messageBaseName?:           string @go(MessageBaseName)
	bundleBaseName?:            string @go(BundleBaseName)
}

#ObjectReference: {
	group?:     string @go(Group)
	version?:   string @go(Version)
	kind?:      string @go(Kind)
	name?:      string @go(Name)
	namespace?: string @go(Namespace)
}

#ObjectReferenceList: [...#ObjectReference]

#ObjectUserBinding: {
	users?: [...string] @go(Users,[]string)
	objects?: #ObjectReferenceList @go(Objects)
}

#ObjectFieldBinding: {
	fields?: [...string] @go(Fields,[]string)
	objects?: #ObjectReferenceList @go(Objects)
}

#ObjectFieldBindingList: [...#ObjectFieldBinding]

#SignerList: [...string]