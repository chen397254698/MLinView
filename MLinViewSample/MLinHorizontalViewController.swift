//
//  MLinHorizonViewController.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/16.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class MLinHorizontalViewController: BaseViewController {
    /// 创建一个水平方向的线性布局，宽铺满父布局， 高度50
    lazy var _linear = MLinView(orientation: .horizontal, mWidth: .match, mHeight: .wrap) => { it in
        it.backgroundColor = color_gray_F5
    }

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

    lazy var _scrollerBtn = UIButton(type: .custom) => { it in
        it.setBackgroundColor(color: color_white, forState: .normal)
        it.setBackgroundColor(color: color_gray_ED, forState: .highlighted)
        it.setBackgroundColor(color: color_white, forState: .disabled)
        it.setTitle("水平滚动", for: .normal)
        it.setTitleColor(color_gray_22, for: .normal)
        it.layer.cornerRadius = 5
        it.layer.masksToBounds = true
        it.layer.borderColor = color_gray_DD.cgColor
        it.layer.borderWidth = 1
        it.layer.masksToBounds = true
        it.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        it.click { [unowned self] in
          self.navigationController?.pushViewController(MLinHScrollerViewController(), animated: true)
        }

        it.mHeight = 45
        it.mTop = 20
        it.mLeft = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "水平线性布局"

        // 将MLinView添加到controller的view，可以参照MLinViewController 新建一个LinearViewController
        view.addSubview(_linear)

        _linear.addBatch(_icon, _topic, _scrollerBtn)
    }
}
