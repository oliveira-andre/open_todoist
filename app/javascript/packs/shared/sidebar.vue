<template>
  <div id="bSidebar">
    <ul class="main_filter is-flex">
      <div class="columns is-multiline">
        <li v-on:click="switchCurrentTab" class="current">
          <router-link v-on:click="switchCurrentTab" to="/">
           <i class="fas fa-inbox has-text-primary is-size-6"></i> 
            Inbox
          </router-link>
        </li>
        <li v-on:click="switchCurrentTab">
          <router-link to="/today">
            <i class="far fa-calendar has-text-info is-size-6"></i>
            Today
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
