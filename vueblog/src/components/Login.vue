<template>
<el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="系统登录">
        <el-form :model="loginForm" ref="loginForm" :rules="rules"  class="login-container" label-position="left"
           label-width="0px" v-loading="loading">
        <h3 class="login_title">系统登录</h3>
        <el-form-item prop="account">
          <el-input type="text" v-model="loginForm.username" auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input type="password" v-model="loginForm.password" auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>

        <el-checkbox class="login_remember" v-model="checked" label-position="left">记住密码</el-checkbox>
        <el-form-item style="width: 100%">
          <el-button type="primary" @click.native.prevent="submitClick" style="width: 100%">登录</el-button>
        </el-form-item>
        <!-- <el-form-item prop="test">
          <el-input type="text" v-model="session" auto-complete="off" placeholder="账号"></el-input>
        </el-form-item> -->

        </el-form>
        
    </el-tab-pane>
    <el-tab-pane label="用户注册">
      <el-form :rules="rules2" ref="regForm" :model="regForm" class="login-container" label-position="left"
           label-width="0px" v-loading="loading">
        <h3 class="login_title">用户注册</h3>
        <el-form-item prop="nickname">
          <el-input type="text" v-model="regForm.nickname" auto-complete="off" placeholder="博客名称"></el-input>
        </el-form-item>
        <el-form-item prop="account">
          <el-input type="text" v-model="regForm.username" auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>
        
        <el-form-item prop="password">
          <el-input type="password" v-model="regForm.password" auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item prop="checkPass">
          <el-input type="password" v-model="regForm.checkPass" auto-complete="off" placeholder="重复密码"></el-input>
        </el-form-item>
        
        <!-- <el-form-item prop="telephone">
          <el-input type="text" v-model="regForm.telephone" auto-complete="off" placeholder="手机号"></el-input>
        </el-form-item>
        <el-form-item prop="verification">
          <el-input type="text" v-model="regForm.verification" auto-complete="off" placeholder="验证码"></el-input>
        </el-form-item> -->

        <el-form-item style="width: 100%">
          <el-button type="primary" @click.native.prevent="submitClick" style="width: 100%">注册</el-button>
        </el-form-item>
        </el-form> 
    </el-tab-pane>
</el-tabs>

  
</template>
<script>
  import {postRequest} from '../utils/api'
  import {putRequest} from '../utils/api'
  export default{
    data(){
      return {
        rules: {
          account: [{required: true, message: '请输入用户名', trigger: 'blur'}],
          password: [{required: true, message: '请输入密码', trigger: 'blur'}],
        },
        rules2: {
          account: [{required: true, message: '请输入用户名', trigger: 'blur'}],
          password: [{required: true, message: '请输入密码', trigger: 'blur'}],
          checkPass: [{required: true, message: '请输入密码', trigger: 'blur'}]
        },
        checked: true,
        loginForm: {
          username: '',
          password: ''//默认123
        },
        regForm:{
          username: '',
          password: '',
          checkPass: '',
          telephone:'',
          verification:'',
        },
        loading: false,
        session:''
      }
    },
    created(){
      // var session = ${session.SPRING_SECURITY_LAST_EXCEPTION.message};
      // console.log("session",session);
      
    },
    methods: {
      submitClick: function () {
        var _this = this;
        this.loading = true;
        // postRequest('/hello', {

        // })
        postRequest('/login', {
          username: this.loginForm.username,
          password: this.loginForm.password
        }).then(resp=> {
          _this.loading = false;
              console.log(resp,"----");

          if (resp.status == 200) {
            //成功
            var json = resp.data;
            if (json.status == 'success') {
              _this.$router.replace({path: '/home'});
            } else {
              // _this.$alert('登录失败!', '失败!');
              // console.log(resp);
              this.$message({type: 'error', message:resp.data })
              
            }
          } else {
            //失败
            _this.$alert('登录失败!', '失败!');
          }
        }, resp=> {
              console.log(resp,"----");

          // _this.loading = false;
          // _this.$alert('连接服务器超时');
        });
      }
    }
  }
</script>
<style>
  .login-container {
    border-radius: 15px;
    background-clip: padding-box;
    margin: 180px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
  }

  .login_title {
    margin: 0px auto 40px auto;
    text-align: center;
    color: #505458;
  }

  .login_remember {
    margin: 0px 0px 35px 0px;
    text-align: left;
  }
</style>
