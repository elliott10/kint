export PATH=/home/chy/secProjects/kint_llvm/llvm-3.1.src/build/Release+Debug+Asserts/bin:$PWD/build/bin:$PATH

# 依赖 LLVM, Clang 3.1 or later
# 删除kint源代码编译系统中, src/Makefile.am "Werror"
# 编译成功后： build/bin

cd ../kint_llvm/tmp/kint-linux
# 配置
make mrproper
make allyesconfig #为了尽可能多地检测内核中的文件
make dep
make clean

# 编译Linux
kint-build make bzImage

#对结果进行求解和收集，结果到pintck.txt
pintck
