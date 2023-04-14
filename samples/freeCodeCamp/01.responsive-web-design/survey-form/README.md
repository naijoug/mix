# 制作一个调查表格
> 目标： 构建一个功能类似于 https://survey-form.freecodecamp.rocks 的应用程序

## 需求：

- 你应该有一个 id 为 title 的 h1 元素
- 你应该有一个 id 为 description 的 p 元素
- 你应该有一个 id 为 survey-form 的 form 元素
- 在表单元素内，你需要在 input 字段中输入你的名字，该字段的 id 为 name，type 为 text
- 在表单元素内，你需要在 input 字段中输入你的邮箱，该字段的 id 为 email
- 如果你输入了格式不正确的邮箱，你将会看见 HTML5 验证错误信息
- 在表单中，你可以在 input 字段中输入一个数字，该字段的 id 为 number
- 数字输入不应接受非数字，或是阻止你输入它们，或是显示一个 HTML5 验证错误（取决于你的浏览器）。
- 如果你输入的数字超出了范围（使用 min 和 max 属性定义），你将会看见 HTML5 验证错误信息
- 表单中的名字、邮箱和数字输入框需有对应的包含描述输入框用途的 label 元素，id 应分别为 id="name-label"、id="email-label" 和 id="number-label"
- 在表单中的名字、邮箱和数字输入框中，你能看到各自的描述文字作为占位符
- 在表单元素内， 你应该有一个 select 下拉元素， id 为 dropdown，它至少有两个选项
- 在表单元素内， 你可以从至少两个单选按钮的组中选择一个选项，该选项使用 name 属性
- 在表单元素内，你可以从一系列复选框中选择几个字段，每个复选框都必须具有 value 属性
- 在表单元素内，你会有一个 textarea 以获取额外的评论
- 在表单元素内，你将收到一个按钮，其 id 为 submit，提交所有输入
- 完成需求并通过下面的所有测试来完成这个项目。 赋予它你自己的个人风格。 编程愉快！

注意： 请在你的 HTML 中添加 <link rel="stylesheet" href="styles.css"> 以链接你的样式表并应用你的 CSS

## 测试

等待中: 你应该有一个 id 为 title 的 h1 元素。
等待中: 你的 #title 元素不应为空。
等待中: 你应该有一个 id 为 description 的 p 元素。
等待中: 你的 #description 不应为空。
等待中: 你应该有一个 id 为 survey-form 的 form 元素。
等待中: 你应该有一个 id 为 name 的 input 元素。
等待中: 你的 #name 元素应该具有 type 为 text。
等待中: 你的 #name 元素应该需要输入。
等待中: 你的 #name 元素应该是 #survey-form 元素的子元素。
等待中: 你应该有一个 id 为 email 的 input 元素。
等待中: 你的 #email 元素应该具有 type 为 email。
等待中: 你的 #email 元素应该需要输入。
等待中: 你的 #email 元素应该是 #survey-form 元素的子元素。
等待中: 你应该有一个 id 为 number 的 input 元素。
等待中: 你的 #number 元素应该是 #survey-form 元素的子元素。
等待中: 你的 #number 元素应该具有 type 为 number。
等待中: 你的 #number 应该有一个值为数字的 min 属性。
等待中: 你的 #number 应该有一个值为数字的 max 属性。
等待中: 你应该有一个 id 为 name-label 的 label 元素。
等待中: 你应该有一个 id 为 email-label 的 label 元素。
等待中: 你应该有一个 id 为 number-label 的 label 元素。
等待中: 你的 #name-label 应包含描述输入的文本。
等待中: 你的 #email-label 应包含描述输入的文本。
等待中: 你的 #number-label 应该包含描述输入的文本。
等待中: 你的 #name-label 元素应该是 #survey-form 元素的子元素。
等待中: 你的 #email-label 元素应该是 #survey-form 元素的子元素。
等待中: 你的 #number-label 元素应该是 #survey-form 元素的子元素。
等待中: 你的 #name 元素应该有 placeholder 属性与占位符文本。
等待中: 你的 #email 元素应该有 placeholder 属性与占位符文本。
等待中: 你的 #number 元素应该有 placeholder 属性与占位符文本。
等待中: 你应该有一个 id 为 dropdown 的 select 元素。
等待中: 你的 #dropdown 应该至少有两个可选择（未禁用）option 元素。
等待中: 你的 #dropdown 元素应该是 #survey-form 元素的子元素。
等待中: 你应该有至少两个 input 元素，type 为 radio（单选按钮）。
等待中: 你至少应该有两个单选按钮，是 #survey-form 的子元素。
等待中: 你所有的单选按钮都应该有一个 value 属性和值。
等待中: 你所有的单选按钮都应该有一个 name 属性和值。
等待中: 每个单选按钮组应至少有 2 个单选按钮。
等待中: 你应该至少有两个 input 元素，type 为 checkbox（复选框），它们是 #survey-form 的子元素。
等待中: 你在 #survey-form 中的所有复选框都应该有 value 属性和值。
等待中: 你至少应该有一个 textarea 元素，它是 #survey-form 的子元素。
等待中: 你应该有一个 id 为 submit 的 input 或 button 元素。
等待中: 你的 #submit 元素应该具有 type 为 submit。
等待中: 你的 #submit 元素应该是 #survey-form 元素的子元素。