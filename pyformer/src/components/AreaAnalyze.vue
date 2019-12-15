<template>
  <div class="echarts">
    <div id="gongdanBar" :style="{width: '100%', height: '400px', color:'#ffffff'}"/>
    <div id="guzhangPie" :style="{width: '100%', height: '400px', color:'#ffffff'}"/>
    <div id="guzhang" :style="{width: '100%', height: '400px', color:'#ffffff'}"/>
  </div>
</template>

<script>
  import {axGet, axPost} from '@/utils'
  export default {
    name: 'hello',
    data () {
      return {
        color:['#5394EC', '#FE5701', '#CFF051', '#FF0231'],
        dataList: this.getData()
      }
    },
    methods: {
      getData(){
        axPost('/analyze', this.$route.params).then((r)=>{
          this.dataList=r.data.msg;
          console.log(r.data);
        }).then((r)=>{
          this.bar();
          this.pie();
        })
      },
      bar(){
        let tem = this.dataList.bar;
        console.log('bar');
        console.log(tem);
        // 绑定页面上的div
        let gongdanBar = this.$echarts.init(document.getElementById('gongdanBar'));
        // 绘制图表
        gongdanBar.setOption({
          color: this.color,
          title: { text: '该经理每月工单数量分析', textStyle:{color: '#ffffff'} },
          xAxis: {
            name: '月份',
            type: 'category',
            data: tem.x,
            axisLabel:{textStyle:{color: '#ffffff'}},
            axisLine:{lineStyle:{color:'#ffffff',}}
          },
          yAxis: {
            name: '工单数量（件）',
            type: 'value',
            axisLabel:{textStyle:{color: '#ffffff'}},
            axisLine:{
              symbol: ['','arrow'],
              symbolSize: [8, 8], // 箭头大小
              symbolOffset: [0, 8],  // 箭头位置
              lineStyle:{color:'#ffffff',}
            },
          },
          legend: {//图例说明文字设置
            data: tem.legend,
            y: 'top',
            textStyle:{color: '#ffffff'}
          },
          series: [
            {
              label: {normal: {show: true, position: 'top'}},
              data: tem.y[0],
              type: 'bar',
              name: tem.legend[0]
            },{
              label: {normal: {show: true, position: 'top'}},
              data: tem.y[1],
              type: 'bar',
              name: tem.legend[1]
            },
          ]
        });
      },
      pie(){
        //假数据
        let tem = this.dataList.pie;
        console.log('pie');
        console.log(tem);
        // 基于准备好的dom，初始化echarts实例
        let guzhangPie = this.$echarts.init(document.getElementById('guzhangPie'))
        // 绘制图表
        guzhangPie.setOption({
          color: this.color,
          title: {text:'故障工单各分类比例', textStyle:{color: '#ffffff'} },
          series: [{
            name: '分类比例',
            type: 'pie',
            radius : '75%',
            center: ['50%', '60%'],
            label: {
              normal: {
                position: 'outer',  // 设置标签位置，默认在饼状图外 可选值：'outer' ¦ 'inner（饼状图上）'
                formatter(v){
                  return v.name + '：' + Math.round(v.percent)+'%'
                }
              }
            },
            itemStyle: {
                emphasis: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              },
            data: tem,
          }],
        })
      },
    }
  }
</script>

<style scoped>

</style>
