<template>
  <div id="bHeader" v-if="is_signed_in">
    <header>
      <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <div class="left-side">
            <i class="fas fa-bars" v-on:click="toggleSidebar"></i>
            <input placeholder="Fast Search" class="input input-search">
          </div>
          <div class="right-side">
            <div class="item">
              <button class="button is-danger is-small" v-on:click="logout">
                Logout
              </button>
            </div>
          </div>
        </div>
      </nav>
    </header>
  </div>
</template>

<script>
  import toastr from 'toastr/toastr';

export default {
  data: function () {
    return {
      is_signed_in: false,
    }
  },
  created: function() {
    if(window.location.pathname !== '/login') {
    this.loadUser();
    }
  },
  methods: {
    toggleSidebar: function() {
      const sidebar = document.getElementById('bSidebar');
      const body = document.getElementById('app');
      
      if(sidebar.classList.contains('exited')){
        sidebar.classList.remove('exited');
        body.classList.add('menu_show');
      } else {
        sidebar.classList.add('exited');
        body.classList.remove('menu_show');
      }
    },
    loadUser: function() {  
      this.token = localStorage.getItem('token'); 
      if(this.token == null) {
        this.$router.push('/login');
      } else {
        this.$http.get(`/api/v1/users/${this.token}`, {})
          .then(response => {
            if(response.status == 200) {
              this.is_signed_in = true
            }
          }, response => {
            toastr.error('Not logged in');
          });
      }
    },
    logout: function() {
      localStorage.clear();
      Turbolinks.visit('/login');
    },
  }
}
  </script>

