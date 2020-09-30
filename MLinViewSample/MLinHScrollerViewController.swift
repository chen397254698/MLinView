//
//  MLinHorizonViewController.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/16.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class MLinHScrollerViewController: BaseViewController {
    /// 创建一个水平方向的线性布局，宽铺满父布局， 高度50
    open lazy var _scroller = MLinScrollView() => { it in
        view.addSubview(it)
        it.snp.makeConstraints { $0.edges.equalToSuperview() }
        it.backgroundColor = color_gray_F5
    }
    
    open lazy var _linear = _scroller._mLinView
    
    /// _content 页面内容, 宽铺满父布局，高自适应, 自动换行
    lazy var _icon = UIImageView(image: UIImage(named: "done_icon")) => { it in

        // 图片宽高自适应，或者固定值，否则可能被拉伸变形
        //        it.mWidth = 60
        //        it.mHeight = 60
        it.mWidth = .wrap
        it.mHeight = .wrap
        
        it.mTop = 10
        it.mBottom = 10
        it.mLeft = 10

        it.backgroundColor = .red
    }

    /// 符号 => 是扩展的符号，不在需要临时变量存放。
    /// _topic 页面主题, 宽高自适应，居于线性布局的中部，父布局为垂直布局则水平居中，以此类推。 注意只有.wrap或者固定宽度
    /// mGravity属性才能生效
    lazy var _topic = UILabel(mWidth: .wrap, mHeight: .wrap, mGravity: .center) => { it in
        it.font = UIFont.systemFont(ofSize: 18)
        it.textColor = color_gray_22
        it.text = "线性布局的使用"
        
        it.mLeft = 10

    }

    /// _content 页面内容, 宽铺满父布局，高自适应, 自动换行
    lazy var _content = UILabel(mWidth: .match, mHeight: .wrap) => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_66
        it.text = "这是线性布局的使用，内容很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长"
        it.textAlignment = .center
        it.numberOfLines = 0
        it.backgroundColor = color_gray_99

        // MLinView 扩展了六个边距属性
        it.mTop = 20
        it.mBottom = 10
        it.mLeft = 10
        it.mRight = 10

        // 当前一个view被hidden时生效
        it.mHiddenTop = 10
        it.mHiddenLeft = 10
    }

    /// 让文字居中 左偏移 50
    lazy var _centerText = UILabel(mWidth: .wrap, mHeight: .wrap, mGravity: .center) => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_white_text
        it.backgroundColor = .red
        it.text = "文字居中 左偏移 50"

        it.mTop = 20
        it.mRight = 50

        // _icon 隐藏时生效
        it.mHiddenTop = 60
    }

    /// 让文字居左
    lazy var _leftText = UILabel(mWidth: .wrap, mHeight: .wrap, mGravity: .left) => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "文字居于左"

        it.mTop = 20
        it.mLeft = 10
    }

    /// 让文字居右
    lazy var _rightText = UILabel(mWidth: .wrap, mHeight: .wrap, mGravity: .right) => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "文字居于右"

        it.mTop = 20
        it.mRight = 10
    }

    lazy var _showHideBtn = UIButton(type: .custom) => { it in
        it.setBackgroundColor(color: color_white, forState: .normal)
        it.setBackgroundColor(color: color_gray_ED, forState: .highlighted)
        it.setBackgroundColor(color: color_white, forState: .disabled)
        it.setTitle("icon 显示隐藏", for: .normal)
        it.setTitleColor(color_gray_22, for: .normal)
        it.layer.cornerRadius = 5
        it.layer.masksToBounds = true
        it.layer.borderColor = color_gray_DD.cgColor
        it.layer.borderWidth = 1
        it.layer.masksToBounds = true
        it.click { [unowned self] in
            self._icon.isHidden = !self._icon.isHidden
        }

        it.mHeight = 45
        it.mTop = 20
        it.mLeft = 30
        it.mRight = 30
    }

    lazy var _addRemoveBtn = UIButton(type: .custom) => { it in
        it.setBackgroundColor(color: color_white, forState: .normal)
        it.setBackgroundColor(color: color_gray_ED, forState: .highlighted)
        it.setBackgroundColor(color: color_white, forState: .disabled)
        it.setTitle("icon 移除插入", for: .normal)
        it.setTitleColor(color_gray_22, for: .normal)
        it.layer.cornerRadius = 5
        it.layer.masksToBounds = true
        it.layer.borderColor = color_gray_DD.cgColor
        it.layer.borderWidth = 1
        it.layer.masksToBounds = true
        it.click { [unowned self] in
            self._icon =>> { it in
                if it.superview != nil {
                    self._icon.removeFromSuperview()
                } else {
                    self._linear.insertSubview(self._icon, 2)
                }
            }
        }

        it.mHeight = 45
        it.mTop = 20
        it.mLeft = 30
        it.mRight = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "水平滚动布局"

        //开启滚动

        _linear.addBatch(_icon, _topic, _content, _centerText, _leftText, _rightText, _showHideBtn, _addRemoveBtn)
    }
}
