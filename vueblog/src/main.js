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
Vue.prototype.$path = "http://localhost:8081/";
import Qs from 'qs';
import VueAxios from 'vue-axios';
var axios_instance = axios.create({
    baseURL: "http://localhost:8081/",
    transformRequest: [function(data) {
        data = Qs.stringify(data);
        return data;
    }],
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    // withCredentials: true
});
axios_instance.interceptors.response.use(res => {
    // console.log(res, "封装的");

    // if (res.data.code == 1002) {
    //     // localStorage.removeItem('ms_username');
    //     router.push('/login');
    // } else if (res.data.code == 1001) {
    //     Message.error(res.data.message);
    // } else if (res.data.code == 1000) {
    //     return res;
    // } else if (res.data.code == 1000) {
    //     return res;
    // }
    return res;
}, error => {
    console.log(error.response);
    Message.error('请求失败');
})
Vue.use(VueAxios, axios_instance);

Vue.use(VueParticles)
    //登录的粒子插件
Vue.use(ElementUI)
Vue.config.productionTip = false
window.bus = new Vue();
new Vue({
    el: '#app',
    router,
    template: '<App/>',
    components: { App }
})