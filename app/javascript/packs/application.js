require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import Vue from 'vue/dist/vue.esm';
import TurbolinksAdapter from 'vue-turbolinks';
import VueResource from 'vue-resource';
import Home from './home/index';
import bHeader from './shared/b-header';
import bSidebar from './shared/b-sidebar';

Vue.use(VueResource);
Vue.use(TurbolinksAdapter);
Vue.component('b-header', bHeader);
Vue.component('b-sidebar', bSidebar);
Vue.component('home', Home);

document.addEventListener("turbolinks:load", function() {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const app = new Vue({
    el: '#app',
  });
});

