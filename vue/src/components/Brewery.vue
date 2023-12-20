<template>
  <section class="brewery">
    <h3>{{ item.name }}</h3>
    <p>
      {{ item.streetAddress }}
      <br />
      {{ item.city }}, {{ item.state }}
      {{ item.zip }}
    </p>
    <p>{{ item.phone }}</p>
    <p>{{ item.email }}</p>
    <p>
      <!-- <a class="link" target="_blank" v-bind:href="item.website">More Info</a> -->
      <router-Link
        class="link"
        v-bind:to="{ name: 'breweryInfo', params: { breweryId: item.id } }"
        >More Info
      </router-Link>
    </p>
    <p>
      <router-Link
        class="link"
        v-bind:to="{ name: 'editBrewery', params: { breweryId: item.id } }"
        >Edit Brewery
      </router-Link>
    </p>
  </section>
</template>

<script>
export default {
  name: "brewery",
  props: ["item"],
};
</script>

<style scoped>
.brewery {
  border-radius: 15px;
  background-color: lightgrey;
  height: relative;
  width: relative;
  margin: 0;
}
h3 {
  color: #220204;
}
.link {
  background-color: black;
  color: white;
  padding: 3px;
  text-decoration: none;
  border-radius: 3px;
}

.updateBtn {
  padding: 5px 27px;
  color: #fff;
  border: none;
  margin-top: 10px;
  cursor: pointer;
}
p {
  margin: 10px;
}
</style>
