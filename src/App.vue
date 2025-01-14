<template>
  <div id="app">
    <MyHeader />
    <MenuBar />
    <Content />
    <MyFooter />
  </div>
</template>

<script>
import MyHeader from './components/default/Header.vue';
import MenuBar from './components/default/MenuBar.vue';
import MyFooter from './components/default/Footer.vue';
import Content from './components/Content.vue';

export default {
  name: 'App',
  components: {
    MyHeader,
    MenuBar,
    MyFooter,
    Content
  },
};
</script>

<style>
</style>