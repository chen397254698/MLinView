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

    lazy var _title = SimpleTitleView() => { it in
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

    init() {
        super.init(orientation: .horizontal, mWidth: .match, mHeight: 100)
        
        addBatch(_icon, _title, _time)
        
        
        _icon.isUserInteractionEnabled = true
        _icon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapIcon)))
        
        _title.isUserInteractionEnabled = true
        _title.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTitle)))
        
    }
    
    
    @objc func tapTitle() {
        UIView.animate(withDuration: 1.2, animations: { [self] in
            _icon.isHidden = !_icon.isHidden
            layoutIfNeeded()
        })
    }
    
    @objc func tapIcon() {
        UIView.animate(withDuration: 0.2, animations: { [self] in
            _title._brief.isHidden = !_title._brief.isHidden
            layoutIfNeeded()
        })
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
