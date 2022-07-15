# Solutions

## Insert a custom view to UITextView

- [SubviewAttachingTextView](https://github.com/vlas-voloshin/SubviewAttachingTextView) : 允许 UITextView 嵌入 UIView 视图
    > UITextView behavior and subclass that allow embedding subviews as text attachments.

## Automating Version & Build Number

- [Automating Version and Build Numbers Using agvtool](https://developer.apple.com/library/archive/qa/qa1827/_index.html)
- [Better way of incrementing build number?](https://stackoverflow.com/questions/9258344/better-way-of-incrementing-build-number)
- [Automatic build versions from git in Xcode](https://gist.github.com/acrookston/55d69a16cd5363426dbf7a3d6a9ee6ce)

```bash
if [ "Release" != "${CONFIGURATION}" ]; then
exit 0
fi

plist="Info.plist"
shortVersion=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "${PROJECT_DIR}/$plist")
echo "versionNumber: $shortVersion"
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/$plist")
echo "pre buildNumber: $buildNumber"
buildNumber=`date +"%y%m%d.%H%M%S"`
echo "current buildNumber: $buildNumber"

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "${PROJECT_DIR}/$plist"
```