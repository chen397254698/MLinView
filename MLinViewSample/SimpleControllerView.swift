//
//  SimpleControllerView.swift
//  MLinView
//
//  Created by chen on 2020/10/12.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class SimpleControllerView: BaseViewController {
    
    lazy var _linear = MLinView._scroller(view, safeEdge: true)
    
    lazy var _mLinView = SimpleItemView() => { it in
        it.backgroundColor = color_gray_F5
    }
    
    lazy var _mLinView2 = SimpleItemView2() => { it in
        it.backgroundColor = color_gray_F0
        it.mWidth = .match
        it.mHeight = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "布局演示"
        
        view.addSubview(_linear)
        
        _linear.addBatch(_mLinView, _mLinView2)

    }
}
