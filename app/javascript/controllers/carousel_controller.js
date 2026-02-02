import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator"]
  static values = {
    autoplay: { type: Boolean, default: true },
    interval: { type: Number, default: 5000 }
  }

  connect() {
    this.currentIndex = 0
    if (this.autoplayValue) {
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

  prev() {
    this.goTo((this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length)
  }

  goToSlide(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    this.goTo(index)
    this.stopAutoPlay()
    this.startAutoPlay()
  }

  goTo(index) {
    // Hide current slide
    this.slideTargets[this.currentIndex].classList.add("opacity-0")
    this.updateIndicator(this.currentIndex, false)

    // Show new slide
    this.currentIndex = index
    this.slideTargets[this.currentIndex].classList.remove("opacity-0")
    this.updateIndicator(this.currentIndex, true)
  }

  updateIndicator(index, active) {
    const indicator = this.indicatorTargets[index]
    if (!indicator) return

    // Remove all possible active/inactive classes
    const activeClasses = ["bg-white/80", "bg-forest-800", "bg-gold-400"]
    const inactiveClasses = ["bg-white/40", "bg-forest-300", "bg-gold-200"]

    if (active) {
      inactiveClasses.forEach(cls => indicator.classList.remove(cls))
      // Determine which active class to use based on existing classes
      if (indicator.classList.contains("bg-forest-800") || indicator.classList.contains("bg-forest-300")) {
        indicator.classList.add("bg-forest-800")
      } else {
        indicator.classList.add("bg-white/80")
      }
    } else {
      activeClasses.forEach(cls => indicator.classList.remove(cls))
      // Determine which inactive class to use
      if (indicator.className.includes("forest")) {
        indicator.classList.add("bg-forest-300")
      } else {
        indicator.classList.add("bg-white/40")
      }
    }
  }
}
