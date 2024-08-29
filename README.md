# DEPAwardCertPrinter

A sh script to print certificates for some contests.

## How to use

### Install dependencies

- `typst`: a LaTeX alternative, its [package name](https://repology.org/project/typst/versions) may vary on different platforms
- Source Han Serif: font used in the template

### Provide a name list

The input file should follow this format just like `list.CSV`:

```text
清小华,三等奖
华小清,二等奖
```

### Provide a secret

The secret should be a string, and it should be stored in a file named `secret.txt`, blank characters are ignored.

### (Optional) Modify the template

You may modify `contest.typ` to change the name of the contest.

And you may modify `template.typ` to customize the template.

### Run the script

```bash
./generate.sh
```
