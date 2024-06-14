#!/bin/sh

FILES='./food/**/*.md'

# 1/2
sed -i 's|\([[:digit:]]\)½|\1 1/2|g' $FILES
sed -i 's|½|1/2|g' $FILES

# 1/3
sed -i 's|\([[:digit:]]\)⅓|\1 1/3|g' $FILES
sed -i 's|⅓|1/3|g' $FILES

# 2/3
sed -i 's|\([[:digit:]]\)⅔|\1 2/3|g' $FILES
sed -i 's|⅔|2/3|g' $FILES

# 1/4
sed -i 's|\([[:digit:]]\)¼|\1 1/4|g' $FILES
sed -i 's|¼|1/4|g' $FILES

# 3/4
sed -i 's|\([[:digit:]]\)¾|\1 3/4|g' $FILES
sed -i 's|¾|3/4|g' $FILES

# 1/5
sed -i 's|\([[:digit:]]\)⅕|\1 1/5|g' $FILES
sed -i 's|⅕|1/5|g' $FILES

# 2/5
sed -i 's|\([[:digit:]]\)⅖|\1 2/5|g' $FILES
sed -i 's|⅖|2/5|g' $FILES

# 3/5
sed -i 's|\([[:digit:]]\)⅗|\1 3/5|g' $FILES
sed -i 's|⅗|3/5|g' $FILES

# 4/5
sed -i 's|\([[:digit:]]\)⅘|\1 4/5|g' $FILES
sed -i 's|⅘|4/5|g' $FILES

# 1/6
sed -i 's|\([[:digit:]]\)⅙|\1 1/6|g' $FILES
sed -i 's|⅙|1/6|g' $FILES

# 5/6
sed -i 's|\([[:digit:]]\)⅚|\1 5/6|g' $FILES
sed -i 's|⅚|5/6|g' $FILES

# 1/8
sed -i 's|\([[:digit:]]\)⅛|\1 1/8|g' $FILES
sed -i 's|⅛|1/8|g' $FILES

# 3/8
sed -i 's|\([[:digit:]]\)⅜|\1 3/8|g' $FILES
sed -i 's|⅜|3/8|g' $FILES

# 5/8
sed -i 's|\([[:digit:]]\)⅝|\1 5/8|g' $FILES
sed -i 's|⅝|5/8|g' $FILES

# 7/8
sed -i 's|\([[:digit:]]\)⅞|\1 7/8|g' $FILES
sed -i 's|⅞|7/8|g' $FILES

# ”
sed -i 's|”|"|g' $FILES

# “
sed -i 's|“|"|g' $FILES
