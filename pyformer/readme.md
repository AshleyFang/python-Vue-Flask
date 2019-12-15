# 前端文件

## cnpm install
安装应用包
## cnpm run dev
运行程序

## 运行前，要修改后端IP地址
前端要给后端发送数据，因此要提前知道后端IP，写在pyformer/src/utils.js文件中  
默认path = 'http://127.0.0.1:5000'
### 后端和前端在一个机器上运行
不需要修改  
### 不在一个机器上
1 要保证和后端在一个局域网  
2 查询后端ip：在cmd中输入ipconfig  
3 修改src/utils.js中的path为查询到的后端ip
