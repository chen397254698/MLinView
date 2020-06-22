//
//  UIButtonExtension.swift
//  Liuxi
//
//  Created by wanghaipeng on 2020/4/15.
//  Copyright © 2020 whp. All rights reserved.
//

import UIKit

typealias buttonClick = (() -> Void) // 定义数据类型(其实就是设置别名)

extension UIButton {
    // 改进写法【推荐】
    private struct RuntimeKey {
        static let actionBlock = UnsafeRawPointer(bitPattern: "actionBlock".hashValue)
        /// ...其他Key声明
    }

    /// 运行时关联
    private var actionBlock: buttonClick? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.actionBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, UIButton.RuntimeKey.actionBlock!) as? buttonClick
        }
    }

    /// 点击回调
    @objc func tapped(button: UIButton) {
        if actionBlock != nil {
            actionBlock!()
        }
    }

    @objc func click(action: @escaping buttonClick) {
        addTarget(self, action: #selector(tapped(button:)), for: .touchUpInside)
        actionBlock = action
    }

    /// 快速创建
    convenience init(action: @escaping buttonClick) {
        self.init()
        addTarget(self, action: #selector(tapped(button:)), for: .touchUpInside)
        actionBlock = action
        sizeToFit()
    }

    /// 快速创建
    convenience init(setImage: String, action: @escaping buttonClick) {
        self.init()
        frame = frame
        self.setImage(UIImage(named: setImage), for: .normal)
        addTarget(self, action: #selector(tapped(button:)), for: .touchUpInside)
        actionBlock = action
        sizeToFit()
    }

    /// 快速创建按钮 setImage: 图片名 frame:frame action:点击事件的回调
    convenience init(setImage: String, frame: CGRect, action: @escaping buttonClick) {
        self.init(setImage: setImage, action: action)
        self.frame = frame
    }
    
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(image, for: forState)
    }
}

