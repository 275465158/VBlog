<template>
  <div id="app">
    <div v-bind:style="{ width: width + 'px' }" class="bar"></div>
    <div class="bar bar2"></div>
    <input
      class="range"
      v-model="width"
      type="range"
      min="0"
      value="30"
      max="1000"
      step="1"
      v-on:change="animate"
    >
  </div>
</template>

<script>
import anime from "../lib/anime.es.js";
// var bouncingBall = anime({
//   targets: ".ball",
//   translateY: "50vh",
//   duration: 300,
//   loop: true,
//   direction: "alternate",
//   easing: "easeInCubic",
//   //new code
//   scaleX: {
//     value: 1.05, //代表缩放的值
//     duration: 150, // 运行时间
//     delay: 268 //延迟多久执行
//   }
// });
export default {
  methods: {
    animate: function() {
      console.log("Here");
      anime({
        targets: ".bar2",
        duration: 1500,
        // easing: 'easeInSine',
        elasticity: 400,
        width: this.width
      });
    }
  }
};
</script>

<style>
.bar {
  background: red;
  width: 50px;
  height: 50px;
  margin-bottom: 10px;
}
</style>
