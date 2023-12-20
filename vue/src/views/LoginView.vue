<template>
  <div class="body">
    <div id="login">
      <form class="center" v-on:submit.prevent="login">
        <h2 class="centerContent">Log In</h2>
        <h3 class="centerContent" role="alert" v-show="invalidCredentials">
          Invalid username and password!
        </h3>
        <div
          class="centerContent"
          role="alert"
          v-if="this.$route.query.registration"
        >
          Thank you for registering, please sign in.
        </div>
        <div class="form-input-group centerContent">
          <label for="username">Username</label>
          <input
            type="text"
            id="username"
            v-model="user.username"
            required
            autofocus
          />
        </div>
        <div class="form-input-group centerContent">
          <label for="password">Password</label>
          <input
            type="password"
            id="password"
            v-model="user.password"
            required
          />
        </div>
        <button class="centerContentBtn" type="submit">Sign in</button>
        <p class="centerContent">Need an account?</p>
        <router-link class="centerContent" v-bind:to="{ name: 'register' }"
          >Sign up.</router-link
        >
      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style scoped>
.form-input-group {
  margin-bottom: 1rem;
}
label {
  margin-right: 0.5rem;
}

.body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 50vh;
  /* background: linear-gradient(-45deg, #220204,#4c2528, #B7531B, #F4A23F, #FBCF4C, white); */
  /* background-size: 400% 400%; */
  /* animation: gradient 15s ease infinite; */
}
/* @keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
} */
.center {
  display: flex;
  flex-direction: column;
  border-radius: 8%;
  background-color: lightgrey;
  border-style: solid;
  border-color: #220204;
  border-width: 3px;
  width: 350px;
  height: 300px;
}

.centerContent {
  display: flex;
  justify-content: center;
  align-items: center;
  text-decoration: none;
  font-family: sans-serif;
}
.centerContentBtn {
  display: grid;
  margin: 0 auto;
}
button[type="submit"] {
  width: 40%;
  height: 40px;
  border: 1px solid;
  background: black;
  border-radius: 25px;
  font-size: 18px;
  color: #e9f4fb;
  font-weight: 700;
  cursor: pointer;
  align-content: center;
}
</style>
