<template>
  <div id="home">
    <div class="container">
      <div class="columns is-multiline">
        <div class="column is-12 is-flex">
          <h1 class="title is-size-4">
            Caixa de entrada
          </h1>
          <div class="right-side">
            <i class="far fa-comment-alt is-size-5"></i>
            <i class="fas fa-ellipsis-h is-size-5"></i>
          </div>
        </div>
        <div class="column is-12 has-text-centered">
          <div v-if="has_tasks">
            teste
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
  props: ["tasks", "has_tasks"]
}
</script>
