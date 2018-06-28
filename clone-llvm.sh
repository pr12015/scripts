#!bin/sh

# script for cloning the llvm project in current directory.
echo -e "\034Cloning the LLVM project..."
git clone --depth=1 https://llvm.org/git/llvm.git

cd llvm
pushd ./
cd tools

# clone clang.
git clone --depth=1 https://llvm.org/git/clang.git

# clone lld.
git clone --depth=1 https://llvm.org/git/lld.git

# clone clang-tools-extra (clang-tidy, clang-format, etc.)
cd clang/tools/
git clone --depth=1 https://llvm.org/git/clang-tools-extra.git extra

popd
cd projects

# clone standart library.
git clone --depth=1 https://llvm.org/git/libcxx.git
git clone --depth=1 https://llvm.org/git/libcxxabi.git
git clone --depth=1 https://llvm.org/git/compiler-rt.git

echo -e "\032Done cloning."

