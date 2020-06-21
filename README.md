#### MLinView  
原来的线性布局升级为主干布局。 主干布局顾名思义就是会有一个主干UIView和附属的UIView
主干上的UIView会顺序排列，附属的UIView会根据指定的锚点分布在主干周围。

不废话 上布局

![截屏2020-06-19 下午6.27.33.png](https://upload-images.jianshu.io/upload_images/18820010-670b263f61a408d7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)

这个布局是一个垂直的主干, 加上一个依附的 “文字依附” UILabe。

```
// 往主干布局_linear 依次加入主干View和依附的 _attachText。
//主干UIView完全不需要写约束，一行代码搞定排列
 _linear.addBatch(_topic, _content, _icon, _centerText, _leftText, _rightText, _showHideBtn, _addRemoveBtn, _vScrollerBtn, _nestBtn, _attachText)

//附属 _attachText, 和一般的UIView一样懒加载
lazy var _attachText = UILabel(mWidth: .wrap, mHeight: .wrap, mGravity: .right) => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "文字依附"

        it.mTop = 10
        it.mRight = 10
        it.mLeft = 40
        
        it.mHiddenTop = 20
        
        //指定 依附于 _icon，对齐方式 topToTop和leftToRight，边距mTop = 10，mRight = 10
        it.mConstraints = [MCons(_icon, .topToTop, .leftToRight)]
    }

```




