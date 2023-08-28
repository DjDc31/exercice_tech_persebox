import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", this.stripeCheckout.bind(this));
  }

  async stripeCheckout(event) {
    event.preventDefault();

    const stripeButtonAction = this.element.getAttribute('action');
    console.log(stripeButtonAction);

    const response = await fetch(stripeButtonAction, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({
        offer_id: this.data.get("offerId")
      })
    });
    const data = await response.json();
    const stripe = Stripe(this.data.get("publishableKey"));
    stripe.redirectToCheckout({
        sessionId: data.id
    }).then(function (result) {
        console.error(result.error.message);
    }).catch(error => {
        console.error('Error with Stripe:', error);
    });
  }
}
