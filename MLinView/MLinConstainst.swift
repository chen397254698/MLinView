//
//  MLinConstainst.swift
//  MLinViewSample
//
//  Created by chen on 2020/6/19.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

public enum AttachOrientation {
    case topToTop
    case topToBottom
    case topToCenterY

    case leftToLeft
    case leftToRight
    case leftToCenterX

    case rightToRight
    case rightToLeft
    case rightToCenterX

    case bottomToBottom
    case bottomToTop
    case bottomToCenterY

    case centerToCenter

    case centerXToCenterX
    case centerXToLeft
    case centerXToRight

    case centerYToCenterY
    case centerYToTop
    case centerYToBottom
}

public struct MCons {
    
    public var anchor: UIView

    public var cons: Array<AttachOrientation>

    public var hiddenView: UIView?
    
    public init(_ anchor: UIView, _ cons:AttachOrientation..., hiddenView: UIView? = nil) {
        self.anchor = anchor
        self.cons = cons
        self.hiddenView = hiddenView
    }
}


public class MParentView: UIView {
}
