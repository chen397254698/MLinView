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

    lazy var _test1 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "1111111111111111111111111111111111"
        it.backgroundColor = UIColor.blue
    }

    lazy var _test2 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "22222222211111111111111111111122222222"
        it.backgroundColor = UIColor.red
        it.mWidth = .match
    }

    lazy var _test3 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "333111111111111111111111111111111133333333"
    }

    lazy var _test4 = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 16)
        it.textColor = color_gray_99
        it.text = "4441111114444"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "抗压缩"

        // 将MLinView添加到controller的view，可以参照MLinViewController 新建一个LinearViewController
        view.addSubview(_linear)

        _linear.addBatch(_test1, _test2)
        
//        _test1.setContentCompressionResistancePriority(.required, for: .horizontal)
        _test2.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        view.addSubview(_test1)
//        view.addSubview(_test2)
//        view.addSubview(_test3)
//        view.addSubview(_test4)

//        _test1.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.left.equalToSuperview()
//            make.right.greaterThanOrEqualTo(_test2.snp.left)
//        }
        ////        _test1.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//
//        _test2.snp.makeConstraints { make in
//            make.top.equalTo(_test1)
//            make.left.greaterThanOrEqualTo(_test1.snp.right)
//            make.right.equalToSuperview()
//        }
//
//        _test1.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.right.greaterThanOrEqualTo(_test2.snp.left)
//        }
//
////        _test1.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        _test1.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//
//        _test2.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.right.greaterThanOrEqualTo(_test3.snp.left)
//            $0.left.greaterThanOrEqualTo(_test1.snp.right)
//        }
//
//        _test2.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//
//        _test3.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.right.equalToSuperview()
//            $0.left.greaterThanOrEqualTo(_test2.snp.right)
//        }
//
//        _test3.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}
