<template>
  <div id="tasksArchiveds">
    <div class="container">
      <div class="columns is-multiline">
        <div class="column is-12">
          <div v-if="hasProjects">
            <ul class="projects">
              <template v-for="project in projects">
                <li class="has-text-weight-bold" :data-target="project.id" v-on:click.self="toggleTasks">
                  <i class="fas fa-chevron-down is-size-7"></i> {{ project.title }}
                  <span class="has-text-weight-normal is-size-7"> {{ project.tasks.length }}</span>
                </li>
                <ul class="tasks" :id="'tasks-from-project-'+project.id">
                  <template v-for="task in project.tasks">
                    <div class="column is-12">
                      <li>
                        {{ task.title }}
                      </li>
                    </div>
                  </template>
                </ul>
              </template>
            </ul>
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
          token: '',
          hasProjects: false,
          projects: [],
        }
      },
      created: function() {
        this.token = localStorage.getItem('token');
        if(this.token == null) {
          this.$router.push('/login')
        } else {
          this.$http.get('/api/v1/projects?status=archiveds', {
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
      }
    }
</script>
