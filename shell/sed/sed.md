
N：将数据流中的下一行加进来创建一个多行组（multiline group）来处理
D：删除多行组中的一行。
P：打印多行组中的一行。

h 将模式空间复制到保持空间
H 将模式空间附加到保持空间
g 将保持空间复制到模式空间
G 将保持空间附加到模式空间
x 交换模式空间和保持空间的内容
d 删除行


插入（insert）命令（i）会在指定行前增加一个新行
附加（append）命令（a）会在指定行后增加一个新行。
修改（change）命令允许修改数据流中整行文本的内容
sed '[address]command\new line'




转换（transform）命令（y）是唯一可以处理单个字符的sed编辑器命令
[address]y/inchars/outchars/


s命令（substitute）来在行中替换文本
s/pattern/replacement/flags
4种可用的替换标记
g，表明新文本将会替换所有匹配的文本；
p，表明原先行的内容要打印出来；
w file，将替换的结果写到文件中。


1. 数字方式的行寻址
$ sed '2s/dog/cat/' data1.txt

2.使用文本模式过滤器
/pattern/command



测试（test）命令（t）
[address]t [label]
测试命令会根据替换命令的结果跳转到某个标签，而不是根据地址进行跳转。


分支（branch）命令b

[address]b [label]

基于地址、地址模式或地址区间排除一整块命令
