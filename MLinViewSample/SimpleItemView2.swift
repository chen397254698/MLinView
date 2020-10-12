//
//  SimpleItemView2.swift
//  MLinView
//
//  Created by chen on 2020/10/12.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

open class SimpleItemView2: UIView {
    
    lazy var _icon = UIImageView(image: UIImage(named: "done_icon"))


    lazy var _time = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 12)
        it.textColor = color_gray_99
        it.text = "2020-01-14"
    }
    
    lazy var _content = UIView()
    
    lazy var _title = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 17)
        it.textColor = color_gray_22
        it.text = "传统约束布局"
        it.mWidth = .wrap
        it.mHeight = .match
    }

    lazy var _brief = UILabel() => { it in
        it.font = UIFont.systemFont(ofSize: 14)
        it.textColor = color_gray_99
        it.text = "简介"
    }
    
    init() {
        super.init(frame: .zero)
        
        addSubview(_icon)
        addSubview(_content)
        addSubview(_title)
        addSubview(_brief)
        addSubview(_time)
        
        _icon.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        _icon.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
            $0.right.greaterThanOrEqualTo(_content.snp.left).offset(-15)
        }
        
        _content.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        _content.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.greaterThanOrEqualTo(_icon.snp.right).offset(15)
            $0.right.greaterThanOrEqualTo(_time.snp.left)
        }
        
        _time.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(20)
            $0.left.greaterThanOrEqualTo(_content.snp.right)
        }
        
        _content.addSubview(_title)
        _content.addSubview(_brief)
        
        _title.snp.makeConstraints{
            $0.top.left.equalToSuperview()
            $0.bottom.greaterThanOrEqualTo(_brief.snp.top).offset(-8)
            $0.width.lessThanOrEqualToSuperview()
        }
        
        _brief.snp.makeConstraints{
            $0.top.greaterThanOrEqualTo(_title.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
            $0.width.lessThanOrEqualToSuperview()
        }
        
        _brief.isUserInteractionEnabled = true
        _brief.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBrief)))
        
        
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
