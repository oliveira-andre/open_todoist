<template>
  <div id="tasksArchiveds">
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
              <template v-for="task in project.tasks">
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
    }
</script>
