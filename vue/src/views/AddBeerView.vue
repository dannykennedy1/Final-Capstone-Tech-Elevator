<template>
    <h1>Add New Beer</h1>
    <form v-on:submit.prevent="createNewBeer">
      <div class="input">
        <label for="name">Name </label>
        <input type="text" name="name" id="name" v-model="newBeer.name"/>
      </div>
      <div class="input">
        <label for="description">Description</label>
        <input
          type="text"
          name="description"
          id="description"
          v-model="newBeer.description"
        />
      </div>
      <div class="input">
        <label for="type">Type</label>
        <input type="text" name="type" id="type" v-model="newBeer.type" />
      </div>
      <div class="input">
        <label for="abv">ABV %</label>
        <input type="text" name="abv" id="abv" v-model="newBeer.abv" />
      </div>
      <h3 v-show="showMessage">Must fill out all required boxes</h3>
      <button type="submit">Add Beer</button>
      <button type="button" v-on:click="cancelForm">Cancel</button>
    </form>
  </template>
  
  <script>
 import beerService from '../services/BeerService';
import BreweryService from '../services/BreweryService';

  export default {
    name: 'addBeer',
    data() {
      return {
        breweryId: this.$route.params.breweryId,
        newBeer: {},
        showMessage: false,
       
      };
    },
    methods: {
      createNewBeer() {
        if (
          this.newBeer.name &&
          this.newBeer.description &&
          this.newBeer.type &&
          this.newBeer.abv 
          ){
            this.newBeer.breweryId = this.breweryId;
              beerService
                .addBeer(this.newBeer)
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
                    console.log(
                      "Error adding beer: unable to communicate to server"
                    );
                  } else {
                    console.log("Error adding beer: make request");
                  }
                });
              
        }
        else {
            this.showMessage = true;
        }
      },
    //   getBreweryId(id){
    //     BreweryService
    //     .getBrewery(id)
    //     .then((response) => {
    //       console.log("Reached loadBrewery in BreweryInfoView");
    //       console.log(response);
    //       this.brewery = response.data;
    //     })
    //     .catch((error) => {
    //       if (error.response) {
    //         console.log("Error loading brewery: ", error.response.status);
    //       } else if (error.request) {
    //         console.log(
    //           "Error loading brewery: unable to communicate to server"
    //         );
    //       } else {
    //         console.log("Error loading brewery: make request");
    //       }
    //     });
    //   },
      cancelForm() {
        this.newBeer = {};
        this.showMessage = false;
        this.$router.push({ name: "breweryInfo" });
      },
    },
  };
  </script>