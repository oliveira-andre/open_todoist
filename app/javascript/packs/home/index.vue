<template>
  <div id="home" class="menu_show">
    <div class="container">
      <div class="columns is-multiline">
        <div class="column is-12 is-flex">
          <p class="title is-size-4">
            inbox
          </p>
          <div class="right-side">
            <i class="far fa-comment-alt is-size-5"></i>
            <i class="fas fa-ellipsis-h is-size-5"></i>
          </div>
        </div>
        <div class="column is-12">
          <div v-if="has_projects">
            <ul class="projects">
              <template v-for="project in projects">
                <li>{{ project.title }}</li>
                <ul class="tasks">
                  <template v-for="task in project.tasks">
                    <li>{{ task.title }}</li>
                  </template>
                </ul>
              </template>
            </ul>
          </div>
          <div v-else class="has-text-centered center">
            <p>Appearly you don't ave any tasks</p>
            <button class="button is-danger is-small">New Task</button>
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
      has_projects: false,
      projects: [],
      token: '',
    }
  },
  created: function() {
    this.token = localStorage.getItem('token');
    if(this.token !== '') {
      this.$http.get('/api/v1/projects', {
        headers: { token: this.token }
      }).then(response => {
        if(response.status == 200) {
          this.projects = response.body;
          this.has_projects = this.projects.length !== 0;
        }
      });
    }
  },
}
</script>
