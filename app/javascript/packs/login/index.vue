<template>
  <div id="login">
    <div class="card">
      <div class="card-content">
      <form v-on:submit.prevent="onSubmit">
        <div class="field">
          <label class="label" for="email">
            Email
          </label>
          <div class="control">
            <input class="input" type="email" id="email" v-model="email" />
          </div>
        </div>
        <div class="field">
          <label class="label" for="password">
            Password
          </label>
          <div class="control">
            <input class="input" type="password" id="password" v-model="password" />
          </div>
        </div>
        <button class="button is-danger is-fullwidth" type="submit">
          Login
        </button>
      </form>
      </div>
    </div>
  </div>
</template>

<script>
      import toastr from 'toastr/toastr';
      export default {
        data: function() {
          return {
            email: '',
            password: '',
          }
        },
        methods: {  
          onSubmit: function() {
            this.$http.post('/api/v1/sessions', {
              users: { 
                email: email.value,
                password: password.value 
              } 
            }).then(response => { 
              if(response.status == 201) {
                toastr.success('You are signed in');
                localStorage.setItem('token', response.data.authentication_token);
                this.token = response.data.authentication_token;
                window.history.length > 1 ? this.$router.go(-1) : this.$router.push('/')
              }
            }, response => { 
              toastr.error('Email or Password are wrong');
            });
          },
        }
      }
</script>
