require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import "@fortawesome/fontawesome-free/js/all";

import Vue from 'vue/dist/vue.esm';
import TurbolinksAdapter from 'vue-turbolinks';
import VueResource from 'vue-resource';
import VueRouter from 'vue-router'

import router from './routes.js';
import App from './App.vue';

Vue.use(VueResource);
Vue.use(TurbolinksAdapter);
Vue.use(VueRouter);

document.addEventListener("turbolinks:load", function() {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const app = new Vue({
    el: '#app',
    router: router,
    render: h => h(App)
  });
});

