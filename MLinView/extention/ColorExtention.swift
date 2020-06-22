//
//  ColorUtil.swift
//  mbc_jrcxpt
//
//  Created by chen on 2020/3/16.
//  Copyright © 2020 MBC. All rights reserved.
//

import UIKit

// 灰色
public let color_gray_11: UIColor = hexColor("#111111")

public let color_gray_22: UIColor = hexColor("#222222")

public let color_gray_23: UIColor = hexColor("#232323")

public var color_gray_33: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#DDDDDD")
            }
            return hexColor("#333333")
        }
    }
    return hexColor("#333333")
}

public let color_gray_44: UIColor = hexColor("#444444")

public let color_gray_55: UIColor = hexColor("#555555")

public var color_gray_66: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#AAAAAA")
            }
            return hexColor("#666666")
        }
    }
    return hexColor("#666666")
}

public let color_gray_77: UIColor = hexColor("#777777")

public let color_gray_88: UIColor = hexColor("#888888")

public let color_gray_99: UIColor = hexColor("#999999")

public let color_gray_AA: UIColor = hexColor("#AAAAAA")

public let color_gray_BB: UIColor = hexColor("#BBBBBB")

public let color_gray_C6: UIColor = hexColor("#C6C6C6")

public let color_gray_CB: UIColor = hexColor("#CBCBCB")

public let color_gray_CC: UIColor = hexColor("#CCCCCC")

public let color_gray_CD: UIColor = hexColor("#CDCDCD")

public let color_gray_D4: UIColor = hexColor("#D4D4D4")

public let color_gray_D8: UIColor = hexColor("#D8D8D8")

public let color_gray_DD: UIColor = hexColor("#DDDDDD")

public let color_gray_DA: UIColor = hexColor("#DADADA")

public let color_gray_E0: UIColor = hexColor("#E0E0E0")

public var color_gray_E3: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#3D3D3D")
            }
            return hexColor("#E3E3E3")
        }
    }
    return hexColor("#E3E3E3")
}

public let color_gray_ED: UIColor = hexColor("#EDEDED")

public let color_gray_EE: UIColor = hexColor("#EEEEEE")

public var color_gray_EF: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#333333")
            }
            return hexColor("#EFEFEF")
        }
    }
    return hexColor("#EFEFEF")
}

public let color_gray_F0: UIColor = hexColor("#F0F0F0")


public var color_gray_F5: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#151515")
            }
            return hexColor("#F5F5F5")
        }
    }
    return hexColor("#F5F5F5")
}

public let color_gray_F7: UIColor = hexColor("#F7F7F7")

public var color_gray_F8: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#191919")
            }
            return hexColor("#F8F8F8")
        }
    }
    return hexColor("#F8F8F8")
}

public let color_gray_FE: UIColor = hexColor("#FEFEFE")

public var color_white: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#232323")
            }
            return UIColor.white
        }
    }
    return UIColor.white
}

public var color_white_text: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor.init {trait in
            if trait.userInterfaceStyle == .dark {
                return hexColor("#dddddd")
            }
            return UIColor.white
        }
    }
    return UIColor.white
}

// 16进制转颜色
public func hexColor(_ color: String) -> UIColor {
    var hexString = color.replacingOccurrences(of: "#", with: "")

    if hexString.starts(with: "0x") {
        hexString = "\(hexString)\(hexString.count == 8 ? "FF" : "")"
    } else {
        hexString = "0x\(hexString)\(hexString.count == 6 ? "FF" : "")"
    }

    if hexString.count == 10 {
        var hex: UInt64 = 0

        Scanner(string: hexString).scanHexInt64(&hex)

        let r = CGFloat((hex & 0xFF000000) >> 24) / 255.0
        let g = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
        let b = CGFloat((hex & 0x0000FF00) >> 8) / 255.0
        let a = CGFloat(hex & 0x000000FF) / 255.0

        return UIColor(red: r, green: g, blue: b, alpha: a)
    } else {
        NSLog("hex color : \(color) is wrong color hex, color hex like #111111, 111111, 11111111, 0x111111")
        return UIColor.red
    }
}
