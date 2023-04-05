#!/usr/bin/env python

# run this script to update your existing chats if you change section markers in your config
# use like `./contrib/update-markers.py ~/notes/ai-chats`

import os
import sys

if len(sys.argv) < 2:
    print("Please provide directory path as parameter")
    sys.exit(1)

old_section_markers = [
    "<!--​ 🔧 settings ​-->",
    "<!--​ 💻 system ​-->",
    "<!--​ 👤 user ​-->",
    "<!--​ 💁 assistant ​-->",
]
new_section_markers = [
    "## ​ 🔧 settings",
    "## ​ 💻 system",
    "## ​ 👤 user",
    "## ​ 💁 assistant",
]

for i in range(len(old_section_markers)):
    for root, dirs, files in os.walk(sys.argv[1]):
        for file in files:
            file_path = os.path.join(root, file)
            with open(file_path, 'r') as f:
                contents = f.read()
            contents = contents.replace(old_section_markers[i], new_section_markers[i])
            with open(file_path, 'w') as f:
                f.write(contents)
