#!bin/bash

# Get needed tools, clone llvm (branch optional)
# build Release+Asserts

cd ~

read -p "Enter branch name" branch

sudo apt-get -y update

sudo apt-get -y install gcc\
	             g++\
		     cmake\
		     cmake-curses-gui\
		     clang-7\
		     ninja-build\
                     gdb

git clone --single-branch --branch $branch https://github.com/sstefan1/llvm-project.git

mkdir release+assert
cd release+assert

cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++-7 -DCMAKE_BUILD_TYPE=Release ../llvm-project/llvm

ninja
