//
//  StringHelper.swift
//  SSWHelpers
//
//  Created by 渡邉美沙 on 2018/07/31.
//  Copyright © 2018年 渡邉美沙. All rights reserved.
//

//  Stringクラス用extension群

import UIKit

public class StringHelper: NSObject
{

}

public extension String
{
    /// 日付文字列→Date型変換
    ///
    /// - Parameter format: 変換後のformat
    /// - Returns: 変換後のDate
    public func toDate(format: String) -> Date?
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        formatter.dateFormat = format
        
        return formatter.date(from: self)
    }
}
