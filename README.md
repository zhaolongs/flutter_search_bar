
**题记**
  ——  执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天。
  
**重要消息**

* [网易云【玩转大前端】配套课程](https://study.163.com/instructor/1021406098.htm)
* [EDU配套  教程](https://edu.csdn.net/lecturer/1555)

* [Flutter开发的点滴积累系列文章](https://blog.csdn.net/zl18603543572/article/details/93532582)

***

### 1 使用封装库
#### 1.1 添加依赖
小编已将本效果写成一个依赖库，读者可根据使用直接添加依赖，代码如下：
github方式依赖

```java
  flutter_search_bars:
    git:
      url: https://github.com/zhaolongs/flutter_search_bar.git
      ref: master
```
pub仓库依赖 [查看最新版本](https://pub.flutter-io.cn/packages/flutter_search_bars)

```java
  #搜索框
  flutter_search_bars: ^0.0.1
```

#### 1.2 导包
在使用到搜索框 SearchBar 的地方导包如下：

```java
import 'package:flutter_search_bars/flutter_search_bars.dart';
```

#### 1.3 使用

##### 1.3.1 默认大小使用

```java
///这里只是用于显示的搜索框不用做输入
///参数[heroTag]用于页面过渡动画tag
///参数clickCallBack为当前搜索框点击事件回调
SearchStaticBar(
	heroTag: "searchStatidBar",
	clickCallBack: () {
	  NavigatorUtils.pushPage(context, TestPage2());
	},
)
```

##### 1.3.2 指定大小使用

```java
 Container(
     width: 120,
      ///这里只是用于显示的搜索框不用做输入
      ///参数[heroTag]用于页面过渡动画tag
      ///参数clickCallBack为当前搜索框点击事件回调
      child: SearchStaticBar(
        heroTag: "searchStatidBar",
        clickCallBack: () {
          NavigatorUtils.pushPage(context, TestPage2());
        },
      ),
    )
```
运行效果如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200625151652610.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3psMTg2MDM1NDM1NzI=,size_16,color_FFFFFF,t_70)