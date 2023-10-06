# “数据结构”那些事

  大多数据编程语言来说，基础的数据类型就是 `int`、`float`、`double`、`char`、`string`、`bool`。基础数据结构就是：数组、链表。高级一点的数据结构有：栈、队列、集合、哈希表。再复杂一些的有：二叉树、图。
  
  宏观一点理解，数据结构是用来描述这些基础数据类型内存布局，也可以理解为是基础数据类型的容器。而最为底层的数据结构就是数组和链表，数组是描述了一块存储相同数据类型的连续内存空间，而链表则是存储数据类型并通过指针连接的非连续内存空间。而且其它的数据结构都是基于数组和链表来实现的一种数据结构的描述。例如栈、队列、二叉树、图，可以通过数组实现，也可以通过链表实现；哈希表则是通过数组和链表结合实现。
  
## 数据结构到底是什么？

- 线性表 (Linear List) : 数据的排列特征是按照一条线排列。数组、链表、栈、队列。
- 非线性表 : 数据排布非线性结构。二叉树、堆、图。

| Data Structure | 说明
| -- | --
| Array             | 数组
| LinkedList        | 链表
| Stack / Queue     | 栈 / 队列
| BinaryTree / Tree | 二叉树 / 树
| Graph             | 图
| HashTable         | 哈希表
| Set / DisjointSet | 集合 / 并查集 
| Trie              | 字典树
| BloomFilter       | 布隆过滤器

## 数组

  为什么大部分编程语言中的数组下标都是从 0 开始？
    
  > 这个与数组的结构特性和内存寻址有关系。数组是一块存储相同类型数据的连续内存空间，而数组的指针或引用是指向数组的一个元素的。访问数组其它位置的元素就是计算其位置的指针地址，如果第一元素下标为 0，则寻址公式为：`a[i] = a0 + i * dataSize`。如果下标是从 1 开始，则寻址公式为：`a[i] = a1 + (i - 1) * dataSize`。可以看出如果下标为 0，寻址公式少了一次减法运算，提高了数组的访问效率。
  
  为什么数组访问效率优于链表？
  
  > 归根到底是因为数组分配的一块连续内存。原因可以从两方面分析。其一是数组的访问的可以直接通过下标计算出元素地址，到达了 `O(1)` 的时间复杂度，而链表访问数据需要遍历整个链表时间复杂度为 `O(n)`。其二是 `CPU` 的缓存机制，因为 `CPU` 访问数据时为了提高效率，每次读取数据时并不是只读指定地址内存，而是读取一个内存块保存到 `CPU` 缓存中。以数组来说会将数组后面的数据以加载到 `CPU` 缓存中，当再次读取数组元素时会直接中缓存中读取
  
  
## 链表

  链表是将一堆零散的内存空间串联起来的数据结构，不需要内存空间连续。链表的数据结构，除了存储数据外，还需存储指向下一个节点的指针。
  
- 单链表
- 双向链表
- 循环链表