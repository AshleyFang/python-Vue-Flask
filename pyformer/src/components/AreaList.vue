<template>
  <div>
    <template>
      <el-table v-if="areaList"
                :data="areaList.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()) || data.serviceArea.toLowerCase().includes(search.toLowerCase()) )"
                style="width: 100%" row-class-name="area-list-row"
                :header-cell-style="{background:'#025C67',color:'#ffffff'}">
        <el-table-column prop="id" label="id" width="180"> </el-table-column>
        <el-table-column prop="name" label="姓名" width="180"> </el-table-column>
        <el-table-column prop="serviceArea" label="服务台区"> </el-table-column>
        <el-table-column label="操作">
          <template slot="header" slot-scope="scope1">
            <el-input
              v-model="search"
              size="mini"
              placeholder="输入关键字搜索"/>
          </template>
          <template slot-scope="scope2">
            <el-button type="primary"  size="small" round @click.native.prevent="update(scope2.row)"> 编辑 </el-button>
            <el-button type="danger"  size="small" round @click.native.prevent="deleteRow(scope2.$index, areaList, scope2.row.id)"> 删除 </el-button>
            <el-button type="success" size="small" round @click.native.prevent="anzlyze(scope2.row.id)"> 分析 </el-button>
          </template>
        </el-table-column>
      </el-table>
      <p v-else>{{this.msg}}</p>
    </template>
  </div>
</template>

<script>
  import {axGet, axPost} from '@/utils'

  export default {
    name: "area_list",
    data() {
      return {
        areaList: this.getData(),
        search:'',
        msg:'正在查询。。。'
        }
    },
    methods: {
      getData() {
        axGet('/getJingli').then((r)=>{
          this.areaList=r.data.msg;
        }).catch(function (error) {
          alert('Error ' + error);
        })
      },
      update(row) {
        this.$router.push({
          name:'update',
          params:row,
        })
      },
      deleteRow(index, rows, id) {
        axPost('/delJingli', {'id': id}).then((r)=>{
          console.log(r.data)
        });
        rows.splice(index, 1);
        // this.getData()
        console.log('del' + id)
      },
      anzlyze(id) {
        this.$router.push({path:'/area/analyze/' + id, params:id})
      },
    }
  }
</script>

<style>
  .el-table .area-list-row {
    background: #025C67;
    text-align: center;
    color: #ffffff;
  }
  .el-table--enable-row-hover .el-table__body tr:hover>td{
    background-color: #212e3e !important;
  }
</style>
