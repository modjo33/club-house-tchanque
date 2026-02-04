import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slider", "slide", "indicator"]
  static values = {
    interval: { type: Number, default: 4000 }
  }

  connect() {
    this.currentIndex = 0
    if (this.slideTargets.length > 1) {
      this.startAutoPlay()
    }
  }

  disconnect() {
    this.stopAutoPlay()
  }

  startAutoPlay() {
    this.intervalId = setInterval(() => {
      this.next()
    }, this.intervalValue)
  }

  stopAutoPlay() {
    if (this.intervalId) {
      clearInterval(this.intervalId)
    }
  }

  next() {
    this.goTo((this.currentIndex + 1) % this.slideTargets.length)
  }

  goToSlide(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    this.stopAutoPlay()
    this.goTo(index)
    this.startAutoPlay()
  }

  goTo(index) {
    if (this.slideTargets.length === 0) return

    this.currentIndex = index

    // Move the slider
    if (this.hasSliderTarget) {
      const offset = -index * 100
      this.sliderTarget.style.transform = `translateX(${offset}%)`
    }

    // Update indicators
    this.indicatorTargets.forEach((indicator, i) => {
      if (i === index) {
        indicator.classList.remove("bg-sage-300")
        indicator.classList.add("bg-forest-600")
      } else {
        indicator.classList.remove("bg-forest-600")
        indicator.classList.add("bg-sage-300")
      }
    })
  }
}
