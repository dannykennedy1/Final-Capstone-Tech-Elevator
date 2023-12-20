<template>
  <h1>Edit Brewery</h1>
  <form v-on:submit.prevent="editBrewery">
    <div class="input">
      <label for="name">Name</label>
      <input type="text" name="name" id="name" v-model="breweryToUpdate.name" />
    </div>
    <div class="input">
      <label for="streetAddress">Street Address</label>
      <input
        type="text"
        name="streetAddress"
        id="streetAddress"
        v-model="breweryToUpdate.streetAddress"
      />
    </div>
    <div class="input">
      <label for="city">City</label>
      <input type="text" name="city" id="city" v-model="breweryToUpdate.city" />
    </div>
    <div class="input">
      <label for="state">State</label>
      <input
        type="text"
        name="state"
        id="state"
        v-model="breweryToUpdate.state"
      />
    </div>
    <div class="input">
      <label for="zip">Zip</label>
      <input type="text" name="zip" id="zip" v-model="breweryToUpdate.zip" />
    </div>
    <div class="input">
      <label for="phone">Phone</label>
      <input
        type="text"
        name="phone"
        id="phone"
        v-model="breweryToUpdate.phone"
      />
    </div>
    <div class="input">
      <label for="email">Email</label>
      <input
        type="text"
        name="email"
        id="email"
        v-model="breweryToUpdate.email"
      />
    </div>
    <div class="input">
      <label for="website">Website URL</label>
      <input
        type="text"
        name="website"
        id="website"
        v-model="breweryToUpdate.website"
      />
    </div>
    <h3 v-show="showError">Cannot leave required fields blank</h3>
    <button type="submit">Save Updates</button>
    <button type="button" v-on:click="cancelForm">Cancel</button>
  </form>
</template>

<script>
import breweryService from "../services/BreweryService";
import axios from "axios";

export default {
  name: "editBrewery",
  data() {
    return {
      showForm: false,
      isLoading: false,
      breweryId: this.$route.params.breweryId,
      breweryToUpdate: {},
      showError: false,
    };
  },
  methods: {
    editBrewery() {
      if (this.breweryToUpdate.id) {
        if (
          this.breweryToUpdate.name &&
          this.breweryToUpdate.state &&
          this.breweryToUpdate.city &&
          this.breweryToUpdate.zip &&
          this.breweryToUpdate.streetAddress &&
          this.breweryToUpdate.email &&
          this.breweryToUpdate.phone &&
          this.breweryToUpdate.website
        ) {
          breweryService
            .updateBrewery(this.breweryToUpdate)
            .then(() => {
              console.log("Reached updateBrewery in EditBreweryView");
              this.$router.push({ name: "brewery" });
            })
            .catch((error) => {
              if (error.response) {
                console.log("Error updating brewery: ", error.response.status);
              } else if (error.request) {
                console.log(
                  "Error updating brewery: unable to communicate with the server"
                );
              } else {
                console.log("Error updating brewery: request error");
              }
            });
        } else {
          this.showError = true;
        }
      } else {
        console.log("No breweryToUpdate.id provided.");
      }
    },
    cancelForm() {
      this.breweryToUpdate = {};
      this.showForm = false;
      this.$router.push({ name: "brewery" });
    },
  },
  created() {
    axios
      .get(`/brewery/${this.breweryId}`)
      .then((response) => {
        const brewery = response.data;

        this.breweryToUpdate = {
          id: brewery.id,
          name: brewery.name,
          streetAddress: brewery.streetAddress,
          city: brewery.city,
          state: brewery.state,
          zip: brewery.zip,
          phone: brewery.phone,
          email: brewery.email,
          website: brewery.website,
        };
      })
      .catch((error) => {
        console.error("Error fetching brewery data:", error);
      });
  },
};
</script>
