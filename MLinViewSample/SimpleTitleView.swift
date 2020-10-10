//
//  SimpleItemView.swift
//  MLinView
//
//  Created by chen on 2020/10/10.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

open class SimpleTitleView: MLinView {

    lazy var _title = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 17)
        it.textColor = color_gray_22
        it.text = "标题"
        it.mWidth = .wrap
        it.mHeight = .wrap
    }

    lazy var _brief = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 14)
        it.textColor = color_gray_99
        it.text = "简介"
        it.textAlignment = .center
        it.mTop = 8
        it.mWidth = .wrap
        it.mHeight = .wrap
    }
    
    init() {
        super.init(orientation: .vertical)
        
        addBatch(_title, _brief)
        
        backgroundColor = .red
        
        _brief.isUserInteractionEnabled = true
        _brief.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBrief)))
    }
    
    @objc func tapIcon() {
        _brief.isHidden = !_brief.isHidden
    }
    
    @objc func tapBrief() {
        _title.isHidden = !_title.isHidden
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
