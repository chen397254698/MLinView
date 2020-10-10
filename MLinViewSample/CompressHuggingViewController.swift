//
//  CompressHuggingViewController.swift
//  MLinView
//
//  Created by chen on 2020/9/30.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class CompressHuggingViewController: BaseViewController {
    lazy var _linear = MLinView(orientation: .horizontal, mWidth: .match, mHeight: 50)
    
    lazy var _compairView = UIView() => { it in
        it.backgroundColor = .red
    }

    lazy var _test1 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "1111111111111111111111111111111111111111"
        it.backgroundColor = UIColor.blue
        it.mWidth = .match
    }

    lazy var _test2 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "22222221111122222222"
        it.backgroundColor = UIColor.red
//        it.mWidth = .match
    }

    lazy var _test22 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "2hhhhh2"
        it.backgroundColor = UIColor.purple
    }

    lazy var _test3 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "333333"
        it.backgroundColor = UIColor.blue
    }

    lazy var _test4 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "44444"
        it.backgroundColor = UIColor.green
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "抗压缩"

        // 将MLinView添加到controller的view，可以参照MLinViewController 新建一个LinearViewController
        view.addSubview(_linear)
        _linear.snp.makeConstraints{
            $0.top.equalToSuperview()
        }

        _linear.addBatch(_test1, _test2, _test22)
        
        _test1.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        _test2.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
           

    }
}
