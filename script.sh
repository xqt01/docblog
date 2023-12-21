#!/bin/bash

# 指定文件夹路径
folder_path="docs"

# 获取文件夹中所有文件名，并按文件名进行降序排序
sorted_file_names=$(ls "$folder_path" | sort -r)

# 打开README文件，将文件名按顺序写入时间线标签下
sed -i '' '/## Timeline/,$d' README.md
echo "## Timeline" >> README.md
for file_name in $sorted_file_names;
do
  file_name_without_extension="${file_name%.*}"
  echo "- [$file_name_without_extension](./docs/$file_name)" >> README.md
done