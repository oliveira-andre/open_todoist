require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm';
import Home from './home/index';

Vue.use(TurbolinksAdapter)
Vue.component('home', Home);

document.addEventListener("turbolinks:load", function() {
  const app = new Vue({
    el: '#app',
  });
});

