//
//  MLinView.swift
//  BaseKit
//
//  Created by chen on 2020/5/20.
//  Copyright © 2020 chen. All rights reserved.
//

import SnapKit
import UIKit

extension CGFloat {
    fileprivate static var fit: CGFloat { -3.0 }
}

public enum Orientation {
    /// 垂直方向
    case vertical
    /// 水平方向
    case horizontal
}

public enum MGravity: Int {
    /// 默认
    case origin = 0
    /// 居左
    case left = 1
    /// 居中
    case center = 2
    // 居右
    case right = 3
    // 居上
    case top = 4
    // 居下
    case bottom = 5
}

fileprivate var mWidthKey: String = "mWidthKey"
fileprivate var mHeightKey: String = "mHeightKey"
fileprivate var mGravityKey: String = "mGravityKey"
fileprivate var mLeftKey: String = "mLeftKey"
fileprivate var mTopKey: String = "mTopKey"
fileprivate var mRightKey: String = "mRightKey"
fileprivate var mBottomKey: String = "mBottomKey"
fileprivate var mHiddenLeftKey: String = "mHiddenLeftKey"
fileprivate var mHiddenRightKey: String = "mHiddenRightKey"
fileprivate var mHiddenTopKey: String = "mHiddenTopKey"
fileprivate var mHiddenBottomKey: String = "mHiddenBottomKey"
fileprivate var mConstraintsKey: String = "mConstraintsKey"

extension UIView {
    public static var mContext = "MSubView"

    // MARK: 重写属性的set方法时一定要用newValue否则设置不上新值

    public convenience init(mWidth: CGFloat, mHeight: CGFloat, mGravity: MGravity = .origin) {
        self.init()
        self.mWidth = mWidth
        self.mHeight = mHeight
        self.mGravity = mGravity
    }

    public var mWidth: CGFloat {
        set {
            objc_setAssociatedObject(self, &mWidthKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mWidthKey)) as? CGFloat ?? .fit }
    }

    public var mHeight: CGFloat {
        set {
            objc_setAssociatedObject(self, &mHeightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mHeightKey)) as? CGFloat ?? .fit }
    }

    public var mGravity: MGravity {
        set {
            objc_setAssociatedObject(self, &mGravityKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mGravityKey)) as? MGravity ?? .origin }
    }

    public var mLeft: CGFloat {
        set {
            objc_setAssociatedObject(self, &mLeftKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mLeftKey)) as? CGFloat ?? 0 }
    }

    public var mTop: CGFloat {
        set {
            objc_setAssociatedObject(self, &mTopKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mTopKey)) as? CGFloat ?? 0 }
    }

    public var mRight: CGFloat {
        set {
            objc_setAssociatedObject(self, &mRightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mRightKey)) as? CGFloat ?? 0 }
    }

    public var mBottom: CGFloat {
        set {
            objc_setAssociatedObject(self, &mBottomKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mBottomKey)) as? CGFloat ?? 0 }
    }

    public var mHiddenLeft: CGFloat? {
        set {
            objc_setAssociatedObject(self, &mHiddenLeftKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mHiddenLeftKey)) as? CGFloat }
    }

    public var mHiddenTop: CGFloat? {
        set {
            objc_setAssociatedObject(self, &mHiddenTopKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mHiddenTopKey)) as? CGFloat }
    }

    public var mHiddenRight: CGFloat? {
        set {
            objc_setAssociatedObject(self, &mHiddenRightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mHiddenRightKey)) as? CGFloat }
    }

    public var mHiddenBottom: CGFloat? {
        set {
            objc_setAssociatedObject(self, &mHiddenBottomKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mHiddenBottomKey)) as? CGFloat }
    }

    public var mConstraints: Array<MCons>? {
        set {
            objc_setAssociatedObject(self, &mConstraintsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            (superview as? MLinView)?.layoutSubview(self)
        }
        get { (objc_getAssociatedObject(self, &mConstraintsKey)) as? Array<MCons> }
    }
}

open class MLinView: UIView {
    /// 子控件
    fileprivate var mSubviews = Array<UIView>()

    fileprivate var mSubviewsAttach = Array<UIView>()

    /// 排列方向
    public var orientation: Orientation = .vertical

    public var scrollerAble = false

    private var isDeinit = false

    private var autoAttach = false

    public var safeEdge = false

    public init(orientation: Orientation = .vertical, mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, autoAttach: Bool = false) {
        self.orientation = orientation
        self.autoAttach = autoAttach
        super.init(frame: .zero)
        self.mWidth = mWidth ?? (orientation == .vertical ? .match : .wrap)
        self.mHeight = mHeight ?? (orientation == .vertical ? .wrap : .match)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func child<T: UIView>(_ index: Int, _ type: T.Type = UIView.self as! T.Type) -> T? {
        mSubviews.getOrNil(index) as? T
    }

    override open func addSubview(_ view: UIView) {
        addSubview(view, mWidth: nil, mHeight: nil, mGravity: nil, forceLayout: true)
    }

    public func addSubview(_ view: UIView, mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, mGravity: MGravity? = nil, forceLayout: Bool = true) {
        insertSubview(view, mSubviews.count, mWidth: mWidth, mHeight: mHeight, mGravity: mGravity, forceLayout: forceLayout)
    }

    public func insertSubview(_ view: UIView, _ index: Int, mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, mGravity: MGravity? = nil, forceLayout: Bool = true) {
        if mWidth != nil { view.mWidth = mWidth! }
        if mHeight != nil { view.mHeight = mHeight! }
        if mGravity != nil { view.mGravity = mGravity! }

        if view.mWidth == .fit { view.mWidth = (orientation == .vertical ? .match : .wrap) }
        if view.mHeight == .fit { view.mHeight = (orientation == .vertical ? .wrap : .match) }

        let lastView = mSubviews.getOrNil(index - 1)
        view.addObserver(self, forKeyPath: "hidden", options: [.new], context: &UIView.mContext)

        super.addSubview(view)

        if view.mConstraints?.isEmpty ?? true {
            mSubviews.insert(view, at: index)

        } else {
            mSubviewsAttach.append(view)
        }

        if forceLayout {
            layoutSubview(lastView)
        }
    }

    public class func _scroller(_ superview: UIView, autoAttach: Bool = true, safeEdge: Bool = false) -> MLinScrollView {
        MLinScrollView(safeEdge: safeEdge) => { it in
            superview.addSubview(it)
            if autoAttach { it.snp.makeConstraints { $0.edges.equalToSuperview() } }
        }
    }

    public func addBatch(_ views: UIView..., mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, insets: UIEdgeInsets? = nil, mGravity: MGravity? = nil) {
        addBatch(views, mWidth: mWidth, mHeight: mHeight, insets: insets, mGravity: mGravity)
    }

    public func addBatch(_ views: [UIView], mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, insets: UIEdgeInsets? = nil, mGravity: MGravity? = nil) {
        let lastView = mSubviews.last

        views.forEach {
            $0 =>> { it in
                if let padding = insets {
                    it.mTop = padding.top
                    it.mLeft = padding.left
                    it.mBottom = padding.bottom
                    it.mRight = padding.right
                }
                addSubview(it, mWidth: mWidth, mHeight: mHeight, mGravity: mGravity, forceLayout: false)
            }
        }

        layoutSubview(lastView)
    }
    
    public func attach<T: UIView>(_ views: T...) {
        views.forEach { super.addSubview($0) }
    }

    func makeAttachConstrain() {
        mSubviewsAttach.forEach { view in
            view.snp.removeConstraints()
            view.snp.makeConstraints {
                if view.mWidth >= 0 {
                    $0.width.equalTo(view.mWidth)
                }
                if view.mHeight >= 0 {
                    $0.height.equalTo(view.mHeight)
                }
            }
            view.mConstraints?.forEach { entity in

                let anchor: UIView = entity.anchor is MParentView ? self : entity.anchor

                let anchorValid = (anchor == self) || (!anchor.isHidden && anchor.superview != nil)

                let hiddenValid = entity.hiddenView == nil || (entity.hiddenView != nil && (entity.hiddenView!.isHidden == true || entity.hiddenView?.superview == nil))

                let isHidden = entity.hiddenView != nil && (entity.hiddenView!.isHidden == true || entity.hiddenView?.superview == nil)

                let topOffset = isHidden ? (view.mHiddenTop ?? 0) : view.mTop
                let leftOffset = isHidden ? (view.mHiddenLeft ?? 0) : view.mLeft
                let rightOffset = isHidden ? (view.mHiddenRight ?? 0) : view.mRight
                let bottomOffset = isHidden ? (view.mHiddenBottom ?? 0) : view.mBottom

                if anchorValid && hiddenValid {
                    view.snp.makeConstraints { make in
                        entity.cons.forEach { cons in
                            switch cons {
                            case .topToTop:
                                make.top.equalTo(anchor.snp.top).offset(topOffset)
                                break
                            case .topToBottom:
                                if entity.anchor is MParentView { break }
                                make.top.equalTo(anchor.snp.bottom).offset(topOffset)
                                break
                            case .topToCenterY:
                                make.top.equalTo(anchor.snp.centerY).offset(topOffset)
                                break
                            case .leftToLeft:
                                make.left.equalTo(anchor.snp.left).offset(leftOffset)
                                break
                            case .leftToRight:
                                if entity.anchor is MParentView { break }
                                make.left.equalTo(anchor.snp.right).offset(leftOffset)
                                break
                            case .leftToCenterX:
                                make.left.equalTo(anchor.snp.centerX).offset(leftOffset)
                                break
                            case .rightToRight:
                                make.right.equalTo(anchor.snp.right).offset(-rightOffset)
                                break
                            case .rightToLeft:
                                if entity.anchor is MParentView { break }
                                make.right.equalTo(anchor.snp.left).offset(-rightOffset)
                                break
                            case .rightToCenterX:
                                make.right.equalTo(anchor.snp.centerX).offset(-rightOffset)
                                break
                            case .bottomToBottom:
                                make.bottom.equalTo(anchor.snp.bottom).offset(-bottomOffset)
                                break
                            case .bottomToTop:
                                if entity.anchor is MParentView { break }
                                make.bottom.equalTo(anchor.snp.top).offset(-bottomOffset)
                                break
                            case .bottomToCenterY:
                                make.bottom.equalTo(anchor.snp.centerY).offset(-bottomOffset)
                                break
                            case .centerToCenter:
                                make.center.equalTo(anchor.snp.center)
                                break
                            case .centerXToCenterX:
                                make.centerX.equalTo(anchor.snp.centerX).offset(leftOffset - rightOffset)
                                break
                            case .centerXToLeft:
                                make.centerX.equalTo(anchor.snp.left).offset(leftOffset)
                                break
                            case .centerXToRight:
                                make.centerX.equalTo(anchor.snp.right).offset(-rightOffset)
                                break
                            case .centerYToCenterY:
                                make.centerY.equalTo(anchor.snp.centerY).offset(topOffset - bottomOffset)
                                break
                            case .centerYToTop:
                                make.centerY.equalTo(anchor.snp.top).offset(topOffset)
                                break
                            case .centerYToBottom:
                                make.centerY.equalTo(anchor.snp.bottom).offset(-bottomOffset)
                                break
                            }
                        }
                    }
                }
            }
        }
    }

    override open func willRemoveSubview(_ subview: UIView) {
        guard let i: Int = mSubviews.firstIndex(where: { $0 == subview }) else { return }
        mSubviews[i].removeObserver(self, forKeyPath: "hidden", context: &UIView.mContext)
        mSubviews.remove(at: i)
        super.willRemoveSubview(subview)

        if !isDeinit {
            layoutSubview(mSubviews.getOrNil(i - 1))
        }
    }

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        if scrollerAble && superview?.superview != nil {
            superview?.snp.makeConstraints {
                if mWidth == .match {
                    $0.width.equalToSuperview()
                } else if mWidth == .wrap {
                    $0.width.equalTo(self)
                } else {
                    $0.width.equalTo(mWidth)
                }
                if mHeight == .match {
                    $0.top.equalToSuperview()
                    if safeEdge {
                        $0.bottom.equalTo(superview!.superview!.safeAreaLayoutGuide.snp.bottom).offset(-1	)
                    } else {
                        $0.bottom.equalToSuperview()
                    }
                } else if mHeight == .wrap {
                    $0.height.equalTo(self)
                } else {
                    $0.height.equalTo(mHeight)
                }
            }
            snp.makeConstraints {
                if mWidth == .match && orientation == .vertical {
                    $0.width.equalToSuperview()
                } else {
                    $0.left.equalToSuperview()
                }
                if mHeight == .match && orientation == .horizontal {
                    $0.height.equalToSuperview()
                } else {
                    $0.top.equalToSuperview()
                }
            }
            DispatchQueue.main.async { [weak self] in
                self?.layoutSubview()
            }

        } else {
            if superview != nil && !scrollerAble {
                snp.remakeConstraints {
                    if mWidth == .match {
                        $0.width.equalToSuperview()
                        if orientation == .horizontal {
                            layer.masksToBounds = true
                        }
                    } else if mWidth == .wrap {
                        if autoAttach { $0.left.equalToSuperview() }
                    } else if mWidth >= 0 {
                        $0.width.equalTo(mWidth)
                        if orientation == .horizontal {
                            layer.masksToBounds = true
                        }
                    }
                    if mHeight == .match {
                        $0.top.equalToSuperview()
                        if safeEdge {
                            $0.bottom.equalTo(superview!.safeAreaLayoutGuide.snp.bottom)
                        } else {
                            $0.bottom.equalToSuperview()
                        }
                        if orientation == .vertical {
                            layer.masksToBounds = true
                        }
                    } else if mHeight == .wrap {
                        if autoAttach { $0.top.equalToSuperview() }
                    } else if mHeight >= 0 {
                        $0.height.equalTo(mHeight)
                        if orientation == .vertical {
                            layer.masksToBounds = true
                        }
                    }
                }
                DispatchQueue.main.async { [weak self] in
                    self?.layoutSubview()
                }
            }
        }
    }

    public func layoutSubview(_ view: UIView? = nil) {
        if view != nil {
            guard let i: Int = mSubviews.firstIndex(where: { $0 == view }) else { return }

            for index in max(0, i - 1) ... (i + 2) {
                guard let subView = mSubviews.getOrNil(index) else { continue }
                makeConstrain(subView, index, (index - i) < 2)
            }
        } else {
            for (i, subView) in mSubviews.enumerated() {
                makeConstrain(subView, i, true)
            }
        }

        DispatchQueue.main.async { [weak self] in
            self?.makeAttachConstrain()
        }
    }

    func makeConstrain(_ view: UIView, _ i: Int, _ clearNextCons: Bool) {
        view.snp.remakeConstraints {
            let isHidden = view.isHidden

            let topOffset = isHidden ? 0 : view.mTop

            let bottomOffset = isHidden ? 0 : -view.mBottom

            let leftOffset = isHidden ? 0 : view.mLeft

            let rightOffset = isHidden ? 0 : -view.mRight

            if orientation == .vertical {
                let hiddenTopOffset = isHidden ? 0 : (view.mHiddenTop != nil ? view.mHiddenTop! : view.mTop)
                let hiddenBottomOffset = isHidden ? 0 : (view.mHiddenBottom != nil ? view.mHiddenBottom! : view.mBottom)
                var constraint: Constraint?
                if i <= 0 {
                    constraint = $0.top.equalToSuperview().offset(topOffset).constraint

                } else {
                    let preSubView = mSubviews[i - 1]

                    let preSubViewIsHidden = preSubView.isHidden

                    let preBottomOffset = preSubViewIsHidden ? 0 : preSubView.mBottom

                    let currentTopOffset = preSubViewIsHidden ? hiddenTopOffset : topOffset

                    constraint = $0.top.greaterThanOrEqualTo(preSubView.snp.bottom).offset(currentTopOffset + preBottomOffset).constraint
                }

                if mSubviews.count > i + 1 {
                    let nextSubView = mSubviews[i + 1]
                    let nextSubViewIsHidden = nextSubView.isHidden

                    let nextTopOffset = nextSubViewIsHidden ? 0 : nextSubView.mTop
//
                    let currentBottomOffset = nextSubViewIsHidden ? hiddenBottomOffset : bottomOffset

                    if clearNextCons { nextSubView.snp.removeConstraints() }
                    $0.right.greaterThanOrEqualTo(nextSubView.snp.left).offset(-currentBottomOffset - nextTopOffset)
                }

                if i == mSubviews.count - 1 {
                    if mHeight == .wrap || scrollerAble || mSubviews.filter { $0.isHidden == false && $0.mWidth == .match }.count > 0 {
                        $0.bottom.equalToSuperview().offset(bottomOffset)
                    }
                }

                if view.isHidden {
                    if mWidth == .wrap {
                        self.snp.makeConstraints {
                            $0.width.greaterThanOrEqualTo(0)
                        }
                    }
                    $0.size.equalTo(0)
                } else {
                    if mWidth == .wrap {
                        self.snp.makeConstraints {
                            $0.width.greaterThanOrEqualTo(view).offset(view.mGravity == .center ? abs(isHidden ? 0 : (view.mRight - view.mLeft)) * 2 : abs(isHidden ? 0 : (view.mRight + view.mLeft)))
                        }
                    }

                    if view.mWidth == .match {
                        $0.left.equalToSuperview().offset(leftOffset)
                        $0.right.equalToSuperview().offset(rightOffset)
                    } else {
                        if view.mGravity == .center {
                            $0.centerX.equalToSuperview().offset(isHidden ? 0 : (view.mLeft - view.mRight))
                        } else if view.mGravity == .right {
                            $0.right.equalToSuperview().offset(rightOffset)
                        } else {
                            $0.left.equalToSuperview().offset(leftOffset)
                        }

                        if view.mWidth >= 0 {
                            $0.width.equalTo(view.mWidth)
                        }
                    }

                    if view.mHeight >= 0 {
                        $0.height.equalTo(view.mHeight)
                    }
                }

            } else {
                let hiddenLeftOffset = isHidden ? 0 : (view.mHiddenLeft != nil ? view.mHiddenLeft! : view.mLeft)
                let hiddenRightOffset = isHidden ? 0 : (view.mHiddenRight != nil ? -view.mHiddenRight! : -view.mRight)

                var constraint: Constraint?
                var attachBottom = false
                if i <= 0 {
                    constraint = $0.left.equalToSuperview().offset(leftOffset).constraint

                    if view.mWidth == .match {
                        constraint?.update(priority: .low)
                        attachBottom = true
                    }
                } else {
                    let preSubView = mSubviews[i - 1]

                    let preSubViewIsHidden = preSubView.isHidden

                    let preRightOffset = preSubViewIsHidden ? 0 : preSubView.mRight

                    let currentLeftOffset = preSubViewIsHidden ? hiddenLeftOffset : leftOffset

                    constraint = $0.left.greaterThanOrEqualTo(preSubView.snp.right).offset(currentLeftOffset + preRightOffset).constraint

                    if view.mWidth == .match || preSubView.mWidth == .match {
                        constraint?.update(priority: .low)
                        attachBottom = true
                    }
                }

                if mSubviews.count > i + 1 {
                    let nextSubView = mSubviews[i + 1]
                    let nextSubViewIsHidden = nextSubView.isHidden

                    let nextLeftOffset = nextSubViewIsHidden ? 0 : nextSubView.mLeft

                    let currentRightOffset = nextSubViewIsHidden ? hiddenRightOffset : rightOffset
                    if clearNextCons { nextSubView.snp.removeConstraints() }
                    $0.right.greaterThanOrEqualTo(nextSubView.snp.left).offset(currentRightOffset - nextLeftOffset)
                }

                if mHeight == .wrap {
                    self.snp.makeConstraints {
                        $0.height.greaterThanOrEqualTo(view).offset(view.mGravity == .center ? abs(isHidden ? 0 : (view.mTop - view.mBottom)) * 2 : abs(isHidden ? 0 : (view.mTop + view.mBottom)))
                    }
                }
                if view.isHidden {
                    if mHeight == .wrap {
                        self.snp.makeConstraints {
                            $0.height.greaterThanOrEqualTo(0)
                        }
                    }
                    $0.size.equalTo(0)
                } else {
                    if view.mWidth >= 0 {
                        $0.width.equalTo(view.mWidth)
                    }

                    if view.mHeight == .match {
                        $0.top.equalToSuperview().offset(topOffset)
                        $0.bottom.equalToSuperview().offset(bottomOffset)
                    } else {
                        if view.mHeight >= 0 {
                            $0.height.equalTo(view.mHeight)
                        }
                        if view.mGravity == .center {
                            $0.centerY.equalToSuperview().offset(isHidden ? 0 : (view.mTop - view.mBottom))
                        } else if view.mGravity == .bottom {
                            $0.bottom.equalToSuperview().offset(bottomOffset)
                        } else {
                            $0.top.equalToSuperview().offset(topOffset)
                        }
                    }
                }
                if i == mSubviews.count - 1 {
                    if mWidth == .wrap || scrollerAble || mSubviews.filter { $0.isHidden == false && $0.mWidth == .match }.count > 0 {
                        $0.right.equalToSuperview().offset(rightOffset)
                    }
                }
            }
        }
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "hidden" && context == &UIView.mContext {
            if containMLinView() {
                layoutSubview()
            } else {
                layoutSubview(object as? UIView)
            }
        }
    }

    private func containMLinView() -> Bool {
        return mSubviews.first { $0.isKind(of: MLinView.self) } != nil
    }

    deinit {
        isDeinit = true
    }
}

open class MLinScrollView: UIScrollView {
    
    private var safeEdge:Bool = false
    open lazy var _mLinView = MLinView(mWidth: .match, mHeight: .match) => { it in
        it.backgroundColor = color_gray_F5
        it.scrollerAble = true
        it.safeEdge = safeEdge
    }
    
    public init(safeEdge:Bool = false) {
        super.init(frame: .zero)
        self.safeEdge = safeEdge
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        bounces = false
        super.addSubview(_mLinView)
        backgroundColor = color_gray_F5
        _mLinView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        _mLinView.didMoveToSuperview()
    }
    
    override open func addSubview(_ view: UIView) {
        _mLinView.addSubview(view)
    }

    public func addSubview(_ view: UIView, mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, mGravity: MGravity? = nil, forceLayout: Bool = true) {
        _mLinView.addSubview(view, mWidth: mWidth, mHeight: mHeight, mGravity: mGravity, forceLayout: forceLayout)
    }

    public func insertSubview(_ view: UIView, _ index: Int, mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, mGravity: MGravity? = nil, forceLayout: Bool = true) {
        _mLinView.insertSubview(view, index, mWidth: mWidth, mHeight: mHeight, mGravity: mGravity, forceLayout: forceLayout)
    }
    
    public func addBatch(_ views: UIView..., mWidth: CGFloat? = nil, mHeight: CGFloat? = nil, insets: UIEdgeInsets? = nil, mGravity: MGravity? = nil) {
        _mLinView.addBatch(views, mWidth: mWidth, mHeight: mHeight, insets: insets, mGravity: mGravity)
    }
}
