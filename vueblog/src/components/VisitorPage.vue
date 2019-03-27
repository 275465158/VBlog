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
    <el-tab-pane label="首页">用户信息
        <div id="about" v-cloak v-title data-title="关于">
        <!-- <h1 class="css127d190621611d">此心安处是吾乡</h1> -->
        <p class="css127d190621611d">醉后不知天在水，满船清梦压星河</p>
  </div>
    </el-tab-pane>
  <el-tab-pane label="文章列表"><div>
    <div style="display: flex;justify-content: flex-start">
      <el-input
        placeholder="通过标题搜索该分类下的博客..."
        prefix-icon="el-icon-search"
        v-model="keywords" style="width: 400px" size="mini">
      </el-input>
      <el-button type="primary" icon="el-icon-search" size="mini" style="margin-left: 3px" @click="searchClick">搜索
      </el-button>
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
      <el-table-column
        type="selection"
        width="35" align="left" >
      </el-table-column>
      <el-table-column
        label="标题"
        width="400" align="left">
        <template slot-scope="scope"><span style="color: #409eff;cursor: pointer" @click="itemClick(scope.row)">{{ scope.row.title}}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="最近编辑时间" width="140" align="left">
        <template slot-scope="scope">{{ scope.row.editTime | formatDateTime}}</template>
      </el-table-column>
      <el-table-column
        prop="nickname"
        label="作者"
        width="120" align="left">
      </el-table-column>
      <el-table-column
        prop="cateName"
        label="所属分类"
        width="120" align="left">
      </el-table-column>
      
    </el-table>
    <div class="blog_table_footer">
      
      <span></span>
      <el-pagination
        background
        :page-size="pageSize"
        layout="prev, pager, next"
        :total="totalCount" @current-change="handleCurrentChange" v-show="this.articles.length>0">
      </el-pagination>
    </div>
  </div></el-tab-pane>
  <el-tab-pane label="系统">
      <el-button  icon="el-icon-circle-plus-outline" size="mini" style="margin-left: 3px" @click="signup">注册
      </el-button>
      <el-button   size="mini" style="margin-left: 3px" @click="signin">登陆
      </el-button>
        
  </div>
    </el-tab-pane>
  
  </el-tabs>
</template>

<script>
 export default{
     data(){
         return {
             keywords:"",
             loading: true,
             articles:[],
             pageSize:10,
             totalCount:0,
             activeIndex2: '1',
         }
     },
     methods:{
         getData(){
             this.$http.post().then(resp=> {
             this.loading = false;
             if (resp.status == 200) {

             }
             });
         },
         searchClick(){

         },
         signup(){
        //      postRequest('/reg', {
        //   username: this.loginForm.username,
        //   password: this.loginForm.password
        // }
        // ).then(resp=> {
        //   this.loading = false;
        //   if (resp.status == 200) {
        //     //成功
            
        //   } else {
        //     //失败
        //   }
        // }, resp=> {
        //   _this.loading = false;
        //   _this.$alert('找不到服务器⊙﹏⊙∥!', '失败!');
        // });
         },
         signin(){
             this.$router.push({
                 path:"/login"
             });
         },
         handleClick(){},
         handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
        }
     },
     created(){
         this.getData();
     }
 }

</script>