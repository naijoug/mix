# C++

## Reference

- [C++ 参考手册](http://zh.cppreference.com/)

## Compiler

- 编译过程 : 
    * Pre-Processing : 预编译 
        + 去掉#开头程序，保留#pragma
        + 宏替换
        + 去掉注释
        + 头文件包含
        + 添加行号
    * Compiling : 编译
        + 语法分析
        + 词法分析
        + 生成相应的汇编代码
    * Assembling : 汇编
        + 将汇编代码转化为相应的机器语言
    * Linking : 链接
        + 通过调用连接器ld来链接程序运行需要的一大堆目标文件，以及所依赖的其它库文件，最后生成可执行文件

- 编译器

    | 编译器 | 名称 | 自动链接标准STL | 说明
    | --- | --- | --- | ---
    | gcc | GUN C 编译器    | ×    | GCC (GNU Compiler Collection) : GNU 编译器套件    
    | g++ | GUN C++ 编译器  | √    | `g++` = `gcc -xc++ -lstdc++ -shared-libgcc`

- 环境文件对比

    | 文件 | Linux | Windows
    | --- | --- | ---
    | 目标文件 | .o | .obj 
    | 动态库   | .so，DSO (Dynamic Shared Objects) 动态共享对象 | .dll，DLL (Dynamic Linking Library) 动态链接库
    | 静态库   | .lib | .a

- 动态库 & 静态库

    | 类型 | 加载时机 | 程序包体积 | 运行依赖 
    | --- | --- | --- | ---
    | 静态库 | 编译时 | 编译包含静态库文件，体积大     | 不再依赖静态库文件
    | 动态库 | 运行时 | 编译不包含动态库文件，体积小   | 依赖动态库文件

- 编译参数

    | 参数 | 说明
    | --- | ---
    | `-E`      | 只进行预编译，不做其它处理
    | `-S`      | 只编译不汇编，生成汇编代码
    | `-c`      | 只编译不链接，生成目标文件
    | `-g`      | 在可执行程序中包含标准调试信息
    | `-o`      | 指定输出文件
    | `-I`      | 添加头文件搜索路径 (默认：/usr/include/)
    | `-L`      | 添加库文件搜索路径 (默认：/usr/lib/)
    | `-lname`  | 链接名为 `libname.a` 或 `libname.so` 的库文件。两者均存在，根据编译方式(-static 或 -shared) 进行选择
    | `-static` | 进行静态编译(链接静态库)
    | `-shared` | 生成动态库文件 或者 进行动态编译(链接动态库)
    | `-fPIC`   | (Position Independent Code) 使用地址无关代码，可以多进程共享

    ``` bash
    # 编译过程
    #   1> 预处理阶段，生成 .i 文件
    $ gcc -E hello.c -o hello.i 
    #   2> 编译阶段，编译生成 .s 文件
    $ gcc -S hello.i -o hello.s 
    #   3> 汇编阶段，生成目标 .o 文件 
    $ gcc -c hello.s -o hello.o # 方式一
    $ as hello.s -o hello.o     # 方式二：使用汇编器从汇编代码生成目标代码
    #   4> 链接阶段，生成可执行文件
    $ gcc hello.o -o hello      # 生成可执行文件 hello
    # 创建静态库
    $ g++ -c hello.cpp           # 将源文件编译为目标文件
    $ ar -crv libhello.a hello.o  # 使用 ar 工具将目标文件打包成为 .a 静态库文件
    # 创建动态库
    $ g++ -fPIC -shared hello.cpp -o libhello.so
    ```

## `.so`
> 动态库

- 隐式调用 : 只需将动态库文件(.so)放入系统动态库路径(/usr/lib)，包含头文件即可使用
- 显示调用 : 代码中出现库文件名，需要自己去打开和管理库文件
    * 包含 `dlfcn.h` 系统库
    * 使用 `dlopen` 函数打开库文件
    * 使用 `dlerror` 函数测试是否打开成功，并进行错误处理
    * 使用 `dlsym` 函数获得函数地址，存放在一个函数指针中
    * 用获得函数指针进行函数调用
    * 程序结束前，使用 `dlclose` 关闭打开的动态库，释放资源
    * 使用 `dlconfig` 工具将动态库的路径加载到系统库列表中

## extern "C"
> `extern "C"` 声明的函数使用函数名作为符号名(跟 C 函数一样)，不能重载(只有非成员函数才能被声明为 `extern "C"`)，可以被 dlopen 动态加载。

  | 符号名 | 说明
  | -- | --
  | `C`   | 符号名就是函数名
  | `C++` | 允许重载，几乎不可能使用函数名作为符号名，而是使用 `name mangling` (使用函数名和其它信息拼接在一起)

## `const`

  ``` c
  const int a;            // 常量整形
  int const a;            // 同上
  const int *a;           // 指向常量整形的指针 (指针可变，整形不可变)
  int const *a;           // 同上
  int * const a;          // 指向整形的常量指针 (指针不可变，整数可变)
  int const * const a;    // 指向常量整形的常量指针 (指针不可变，整形不可变)
  ```

## C++ 默认参数
> - 如果某个参数是默认参数，那么它后面的参数必须都是默认参数
> - 默认参数可以放在函数声明或者定义中，但只能放在二者之一
> - 函数重载时谨慎使用默认参数值

  ```c++
  int sum(int a, int b = 3, int c = 5) {
  return a + b + c; 
  }
  sum(1);         // 1 + 3 + 5
  sum(1, 2);      // 1 + 2 + 5
  sum(1, 2, 3);   // 1 + 2 + 3
  ```

## Make & CMake

- make : 通过 Makefile 文件进行编译和链接程序 (Makefile 缺陷 : 工程大时手写 Makefile 比较困难，更换平台需要修改 Makefile)

```bash Makefile
# target : prerequisites
# [tab]command

# 1.0 版本
sayHello: main.o hello.o 
	gcc -o sayHello main.o hello.o
main.o: main.c hello.h
	gcc -c main.c
hello.o: hello.c hello.h
	gcc -c hello.c
clean:
	rm sayHello main.o hello.o

# 2.0 版本
objs = main.o hello.o
sayHello: $(objs)
	gcc -o sayHello $(objs)
main.o: main.c hello.h  # Makefile 可以自动推导文件依赖关系
hello.o: hello.c hello.h
.PHONY : clean # 防止与 clean 命名的文件冲突
clean:
	-rm sayHello $(objs)
```

```bash
$ make # 按照 Makefile 文件进行编译
$ make clean # 按照 Makefile 清除中间文件
```

> `CMake` : (Cross-platform Make) 跨平台 make 工具, 通过 CMakeLists.txt 文件生成 Makefile

  ```bash CMakeLists.txt
  # 主目录 CMakeLists.txt
  cmake_minimum_required(VERSION 3.12)    # CMake 最低版本
  project(test)   # 项目名称
  add_subdirectory(hello) # 添加 cmake 管理子目录
  target_link_libraries(test hello) # 链接名为 hello 的链接库
  aux_source_directory(. DIR_SOURCES) # 目录下所有源文件
  add_executable(test ${DIR_SOURCES}) # 将目标文件编译为可执行文件 test
  # 子目录(hello) CMakeLists.txt
  aux_source_directory(. DIR_LIB_SOURCES)
  add_library(hello ${DIR_LIB_SOURCES})
  ```

  ```bash
  $ cmake .   # 根据 CMakeLists.txt 生成 Makefile
  $ make      # 根据生成的 Makefile 进行编译链接
  ```

## [SWIG](https://github.com/swig/swig) 
> Simplified Wrapper and Interface Generator

- [Python与C/C++混合编程](https://zhuanlan.zhihu.com/p/20150641)
- [编译运行SWIG的example代码样例](https://note.qidong.name/2018/01/hello-swig-example/)

  ```bash
  # 树莓派安装
  $ sudo apt-get install swig
  # macOS(源码安装)
  $ ./configure 
  $ make
  $ make install

  # 简单使用 
  #  配置文件(test.i) -> 包装c文件(test_wrap.c) & python文件(test.py)
  $ swig -python test.i       # C : test.i -> test.py test_wrap.c
  $ swig -c++ -python test.i  # C++ : test.i -> test.py test.wrap.cxx
  #  生成动态库
  $ gcc -fPIC -shared test_wrap.c -o _test.so -I/usr/include/python2.7 -lpython2.7    # C
  $ g++ -fPIC -shared test_wrap.cxx -o _test.so -I/usr/include/python2.7 -lpython2.7  # C++
  ```