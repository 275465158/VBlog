<style type="text/css">
.blog_table_footer {
  display: flex;
  box-sizing: content-box;
  padding-top: 10px;
  padding-bottom: 0px;
  margin-bottom: 0px;
  justify-content: space-between;
}
</style>
<template>
  <el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="首页">
      获取用户信息
      <el-button
        icon="el-icon-circle-plus-outline"
        size="mini"
        style="margin-left: 3px"
        @click="signup"
      >注册</el-button>
      <el-button size="mini" style="margin-left: 3px" @click="signin">登陆</el-button>
      <el-dialog title :visible.sync="loginDialogVisible" width="30%">
        <el-tabs v-model="loginAndRegActive" @tab-click="handleClick" style="height:100%">
          <el-tab-pane label="系统登录" name="login">
            <el-form
              :rules="rules"
              :model="loginForm"
              class="isSuspend login-container"
              ref="loginForm"
              label-position="left"
              label-width="0px"
              v-loading="loading"
            >
              <h3 class="login_title">系统登录</h3>
              <el-form-item prop="username">
                <el-input
                  type="text"
                  v-model="loginForm.username"
                  auto-complete="off"
                  placeholder="账号"
                ></el-input>
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
          <el-tab-pane label="用户注册" name="reg">
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
                <el-input
                  type="text"
                  v-model="regForm.nickname"
                  auto-complete="off"
                  placeholder="博客名称"
                ></el-input>
              </el-form-item>
              <el-form-item prop="username">
                <el-input
                  type="text"
                  v-model="regForm.username"
                  auto-complete="off"
                  placeholder="账号"
                ></el-input>
              </el-form-item>

              <el-form-item prop="password">
                <el-input
                  type="password"
                  v-model="regForm.password"
                  auto-complete="off"
                  placeholder="密码"
                ></el-input>
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
      { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur'] }
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
                <el-button type="primary" @click="submitForm('regForm')" style="width: 100%">注册</el-button>
              </el-form-item>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      </el-dialog>
      <div id="about" v-cloak data-title="关于">
        <!-- <h1 class="css127d190621611d">此心安处是吾乡</h1> -->
        <p class="css127d190621611d">醉后不知天在水，满船清梦压星河</p>
      </div>
    </el-tab-pane>
    <el-tab-pane label="文章列表">
      <div>
        <div style="display: flex;justify-content: flex-start">
          <el-input
            placeholder="通过标题搜索该分类下的博客..."
            prefix-icon="el-icon-search"
            v-model="keywords"
            style="width: 400px"
            size="mini"
          ></el-input>
          <el-button
            type="primary"
            icon="el-icon-search"
            size="mini"
            style="margin-left: 3px"
            @click="searchClick"
          >搜索</el-button>
        </div>
        <!--<div style="width: 100%;height: 1px;background-color: #20a0ff;margin-top: 8px;margin-bottom: 0px"></div>-->
        <el-table
          ref="multipleTable"
          :data="articles"
          tooltip-effect="dark"
          style="width: 100%;overflow-x: hidden; overflow-y: hidden;"
          max-height="390"
          v-loading="loading"
          element-loading-text="拼命加载中"
          element-loading-spinner="el-icon-loading"
          element-loading-background="rgba(0, 0, 0, 0.8)"
        >
          <el-table-column type="selection" width="35" align="left"></el-table-column>
          <el-table-column label="标题" width="400" align="left">
            <template slot-scope="scope">
              <span
                style="color: #409eff;cursor: pointer"
                @click="itemClick(scope.row)"
              >{{ scope.row.title}}</span>
            </template>
          </el-table-column>
          <el-table-column label="最近编辑时间" width="140" align="left">
            <template slot-scope="scope">{{ scope.row.editTime | formatDateTime}}</template>
          </el-table-column>
          <el-table-column prop="nickname" label="作者" width="120" align="left"></el-table-column>
          <el-table-column prop="cateName" label="所属分类" width="120" align="left"></el-table-column>
        </el-table>
        <div class="blog_table_footer">
          <span></span>
          <el-pagination
            background
            :page-size="pageSize"
            layout="prev, pager, next"
            :total="totalCount"
            @current-change="handleCurrentChange"
            v-show="this.articles.length>0"
          ></el-pagination>
        </div>
      </div>
    </el-tab-pane>
  </el-tabs>
</template>

<script>
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
      keywords: "",
      loading: true,
      articles: [],
      pageSize: 10,
      totalCount: 0,
      activeIndex2: "1",
      loginDialogVisible: false,
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
      loginAndRegActive: ""
    };
  },
  methods: {
    getData() {
      this.$http.post().then(resp => {
        this.loading = false;
        if (resp.status == 200) {
        }
      });
    },
    searchClick() {},

    handleClick() {},
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
    // -------------------------------------------------------------------------------------------
    signup() {
      this.loginAndRegActive = "login";
      this.loginDialogVisible = true;
    },
    signin() {
      this.loginAndRegActive = "reg";
      this.loginDialogVisible = true;
      // this.$router.push({
      //   path: "/login"
      // });
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          // console.log(formName, "formName");
          // this.loading = true;
          if (formName === "loginForm") {
            let url = "/login";
            // console.log(url, "url");
            this.$http
              .post("/login", {
                username: this.loginForm.username,
                password: this.loginForm.password
              })
              .then(res => {
                if (res.status == 200) {
                  console.log(res.data);
                  if (res.data.status === "success") {
                    this.$router.replace({ path: "/home" });
                  } else {
                    this.$message({ type: "error", message: resp.data });
                  }
                }
              });
          } else if (formName === "regForm") {
            postRequest("/reg", {
              username: this.regForm.username,
              password: this.regForm.password,
              email: this.regForm.email
            }).then(resp => {
              this.loading = false;
              if (resp.status == 200) {
                //成功
                var json = resp.data;
                if (json.status == "success") {
                  // this.$router.replace({ path: "/login" });
                  this.$message({ type: "success", message: resp.data });
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
  },

  created() {
    this.getData();
  }
};
</script>