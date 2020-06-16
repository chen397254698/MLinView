//
//  MLinNestViewController.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/16.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class MLinNestViewController: BaseViewController {
    /// 创建一个水平方向的线性布局，宽度铺满父布局
    lazy var _linear = MLinView(orientation: .horizontal, mWidth: .match, mHeight: .wrap) => { it in
        it.backgroundColor = color_gray_F5
    }

    /// 创建一个垂直方向的线性布局，宽高自适应
    lazy var _container = MLinView(orientation: .vertical, mWidth: .wrap, mHeight: .wrap) => { it in

        UILabel(mWidth: .wrap, mHeight: .wrap) =>> { topic in
            topic.font = UIFont.systemFont(ofSize: 18)
            topic.textColor = color_gray_33
            topic.text = "布局嵌套的使用"
            it.addSubview(topic)
        }

        UILabel(mWidth: .wrap, mHeight: .wrap) =>> { des in
            des.font = UIFont.systemFont(ofSize: 18)
            des.textColor = color_gray_66
            des.text = "内容"
            des.mTop = 10
            it.addSubview(des)
        }

        it.mLeft = 15
        it.backgroundColor = color_gray_EE
        it.mGravity = .center
    }

    /// _content 页面内容, 宽铺满父布局，高自适应, 自动换行
    lazy var _icon = UIImageView(image: UIImage(named: "done_icon")) => { it in

        // 图片宽高自适应，或者固定值，否则可能被拉伸变形
        //        it.mWidth = 60
        //        it.mHeight = 60
        it.mWidth = .wrap
        it.mHeight = .wrap

        it.backgroundColor = .red

        it.mTop = 10
        it.mLeft = 15
        it.mBottom = 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "布局嵌套"

        // 将MLinView添加到controller的view，可以参照MLinViewController 新建一个LinearViewController
        view.addSubview(_linear)

        _linear.addBatch(_icon, _container)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /// =>? 只有在左边参数非空的时候运行
        _container.child(1) =>? { it in
            it.isHidden = !it.isHidden
        }
    }
}
