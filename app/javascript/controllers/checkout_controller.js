import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkout"
export default class extends Controller {
  connect() {
    // Tout code que vous souhaitez exécuter lorsque le contrôleur est connecté
  }

  redirectToCheckout(event) {
    event.preventDefault();

    const checkoutUrl = this.data.get('checkoutUrl'); // Récupération de l'URL depuis les attributs de donnée

    fetch(checkoutUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        offer_id: event.currentTarget.dataset.offerId
      })
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        return response.text().then(text => { throw new Error(text); });
      }
    })
    .then(data => {
      const sessionId = data.id;
      stripe.redirectToCheckout({ sessionId: sessionId });
    })
    .catch(error => {
      console.error("There was an error:", error);
    });
  }
}
