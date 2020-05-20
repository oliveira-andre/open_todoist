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
            <ul class="projects">
              <template v-for="project in projects">
                <li class="has-text-weight-bold" :data-target="project.id" v-on:click.self="toggleTasks">
                  <i class="fas fa-chevron-down is-size-7"></i> {{ project.title }}
                  <span class="has-text-weight-normal is-size-7"> {{ project.tasks.length }}</span>
                  <div class="is-pulled-right">
                    <button class="button is-danger is-small" :data-target="project.id" v-on:click.stop.prevent.self="deleteProject">
                      <i class="fas fa-trash"></i>
                    </button>
                    <button class="button is-primary is-small" :data-target="project.id" v-on:click.stop.prevent.self="startNewTask">
                      <i class="is-pulled-right fas fa-plus"></i>
                    </button>
                  </div>
                </li>
                <input type="text" :id="'new-task-on-project-'+project.id" class="input is-hidden" placeholder="Type the title of task" v-model="taskTitle" v-on:keyup.enter="createTask">
                <ul class="tasks" :id="'tasks-from-project-'+project.id">
                  <template v-for="task in project.tasks.filter(task => task.status == 'opened')">
                    <div class="column is-12">
                      <li>
                        {{ task.title }}
                      <i class="is-pulled-right fas fa-trash has-text-danger" :data-project-id="project.id" :data-target="task.id" v-on:click.self="deleteTask"></i>
                      </li>
                    </div>
                  </template>
                </ul>
              </template>
            </ul>
          </div>
          <div class="has-text-centered center">
            <template v-if="newProject">
              <input type="text" class="input" placeholder="Type your project title" v-model="projectTitle" v-on:keyup.enter="createProject">
            </template>
            <template v-else>
              <p v-if="!hasProjects">Appearly you don't have any project</p>
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
          projectId: '',
          taskTitle: '',
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
    startNewTask: function(e) {
      this.projectId = e.target.dataset.target;
      let input = document.querySelector(`#new-task-on-project-${this.projectId}`);
      input.classList.remove('is-hidden');
    },
    createProject: function() {
      if(this.projectTitle === "") return

      this.$http.post('/api/v1/projects', {
        projects: {
          title: this.projectTitle,
        }
      }, { headers: { token: this.token } }).then(response => {
        this.projects.push(response.body);
        this.projectTitle = '';
        this.hasProjects = true;
        this.newProject = false;
        toastr.success('Project created!');
      }, response => {
        toastr.error('Something got wrong');
      });

    },
    createTask: function() {
      let input = document.querySelector(`#new-task-on-project-${this.projectId}`);
      input.classList.add('is-hidden');

      if(this.taskTitle === "") return

      this.$http.post(`/api/v1/projects/${this.projectId}/tasks`, {
        tasks: {
          title: this.taskTitle,
        }
      }, { headers: { token: this.token } }).then(response => {
        this.taskTitle = '';
        let projects = this.projects.find(project => project.id == this.projectId);
        projects.tasks.push(response.body);
        toastr.success('Task created!');
      }, response => {
        toastr.error('Something got wrong');
      });
    },
    deleteProject: function(e) {
      let id = e.target.dataset.target;

      this.$http.delete(`/api/v1/projects/${id}`, {
        headers: { token: this.token } 
      }).then(response => {
        let index = this.projects.findIndex(project => project.id === response.body.id);
        this.projects.splice(index ,1);
        this.hasProjects = this.projects.length !== 0;
        toastr.success('Project archived!');
      }, response => {
        toastr.error('Something got wrong');
      });
    },
    deleteTask: function(e) {
      let id = e.target.dataset.target;
      this.projectId = e.target.dataset.projectId;

      this.$http.delete(`/api/v1/projects/${this.projectId}/tasks/${id}`, {
        headers: { token: this.token } 
      }).then(response => {
        let project = this.projects.find(project => project.id == this.projectId);
        let index = project.tasks.findIndex(task => task.id === response.body.id);
        project.tasks.splice(index ,1);
        toastr.success('Task archived!');
      }, response => {
        toastr.error('Something got wrong');
      });
    },
    toggleTasks: function(e) {
      var icon = e.target.firstElementChild;
      var tasks = document.querySelector(`#tasks-from-project-${e.target.dataset.target}`);

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
