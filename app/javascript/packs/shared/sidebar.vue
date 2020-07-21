<template>
  <div id="bSidebar" v-if="is_signed_in">
    <ul class="main_filter is-flex">
      <div class="columns is-multiline">
        <li v-on:click="switchCurrentTab" class="current">
          <router-link v-on:click="switchCurrentTab" to="/">
           <i class="fas fa-inbox has-text-primary is-size-6"></i> 
            Inbox
          </router-link>
        </li>
        <li v-on:click="switchCurrentTab">
          <router-link to="/archiveds">
            <i class="far fa-calendar has-text-info is-size-6"></i>
            Archiveds
          </router-link>
        </li>
        <li v-on:click="switchCurrentTab">
          <router-link to="/week">
            <i class="far fa-calendar-alt has-text-warning is-size-6"></i>
            Next 7 days
          </router-link>
        </li>
      </div>
    </ul>
  </div>
</template>

<script>
    export default {
      data: function() {
        return {
          is_signed_in: false
        }
      },
      created: function() {
        if(window.location.pathname !== '/login') {
          this.token = localStorage.getItem('token');
          if(this.token == null) {
            this.$router.push('/login');
          } else {
            this.$http.get(`/api/v1/users/${this.token}`, {})
              .then(response => {
                if(response.status == 200) {
                  this.current_user = response.body;
                  this.is_signed_in = true
                }
              }, response => {
                toastr.error('Not logged in');
              }); 
          }
        }
      },
      methods: {
        switchCurrentTab: function(event) {
          document.getElementsByClassName('current')[0].classList.remove('current');
          event.target.parentNode.classList.add('current');
        },
      },
    }
</script>
