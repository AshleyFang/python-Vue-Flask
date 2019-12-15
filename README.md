# python-Vue-Flask
应付性小作业，总体：Vue + Axios + Flask + mySQL ，细节：Element UI、Echarts

## 数据库文件 dianli.sql

## 后端文件 pylatter
默认前后端在一个电脑上运行  
1 在电脑上有一个连接账号是root,密码是123456（不是的话要么修改数据库，要么修改models文件）  
2 有一个数据库名叫dianli(也可以叫别的名字。如果不叫dianli，记得修改models文件)  
3 运行models文件  
4 运行get_msg文件  

## 前端文件 pyformer
默认在前后端在一个电脑上运行
1 cnpm install
2 cnpm run dev

## 前后端分机运行
### 1 启用pylatter/get_msg.py最后一行代码  
app.run(host='0.0.0.0', port=5000)  
### 2 修改pyformer/src/utils.js中path的值，改为后端ip  
详情见前端文件的readme

## PPT 文件
附带遇到的一些问题和解决方法，希望给多年以后（如果还要）还要重头再来的自己一个提醒。  
一个坑踩两次太痛苦了
