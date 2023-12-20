<template>
  <div class="title">
    <img class="logo" v-bind:src="brewery.logo" />
    <h2>{{ brewery.name }} - {{ brewery.category }}</h2>
  </div>
  <div class="description">{{ brewery.description }}</div>
  <div class="photo-container">
    <img class="photo" v-bind:src="brewery.photo" />
  </div>
  <div class="info">
    <p class="address">
      {{ brewery.streetAddress }}, {{ brewery.city }}, {{ brewery.state }}
      {{ brewery.zip }}
    </p>
    <p class="phone">{{ brewery.phone }}</p>
    <p class="email">{{ brewery.email }}</p>
    <p>
      <a class="link" target="_blank" v-bind:href="brewery.website"
        >Website</a
      >
    </p>
    <p>
      <a class="link" target="_blank" v-bind:href="brewery.mapLink">Map</a>
    </p>
    <!-- HOURS <p>{{ brewery.hours }}</p> -->
  </div>
  <div>
    <h3 class="beer-list-title">
      <img class="beer-icon" src="../../beer.png" />Beer List<img
        class="beer-icon"
        src="../../beer.png"
      />
    </h3>
    <section class="beers">
      <beer v-for="beer in beers" v-bind:key="beer.id" v-bind:item="beer"></beer>
    </section>
    <div class="addBeer-container">
      <router-Link
        class="addBeer"
        v-bind:to="{ name: 'addBeer', params: { Id: breweryId } }"
        >Add a Beer
      </router-Link>
    </div>
  </div>
</template>

<script>
import Beer from "../components/Beer.vue";
import beerService from "../services/BeerService";
import breweryService from "../services/BreweryService";

export default {
  components: { Beer },
  name: "breweryInfoView",
  data() {
    return {
      breweryId: this.$route.params.breweryId,
      brewery: {},
      beers: [],
      newBeer: {},
    };
  },
  methods: {
    loadBrewery(id) {
      breweryService
        .getBrewery(id)
        .then((response) => {
          console.log("Reached loadBrewery in BreweryInfoView");
          console.log(response);
          this.brewery = response.data;
        })
        .catch((error) => {
          if (error.response) {
            console.log("Error loading brewery: ", error.response.status);
          } else if (error.request) {
            console.log(
              "Error loading brewery: unable to communicate to server"
            );
          } else {
            console.log("Error loading brewery: make request");
          }
        });
    },
    loadBeers(breweryId) {
      beerService
        .listBeers(breweryId)
        .then((response) => {
          console.log(response);
          console.log("Reached loadBeers in BreweryInfoView");
          this.beers = response.data;
        })
        .catch((error) => {
          if (error.response) {
            console.log("Error loading beer: ", error.response.status);
          } else if (error.request) {
            console.log("Error loading beer: unable to communicate to server");
          } else {
            console.log("Error loading beer: make request");
          }
        });
    },
    createNewBeer() {
      if (
        this.newBeer.name &&
        this.newBeer.description &&
        this.newBeer.type &&
        this.newBeer.abv
      ) {
        beerService
          .addBeer(this.newBeer.brewerId)
          .then(() => {
            console.log("Reached createNewBeer in AddBeerView");
            this.newBeer = {};
            this.showMessage = false;
            this.$router.push({ name: "breweryInfo" });
          })
          .catch((error) => {
            console.log("reached catch");
            if (error.response) {
              console.log("Error adding beer: ", error.response.status);
            } else if (error.request) {
              console.log("Error adding beer: unable to communicate to server");
            } else {
              console.log("Error adding beer: make request");
            }
          });
      } else {
        this.showMessage = true;
      }
    },
    cancelForm() {
      this.newBeer = {};
      this.showMessage = false;
      this.$router.push({ name: "breweryInfo" });
    },
  },

  created() {
    console.log("Reached created in BreweryInfoView");
    const brewId = this.$route.params.breweryId;
    this.loadBrewery(brewId);
    this.loadBeers(brewId);
  },
};
</script>

<style scoped>
.title {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #a3cb6f;
  margin-top: 25px;
  margin-bottom: 10px;
}

.title,
.info {
  margin-left: 15vw;
  margin-right: 15vw;
  border-radius: 10px;
}

div,
p {
  font-family: sans-serif;
}

.info {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #a3cb6f;
  margin-bottom: 10px;
  margin-top: 10px;
  font-size: 14pt;
  flex-wrap: wrap;
}

.address,
.phone,
.email,
.link {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-right: 20px;
  padding-left: 20px;
}

.logo {
  height: 75px;
  padding-right: 20px;
  padding-top: 10px;
  padding-bottom: 10px;
}

.photo {
  height: 500px;
}

.photo-container {
  display: flex;
  justify-content: center;
}

.address,
.phone,
.email,
.link {
  text-decoration: none;
}

.link {
  color: blue;
}

.beer-list-title {
  font-weight: bold;
  font-size: 20pt;
  display: flex;
  justify-content: center;
}

.beers {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

.addBeer {
  background-color: #a3cb6f;
  border-radius: 28px;
  cursor: pointer;
  color: #ffffff;
  font-family: sans-serif;
  font-size: 17px;
  font-weight: bold;
  padding: 16px 31px;
  text-decoration: none;
}

.addBeer-container {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.beer-icon {
  height: 30px;
  margin-left: 15px;
  margin-right: 15px;
}

.description {
  margin-left: 30vw;
  margin-right: 30vw;
  margin-top: 30px;
  margin-bottom: 30px;
  font-family: serif;
}
</style>
