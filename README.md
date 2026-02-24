# hcledit
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub release](https://img.shields.io/github/release/minamijoyo/hcledit.svg)](https://github.com/minamijoyo/hcledit/releases/latest)
[![GoDoc](https://godoc.org/github.com/minamijoyo/hcledit/hcledit?status.svg)](https://godoc.org/github.com/minamijoyo/hcledit)

## Features

- CLI-friendly: Read HCL from stdin, edit and write to stdout, easily pipe and combine other commands
- Token-based edit: You can update lots of existing HCL files with automation scripts without losing comments.
- Schemaless: No dependency on specific HCL application binary or schema
- Support HCL2 (not HCL1)
- Available operations:
  - attribute append/get/rm/set
  - block append/get/list/mv/rm
  - body get
  - fmt

The hcledit focuses on editing HCL with command line, doesn't aim for generic query tools. It was originally born for refactoring Terraform configurations, but it's not limited to specific applications.
The HCL specification is somewhat generic, so usability takes precedence over strictness if there is room for interpreting meanings in the schemaless approach.

## Install

### Homebrew

If you are macOS user:

```
$ brew install minamijoyo/hcledit/hcledit
```

### Download

Download the latest compiled binaries and put it anywhere in your executable path.

https://github.com/minamijoyo/hcledit/releases

### Source

If you have Go 1.18+ development environment:

```
$ git clone https://github.com/minamijoyo/hcledit
$ cd hcledit/
$ make install
$ hcledit version
```

## Usage

```
$ hcledit --help
A command line editor for HCL

Usage:
  hcledit [command]

Available Commands:
  attribute   Edit attribute
  block       Edit block
  body        Edit body
  fmt         Format file
  help        Help about any command
  version     Print version

Flags:
  -f, --file string   A path of input file (default "-")
  -h, --help          help for hcledit
  -u, --update        Update files in-place

Use "hcledit [command] --help" for more information about a command.
```

### attribute

```
$ hcledit attribute --help
Edit attribute

Usage:
  hcledit attribute [flags]
  hcledit attribute [command]

Available Commands:
  append      Append attribute
  get         Get attribute
  rm          Remove attribute
  set         Set attribute

Flags:
  -h, --help   help for attribute

Global Flags:
  -f, --file string   A path of input file (default "-")
  -u, --update        Update files in-place

Use "hcledit attribute [command] --help" for more information about a command.
```

Given the following file:

```attr.hcl
resource "foo" "bar" {
  attr1 = "val1"
  nested {
    attr2 = "val2"
  }
}
```

```
$ cat tmp/attr.hcl | hcledit attribute get resource.foo.bar.nested.attr2
"val2"
```

```
$ cat tmp/attr.hcl | hcledit attribute set resource.foo.bar.nested.attr2 '"val3"'
resource "foo" "bar" {
  attr1 = "val1"
  nested {
    attr2 = "val3"
  }
}
```

```
$ cat tmp/attr.hcl | hcledit attribute rm resource.foo.bar.attr1
resource "foo" "bar" {
  nested {
    attr2 = "val2"
  }
}
```

```
$ cat tmp/attr.hcl | hcledit attribute append resource.foo.bar.nested.attr3 '"val3"' --newline
resource "foo" "bar" {
  attr1 = "val1"
  nested {
    attr2 = "val2"

    attr3 = "val3"
  }
}
```

### block

```
$ hcledit block --help
Edit block

Usage:
  hcledit block [flags]
  hcledit block [command]

Available Commands:
  append      Append block
  get         Get block
  list        List block
  mv          Move block (Rename block type and labels)
  rm          Remove block

Flags:
  -h, --help   help for block

Global Flags:
  -f, --file string   A path of input file (default "-")
  -u, --update        Update files in-place

Use "hcledit block [command] --help" for more information about a command.
```

Given the following file:

```block.hcl
resource "foo" "bar" {
  attr1 = "val1"
}

resource "foo" "baz" {
  attr1 = "val2"
}
```

```
$ cat tmp/block.hcl | hcledit block list
resource.foo.bar
resource.foo.baz
```

```
$ cat tmp/block.hcl | hcledit block get resource.foo.bar
resource "foo" "bar" {
  attr1 = "val1"
}
```

```
$ cat tmp/block.hcl | hcledit block mv resource.foo.bar resource.foo.qux
resource "foo" "qux" {
  attr1 = "val1"
}

resource "foo" "baz" {
  attr1 = "val2"
}
```

```
$ cat tmp/block.hcl | hcledit block rm resource.foo.baz
resource "foo" "bar" {
  attr1 = "val1"
}
```

```
$ cat tmp/block.hcl | hcledit block append resource.foo.bar block1.label1 --newline
resource "foo" "bar" {
  attr1 = "val1"

  block1 "label1" {
  }
}

resource "foo" "baz" {
  attr1 = "val2"
}
```

### body

```
$ hcledit body --help
Edit body

Usage:
  hcledit body [flags]
  hcledit body [command]

Available Commands:
  get         Get body

Flags:
  -h, --help   help for body

Global Flags:
  -f, --file string   A path of input file (default "-")
  -u, --update        Update files in-place

Use "hcledit body [command] --help" for more information about a command.
```

Given the following file:

```body.hcl
resource "foo" "bar" {
  attr1 = "val1"
  nested {
    attr2 = "val2"
  }
}
```

```
$ cat tmp/body.hcl | hcledit body get resource.foo.bar
attr1 = "val1"
nested {
  attr2 = "val2"
}
```

### fmt

```
$ hcledit fmt --help
Format a file to a caconical style

Usage:
  hcledit fmt [flags]

Flags:
  -h, --help   help for fmt

Global Flags:
  -f, --file string   A path of input file (default "-")
  -u, --update        Update files in-place
```

Given the following file:

```
$ cat tmp/fmt.hcl
resource "foo" "bar" {
  attr1 = "val1"
  attr2="val2"
}
```

```
$ cat tmp/fmt.hcl | hcledit fmt
resource "foo" "bar" {
  attr1 = "val1"
  attr2 = "val2"
}
```

## License

MIT
