import Vue from 'vue'
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import HomeIndex from './home/index';
import TodayIndex from './today/index';
import WeekIndex from './week/index';

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: HomeIndex },
    { path: '/today', component: TodayIndex },
    { path: '/week', component: WeekIndex },
  ],
});
