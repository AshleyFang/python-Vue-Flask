# 前端文件

## cnpm install
安装应用包
## cnpm run dev
运行程序

## 运行前，要修改后端IP地址
### 后端和前端在一个机器上运行
不需要修改：path = 'http://127.0.0.1:5000'
### 不在一个机器上
####1 要保证和后端在一个局域网
####2 查询后端ip：在cmd中输入ipconfig
####3 修改src/utils.js中的path为查询到的后端ip
