import Vue from 'vue'
import App from './App'
import router from './router'
Vue.config.productionTip = false;

// 引入 Element UI
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(Element);

// 引入Echarts
import echarts from 'echarts'
Vue.prototype.$echarts = echarts

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  render: h => h(App)
});
