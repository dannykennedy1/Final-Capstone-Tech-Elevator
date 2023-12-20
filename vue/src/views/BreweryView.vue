<template>
  <div class="brewery">
    <div>
      <h1>Brewery List</h1>
      <router-Link v-if="adminCheck" class="link" v-bind:to="{ name: 'addBrewery' }">Add Brewery
      </router-Link>
    </div>
    <section class="container">
      <brewery
        v-for="brewery in breweries"
        v-bind:key="brewery.id"
        v-bind:item="brewery"
      />
    </section>
    <form v-on:submit.prevent="createNewBrewery" v-show="showForm">
      <div class="input">
        <label for="name">Name</label>
        <input type="text" name="name" id="name" v-model="newBrewery.name" />
      </div>
      <div class="input">
        <label for="streetAddress">Street Address</label>
        <input
          type="text"
          name="streetAddress"
          id="streetAddress"
          v-model="newBrewery.streetAddress"
        />
      </div>
      <div class="input">
        <label for="city">City</label>
        <input type="text" name="city" id="city" v-model="newBrewery.city" />
      </div>
      <div class="input">
        <label for="state">State</label>
        <input type="text" name="state" id="state" v-model="newBrewery.state" />
      </div>
      <div class="input">
        <label for="zip">Zip</label>
        <input type="text" name="zip" id="zip" v-model="newBrewery.zip" />
      </div>
      <div class="input">
        <label for="phone">Phone</label>
        <input type="text" name="phone" id="phone" v-model="newBrewery.phone" />
      </div>
      <div class="input">
        <label for="email">Email</label>
        <input type="text" name="email" id="email" v-model="newBrewery.email" />
      </div>
      <div class="input">
        <label for="website">Website URL</label>
        <input
          type="text"
          name="website"
          id="website"
          v-model="newBrewery.website"
        />
      </div>
      <h3 v-show="showMessage">Must fill out all required boxes</h3>
      <button type="submit">Save Brewery</button>
      <button type="button" v-on:click="cancelForm">Cancel</button>
    </form>
  </div>
</template>

<script>
import Brewery from "../components/Brewery.vue";
import breweryService from "../services/BreweryService";
import authService from "../services/AuthService";

export default {
  components: { Brewery },
  name: "listBreweries",
  data() {
    return {
      breweries: [],
      showForm: false,
      newBrewery: {},
      showMessage: false,
      adminCheck: false,
    };
  },
  methods: {
    loadBreweries() {
      breweryService
        .listBreweries()
        .then((response) => {
          console.log("Reached listBreweries in BreweryView");
          console.log(response);
          this.breweries = response.data;
        })
        .catch((error) => {
          if (error.response) {
            console.log("Error loading breweries: ", error.response.status);
          } else if (error.request) {
            console.log(
              "Error loading breweries: unable to communicate to server"
            );
          } else {
            console.log("Error loading breweries: make request");
          }
        });
    },
    createNewBrewery() {
      if (
        this.newBrewery.name &&
        this.newBrewery.streetAddress &&
        this.newBrewery.zip &&
        this.newBrewery.state &&
        this.newBrewery.phone &&
        this.newBrewery.website &&
        this.newBrewery.city &&
        this.newBrewery.email
      )
        breweryService
          .addBrewery(this.newBrewery)
          .then(() => {
            console.log("Reached createNewBrewery in BreweryView");
            this.newBrewery = {};
            this.showForm = false;
            this.showMessage = false;
            this.loadBreweries();
          })
          .catch((error) => {
            console.log("reached catch");
            if (error.response) {
              console.log("Error adding brewery: ", error.response.status);
            } else if (error.request) {
              console.log(
                "Error adding brewery: unable to communicate to server"
              );
            } else {
              console.log("Error adding brewery: make request");
            }
          });
      else {
        this.showMessage = true;
      }
    },
    CheckForAdmin(){
      authService.checkUser()
    .then((response) => {
            console.log("Reached Login Check in BreweryView");
            console.log(response.data);
            if(response.data === "admin"){
              console.log("Reached THIS");
              this.adminCheck = true;
            }
          })
          .catch((error) => {
            console.log("reached catch of admin checking");
            if (error.response) {
              console.log("Error checking user: ", error.response.status);
            } else if (error.request) {
              console.log(
                "Error checking user: unable to communicate to server"
              );
            } else {
              console.log("Error checking user: make request");
            }
          });
    },
    cancelForm() {
      this.newBrewery = {};
      this.showForm = false;
      this.showMessage = false;
    },
  },
  created() {
    console.log("reached created in BreweryView");
    // this.CheckForAdmin();
    if(this.$store.state.token != '' ){
      this.adminCheck = true;
    }
    this.loadBreweries();
  },
};
</script>

<style scoped>
.brewery {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}

h1 {
  font-size: 24px;
  margin-bottom: 20px;
  color: black;
}

.container {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: center;
}

.input {
  margin-bottom: 10px;
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
}

button {
  padding: 10px 20px;
  background-color: black;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 10px;
}

button[type="submit"] {
  background-color: black;
}

button[type="submit"]:hover,
button[type="button"]:hover {
  background-color: #0056b3;
}

.addBtn {
  margin-bottom: 10px;
}
</style>
