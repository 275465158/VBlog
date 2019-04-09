<template>
  <div>
    <p>友情链接</p>
    <a :href="url2">github</a>
    <span @click="See(url)">点击特效</span>
  </div>
</template>

<script>
export default {
  data() {
    return {
      url: "https://codepen.io/alexzaworski/pen/mEkvAG",
      url2: "https://codepen.io/collection/XLebem/4/",
      url3: "https://github.com/juliangarnier/anime"
    };
  },
  methods: {
    See(e) {
      window.location.href = e;
    }
  }
};
</script>

<style>
</style>
