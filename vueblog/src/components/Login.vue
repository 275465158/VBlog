<template>
  <el-tabs v-model="activeName" @tab-click="handleClick" style="height:100%">
    <el-tab-pane label="系统登录">
      <vue-particles
        class="lizi particles"
        color="#000"
        :particleOpacity="0.7"
        :particlesNumber="60"
        shapeType="circle"
        :particleSize="4"
        linesColor="#fff"
        :linesWidth="1"
        :lineLinked="true"
        :lineOpacity="0.4"
        :linesDistance="150"
        :moveSpeed="2"
        :hoverEffect="true"
        hoverMode="grab"
        :clickEffect="true"
        clickMode="push"
      ></vue-particles>

      <el-form
        :rules="rules"
        :model="loginForm"
        class="isSuspend login-container"
        ref="loginForm"
        label-position="left"
        label-width="0px"
        v-loading="loading"
      >
        <!-- :class="[isSuspend,login-container]" -->
        <h3 class="login_title">系统登录</h3>
        <el-form-item prop="username">
          <el-input type="text" v-model="loginForm.username" auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            type="password"
            v-model="loginForm.password"
            auto-complete="off"
            placeholder="密码"
          ></el-input>
        </el-form-item>
        <el-checkbox class="login_remember" v-model="checked" label-position="left">记住密码</el-checkbox>
        <el-form-item style="width: 100%">
          <el-button type="primary" @click="submitForm('loginForm')" style="width: 100%">登录</el-button>
        </el-form-item>
      </el-form>
    </el-tab-pane>
    <el-tab-pane label="用户注册">
      <el-form
        :rules="rules2"
        ref="regForm"
        :model="regForm"
        class="login-container"
        label-position="left"
        label-width="0px"
        v-loading="loading"
      >
        <h3 class="login_title">用户注册</h3>
        <el-form-item prop="nickname">
          <el-input type="text" v-model="regForm.nickname" auto-complete="off" placeholder="博客名称"></el-input>
        </el-form-item>
        <el-form-item prop="username">
          <el-input type="text" v-model="regForm.username" auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input type="password" v-model="regForm.password" auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item prop="checkPass">
          <el-input
            type="password"
            v-model="regForm.checkPass"
            auto-complete="off"
            placeholder="重复密码"
          ></el-input>
        </el-form-item>
        <el-form-item
          prop="email"
          :rules="[
      { required: true, message: '请输入邮箱地址', trigger: 'blur' },
      { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
    ]"
        >
          <el-input v-model="regForm.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <!-- <el-form-item prop="telephone" >
          <el-input type="text" v-model="regForm.telephone" auto-complete="off" placeholder="手机号"></el-input>
        </el-form-item>-->
        <!--<el-form-item prop="verification">
          <el-input type="text" v-model="regForm.verification" auto-complete="off" placeholder="验证码"></el-input>
        </el-form-item>-->

        <el-form-item style="width: 100%">
          <el-button type="primary" @click.native.prevent="submitClick" style="width: 100%">注册</el-button>
        </el-form-item>
      </el-form>
    </el-tab-pane>
  </el-tabs>
</template>
<script>
import { postRequest } from "../utils/api";
import { putRequest } from "../utils/api";
export default {
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.regForm.checkPass !== "") {
          this.$refs.regForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.regForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }]
      },
      rules2: {
        nickname: [
          { required: true, message: "请输入博客名", trigger: "blur" }
        ],
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [{ validator: validatePass, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }]
        // telephone:[{required: true,pattern: /^1[34578]\d{9}$/,message: '目前只支持中国大陆的手机号码',trigger: 'blur'}]
      },
      checked: true,
      loginForm: {
        username: "",
        password: "" //默认123
      },
      regForm: {
        username: "",
        password: "",
        checkPass: "",
        telephone: "",
        email: "",
        verification: ""
      },
      loading: false,
      session: ""
    };
  },
  methods: {
    checkPhone(rule, value, callback) {
      if (!/^1[34578]\d{9}$/.test(value)) {
        callback(new Error("请输入正确的手机号码!"));
      }
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.log(formName, "formName");

          this.loading = true;
          if (formName === "loginForm") {
            let url = "/login";
            // console.log(url, "url");

            postRequest(
              url,
              // this.loginForm
              {
                username: this.loginForm.username,
                password: this.loginForm.password
              }
            ).then(resp => {
              this.loading = false;
              if (resp.status == 200) {
                //成功
                var json = resp.data;
                if (json.status == "success") {
                  this.$router.replace({ path: "/home" });
                } else {
                  this.$message({ type: "error", message: resp.data });
                }
              }
            });
          } else if (formName === "regForm") {
            postRequest("/reg", {
              username: this.loginForm.username,
              password: this.loginForm.password,
              email: this.loginForm.email
            }).then(resp => {
              this.loading = false;
              if (resp.status == 200) {
                //成功
                var json = resp.data;
                if (json.status == "success") {
                  this.$router.replace({ path: "/login" });
                } else {
                  this.$message({ type: "error", message: resp.data });
                }
              }
            });
          }
        } else {
          alert("error submit!!!");
          // this.$message({type: 'error', message:"咋着，想上天啊"})
          // console.log('error submit!!');
          return false;
        }
      });
    }
  }
};
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
.isSuspend {
  background: transparent;
  top: 0;
  left: 40%;
  width: 20%;
  position: absolute;
}
.particles {
  width: 100%;
}
</style>
