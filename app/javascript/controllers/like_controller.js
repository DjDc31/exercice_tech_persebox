import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "likeButton", "unlikeButton" ]

  connect() {
  }

  like(event) {
    event.preventDefault()
    let button = event.currentTarget
    let productId = button.getAttribute("data-product-id")
    console.log(productId)
    let url = `/products/${productId}/like`
    let likeButton = document.querySelector(`.heart-icon-${productId}.like-button`)
    let unlikeButton = document.querySelector(`.heart-icon-${productId}.unlike-button`)

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      credentials: 'same-origin', // Ajoutez cette ligne
    }).then((response) => {
      if (response.ok) {
        // Cachez le bouton "like", affichez le bouton "unlike".
        likeButton.style.display = "none"
        unlikeButton.style.display = "block"
      } else if (response.status === 401) { // code HTTP pour non autorisé
        // Redirigez vers la page de connexion si l'utilisateur n'est pas connecté.
        window.location.href = "/users/sign_in";
      } else {
        // Gérez l'erreur.
        console.log("Erreur lors de la tentative de like du produit.")
      }
    })
  }

  unlike(event) {
    event.preventDefault()
    let button = event.currentTarget
    let likeId = button.getAttribute("data-like-id")
    console.log(likeId)
    let url = `/likes/${likeId}`
    let productId = button.getAttribute("data-product-id")
    let likeButton = document.querySelector(`.heart-icon-${productId}.like-button`)
    let unlikeButton = document.querySelector(`.heart-icon-${productId}.unlike-button`)

    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      credentials: 'same-origin', // Ajoutez cette ligne
    }).then((response) => {
      if (response.ok) {
        // Cachez le bouton "unlike", affichez le bouton "like".
        likeButton.style.display = "block"
        unlikeButton.style.display = "none"
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
