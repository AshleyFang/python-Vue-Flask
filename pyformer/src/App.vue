<template>
  <div id="app">
    <el-row>
      <el-menu
        class="el-menu-demo"
        mode="horizontal"
        router
        background-color="#025C67"
        text-color="#fff"
        active-text-color="#ffd04b">
        <el-col :span="4">
          <img src="@/assets/logo.jpg" class="logo">
        </el-col>
        <el-col :span="4">
          <el-menu-item index="/area/list">台区经理</el-menu-item>
        </el-col>
        <el-col :span="4">
          <el-menu-item index="/area/add">增加台区</el-menu-item>
        </el-col>
        <el-col :span="4">
          <el-menu-item index="/area/query">上传工单</el-menu-item>
        </el-col>
        <el-col :span="4">
          <el-submenu index="/gongdan/list">
            <template slot="title">工单列表</template>
            <el-menu-item index="/gongdan/list/guzhang">故障工单</el-menu-item>
            <el-menu-item index="/gongdan/list/fuwu">服务工单</el-menu-item>
            <el-menu-item index="/gongdan/list/neibu">内部工单</el-menu-item>
          </el-submenu>
        </el-col>
        <el-col :span="4">
          <el-menu-item index="/">用户：{{user}}</el-menu-item>
        </el-col>
      </el-menu>
    </el-row>
    <el-row>
      <el-col :span="4" style="margin-top: 50px">
        <img src="@/assets/rmp.jpg" class="logo">
        <p style="color:#ffffff; font-size: small;line-height: 30px">
          项目：电力台区经理管理系统<br>
          前端：方一新 && 后端：汤悦<br>
          时间：2 0 1 9 年 1 1 月3 0 日<br>
        </p>
      </el-col>
      <el-col :span="18" style="margin-top: 10px">
        <router-view v-if="user"/>
        <p v-else>未登录</p>
      </el-col>
      <el-col :span="2"> </el-col>
    </el-row>
  </div>
</template>

<script>
  export default {
    name: 'app',
    data () {
      return{
        user:'asdf'
      }
    }
  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }
  .logo{
    height: 50px;
  }
</style>
