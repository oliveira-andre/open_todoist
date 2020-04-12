<template>
  <div id="bHeader">
    <header>
      <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <div class="left-side">
            <i class="fas fa-bars" v-on:click="toggleSidebar"></i>
            <input placeholder="Fast Search" class="input input-search">
          </div>
          <div class="right-side" v-if="is_signed_in">
            <div class="item is-size-5">
              <a href="#">
                <i class="fas fa-cog"></i>
              </a>
            </div>
            <div class="item is-size-5">
              <a href="#">
                <i class="fas fa-bell"></i>
              </a>
            </div>
            <div class="item is-size-5">
              <a href="">
                <i class="fas fa-chart-line"></i>
                <span class="is-size-6">
                  0/5
                </span>
              </a>
            </div>
            <div class="item is-size-5">
              <a href="#">
                <i class="fas fa-plus"></i>
              </a>
            </div>
          </div>
          <div class="right-side" v-else>
            <div class="item">
              <button class="button is-danger is-small" data-target="login-modal" v-on:click="openLoginModal">
                Login
              </button>
            </div>
          </div>
        </div>
      </nav>
      <div class="modal" id="login-modal">
        <div class="modal-background" v-on:click="closeLoginModal"></div>
        <div class="modal-content">
          <form v-on:submit.prevent="onSubmit">
            <div class="field">
              <label class="label" for="email">
                Email
              </label>
              <div class="control">
                <input class="input" type="email" id="email" v-model="email">
              </div>
            </div>
            <div class="field">
              <label class="label" for="password">
                Password
              </label>
              <div class="control">
                <input class="input" type="password" id="password" v-model="password">
              </div>
            </div>
            <button class="button is-danger is-fullwidth" type="submit">
              Login
            </button>
          </form>
        </div>
      </div>
    </header>
  </div>
</template>

<script>
  import toastr from 'toastr/toastr';

export default {
  props: ["current_user", "is_signed_in"],
  data: function () {
    return {
      email: '',
      password: '',
    }
  },
  methods: {
    openLoginModal: function(event) {
      const modal = document.getElementById(event.target.dataset.target);
      modal.classList.add('is-active');
    },
    closeLoginModal: function(event) {
      event.target.parentNode.classList.remove('is-active');
    },
    toggleSidebar: function() {
      const sidebar = document.getElementById('bSidebar');
      const body = document.getElementById('home');
      
      if(sidebar.classList.contains('exited')){
        sidebar.classList.remove('exited');
        home.classList.add('menu_show');
      } else {
        sidebar.classList.add('exited');
        home.classList.remove('menu_show');
      }
    },
    onSubmit: function() {
      this.$http.post('/users/sign_in', {
        users: { 
          email: email.value,
          password: password.value 
        } 
      }).then(response => { 
        if(response.status == 202) {
          toastr.success(response.data.message);
          Tubolinks.visit('/');
        }
      }, response => { 
          toastr.error('Email or Password are wrong');
        });
    },
  }
}
</script>

