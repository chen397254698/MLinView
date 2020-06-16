# MLinView
基于snapkit封装的线性布局，让简单的布局脱离繁琐的约束

![图片](image/mlin_vertical.png "垂直线性布局")

```
//简单的垂直线性布局只需要疯狂的批量add，剩下的事交给MLinView 处理
 _linear.addBatch(_topic, _content, _icon, _centerText, _leftText, _rightText, _showHideBtn, _addRemoveBtn, _vScrollerBtn, _nestBtn)
 
```

MLinView 支持垂直 水平两个方向，还支持scoller滚动

```
// 只要添加.scoller就支持滚动
view.addSubview(_linear.scoller)
```

MLinView 支持布局的嵌套，子view的 hide  removeFromSuperview 都和普通UIView一致


![图片](image/nesting.png "垂直线性布局")
