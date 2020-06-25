import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/23.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/demo/search_textfield_bar.dart
///圆角搜索框
class SearchTextFieldBar extends StatefulWidget {
  ///搜索框上显示的文案
  String hint;
  ///hero过渡动画的tag
  String heroTag;
  ///搜索框的圆角
  double defaultBorderRadius;
  EdgeInsets margin;
  EdgeInsets padding;

  ///点击的回调事件
  Function clickCallBack;

  ///如果考虑不需要水波纹效果那么就可以设置颜色为透明色
  Color splashColor;
  ///文本输入框焦点控制
  FocusNode focusNode;
  ///文本输入框
  TextEditingController controller;
  ///点击键盘上的回车键的回调
  Function(String text) onSubmitted;
  ///输入文本的长度限制
  int inputKeyWordsLength;
  ///输入框文字大小
  double fontSize;

  SearchTextFieldBar(
      {this.hint = "搜索",
      this.defaultBorderRadius = 20.0,
      this.margin = const EdgeInsets.only(top: 10.0, bottom: 10.0),
      this.padding = const EdgeInsets.only(left: 12),
      this.heroTag,
      this.clickCallBack,
      this.splashColor = const Color(0xFFD6D6D6),
      this.focusNode,
      this.controller,
      this.onSubmitted,
      this.inputKeyWordsLength=20,
      this.fontSize = 14});

  @override
  State<StatefulWidget> createState() {
    return SearchTextFieldBarState();
  }
}

class SearchTextFieldBarState extends State<SearchTextFieldBar> {
  ///为true 时显示清除选项
  bool showClear = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      widget.focusNode = new FocusNode();
    }
    if (widget.controller == null) {
      widget.controller = new TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      ///外边距
      margin: widget.margin,
      child: buildContainer(context),
    );
  }

  ///构建搜索框的显示区域[Container]
  Container buildContainer(BuildContext context) {
    return Container(
      height: widget.defaultBorderRadius * 2,

      ///获取当前StatelessWidget的宽度
      width: MediaQuery.of(context).size.width,

      ///对齐方式
      alignment: Alignment(-1, 0),

      ///内边距
      padding: widget.padding,

      ///圆角边框
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.defaultBorderRadius),
      ),
      child: buildRow(),
    );
  }

  ///构建搜索图标与显示文本
  Row buildRow() {
    return Row(
      ///居左
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///搜索图标
        Image.asset(
          "assets/images/2.0x/search_icon.png",
          width: 18.0,
          height: 18.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment(-1, 0),
            child: TextField(
              ///设置键盘的类型
              keyboardType: TextInputType.text,
              ///键盘回车键的样式为搜索
              textInputAction: TextInputAction.search,
              ///只有苹果手机上有效果
              keyboardAppearance:Brightness.dark,
              controller: widget.controller,
              ///最大行数
              maxLines: 1,
              ///输入文本格式过滤
              inputFormatters: [
                ///输入的内容长度限制
                LengthLimitingTextInputFormatter(widget.inputKeyWordsLength),
              ],
              ///当输入文本时实时回调
              onChanged: (text) {
                ///多层判断 优化刷新
                ///只有当有改变时再刷新
                if (text.length > 0) {
                  if (!showClear) {
                    showClear = true;
                    setState(() {});
                  }
                } else {
                  if (showClear) {
                    showClear = false;
                    setState(() {});
                  }
                }
              },
              ///点击键盘上的回车键
              ///或者是搜索按钮的回调
              onSubmitted: (text) {
                if(widget.onSubmitted!=null){
                  widget.onSubmitted(text);
                }
              },
              ///输入框不自动获取焦点
              autofocus: false,
              focusNode: widget.focusNode,
              style: TextStyle(
                  fontSize: widget.fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              ///输入框的边框装饰
              decoration: InputDecoration(
                  //重要 用于编辑框对齐
                  isDense: true,
                  ///清除文本内边跑
                  contentPadding: EdgeInsets.zero,
                  ///不设置边框
                  border: InputBorder.none,
                  ///设置提示文本
                  hintText: widget.hint,
                  ///设置提示文本的样式
                  hintStyle: TextStyle(
                    fontSize: widget.fontSize,
                    color: Color(0xff999999),
                  )),
            ),
          ),
        ),
        buildClearButton(),
      ],
    );
  }
  ///清除按键
  ///当文本框有内容输入时显示清除按钮
  buildClearButton() {
    if (showClear) {
      return IconButton(
        icon: Icon(
          Icons.clear,
          size: 24.0,
          color: Color(0xffacacac),
        ),
        onPressed: () {
          widget.controller.clear();
        },
      );
    } else {
      return Container();
    }
  }
}
