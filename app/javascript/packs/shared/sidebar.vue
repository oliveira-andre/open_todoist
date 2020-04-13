<template>
  <div id="bSidebar">
    <ul class="main_filter is-flex">
      <div class="columns is-multiline">
        <li v-bind:class="{ current: isHome }">
          <a href="/">
           <i class="fas fa-inbox has-text-primary is-size-6"></i> 
            Caixa de entrada
          </a>
        </li>
        <li v-bind:class="{ current: isToday }">
          <a v-on:click="switchCurrentTab" data-time="today">
            <i class="far fa-calendar has-text-info is-size-6"></i>
            Hoje
          </a>
        </li>
        <li v-bind:class="{ current: isWeek }">
          <a v-on:click="switchCurrentTab" data-time="week">
            <i class="far fa-calendar-alt has-text-warning is-size-6"></i>
            Próximos 7 dias
          </a>
        </li>
      </div>
    </ul>
  </div>
</template>

<script>
    export default {
      data: function() {
        return {
          isHome: false,
          isToday: false,
          isWeek: false,
        }
      },
      created: function() {
        let urlParams = new URLSearchParams(window.location.search);
        let time = urlParams.get('time');

        switch(time) {
          case 'today':
            this.isToday = true
            break;
          case 'week':
            this.isWeek = true
            break;
          default:
            this.isHome = true
        };
      },
      methods: {
        switchCurrentTab: function(event) {
          Turbolinks.visit(`/?time=${event.target.dataset.time}`);
        },
      },
    }
</script>
