//
//  SimpleItemView.swift
//  MLinView
//
//  Created by chen on 2020/10/10.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

open class SimpleItemView: MLinView {
    lazy var _icon = UIImageView(image: UIImage(named: "done_icon")) => { it in
        it.mWidth = .wrap
        it.mHeight = .wrap
        it.mGravity = .center
        it.mLeft = 15
    }

    lazy var _content = MLinView(orientation: .vertical) => { it in
                
        it.mLeft = 15
        it.mRight = 15
        it.mWidth = .match
        it.mHeight = .wrap
        it.mGravity = .center
    }


    lazy var _time = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 12)
        it.textColor = color_gray_99
        it.text = "2020-01-14"
        it.mRight = 15
        it.mHeight = .wrap
        it.mTop = 20
    }
    
    lazy var _title = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 17)
        it.textColor = color_gray_22
        it.text = "MLinView主干布局"
        it.mWidth = .wrap
        it.mHeight = .match
    }

    lazy var _brief = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 14)
        it.textColor = color_gray_99
        it.text = "简介"
        it.textAlignment = .center
        it.mTop = 8
        it.mHiddenTop = 0
        it.mWidth = .wrap
        it.mHeight = .wrap
    }
    
    init() {
        super.init(orientation: .horizontal, mWidth: .match, mHeight: 100)
        
        _content.addBatch(_title, _brief)
        
        _brief.isUserInteractionEnabled = true
        _brief.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBrief)))
        
        addBatch(_icon, _content, _time)
        
        
        _icon.isUserInteractionEnabled = true
        _icon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapIcon)))
        
        _content.isUserInteractionEnabled = true
        _content.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTitle)))
        
    }
    
    
    @objc func tapTitle() {
        UIView.animate(withDuration: 1.2, animations: { [self] in
            _icon.isHidden = !_icon.isHidden
            layoutIfNeeded()
        })
    }
    
    @objc func tapIcon() {
        UIView.animate(withDuration: 0.2, animations: { [self] in
            _brief.isHidden = !_brief.isHidden
            layoutIfNeeded()
        })
    }
    
    @objc func tapBrief() {
        _title.isHidden = !_title.isHidden
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
