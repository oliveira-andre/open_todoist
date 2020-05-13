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
          <div v-if="hasProjects">
            <ul class="projects" v-on:click="toggleTasks">
              <template v-for="project in projects">
                <li class="has-text-weight-bold">
                  <i class="fas fa-chevron-down is-size-7"></i> {{ project.title }}
                  <span class="has-text-weight-normal is-size-7"> {{ project.tasks.length }}</span>
                </li>
                <ul class="tasks">
                  <template v-for="task in project.tasks">
                    <li>{{ task.title }}</li>
                  </template>
                </ul>
              </template>
            </ul>
          </div>
          <div v-else class="has-text-centered center">
            <template v-if="newProject">
              <input type="text" class="input" placeholder="Type your project title" v-model="projectTitle" v-on:blur="createProject">
            </template>
            <template v-else>
              <p>Appearly you don't have any project</p>
              <button class="button is-danger is-small" v-on:click="startNewProject">New Project</button>
            </template>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import toastr from 'toastr/toastr';

export default {
  data: function() {
    return {
      hasProjects: false,
      projects: [],
      token: '',
      newProject: false,
      projectTitle: '',
    }
  },
  created: function() {
    this.token = localStorage.getItem('token');
    if(this.token == null) {
      this.$router.push('/login')
    } else {
      this.$http.get('/api/v1/projects', {
        headers: { token: this.token }
      }).then(response => {
        if(response.status == 200) {
          this.projects = response.body;
          this.hasProjects = this.projects.length !== 0;
        }
      });
    }
  },
  methods: {
    startNewProject: function(e) {
      this.newProject = true
    },
    createProject: function() {
      if(this.projectTitle === "") {
        this.newProject = false
      } else {
        this.$http.post('/api/v1/projects', {
          projects: {
            title: this.projectTitle,
          }
        }, { headers: { token: this.token } }).then(response => {
          Turbolinks.visit('/');
        }, response => {
          toastr.error('Something got wrong');
        });
      }
    },
    toggleTasks: function(e) {
      if(e.target.classList.contains('fas')) {
        var icon = e.target;
        var tasks = e.target.parentNode.parentNode.lastChild;
      } else {
        var icon = e.target.firstElementChild;
        var tasks = e.target.parentNode.lastChild;
      }

      if(icon.classList.contains('fa-chevron-down')){
        icon.classList.remove('fa-chevron-down');
        icon.classList.add('fa-chevron-right');
      } else { 
        icon.classList.remove('fa-chevron-right');
        icon.classList.add('fa-chevron-down');
      }

      if(tasks.classList.contains('is-hidden')){
        tasks.classList.remove('is-hidden');
      } else {
        tasks.classList.add('is-hidden');
      }
    },
  },
}
</script>
