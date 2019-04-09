<template>
  <div id="ball">https://codepen.io/tomrishworth/pen/VbbMgV</div>
  <!-- <canvas id="c"></canvas> -->
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
        targets: ".ball",
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
.canvas {
  display: block;
  width: 100vw;
  height: 100vh;
  cursor: none;
}
.ball {
  display: block;
  width: 100vw;
  height: 100px;
  background-color: aqua;
  cursor: none;
}
</style>
