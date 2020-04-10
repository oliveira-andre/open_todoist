require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm';
import Home from './home/index';
import bHeader from './shared/b-header';

Vue.use(TurbolinksAdapter);
Vue.component('b-header', bHeader);
Vue.component('home', Home);

document.addEventListener("turbolinks:load", function() {
  const app = new Vue({
    el: '#app',
  });
});

