import Vue from 'vue'
import Router from 'vue-router'

const routerOptions = [
  {path: '/', component: 'AreaList'},
  { path: '/about', component: 'About'},
  { path: '/area/list', component: 'AreaList'},
  { path: '/area/add', component: 'AreaAdd'},
  { path: '/area/update', component: 'AreaAdd', name:'update'},
  { path: '/area/analyze/:id', component: 'AreaAnalyze'},
  { path: '*', component: 'NotFound'},
];

const routes = routerOptions.map(route => {
  return {
    ...route,
    component: () => import(`@/components/${route.component}.vue`)
  }
});

Vue.use(Router);

export default new Router({
  routes,
  mode: 'history'
})
