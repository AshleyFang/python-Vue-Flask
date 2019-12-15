<template>
  <el-form label-width="100px" class="demo-ruleForm"
           :model="areaForm" ref="areaForm" show-message>
    <el-form-item label="id编号" prop="id" class="areaform">
      <el-input type="text" v-model="areaForm.id" disabled placeholder="自动生成"/>
    </el-form-item>
    <el-form-item label="姓名" prop="name"
                  :rules="[{required: true, message: '请输入姓名', trigger: 'blur' }]">
      <el-input type="text" v-model="areaForm.name"/>
    </el-form-item>
    <el-form-item label="服务台区" prop="serviceArea"
                  :rules="[{required: true, message: '请输入服务台区', trigger: 'blur' }]">
    <el-input type="text" v-model="areaForm.serviceArea"/>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('areaForm')">提交</el-button>
      <el-button @click="resetForm()">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
  import {axPost} from '@/utils'

  export default {
    name: "area_list",
    data() {
      return {
        class: '',
        areaForm: {
          id: '',
          name: '',
          serviceArea: '',
        },
      }
    },
    created() {
      this.getData()
    },
    methods:{
      getData(){
        if(this.$route.params.id){
          this.class = 'update';

          let t = this.$route.params;
          this.areaForm.id = t.id;
          this.areaForm.name = t.name;
          this.areaForm.serviceArea= t.serviceArea;
        }else{
          this.class = 'add';
        }
        console.log(this.class)
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            // 编辑
            if(this.class === 'update'){
              axPost('/updateJingli', this.areaForm).then((r)=>{
                console.log(r.data.msg)
              }).then(()=>{
                this.$router.push("/area/list")
              });
            // 添加
            }else if(this.class === 'add'){
              axPost('/addJingli', this.areaForm).then((r)=>{
                console.log(r.data.msg)
              }).then(()=>{
                this.$router.push("/area/list")
              });
            }
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm() {
        this.areaForm={
          id: this.areaForm.id,
          name: '',
          serviceArea: '',
        }
      }
    }
  }
</script>

<style>
  .demo-ruleForm .el-form-item__label{
    color: white;
  }
</style>
