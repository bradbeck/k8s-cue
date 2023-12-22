// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go reflect

// Package reflect implements run-time reflection, allowing a program to
// manipulate objects with arbitrary types. The typical use is to take a value
// with static type interface{} and extract its dynamic type information by
// calling TypeOf, which returns a Type.
//
// A call to ValueOf returns a Value representing the run-time data.
// Zero takes a Type and returns a Value representing a zero value
// for that type.
//
// See "The Laws of Reflection" for an introduction to reflection in Go:
// https://golang.org/doc/articles/laws_of_reflection.html
package reflect

import "internal/abi"

// Type is the representation of a Go type.
//
// Not all methods apply to all kinds of types. Restrictions,
// if any, are noted in the documentation for each method.
// Use the Kind method to find out the kind of type before
// calling kind-specific methods. Calling a method
// inappropriate to the kind of type causes a run-time panic.
//
// Type values are comparable, such as with the == operator,
// so they can be used as map keys.
// Two Type values are equal if they represent identical types.
#Type: _

// A Kind represents the specific kind of type that a Type represents.
// The zero Kind is not a valid kind.
#Kind: uint // #enumKind

#enumKind:
	#Invalid |
	#Bool |
	#Int |
	#Int8 |
	#Int16 |
	#Int32 |
	#Int64 |
	#Uint |
	#Uint8 |
	#Uint16 |
	#Uint32 |
	#Uint64 |
	#Uintptr |
	#Float32 |
	#Float64 |
	#Complex64 |
	#Complex128 |
	#Array |
	#Chan |
	#Func |
	#Interface |
	#Map |
	#Pointer |
	#Slice |
	#String |
	#Struct |
	#UnsafePointer |
	#Ptr

#values_Kind: {
	Invalid:       #Invalid
	Bool:          #Bool
	Int:           #Int
	Int8:          #Int8
	Int16:         #Int16
	Int32:         #Int32
	Int64:         #Int64
	Uint:          #Uint
	Uint8:         #Uint8
	Uint16:        #Uint16
	Uint32:        #Uint32
	Uint64:        #Uint64
	Uintptr:       #Uintptr
	Float32:       #Float32
	Float64:       #Float64
	Complex64:     #Complex64
	Complex128:    #Complex128
	Array:         #Array
	Chan:          #Chan
	Func:          #Func
	Interface:     #Interface
	Map:           #Map
	Pointer:       #Pointer
	Slice:         #Slice
	String:        #String
	Struct:        #Struct
	UnsafePointer: #UnsafePointer
	Ptr:           #Ptr
}

#Invalid:       #Kind & 0
#Bool:          #Kind & 1
#Int:           #Kind & 2
#Int8:          #Kind & 3
#Int16:         #Kind & 4
#Int32:         #Kind & 5
#Int64:         #Kind & 6
#Uint:          #Kind & 7
#Uint8:         #Kind & 8
#Uint16:        #Kind & 9
#Uint32:        #Kind & 10
#Uint64:        #Kind & 11
#Uintptr:       #Kind & 12
#Float32:       #Kind & 13
#Float64:       #Kind & 14
#Complex64:     #Kind & 15
#Complex128:    #Kind & 16
#Array:         #Kind & 17
#Chan:          #Kind & 18
#Func:          #Kind & 19
#Interface:     #Kind & 20
#Map:           #Kind & 21
#Pointer:       #Kind & 22
#Slice:         #Kind & 23
#String:        #Kind & 24
#Struct:        #Kind & 25
#UnsafePointer: #Kind & 26

#Ptr: #Kind & 22

// uncommonType is present only for defined types or types with methods
// (if T is a defined type, the uncommonTypes for T and *T have methods).
// Using a pointer to this struct reduces the overall size required
// to describe a non-defined type with no methods.
_#uncommonType: abi.#UncommonType

// Embed this type to get common/uncommon
_#common: {
	Type: abi.#Type
}

_#aNameOff: abi.#NameOff

_#aTypeOff: abi.#TypeOff

_#aTextOff: abi.#TextOff

// ChanDir represents a channel type's direction.
#ChanDir: int // #enumChanDir

#enumChanDir:
	#RecvDir |
	#SendDir |
	#BothDir

#values_ChanDir: {
	RecvDir: #RecvDir
	SendDir: #SendDir
	BothDir: #BothDir
}

#RecvDir: #ChanDir & 1
#SendDir: #ChanDir & 2
#BothDir: #ChanDir & 3

// arrayType represents a fixed array type.
_#arrayType: abi.#ArrayType

// chanType represents a channel type.
_#chanType: abi.#ChanType

// funcType represents a function type.
//
// A *rtype for each in and out parameter is stored in an array that
// directly follows the funcType (and possibly its uncommonType). So
// a function type with one method, one input, and one output is:
//
//	struct {
//		funcType
//		uncommonType
//		[2]*rtype    // [0] is in, [1] is out
//	}
_#funcType: abi.#FuncType

// interfaceType represents an interface type.
_#interfaceType: {
	InterfaceType: abi.#InterfaceType
}

// mapType represents a map type.
_#mapType: {
	MapType: abi.#MapType
}

// ptrType represents a pointer type.
_#ptrType: {
	PtrType: abi.#PtrType
}

// sliceType represents a slice type.
_#sliceType: {
	SliceType: abi.#SliceType
}

// Struct field
_#structField: abi.#StructField

// structType represents a struct type.
_#structType: {
	StructType: abi.#StructType
}

// Method represents a single method.
#Method: {
	// Name is the method name.
	Name: string

	// PkgPath is the package path that qualifies a lower case (unexported)
	// method name. It is empty for upper case (exported) method names.
	// The combination of PkgPath and Name uniquely identifies a method
	// in a method set.
	// See https://golang.org/ref/spec#Uniqueness_of_identifiers
	PkgPath: string
	Type:    #Type
	Index:   int
}

_#kindDirectIface: 32
_#kindGCProg:      64
_#kindMask:        31

// A StructField describes a single field in a struct.
#StructField: {
	// Name is the field name.
	Name: string

	// PkgPath is the package path that qualifies a lower case (unexported)
	// field name. It is empty for upper case (exported) field names.
	// See https://golang.org/ref/spec#Uniqueness_of_identifiers
	PkgPath: string
	Type:    #Type
	Tag:     #StructTag
	Offset:  uint64 @go(,uintptr)
	Index: [...int] @go(,[]int)
	Anonymous: bool
}

// A StructTag is the tag string in a struct field.
//
// By convention, tag strings are a concatenation of
// optionally space-separated key:"value" pairs.
// Each key is a non-empty string consisting of non-control
// characters other than space (U+0020 ' '), quote (U+0022 '"'),
// and colon (U+003A ':').  Each value is quoted using U+0022 '"'
// characters and Go string literal syntax.
#StructTag: string

_#bucketSize: uint64 & 8
_#maxKeySize: uint64 & 128
_#maxValSize: uint64 & 128

_#maxPtrmaskBytes: 2048
