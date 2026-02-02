import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator"]

  connect() {
    this.currentIndex = 0
    this.startAutoPlay()
  }

  disconnect() {
    this.stopAutoPlay()
  }

  startAutoPlay() {
    this.interval = setInterval(() => {
      this.next()
    }, 5000)
  }

  stopAutoPlay() {
    if (this.interval) {
      clearInterval(this.interval)
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
    this.indicatorTargets[this.currentIndex].classList.remove("bg-white/80")
    this.indicatorTargets[this.currentIndex].classList.add("bg-white/40")

    // Show new slide
    this.currentIndex = index
    this.slideTargets[this.currentIndex].classList.remove("opacity-0")
    this.indicatorTargets[this.currentIndex].classList.remove("bg-white/40")
    this.indicatorTargets[this.currentIndex].classList.add("bg-white/80")
  }
}
