import axios from "axios";

const http = axios.create({ baseURL: "https://localhost:44315" });

export default {
    listBeers(brewerId) {
      return http.get(`/beer/byBrewery/${brewerId}`);
    },
    addBeer( newBeer) {
      return http.post(`/beer/createBeer`, newBeer);
    },
    deleteBeer(beerId){
      return http.delete(`/beer/${beerId}`);
    }
    // updateBrewery(updatedBrewery) {
    //   return http.put(`/brewery/${updatedBrewery.id}`, updatedBrewery);
    // },
    // getBrewery(id) {
    //   return http.get(`/brewery/${id}`);
    // },
  };

