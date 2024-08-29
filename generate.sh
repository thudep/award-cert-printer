#!/bin/bash

# 创建输出目录
mkdir -p output

contest=$(cat contest.typ)

secret=$(cat secret.txt)

# 读取 list.CSV 文件的每一行
while IFS=',' read -r name prize; do
    # 输出名字到 name.typ
    echo "$name" > name.typ
    
    # 输出奖项到 prize.typ
    echo "$prize" > prize.typ

    # 拼接 name, prize, contest, 和 secret
    combined="${name}${prize}${contest}${secret}"
    
    # 生成 SHA-1 摘要并输出到 fingerprint.typ
    echo -n "$combined" | tr -d '[:space:]' | sha1sum | awk '{print $1}' > fingerprint.typ
    
    # 使用 typst 生成 PDF 文件
    typst compile template.typ "output/${name}.pdf"
done < list.CSV

echo "Completed"
