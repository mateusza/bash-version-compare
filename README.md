# bash-version-compare

Bash function to compare version string using [Semantic Versioning](https://semver.org/)

## Usage

```
version_compare 5.1 gt 2.6 && echo OK   # OK
version_compare 5.1 ge 5.1 && echo OK   # OK
version_compare 1.1 lt 2.6 && echo OK   # nope
```
