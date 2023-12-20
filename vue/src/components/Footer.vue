<template>
  <div id="info">
    <p>BrewScout</p>
    <p>info@brewscout.com</p>
    <p>
      <router-link v-bind:to="{ name: 'home' }" class="nav-link"
        >Home</router-link
      >
    </p>
    <p>
      <!-- <router-link v-bind:to="{ name: 'about' }" class="nav-link"
      >About</router-link> -->
    </p>
    <p>
      <!-- <router-link v-bind:to="{ name: 'privacy' }" class="nav-link"
      >Privacy policy and Terms of Service</router-link> -->
    </p>
    <p>Social Media</p>
    <p>Sitemap</p>
    <p>© 2023 The Brew Scout</p>

  </div>
</template>

<script>
export default {
  name: "footer",
};
</script>

<style scoped>
#info {
  display: flex;
  justify-content: center;
  text-align: center;
  background-color: lightgrey;
  padding: 5px 0;
  margin-top: 40px;
  font-family: sans-serif;
}

p {
  display: flex;
  align-items: center;
  margin-left: 30px;
  margin-right: 30px;
}

.nav-link {
  text-decoration: none;
  color: blue;
}
</style>
