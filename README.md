# Award Certificates Printer

A sh script to print certificates for some contests.

## How to use

### Install dependencies

- `typst`: a LaTeX alternative, its [package name](https://repology.org/project/typst/versions) hardly vary on different platforms
- Source Han Serif: font used in the template

### Provide a name list

The input file `list.CSV` should be like this:

```text
清小华,三等奖,2024地球中微子暑期学校
华小清,二等奖,2024地球中微子暑期学校
```

### Provide a secret

The secret should be a string, and it should be stored in a file named `secret.txt`, blank characters are ignored.

### (Optional) Modify the template

You may modify `template.typ` to customize the style.

### Run the script

```bash
./generate.sh
```
