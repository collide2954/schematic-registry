# Schematic package registry

The index of packages for [Schematic](https://github.com/collide2954/schematic).
Each file in `packages/` describes one package: where its source lives and
which versions exist. Schematic reads these files straight from this
repository over HTTPS when a project asks for a package by name, so there is
nothing to install and nothing to run here.

## Package files

`packages/<name>.scm` holds one map:

```scheme
{:name "text-tools"
 :description "Small helpers for titles and slugs"
 :license "Apache-2.0"
 :git "https://github.com/collide2954/schematic-registry"
 :subdir "examples/text-tools"
 :versions {"0.1.0" {:tag "text-tools/0.1.0"}}}
```

- `:git` is the repository to clone, and `:subdir` narrows it to one folder.
- `:license` is an SPDX expression, such as `"MIT"` or `"MIT OR Apache-2.0"`.
  A project can limit itself to an allowed list of licenses, and a package
  without one is refused there, so say it here and in the package's own
  `project.scm`.
- Every version names a `:tag` or a `:commit`. Schematic records the exact
  commit it checked out, and a hash of the files, in the project's lock file.
- A package is a project: a folder with a `project.scm` manifest and a `src`
  folder of namespaces. Its `:dependencies` come along when it is added.

## The index

`index.scm` is a vector of every package name. The
[packages page](https://collide2954.github.io/schematic/packages.html) on
the Schematic website reads it, then each package file, so a package shows
up there as soon as it is listed.

## Adding a package

Open a pull request that adds `packages/<name>.scm` and puts the name in
`index.scm`. Names use lowercase letters, digits, and hyphens, and match the
`:name` in the package's own `project.scm`.
