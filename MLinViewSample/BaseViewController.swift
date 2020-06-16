//
//  BaseViewController.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/16.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {


    open override func viewDidLoad() {
        // 清除四边边距
        edgesForExtendedLayout = []

        navigationController?.navigationBar.barTintColor = color_white
        // 当你不想要navigationBar进行模糊处理时：
        // Bar的模糊效果，默认为YES
        navigationController?.navigationBar.isTranslucent = false

        view.backgroundColor = color_white

//        navigationController?.navigationBar.shadowImage = UIImage.mm_image(with: UIColor.clear, size: CGSize(width: getMainScreenWidth(), height: 0.5))

        configUI()
        initAndObserve()
    }

    func configUI() {

    }

    func initAndObserve() {

    }
    
}
