<template>
  <div id="home" class="menu_show">
    <div class="container">
      <div class="columns is-multiline">
        <div class="column is-12 is-flex">
          <p class="title is-size-4">
            Caixa de entrada
          </p>
          <div class="right-side">
            <i class="far fa-comment-alt is-size-5"></i>
            <i class="fas fa-ellipsis-h is-size-5"></i>
          </div>
        </div>
        <div class="column is-12 has-text-centered">
          <div v-if="has_tasks">
            <p>teste</p>
          </div>
          <div v-else class="center">
            <p>Parece que você não tem nada agendado</p>
            <button class="button is-danger is-small">Adicionar uma tarefa</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      has_tasks: false,
      tasks: [],
      token: '',
    }
  },
  created: function() {
    this.token = localStorage.getItem('token');
    if(this.token !== '') {
      this.$http.get('/api/v1/tasks', {
        headers: { token: this.token }
      }).then(response => {
        if(response.status == 200) {
          this.tasks = response.body;
          this.has_tasks = this.tasks.length !== 0;
        }
      });
    }
  },
}
</script>
