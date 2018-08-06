//
//  DateHelper.swift
//  SSWHelpers
//
//  Created by 渡邉美沙 on 2018/07/31.
//  Copyright © 2018年 渡邉美沙. All rights reserved.
//

//  日付関連extension群

import UIKit

public class DateHelper: NSObject
{
    
    /// カレンダーのオブジェクトを取得する
    ///
    /// - Returns: カレンダーのオブジェクト
    public static func getCalendar() -> Calendar?
    {
        // 西暦を設定
        var calendar = Calendar(identifier: .gregorian)
        
        // カレンダーのロケーションを設定
        calendar.locale = Locale(identifier: "en_US_POSIX")
        
        return calendar
    }
}

public extension Date
{
    /// Date型→日付文字列変換
    ///
    /// - Parameter format: 変換後のformat
    /// - Returns: 変換後のString
    public func toString(format: String) -> String?
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    /// 指定した時刻から現在時刻までの経過をチェックする関数
    ///
    /// - Parameters:
    ///   - year: 年の経過(設定値：0〜)
    ///   - month: 月の経過(設定値：0〜11)
    ///   - day: 日の経過(設定値：0〜30)
    ///   - hour: 時の経過(設定値：0〜23)
    ///   - minute: 分の経過(設定値：0〜59)
    /// - Returns: 経過していたらtrue 経過していなければfalse
    public func isOverTime(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minute: Int = 0) -> Bool
    {
        let calendar = DateHelper.getCalendar()
        if let diffAll = calendar?.diffAll(from: self, to: Date())
        {
            // yearのチェック
            if let diffYear = diffAll.year
            {
                if diffYear >= 0
                {
                    if year < 0 { return false }
                    if year < diffYear { return true }
                    if year > diffYear { return false }
                } else if diffYear < 0 {
                    return false
                }
            }
            
            // monthのチェック
            if let diffMonth = diffAll.month
            {
                if diffMonth >= 0
                {
                    if month < 0 { return false }
                    if month < diffMonth { return true }
                    if month > diffMonth { return false }
                } else if diffMonth < 0 {
                    return false
                }
            }
            
            // dayのチェック
            if let diffDay = diffAll.day
            {
                if diffDay >= 0
                {
                    if day < 0 { return false }
                    if day < diffDay { return true }
                    if day > diffDay { return false }
                } else if diffDay < 0 {
                    return false
                }
            }
            
            // hourのチェック
            if let diffHour = diffAll.hour
            {
                if diffHour >= 0
                {
                    if hour < 0 { return false }
                    if hour < diffHour { return true }
                    if hour > diffHour { return false }
                } else if diffHour < 0 {
                    return false
                }
            }
            
            // minuteのチェック
            if let diffMinute = diffAll.minute
            {
                if diffMinute >= 0
                {
                    if minute < 0 { return false }
                    if minute < diffMinute { return true }
                    if minute > diffMinute { return false}
                } else if diffMinute < 0 {
                    return false
                }
            }
            
            // 経過時間が全て一致した場合
            return true
        }
        return false
    }
}

public extension Calendar
{
    /// 2つの日時の差分を取得
    ///
    /// - Parameters:
    ///   - from: 開始日時
    ///   - to: 終了日時
    /// - Returns: 差分
    public func diffAll(from: Date, to: Date) -> DateComponents?
    {
        return self.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond],
                                   from: from, to: to)
    }
}
