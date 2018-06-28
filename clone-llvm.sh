#!bin/bash

file=./get-tools.sh

# default colors are set for linux-gnu
OS="unknown"
RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
END_COLOR="\e[0m"
E='-e'

# Check OS.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo $E "${GREEN}Linux-GNU detected${END_COLOR}"
	OS="linux"
elif [[ $OSTYPE =~ darwin. ]]; then
	E=''
	OS="darwin"
	RED="[31m"
	BLUE="[34m"
	GREEN="[32m"
	END_COLOR="[0m"
	echo $E "${GREEN}OSX darwin detected${END_COLOR}"
else
	echo $E "OS not supported"
    echo "$OSTYPE"
fi

# Check if tools are needed.
file=./get-tools.sh
if [[ -e "$file" ]]; then
	bash $file
else
	echo $E "${RED}get-tools.sh not found.${END_COLOR}"
fi

# script for cloning the llvm project in current directory.
echo $E "${BLUE}Cloning the LLVM project...${END_COLOR}"
git clone --depth=1 https://llvm.org/git/llvm.git

cd llvm/tools
echo $PWD
echo $E "${RED}SHOULD BE LLVM/TOOLS${END_COLOR}"

# clone clang.
git clone --depth=1 https://llvm.org/git/clang.git

# clone lld.
git clone --depth=1 https://llvm.org/git/lld.git

# clone clang-tools-extra (clang-tidy, clang-format, etc.)
cd clang/tools/
echo $PWD
echo $E "${RED}SHOULD BE CLANG/TOOLS${END_COLOR}"
git clone --depth=1 https://llvm.org/git/clang-tools-extra.git extra

cd ../../../projects
echo $PWD
echo $E "${RED}SHOULD BE LLVM/PROJECTS${END_COLOR}"

# clone standart library.
git clone --depth=1 https://llvm.org/git/libcxx.git
git clone --depth=1 https://llvm.org/git/libcxxabi.git
git clone --depth=1 https://llvm.org/git/compiler-rt.git

echo $E "${GREEN}Done cloning.${END_COLOR}"

