import { Controller } from "@hotwired/stimulus"

// Rotation automatique des événements avec effet de fondu.
// Affiche un seul événement à la fois, change toutes les 4 secondes.
export default class extends Controller {
  static targets = ["item"]

  connect() {
    this.current = 0
    this.items = this.itemTargets

    if (this.items.length <= 1) return

    this.timer = setInterval(() => {
      this.next()
    }, 4000)
  }

  disconnect() {
    if (this.timer) clearInterval(this.timer)
  }

  next() {
    // Fade out l'événement actuel
    this.items[this.current].style.opacity = "0"

    // Passe au suivant
    this.current = (this.current + 1) % this.items.length

    // Fade in le nouveau
    this.items[this.current].style.opacity = "1"
  }
}
