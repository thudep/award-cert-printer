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

### (Optional) Modify the template

You may modify `template.typ` to customize the style.

### Run the script

There are two ways to run the script. Here are some examples, and you can use `-h` to show the help message.

#### 1. Use the default secret(stored in `secret.txt`) to generate the sha1

Create a `secret.txt` file with the secret in it, then run:

```bash
./generate.sh
```

#### 2. Use a custom secret to generate the sha1

```bash
./generate.sh -s <your_secret>
```
