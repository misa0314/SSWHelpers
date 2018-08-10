//
//  ColorHelper.swift
//  SSWHelpers
//
//  Created by 渡邉美沙 on 2018/08/02.
//  Copyright © 2018年 渡邉美沙. All rights reserved.
//

import UIKit

public class ColorHelper: NSObject {

}

public extension UIColor
{
    /// RGBから色を作成する
    ///
    /// - Parameters:
    ///   - rgb: RGB(0x111111形式で記載)
    ///   - alpha: 透過
    public convenience init(rgb: UInt, alpha: CGFloat = 1.0) {
        let red: CGFloat = CGFloat((rgb & 0xff0000) >> 16) / 0xff
        let green: CGFloat = CGFloat((rgb & 0x00ff00) >> 8) / 0xff
        let blue: CGFloat = CGFloat(rgb & 0x0000ff) / 0xff
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
