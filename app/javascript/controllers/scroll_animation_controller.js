import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    threshold: { type: Number, default: 0.1 },
    animation: { type: String, default: "fade-in-up" }
  }

  connect() {
    this.element.classList.add("animate-hidden")

    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            this.element.classList.remove("animate-hidden")
            this.element.classList.add(this.animationValue)
            this.observer.unobserve(this.element)
          }
        })
      },
      {
        threshold: this.thresholdValue,
        rootMargin: "0px 0px -50px 0px"
      }
    )

    this.observer.observe(this.element)
  }

  disconnect() {
    if (this.observer) {
      this.observer.disconnect()
    }
  }
}
