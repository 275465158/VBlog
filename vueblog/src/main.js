import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
// import './styles/element-variables.scss'
import 'font-awesome/css/font-awesome.min.css'
import './utils/filter_utils.js'
import VueParticles from 'vue-particles'
import axios from 'axios';
import { Message } from 'element-ui';
import store from './store'
import Qs from 'qs';
import VueAxios from 'vue-axios';
import Vuex from "vuex"
// import { initMenu } from './utils/utils'



Vue.use(Vuex)
Vue.prototype.$path = "http://localhost:8081/";
axios.defaults.withCredentials = true;
var axios_instance = axios.create({
  baseURL: "http://localhost:8081/",
  transformRequest: [function (data) {
    data = Qs.stringify(data);
    return data;
  }],
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
});

axios_instance.interceptors.response.use(res => {
  return res;
}, error => {
  console.log(error.response);
  Message.error('请求失败');
})
Vue.use(VueAxios, axios_instance);
Vue.use(VueParticles)
// const store = new Vuex.Store({
//   state: {
//     //公共
//     comm: {
//       loading: false,
//       login: {
//         memberId: '',
//         userData: ''
//       },
//       indexConf: {
//         isTab: false, //是否显示tab页
//         isBack: false, //是否显示返回
//         title: '' //标题
//       }
//     }
//   },

// 这个官方名字叫导航守卫，挺形象的
// router.beforeEach((to, from, next) => {
//   // 如果是去登录或注册，那就先把user移除
//   if (to.path === '/login' || to.path === '/reg') {
//     sessionStorage.removeItem('user')
//   }
//   let user = JSON.parse(sessionStorage.getItem('user'))
//   if (!user && (to.path === '/manger/my' || to.path === '/manger/send' || to.path === '/manger/history')) {
//     next({ path: '/login' })
//   } else {
//     next()
//   }
// })
//登录的粒子插件
Vue.use(ElementUI)
Vue.config.productionTip = false
window.bus = new Vue();
new Vue({
  el: '#app',
  router,
  // store,
  template: '<App/>',
  components: { App }
})