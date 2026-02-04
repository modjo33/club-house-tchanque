import { Controller } from "@hotwired/stimulus"

// Contrôleur pour la modal d'affiche d'événement
export default class extends Controller {
  static targets = ["modal", "image"]

  open(event) {
    event.preventDefault()
    const imageUrl = event.currentTarget.dataset.imageUrl
    if (imageUrl) {
      this.imageTarget.src = imageUrl
      this.modalTarget.classList.remove("hidden")
      document.body.classList.add("overflow-hidden")
    }
  }

  close(event) {
    // Ferme si on clique sur le fond ou le bouton X
    if (event.target === this.modalTarget || event.currentTarget.dataset.action?.includes("close")) {
      this.modalTarget.classList.add("hidden")
      document.body.classList.remove("overflow-hidden")
    }
  }

  closeOnEscape(event) {
    if (event.key === "Escape" && !this.modalTarget.classList.contains("hidden")) {
      this.modalTarget.classList.add("hidden")
      document.body.classList.remove("overflow-hidden")
    }
  }

  connect() {
    // Écoute la touche Escape pour fermer la modal
    document.addEventListener("keydown", this.closeOnEscape.bind(this))
  }

  disconnect() {
    document.removeEventListener("keydown", this.closeOnEscape.bind(this))
  }
}
