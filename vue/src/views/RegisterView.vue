<template>
  <div class="body">
  <div id="register" class="text-center">
    <form class="center" v-on:submit.prevent="register">
      <h1 class="centerContent">Create Account</h1>
      <h4 class="centerContent" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </h4>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input
          type="text"
          id="username"
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password</label>
        <input
          type="password"
          id="confirmPassword"
          v-model="user.confirmPassword"
          required
        />
      </div>
      <button class="centerContentBtn" type="submit">Create Account</button>
      <p class="centerContent">
        <router-link v-bind:to="{ name: 'login' }"
          >Already have an account? Log in.</router-link
        >
      </p>
    </form>
  </div>
</div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: "/login",
                query: { registration: "success" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },
};
</script>

<style scoped>
.body{
  display:flex;
  justify-content: center;
  align-items: center;
  height: 90vh;
  background: linear-gradient(-45deg, #220204,#4c2528, #B7531B, #F4A23F, #FBCF4C, white);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
	height: 100vh;
}
@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}
.form-input-group {
  margin-bottom: 1rem;
  display:flex;
  justify-content: center;
  align-items: center;
}
label {
  margin-right: 0.5rem;
}
/* #register{
  display:flex;
  justify-content: center;
  align-items: center;
  height: 90vh;
  background: linear-gradient(#FBCF4C,#4c2528  )
} */
.center{
  border-radius: 8%;
  background-color: white;
  border-style: solid;
  border-color: #220204;
  border-width: 4px;
  width: 450px;
  height: 300px;
}

.centerContent {
  display:flex;
  justify-content: center;
  align-items: center;
}
.centerContentBtn {
  display:grid;
  margin:auto;
}
button[type="submit"]{
  width: 60%;
  height: 50px;
  border: 1px solid;
  background: #4c2528;
  border-radius: 25px;
  font-size: 18px;
  color: #e9f4fb;
  font-weight: 700;
  cursor: pointer;
  align-content: center;
}

</style>
