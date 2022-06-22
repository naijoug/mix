# Network

## Reference

- [即时通讯网](http://www.52im.net/)
- [TCP/IP详解 卷1：协议](http://www.52im.net/topic-tcpipvol1.html)
- [JSDelivr](https://www.jsdelivr.com) : A free CDN for Open Source
- [OpenSSH](https://github.com/openssh/openssh-portable)

## notes

- [HTTP](HTTP.md)
- [HTTPS](HTTPS.md)

## Concept

  | 缩写 | 说明
  | -- | --
  | `DNS`     | (Domain Name Server) 域名解析服务器
  | `IM`      | (Instant Messaging) 即时通讯
  | `CDN`     | (Content Delivery Network) 内容分发网络
  | `VPN`     | (Virtual Private Network) 虚拟私人网络
  | `SSH`     | (Secure Shell) 安全(加密) Shell

## `TCP/IP`

- 应用层 (OSI 应用层 & 表示层 & 会话层)
- 传输层
- 网络层
- 数据链路层
- 物理层

## `DNS`
> DNS 解析 : 域名到 IP 地址的映射，DNS 解析使用 UDP 数据报，端口号 53，采用明文传输。

  | 解析方式 | 说明
  | -- | --
  | 递归查询 | 不断地自下而上遍历解析 `我去给你问一下`
  | 迭代查询 | `我告诉你谁可能知道`

  | 解析记录 | 说明
  | -- | --
  | A 记录        | (Address) 
  | NS 记录       | (Name Server) 
  | MX 记录       | (Mail Exchange) 
  | CNAME 记录    | (Canonical Name) 
  | TXT 记录      | (Textfile)
  | TTL 值        | (Time-To-Live) 
  | PTR 值        | (Pointer)

## `VPN`

- [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)
    > Manage and switch between multiple proxies quickly & easily.
- [iGuge](https://microsoftedge.microsoft.com/addons/detail/iguge/mchibleoefileemjfghfejaggonplmmg)
    > We offer accelerated access to Google scholar Search, Chrome Store etc products.

  | `VPN` | 设备数量 | 免费流量/月 | 服务器地址 | 免费是否可用
  | :-: | :-: | :-: | :-: | :-: 
  | [Speedify](http://speedify.com/)                  | 5 | 1G    | N  | ✅ 
  | [Hotspot Shield](https://www.hotspotshield.com/)  | 1 | INF   | N  | ✅ 
  | [Windscribe](https://windscribe.com/)             | N | 10G   | 11 | ✅  
  | [SurfEasy](https://www.surfeasy.com/)             | 5 | 1.3G  | N  | ✅ 
  | [TunnelBear](https://www.tunnelbear.com/)         | N | 500M  | N  | ✅ 
  | [Hide.me](https://hide.me)                        | 1 | 2G    | 5  | ❌
  | [ProtonVPN](https://protonvpn.com)                | 1 | INF   | 3  | ❌  
  | [ZoogVPN](https://zoogvpn.com/)                   | 1 | 10G   | 3  | ❌ 
  | [ExpressVPN](https://www.expressvpn.com/)         | - | -     | -  | ❌

## `SSH`

  ```sh
  # 安装 openssh
  $ sudo apt-get update # 更新系统工具和依赖
  $ sudo apt-get install openssh-server openssh-client
    
  # 启用 openssh
  $ /etc/init.d/ssh start       # 启动
  $ /etc/init.d/ssh stop        # 停止
  $ /etc/init.d/ssh restart     # 重新启动
  # 利用 service 启用
  $ sudo service ssh start      # 启动
  $ sudo service ssh stop       # 停止
  $ sudo service ssh restart    # 重新启动

  # 启用账户 & 密码登录
  #   1. 修改 PasswordAuthentication 为 yes
  $ sudo vim /etc/ssh/sshd_config 
  #   2. 重启 ssh 服务
  $ sudo service sshd restart

  # 私钥登录
  #   方案一 : 将本机
  $ ssh-keygen                # 创建 ssh 密钥对(~/.ssh/id_rsa.pub)
  $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com" 
  #   -t : 加密算法(默认: RSA)
  #   -b : 秘钥长度(默认: 2048)
  #   -C : 指定秘钥的用户信息
  $ ssh-copy-id user@host     # 复制本机公钥到目标主机(~/.ssh/authorized_keys)
  #   方案二 : 私钥文件直接登录
  $ chmod 400 private_key.pem # 添加权限
  $ ssh -i private_key.pem user@host 
  ```