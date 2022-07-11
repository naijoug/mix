# CocoaPods
> The Cocoa Dependency Manager.

## Reference

- [CocoaPods](https://github.com/CocoaPods/CocoaPods)

## Concept



##  `resources` vs `resource_bundles`

- [Cocoapods Resources Management?](https://yoxisem544.github.io/cocoapods-resources/)

```ruby
spec.resources = ['Images/*.png', 'Sounds/*']
```

```ruby
spec.resource_bundles = {
    'MapBox' => ['MapView/Map/Resources/*.png'],
    'MapBoxOtherResources' => ['MapView/Map/OtherResources/*.png']
}
```

## Commands

```bash
# 参数说明:
#   --no-repo-update : `pod install` & `pod update` 会默认执行`pod repo update`会更新本地pod索引,加上这个参数就仅跟新当前项目需要的框架。
#   --verbose :         显示具体的输出信息
#   --silent :          不显示具体的输出信息
$ pod init          # 在当前目录创建 `Podfile` 文件
$ pod install       # 安装 Podfile 中的依赖库
$ pod update        # 更新 Podfile 中的依赖库
$ pod --no-repo-update --verbose update     # 仅更新当前项目框架

# 在本机注册一个Cocoapods账号
# 格式 : `pod trunk register 邮箱 '昵称' --description='设备信息'`
#   第一次注册后，切换设备后继续使用这个命令进行登录(可以不输入昵称)，
#   `--description` : 用于区分不同的设备
$ pod trunk register xxx@mail.com 'xxx' --description='macbook'

# 查看注册信息
#   Pods : 提交的库的信息
#   Sessions : 注册的设备信息
$ pod trunk me 

# 创建`Podspec`文件
# 已经创建后项目的情况下，可以使用此命令创建`.podspec`文件
$ pod spec create 'XXKit'
$ pod spec lint XXKit.podspec # 远程校验 Podspec 文件是否有错误

# 根据Cocoapods的项目模板，创建`Podspec`文件和一个空项目
# 创建的过程，可以通过命令行输入项目的相关信息
$ pod lib create 'XXKit'

# 本地校验 Podspec 文件是否有错误
# 参数说明:
#   --verbose :         显示具体的输出信息
#   --allow-warnings :  可以屏蔽用到的第三方框架的警告
#   --fail-fast :       出现错误就立即定制校验(正常情况是会校验完所有错误，才会停止)
#   --use-libraries :   用到了库文件需要加上这个参数
#   --sources :         包含了 Cocoapods 仓库以外的其他仓库
#   --subspec=XXX :     校验某个子模块
$ pod lib lint XXKit.podspec

# 上传到 CocoaPods 官方仓库
$ pod trunk push XXKit.podspec                  # 将`Podspec`上传到 CocoaPods  官方的仓库中
$ pod trunk push XXKit.podspec --verbose        # 显示上传信息
$ pod trunk add-owner 'XXKit' 'xxx@mail.com'    # 添加一个小伙伴到你项目
$ pod search XXKit                              # 查询 Cocoapods 是否包含这个库

# 上传到私有仓库
$ pod repo                                      # 查看当前 Repo 仓库有哪些
$ pod repo add XXSpecs git@xxx.com:xxx/XXSpecs.git # 添加一个repo specs
$ pod repo remove XXSpecs                       # 删除一个repo specs
$ pod repo push XXSpecs XXKit.podspec           # 添加specs文件到指定的远程repo
```

## Podfile

## 