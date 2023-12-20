<template>
  <div class="beers">
    <h4 class="name">
      {{ item.name }} - {{ item.type }} - {{ item.abv }}% ABV
    </h4>
    <div class="description">{{ item.description }} &nbsp;<button id="deleteBtn" v-on:click="DeleteABeer(item.id)">Delete</button></div>
  </div>
</template>

<script>
import beerService from "../services/BeerService";
export default {
  name: "beer",
  props: ["item"],
  data() {
    return {

    };
  },
  methods: {
    DeleteABeer(id){
      beerService.deleteBeer(id)
      .then((response) => {
          console.log("Reached DELETE in BeerComponent");
          console.log(response);
          this.$router.go(this.$router.currentRoute)
        })
        .catch((error) => {
          if (error.response) {
            console.log("Error deleting beer: ", error.response.status);
          } else if (error.request) {
            console.log(
              "Error deleting beer: unable to communicate to server"
            );
          } else {
            console.log("Error deleting beer: make request");
          }
        });
    }
  }
  }
</script>

<style scoped>
div {
  margin: 5px;
}
#deleteBtn{
  background-color: #4c2528;
  color: white;
  border-radius: 10%;
}
h4 {
  margin-bottom: 5px;
  margin-top: 10px;
}
</style>
