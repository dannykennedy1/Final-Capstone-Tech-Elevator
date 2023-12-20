<template>
  <div id="nav">
    <router-link v-bind:to="{ name: 'home' }" class="nav-link"
      >Home</router-link
    >
    <router-link v-bind:to="{ name: 'brewery' }" class="nav-link"
      >Breweries</router-link
    >

    <!-- <router-link v-bind:to="{ name: 'beer' }" class="nav-link"
      >Beer</router-link> -->

    <!-- <router-link v-bind:to="{ name: 'about' }" class="nav-link"
      >About</router-link> -->

    <router-link
      v-bind:to="{ name: 'logout' }"
      v-if="$store.state.token != ''"
      class="nav-link"
      >Logout</router-link
    >
    <!-- <router-link
      v-bind:to="{ name: 'login' }"
      v-if="$store.state.token != ''"
      class="nav-link"
      >Login</router-link
    > -->

    <!-- <router-link v-bind:to="{ name: 'about' }" class="nav-link"
      >About</router-link
    > -->

    <!-- <router-link
      v-bind:to="{ name: 'logout' }"
      v-if="$store.state.token != ''"
      class="nav-link"
      >Logout</router-link
    > -->
  </div>
</template>

<script>
export default {
  name: "header",
};
</script>

<style scoped>
#nav {
  text-align: center;
  background-color: lightgrey;
  padding: 20px 0;
}

.nav-link {
  text-decoration: none;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 30px;
  color: #220204;
  margin: 0 25px;
}
</style>
