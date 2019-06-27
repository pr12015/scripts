#!bin/bash

# Get needed tools, clone llvm (branch optional)
# build Release+Asserts

BLUE="\e[34m"
GREEN="\e[32m"
END="\e[0m"

cd ~

read -p "Enter branch name: " branch
mkdir $branch
cd $branch

sudo apt-get -y update

sudo apt-get -y install gcc\
	             g++\
		     cmake\
		     cmake-curses-gui\
		     clang-7\
		     ninja-build\
                     gdb\
                     python\
                     python-pip

clear
echo -e "${BLUE}Cloning $branch branch.${END}"
echo

git clone --single-branch --branch $branch https://github.com/sstefan1/llvm-project.git

mkdir release+assert
cd release+assert

read -p "Build clang? (Y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cmake -G Ninja -DLLVM_ENABLE_PROJECTS='clang' -DLLVM_ENABLE_ASSERTIONS=ON \
                   -DCMAKE_CXX_COMPILER=clang++-7 -DCMAKE_BUILD_TYPE=Release ../llvm-project/llvm
else
    cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++-7 -DCMAKE_ENALE_ASSERTIONS=ON \
                   -DCMAKE_BUILD_TYPE=Release ../llvm-project/llvm
fi

clear
echo -e "${GREEN}CMake done!${END}"
echo
echo -e "${BLUE}Build started...${END}"

ninja

cd ~
git clone https://github.com/llvm/llvm-test-suite.git
git clone https://github.com/llvm/llvm-lnt.git
