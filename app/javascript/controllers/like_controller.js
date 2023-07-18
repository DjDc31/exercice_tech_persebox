import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "likeButton", "unlikeButton" ]

  connect() {
    // Votre code de configuration initiale ici, si nécessaire.
  }

  like(event) {
    event.preventDefault()
    let button = event.target
    let productId = button.getAttribute("data-product-id")
    let url = `/products/${productId}/like`

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    }).then((response) => {
      if (response.ok) {
        // Cachez le bouton "like", affichez le bouton "unlike".
        this.likeButtonTarget.style.display = "none"
        this.unlikeButtonTarget.style.display = "block"
      } else {
        // Gérez l'erreur.
        console.log("Erreur lors de la tentative de like du produit.")
      }
    })
  }

  unlike(event) {
    event.preventDefault()
    let button = event.target
    let likeId = button.getAttribute("data-like-id")
    let url = `/likes/${likeId}`

    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    }).then((response) => {
      if (response.ok) {
        // Cachez le bouton "unlike", affichez le bouton "like".
        this.likeButtonTarget.style.display = "block"
        this.unlikeButtonTarget.style.display = "none"
      } else {
        // Gérez l'erreur.
        console.log("Erreur lors de la tentative de unlike du produit.")
      }
    })
  }
}

// Helper function to get meta values.
function getMetaValue(name) {
  const element = document.head.querySelector(`meta[name="${name}"]`)
  return element.getAttribute("content")
}
