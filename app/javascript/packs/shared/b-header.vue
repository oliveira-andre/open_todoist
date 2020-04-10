<template>
  <div id="bHeader">
    <header>
      <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <div class="left-side">
            <i class="fas fa-bars"></i>
            <input placeholder="Fast Search" class="input input-search">
          </div>
          <div class="right-side">
            <div v-if="is_signed_in">
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
            <div v-else>
              <div class="item">
                <button class="button is-danger is-small" data-target="login-modal" v-on:click="openLoginModal">
                  Login
                </button>
              </div>
            </div>
          </div>
        </div>
      </nav>
      <div class="modal" id="login-modal">
        <div class="modal-background" v-on:click="closeLoginModal"></div>
        <div class="modal-content">
          <div class="field">
            <label class="label" for="email">
              Email
            </label>
            <div class="control">
              <input class="input">
            </div>
          </div>
          <div class="field">
            <label class="label" for="password">
              Password
            </label>
            <div class="control">
              <input class="input">
            </div>
          </div>
          <button class="button is-danger is-fullwidth">
            Login
          </button>
        </div>
      </div>
    </header>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        props: ["current_user", "is_signed_in"]
      }
    },
    methods: {
      openLoginModal: function(event) {
          const modal = document.getElementById(event.target.dataset.target);
          modal.classList.add('is-active');
      },
      closeLoginModal: function(event) {
          event.target.parentNode.classList.remove('is-active');
      }
    }
  }
</script>

