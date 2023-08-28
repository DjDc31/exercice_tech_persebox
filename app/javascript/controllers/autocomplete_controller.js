import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete"
export default class extends Controller {
  static targets = ["address", "latitude", "longitude", "postalCode", "city"];

  connect() {
    this.initializeAutocomplete();
  }

  initializeAutocomplete() {
    const autocomplete = new google.maps.places.Autocomplete(this.addressTarget);

    autocomplete.addListener('place_changed', function() {
      const place = autocomplete.getPlace();

      let lat, lng, postalCode, city;

      // Récupération de la latitude et de la longitude
      if (place.geometry && place.geometry.location) {
        lat = place.geometry.location.lat();
        lng = place.geometry.location.lng();
      }

      // Parcourir tous les composants de l'adresse pour extraire le code postal et la ville
for (let i = 0; i < place.address_components.length; i++) {
    const addressType = place.address_components[i].types[0];

    if (addressType === "postal_code") {
      postalCode = place.address_components[i].long_name;
    } else if (addressType === "locality") {
      city = place.address_components[i].long_name;
    }
}


      // Remplissage des champs cachés avec les valeurs récupérées
      document.getElementById('input_latitude').value = lat;
      document.getElementById('input_longitude').value = lng;
      document.getElementById('input_postal_code').value = postalCode;
      document.getElementById('input_city').value = city;
    });
  }
}
