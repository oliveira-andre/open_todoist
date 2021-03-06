import Vue from 'vue'
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import HomeIndex from './home/index';
import LoginIndex from './login/index';
import TasksArchivedsIndex from './tasksArchiveds/index';
import WeekIndex from './week/index';

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: HomeIndex },
    { path: '/login', component: LoginIndex },
    { path: '/archiveds', component: TasksArchivedsIndex },
    { path: '/week', component: WeekIndex },
  ],
});
