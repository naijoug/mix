
## Reference

- [MDN - HTML](https://developer.mozilla.org/zh-CN/docs/Web/HTML)
- [绿叶学习网](www.lvyestudy.com)
- [从 0 到 1: HTML+CSS 快速上手](https://weread.qq.com/web/reader/1053223071cad78210554c5)

## Note

- Web 1.0
- Web 2.0
- Web 3.0

- 静态页面 vs 动态页面 : 动态是指是否与服务器进行数据交互

- HTML 基本元素
    * 文字
    * 图片
    * 超链接
    * 音视频

## Roadmap

- HTML -> CSS -> JavaScript -> JQuery -> HTML5 -> CSS3 -> ES6 -> [Node、React、Vue]
    * HTML : 控制网页的结构
    * CSS : 控制网页的外观
    * JavaScript : 控制网页的行为
- webpack、gulp、babel

## HTML
> Hyper Text Markup Language : 超文本标记语言

- HTML 不是编程语言，是一种描述性标记语言
- 语法: `<tag>content</tag>`

- `<html xmlns="http://www.w3.org/1999/xhtml"></html>` : 标识当前页面使用 W3C 的 XHTML 标准

- 能嵌套在 head 标签内的标签
    * title : 网页标题
    * meta : 定义页面的特殊信息(关键字、页面描述...)，用于搜索引擎提取
    * link : 引入外链文件
    * style : 定义元素 CSS 样式
    * script : 定义页面 JavaScript 代码
    * base : 

- 自闭合标签
    * meta
    * link
    * br
    * hr
    * img
    * input

- 能嵌套在 body 标签内的标签
    * h1 ~ h6 : 标题
    * p : (paragraph) 段落标签
    * br : 换行标签 (自闭合标签 `</br>`)
    * hr : (horizon 地平线) 水平线标签 (自闭合标签 `<hr/>`)
    * div : (division 分区) 区域划分标签
  
- 特殊符号
    * `&nbsp;` : 空格 (space)
    * `&quot;` : 引号
    * `&times;` : 乘号
    * `&divide;` : 除号
    * `&gt;` : 大于号
    * `&lt;` : 小于号
    * `&amp;` : 与(&)符号

- 文本标签
    * b : 粗体
    * i : 斜体
    * s : 中划线(删除线)
    * u : 下划线
    * strong : (strong 强调) 粗体
    * em : (emphasized 强调) 斜体，语义性更好
    * sup : (superscripted) 上标
    * sub : (subscripted) 下标
    * big : 大字号
    * small : 小字号
  
- 块元素 vs 行内元素   
    * block : 块元素占据一行，不能与其它元素位于同一行，可以嵌套其它块元素和行内元素
    * inline : 可以和其它行内元素位于同一行，不能嵌套块元素
  
- 块元素
    * h1 ~ h6
    * p 
    * div
    * hr 
    * ol
    * ul
  
- 列表
    * 有序列表 : ol (ordered list)
    * 无序列表 : ul (unordered list)
      + li : (list)
    * 定义列表 : dl (definition list)
      + dt : (definition term)
      + dd : (definition description)

- table : 表格
    * caption : 表格标题
    * tr : (table row) 行
    * th : (table head) 表头
    * td : (table data cell) 单元格
    * rowspan : (row span)合并行
    * colspan : (column span)合并列
    * thead : 表头
    * tbody : 表身
    * tfoot : 表脚

- img : 图片 `<img src="", alt="", title="">`
- a : 超链接 `<a href="hyper link url", target="open method">hperlink</a>`
    * href
        + 外部链接 : 外部网页 url
        + 内部链接 : 本地网页 path
        + 锚点链接 : 锚定当前网页的某一个位置
    * target
        + _self : (默认)在当前窗口打开
        + _blank : 在新窗口打开
        + _parent : 在父窗口打开
        + _top : 在顶层窗口打开

- form : 表单
    * input
    * textarea
    * select & option

- iframe : 框架，用于在当前页面嵌入另一个页面

## CSS
> Cascading Style Sheet : 层叠样式表

- 引入方式
    * 外部样式表 : `<link rel="stylesheet" type="text/css" href="css/path"/>`
    * 内部样式表 : `<style type="text/css">xxx</style>`
    * 行内样式表 : `<div style="xxx"></div>`
    * @import 引入 : 极少使用，该引入方式会先加载 HTML，再加载 CSS

- id & class
    * id 属性 : 用于标识唯一元素，同一页面不能重复
    * class 属性 : 用于标记同类元素，同一页可以重复

- 选择器
    * 元素选择器
    * id 选择器
    * class 选择器
    * 后代选择器
    * 群组选择器
