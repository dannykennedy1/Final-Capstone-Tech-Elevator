<template>
  <div id="capstone-app">
    <div id="nav">
      <Header />
      <body>
        <router-view />
      </body>
      <Footer class="footer" />
    </div>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";

export default {
  components: { Header, Footer },
};
</script>

<style scoped>
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* This ensures the footer stays at the bottom */
}

.footer {
  flex-shrink: 0; /* This prevents the footer from shrinking */
  /* Add any additional styles for your footer here */
}
</style>
