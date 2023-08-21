# Apple

## Reference

- [Apple Developer](https://developer.apple.com)
- [iTunes Connect](https://itunesconnect.apple.com)
- [Apple Developer Documentation](https://developer.apple.com/documentation)

## notes

- [iOS](iOS/README.md)
- [macOS](macOS/README.md)

## Concept

- `Cocoa` vs `Cocoa Touch`

| 框架 | 包含框架 | 开发平台
| --- | --- | ---
| `Cocoa`         | `Foundation` & `AppKit`   | `macOS` 应用程序
| `Cocoa Touch`   | `Foundation` & `UIKit`    | `iOS` 应用程序

- `IAP` (iOS 内购)

| IAP | 服务器地址 
| --- | ---
| 测试 | https://sandbox.itunes.apple.com/verifyReceipt
| 正式 | https://buy.itunes.apple.com/verifyReceipt

- `APNS` (iOS 推送)
 
| APNS | 服务器地址
| --- | ---
| 测试 | gateway.sandbox.push.apple.com:2195 
| 发布 | gateway.push.apple.com:2195

## Certificates

- Services
    * Apple Push Notification service SSL (Sandbox)
        > 开发环境(沙盒)苹果推送证书
    * Apple Push Notification service SSL (Sandbox & Production)
        > 通用环境(沙盒和生成)苹果推送证书
    * VoIP Services Certificate
        > 苹果推送 VoIP 服务证书