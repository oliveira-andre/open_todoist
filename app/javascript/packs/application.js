require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import Vue from 'vue/dist/vue.esm';
import TurbolinksAdapter from 'vue-turbolinks';
import VueResource from 'vue-resource';

import router from './routes.js';
import App from './App.vue';

Vue.use(VueResource);
Vue.use(TurbolinksAdapter);

document.addEventListener("turbolinks:load", function() {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const app = new Vue({
    el: '#app',
    router,
    render: h => h(App)
  });
});

