<h1>项目目前进度</h1>
* 前端基于`QT`实现气泡聊天对话框，支持添加好友，好友通信，聊天记录展示等功能。仿微信实现聊天布局和qss优化。
*  后端采用分布式设计
*  分为`GateServer`网关服务，`StatusServer`负载均匀，多个`ChatServer`分布式承载用户聊天连接，`VarifyServer`用来验证和收发邮件，各服务通过`grpc`通信。
*  网关对外采用http服务，聊天服务采用asio实现tcp可靠长链接通信和转发,为Tcp数据流的粘包做了拆包处理。
* 用户数据通过msql存储并且基于`mysqlconnector`手动封装连接池，包括redis连接池，以及grpc连接池等。
* 基于`boost asio`实现异步通信，通过连接池管理连接。单服务器支持8000连接，多服务器分布部署可支持1W~2W活跃用户。

#正在实现
* 基于WebRtc实现的实时通讯效果。
* 文件以及图片传输
* clinet端的Chatdiolog的创建存在段错误，目前未修复。
