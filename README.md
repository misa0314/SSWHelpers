# SSWHelpers

[![CI Status](https://img.shields.io/travis/渡邉美沙/SSWHelpers.svg?style=flat)](https://travis-ci.org/渡邉美沙/SSWHelpers)
[![Version](https://img.shields.io/cocoapods/v/SSWHelpers.svg?style=flat)](https://cocoapods.org/pods/SSWHelpers)
[![License](https://img.shields.io/cocoapods/l/SSWHelpers.svg?style=flat)](https://cocoapods.org/pods/SSWHelpers)
[![Platform](https://img.shields.io/cocoapods/p/SSWHelpers.svg?style=flat)](https://cocoapods.org/pods/SSWHelpers)

開発でよく使う処理のextentionや関数群

## 目次

- [Requirements](#Requirements)
- [Installation](#Installation)
- [BasicUsage](#BasicUsage)
    - [ColorHelper](#ColorHelper)
    - [DateHelper](#DateHelper)
    - [StringHelper](#StringHelper)
    - [ImageHelper](#ImageHelper)
- [License](#License)

## Requirements
---
iOS 9.0+
Xcode 9.4

## Installation
---

SSWHelpers is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'SSWHelpers', :git => 'https://github.com/misa0314/SSWHelpers.git', :branch => 'develop'
```

## BasicUsage
---
Import the class header.
```
import SSWHelper
```

### ColorHelper
---
#### RGBから色を作成する
アルファ指定なし
```
UIColor.init(rgb: 0xacacff)
```
アルファ指定あり
```
UIColor.init(rgb: 0xacacff, alpha: 0.5)
```

### DateHelper
---
#### Date型→日付文字列変換
```
let now: Date = Date()
let strNow = now.toString(format: "YYYY/MM/dd HH:mm:ss ZZZZ")
```

#### 指定した時刻から現在時刻までの経過をチェックする
```
if date?.isOverTime(year: 0, month: 0, day: 1, hour: 0, minute: 0) == true
{
print("経過しています")
} else {
print("経過していません")
}
```

#### 2つの日時の差分を取得
```
// 西暦を設定
var calendar = Calendar(identifier: .gregorian)
// カレンダーのロケーションを設定
calendar.locale = Locale(identifier: "en_US_POSIX")

let str = "2018/08/01 15:00:00"
let fromDate = str.toDate(format: "YYYY/MM/dd HH:mm:ss")

let diff = calendar.diffAll(from: fromDate!, to: Date())
```

### StringHelper
---
### 日付文字列→Date型変換
```
let str = "2018/08/01 15:00:00"
let fromDate = str.toDate(format: "YYYY/MM/dd HH:mm:ss")
```

### ImageHelper
---
#### 正方形の画像の表示を正円で表示
```
let imageView = UIImageView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: 200, height: 200))
imageView.image = UIImage.init(named: "image")
self.view.addSubview(imageView)
imageView.roundImage()
```

#### 画像を角丸で表示
```
let imageView = UIImageView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: 200, height: 200))
imageView.image = UIImage.init(named: "image")
self.view.addSubview(imageView)
imageView.cornerRoundImage(cornerRadius: 5.0)
```

#### 画像に枠線をつけて表示する
```
let imageView = UIImageView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: 200, height: 200))
imageView.image = UIImage.init(named: "image")
self.view.addSubview(imageView)
imageView.drawBorder(color: UIColor.blue, width: 5.0)
```

#### サイズを指定してリサイズする
```
let image = UIImage.init(named: "image")?.resizeImage(width: 100.0, height: 100.0)
```

#### スケールを指定してリサイズする
```
let image = UIImage.init(named: "image")?.resizeImage(scale: 0.5)
```

#### 開始地点を指定して画像を切り抜く
```
let image = UIImage.init(named: "image")?.cropImage(x: 0.0, y: 0.0, width: 100, height: 100)
```

#### オプションを指定して画像を切り抜く
```
let image = UIImage.init(named: "image")?.cropImageWithOption(option: UIImage.cropImageOption.center, width: 100, height: 100)
```

## License
---
SSWHelpers is available under the MIT license. See the LICENSE file for more info.
