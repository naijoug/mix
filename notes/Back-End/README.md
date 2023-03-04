# Back-End

## Reference

- [互联网公司经典技术架构](https://github.com/davideuler/architecture.of.internet-product)

## Concept

| - | - | -
| -- | -- | --
| SOA   | Service Oriented Architecture     | 面向服务的架构
| SOAP  | Simple Object Access Protocol     | 简单对象协议 
| WSDL  | Web Services Description Language | 基于 XML 的 Web 服务描述语言
| ESB   | Enterprise Service Bus            | 企业服务总线
| RPC   | Remote Procedure Call             | 远程过程调用
| REST  | Representational State Transfer   | 表现层状态转化  
| SSO   | Single Sign On                    | 单点登录
| JWT   | JSON Web Token                    | 
| OAuth | Open Authorization                | 
| CMS   | Content Management System         | 内容管理系统
| CRUD  | Create Read Update Delete         | 增删改查
| CORS  | Cross-Origin Resource Sharing     | 跨域资源共享
| NIO   | NoneBlocking IO                   |
| BIO   | Blocking IO                       |
| VPC   | Virtual Private Cloud             | 

## SOA
> 面向服务的一种软件架构设计，基于网络通用的通信语言的服务接口，让软件组件可重复利用。

## Microservice
> 微服务，独立开发和部署服务的开发体系架构

## RPC vs REST

- [Restful API Design References](https://github.com/aisuhua/restful-api-design-references)
- [WEB开发中，使用JSON-RPC好，还是RESTful API好？](https://www.zhihu.com/question/28570307)
- [谁能用通俗的语言解释一下什么是 RPC 框架？](https://www.zhihu.com/question/25536695)

- RPC : (Remote Procedure Call) 远程过程调用
    * [thrift](https://github.com/apache/thrift)
    * [gRPC](https://github.com/grpc)
        > A high performance, open source universal RPC framework
    * [jsonrpc4j](https://github.com/briandilley/jsonrpc4j)
        > JSON-RPC for Java

- REST (Representational State Transfer) : 表现层状态转化  
    * Resource (资源) 
        > 网络上一个实体（具体信息），每个资源都用一个URI来标识和定位。 
    * Representation (表现层)
        > 资源的表现形式。(HTML，XML，JSON，二进制...) 
    * State Transfer (状态转移) 
        > 客户端所有操作本质上就是用某种方法让服务器中的资源状态发生变化。

## OAuth vs JWT

- [全面了解Token,JWT,OAuth,SAML,SSO](https://zhuanlan.zhihu.com/p/38942172)

- OAuth : 一种开放授权框架，为用户资源的授权定义了一个安全、开放及简单的标准，第三方无需知道用户的账号及密码，就可获取到用户的授权信息，并且这是安全的。
- JWT : 一种认证协议

## IaaS & Paas & SaaS

- [IaaS、PaaS、SaaS 的区别？](https://www.zhihu.com/question/21641778)

  | - | - | -
  | -- | -- | -- 
  | IaaS  | Infrastructure-as-a-Service   | 基础设置即服务
  | PaaS  | Platform-as-a-Service         | 平台即服务
  | SaaS  | Software-as-a-Service         | 软件即服务

- `Image Hosting Service` : 图床服务
    * [七牛](https://www.qiniu.com/)
    * [imgur](https://imgur.com/)
    * [sm.ms](https://sm.ms/)

## Virtual

- [Docker](https://github.com/docker)
- [Vagrant](https://github.com/hashicorp/vagrant)

## Cloud Server

- ECS (Elastic Compute Service) : 动态计算服务 (AWS 云服务器)
- SSE (Server-Sent Events) : 服务推送事件 

## Framework

- [xmpp](https://xmpp.org/)
- [PBootCMS](https://pbootcms.com)