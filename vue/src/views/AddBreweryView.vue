<template>
  <div id="everything">
    <div class="container">
      <div class="text">Create New Brewery</div>
      <form action="#" v-on:submit.prevent="createNewBrewery">
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="name"
              id="name"
              v-model="newBrewery.name"
              required
            />
            <div class="underline"></div>
            <label for="name">Name </label>
          </div>
          <div class="input-data">
            <input
              type="text"
              name="streetAddress"
              id="streetAddress"
              v-model="newBrewery.streetAddress"
              required
            />
            <div class="underline"></div>
            <label for="streetAddress">Street Address </label>
          </div>
        </div>
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="city"
              id="city"
              v-model="newBrewery.city"
              required
            />
            <div class="underline"></div>
            <label for="city">City </label>
          </div>
          <div class="input-data">
            <input
              type="text"
              name="state"
              id="state"
              v-model="newBrewery.state"
              required
            />
            <div class="underline"></div>
            <label for="state">State </label>
          </div>
        </div>
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="zip"
              id="zip"
              v-model="newBrewery.zip"
              required
            />
            <div class="underline"></div>
            <label for="zip">Zip </label>
          </div>
          <div class="input-data">
            <input
              type="text"
              name="phone"
              id="phone"
              v-model="newBrewery.phone"
              required
            />
            <div class="underline"></div>
            <label for="phone">Phone </label>
          </div>
        </div>
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="email"
              id="email"
              v-model="newBrewery.email"
              required
            />
            <div class="underline"></div>
            <label for="email">Email </label>
          </div>
          <div class="input-data">
            <input
              type="text"
              name="website"
              id="website"
              v-model="newBrewery.website"
              required
            />
            <div class="underline"></div>
            <label for="website">Website URL </label>
          </div>
        </div>
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="description"
              id="description"
              v-model="newBrewery.description"
              required
            />
            <div class="underline"></div>
            <label for="description">Description</label>
          </div>
          <div class="input-data">
            <input
              type="text"
              name="category"
              id="category"
              v-model="newBrewery.category"
              required
            />
            <div class="underline"></div>
            <label for="category">Category</label>
          </div>
        </div>
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="logo"
              id="logo"
              v-model="newBrewery.logo"
              required
            />
            <div class="underline"></div>
            <label for="logo">Logo URL</label>
          </div>
          <div class="input-data">
            <input
              type="text"
              name="photo"
              id="photo"
              v-model="newBrewery.photo"
              required
            />
            <div class="underline"></div>
            <label for="photo">Photo URL</label>
          </div>
        </div>
        <div class="form-row">
          <div class="input-data">
            <input
              type="text"
              name="mapLink"
              id="mapLink"
              v-model="newBrewery.mapLink"
              required
            />
            <div class="underline"></div>
            <label for="photo">Map URL</label>
          </div>
        </div>

        <div class="form-row submit-btn">
          <div class="input-data">
            <div class="inner"></div>
            <input type="submit" value="Create Brewery" />
          </div>
          <div class="submit-btn">
            <div class="input-data">
              <div class="inner"></div>
              <input type="button" v-on:click="cancelForm" value="Cancel" />
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService";

export default {
  name: "addBrewery",
  data() {
    return {
      newBrewery: {},
      showMessage: false,
    };
  },
  methods: {
    createNewBrewery() {
      console.log("Reached METHOD in BreweryView");
      breweryService
        .addBrewery(this.newBrewery)
        .then(() => {
          console.log("Reached createNewBrewery in BreweryView");
          this.newBrewery = {};
          this.showMessage = false;
          this.$router.push({ name: "brewery" });
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
    },
    cancelForm() {
      this.newBrewery = {};
      this.showMessage = false;
      this.$router.push({ name: "brewery" });
    },
  },
};
</script>
<style scoped>
@import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");

#everything {
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 10px;
  font-family: "Poppins", sans-serif;
  background: #b7531b;
}

.container {
  max-width: 800px;
  background: #fff;
  width: 800px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}
.container .text {
  text-align: center;
  font-size: 41px;
  font-weight: 600;
  font-family: "Poppins", sans-serif;
  background: -webkit-linear-gradient(
    right,
    #220204,
    #4c2528,
    #b7531b,
    #f4a23f,
    white
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.container form {
  padding: 30px 0 0 0;
}
.container form .form-row {
  display: flex;
  margin: 32px 0;
}
form .form-row .input-data {
  width: 100%;
  height: 40px;
  margin: 0 20px;
  position: relative;
}
form .form-row .textarea {
  height: 70px;
}
.input-data input,
.textarea textarea {
  display: block;
  width: 100%;
  height: 100%;
  border: none;
  font-size: 17px;
  border-bottom: 2px solid rgba(0, 0, 0, 0.12);
}
.input-data input:focus,
.textarea textarea:focus {
  outline: none;
  border-bottom: 2px solid transparent;
}
.input-data input:focus ~ label,
.textarea textarea:focus ~ label,
.input-data input:valid ~ label,
.textarea textarea:valid ~ label {
  transform: translateY(-20px);
  font-size: 14px;
  color: #220204;
}
.textarea textarea {
  resize: none;
  padding-top: 10px;
}
.input-data label {
  position: absolute;
  pointer-events: none;
  bottom: 10px;
  font-size: 16px;
  transition: all 0.3s ease;
}
.textarea label {
  width: 100%;
  bottom: 40px;
  background: #fff;
}
.input-data .underline {
  position: absolute;
  bottom: 0;
  height: 2px;
  width: 100%;
}
.input-data .underline:before {
  position: absolute;
  content: "";
  height: 2px;
  width: 100%;
  background: #a3cb6f;
  transform: scaleX(0);
  transform-origin: center;
  transition: transform 0.3s ease;
}
.input-data input:focus ~ .underline:before,
.input-data input:valid ~ .underline:before,
.textarea textarea:focus ~ .underline:before,
.textarea textarea:valid ~ .underline:before {
  transform: scale(1);
}
.submit-btn .input-data {
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 45px !important;
  border-radius: 10px;
}

.submit-btn .input-data input {
  flex: 1;
  background: none;
  border: none;
  color: #fff;
  font-size: 17px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
  position: relative;
  z-index: 2;
}

.submit-btn .input-data .inner {
  height: 100%;
  width: 200%; /* Change from 300% to 200% */
  position: absolute;
  left: -100%;
  background: -webkit-linear-gradient(
    right,
    #220204,
    #4c2528,
    #b7531b,
    #f4a23f
  );
  transition: all 0.4s;
}

.submit-btn .input-data:hover .inner {
  left: 0;
}

.submit-btn .input-data input {
  background: none;
  border: none;
  color: #fff;
  font-size: 17px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
  position: relative;
  z-index: 2;
}
@media (max-width: 700px) {
  .container .text {
    font-size: 30px;
  }
  .container form {
    padding: 10px 0 0 0;
  }
  .container form .form-row {
    display: block;
  }
  form .form-row .input-data {
    margin: 35px 0 !important;
  }
  .submit-btn .input-data {
    width: 40% !important;
  }
}
</style>

<!-- background: -webkit-linear-gradient(right, #220204,#4c2528,#B7531B,#F4A23F); -->
