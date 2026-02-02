import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mobileMenu", "menuIcon", "closeIcon"]

  toggleMenu() {
    this.mobileMenuTarget.classList.toggle("hidden")
    this.menuIconTarget.classList.toggle("hidden")
    this.closeIconTarget.classList.toggle("hidden")
  }
}
