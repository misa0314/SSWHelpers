//
//  ImageHelper.swift
//  SSWHelpers
//
//  Created by 渡邉美沙 on 2018/08/01.
//  Copyright © 2018年 渡邉美沙. All rights reserved.
//

//  画像関連extension群

import UIKit

public class ImageHelper: NSObject
{

}

public extension UIImageView
{
    /// 正方形の画像の表示を正円で表示する
    public func roundImage()
    {
        let width = self.frame.size.width
        
        self.layer.cornerRadius = width / 2.0
        self.layer.masksToBounds = true
    }
    
    /// 画像を角丸で表示する
    ///
    /// - Parameter cornerRadius: 角丸の角度
    public func cornerRoundImage(cornerRadius: CGFloat)
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    /// 画像に枠線をつけて表示する
    ///
    /// - Parameters:
    ///   - color: 枠線の色
    ///   - width: 枠線の太さ
    public func drawBorder(color: UIColor, width: CGFloat)
    {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}

public extension UIImage
{
    /// サイズを指定してリサイズする
    ///
    /// - Parameters:
    ///   - width: リサイズ後の横幅
    ///   - height: リサイズ後の縦幅
    /// - Returns: リサイズした画像
    public func resizeImage(width: CGFloat, height: CGFloat) -> UIImage?
    {
        let size = CGSize.init(width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect.init(x: 0.0, y: 0.0, width: size.width, height: size.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizeImage
    }
    
    /// スケールを指定してリサイズする
    ///
    /// - Parameter scale: リサイズするスケール
    /// - Returns: リサイズした画像
    public func resizeImage(scale: CGFloat) -> UIImage?
    {
        let size = CGSize.init(width: self.size.width * scale, height: self.size.height * scale)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect.init(x: 0.0, y: 0.0, width: size.width, height: size.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizeImage
    }
    
    /// 開始地点を指定して画像を切り抜く
    ///
    /// - Parameters:
    ///   - x: 開始地点のx座標
    ///   - y: 開始地点のy座標
    ///   - width: 切り抜く画像の横幅
    ///   - height: 切り抜く画像の縦幅
    /// - Returns: 切り抜いた画像
    public func cropImage(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIImage?
    {
        var opaque = false
        if let cgImage = cgImage {
            switch cgImage.alphaInfo {
            case .noneSkipLast, .noneSkipFirst:
                opaque = true
            default:
                break
            }
        }
        
        let cropRect = CGRect.init(x: x, y: y, width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(cropRect.size, opaque, scale)
        draw(at: CGPoint(x: -cropRect.origin.x, y: -cropRect.origin.y))
        let cropImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return cropImage
    }
    
    public enum cropImageOption: Int {
        case leftTop
        case leftCenter
        case leftBottom
        case centeredTop
        case center
        case centeredBottom
        case rightTop
        case rightCenter
        case rightBottom
    }
    
    /// オプションを指定して画像を切り抜く
    ///
    /// - Parameters:
    ///   - option: 画像切り抜き位置
    ///   - width: 切り抜く画像の横幅
    ///   - height: 切り抜く画像の縦幅
    /// - Returns: 切り抜いた画像
    public func cropImageWithOption(option: cropImageOption, width: CGFloat, height: CGFloat) -> UIImage?
    {
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        switch option {
        case .leftTop:
            x = 0.0
            y = 0.0
        case .leftCenter:
            x = 0.0
            y = (self.size.height / 2.0 ) - (height / 2.0)
        case .leftBottom:
            x = 0.0
            y = self.size.height - height
        case .centeredTop:
            x = (self.size.width / 2.0) - (width / 2.0)
            y = 0.0
        case .center:
            x = (self.size.width / 2.0) - (width / 2.0)
            y = (self.size.height / 2.0 ) - (height / 2.0)
        case .centeredBottom:
            x = (self.size.width / 2.0) - (width / 2.0)
            y = self.size.height - height
        case .rightTop:
            x = self.size.width - width
            y = 0.0
        case .rightCenter:
            x = self.size.width - width
            y = (self.size.height / 2.0 ) - (height / 2.0)
        case .rightBottom:
            x = self.size.width - width
            y = self.size.height - height
        }
        return self.cropImage(x: x, y: y, width: width, height: height)
    }
}
