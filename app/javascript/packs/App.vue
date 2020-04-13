<template>
  <v-app>
    <Header/>
    <Sidebar/>
      <v-content>
        <router-view></router-view>
      </v-content>
  </v-app>
</template>

<script>
  import Vue from 'vue';
  import Header from './shared/header';
  import Sidebar from './shared/sidebar';
  import VueRouter from 'vue-router';
  Vue.use(VueRouter);

  export default {
    data () {
      return {
      }
    },
    components: {
      'Header': Header,
      'Sidebar': Sidebar,
    }
  }
</script>

