# iOS

## Reference

- [Awesome Swift](https://github.com/matteocrippa/awesome-swift)
    > A collaborative list of awesome Swift libraries and resources. Feel free to contribute!
- [TimLiu-iOS](https://github.com/Tim9Liu9/TimLiu-iOS)
    > iOS开发常用三方库、插件、知名博客等等
- [ObjC 中国](https://objccn.io/)
- [NSHipster 中文](https://nshipster.cn/)
- [tips](https://github.com/pro648/tips)
- [iOS 知识小集](https://github.com/awesome-tips/iOS-Tips)

## notes

- [iOS-X](notes/iOS-X.md)
- [UIKit](notes/UIKit.md)
- [SwiftUI](notes/SwiftUI.md)
- [Solutions](notes/Solutions.md)
- [Totorials](notes/Tutorials.md)
- [Objective-C](notes/Objective-C.md)

## Concept

- `@main` vs `@UIApplicationMain`

- iOS 唯一标识

  | 标识 | 说明
  | --- | ---
  | `IMEI`    | 国际移动设备身份码，`iOS 5` 以后苹果不再允许获取 IMEI
  | `MAC`     | 网络唯一标识符，`iOS 7` 之后
  | `UDID`    | iOS 设备的唯一识别码，在 `iOS 6`（2013 年 5 月 ） 以后被 Apple 禁止
  | `UUID`    | (Universally Unique Identifier) 通用唯一识别码，NSUUID 每次获取的值都会发生变化，但是它会保持唯一性
  | `IDFA`    | 广告标识符，每台设备的唯一ID。用户可以禁止、重置、还原，`iOS 6` 提出。
  | `IDFV`    | Vendor 标示符，也被称为厂商标识符。只要用户的设备中没有卸载当前 Vendor 的所有 APP，则不会发生变化。什么是 Vendor ？可以理解成 bundleID 的前两部分

## GitHub

- [Yalantis](https://github.com/Yalantis)
- [Ramotion](https://github.com/Ramotion)
- [NextLevel](https://github.com/NextLevel)

  | Official Apps | Language 
  | --- | --- 
  | [Wikipedia iOS](https://github.com/wikimedia/wikipedia-ios) | OC & Swift 
  | [Firefox for iOS](https://github.com/mozilla-mobile/firefox-ios) | Swift
  | [WordPress for iOS](https://github.com/wordpress-mobile/WordPress-iOS) | Swift

## Architecture

- [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture)
    > A library for building applications in a consistent and understandable way, with composition, testing, and ergonomics in mind.

## Debug Tools

- [FLEX](https://github.com/FLEXTool/FLEX)
    > An in-app debugging and exploration tool for iOS

## Localized

- `InfoPlist.strings` : App 系统显示层面上的本地化的（如 App 名字）
    * [Cocoa Keys](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html)
    * [Core Foundation Keys](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html)
- `Localizable.strings` : 代码中用到的字符串用宏 `NSLocalizedString(key, comment)` 做本地化默认 .strings 文件
- `xxx.strings` : 自定义本地化文件，用宏 `NSLocalizedStringFromTable(key, tbl, comment)` 来指定 `.strings` 文件的来源

## Commands

  ```bash
  # 将 OC 代码转化为 C/C++ 代码
  clang -rewrite-objc main.m -o main.cpp
  # 只生成 iOS 平台下代码
  #   xcrun == Xcode Run
  #   -sdk    指定系统平台
  #   -arch   指定的架构
  xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp

  # 查看xxx.app的uuid
  $ dwarfdump  --uuid xxx.app/xxx
  # 查看xxx.app.dSYM的uuid
  $ dwarfdump --uuid xxx.app.dSYM/Contents/Resources/DWARF/xxx

  # genstrings [-a] [-q] [-o <outputDir>] sourcefile
  # > 遍历当前目录，生成 Localizable.strings
  #   -a  在存在的文件后面追加内容
  #   -q  关闭多个键/值对的警告
  #   -o  指定输出目录
  $ genstrings -o en.lproj  *.m
  $ genstrings -o zh-Hans.lproj *.m
  # 遍历当前目录及所有子目录中的 .m 文件，生成 Localizable.strings
  $ find . -name \*.m | xargs genstrings -o en.lproj
  $ find ./ -name "*.m" -print0 | xargs -0 genstrings -o en.lproj # 与上面等价
  ```
    
## Tool

- [XcodesApp](https://github.com/RobotsAndPencils/XcodesApp) : 切换不同的 Xcode 版本
    > https://github.com/RobotsAndPencils/XcodesApp
- [XcodeProjects](https://github.com/DKalachniuk/XcodeProjects)
    > Switch between projects faster. Don't write "pod install", "pod update" and "cd <your project>" anymore. Just click couple of buttons
- [Apple Party](https://github.com/37iOS/AppleParty)
- [ProfilesManager](https://github.com/shaojiankui/ProfilesManager)
    > Apple iOS/macOS Provisioning Profiles management,.provisionprofile, .mobileprovision files manager tool for mac
