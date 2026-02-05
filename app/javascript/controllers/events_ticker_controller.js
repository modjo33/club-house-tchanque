import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "marquee"]
  static values = {
    speed: { type: Number, default: 50 } // pixels per second
  }

  connect() {
    if (!this.hasMarqueeTarget) return

    this.position = 0
    this.isPaused = false
    this.lastTimestamp = null

    // Wait for content to render
    requestAnimationFrame(() => {
      this.setupMarquee()
    })
  }

  disconnect() {
    if (this.animationId) {
      cancelAnimationFrame(this.animationId)
    }
  }

  setupMarquee() {
    const marquee = this.marqueeTarget

    // Remove CSS animation class (we'll use JS instead)
    marquee.classList.remove("animate-marquee")
    marquee.style.animation = "none"

    // Get the width of the first half of content (original events)
    const children = Array.from(marquee.children)
    const halfLength = children.length / 2

    let firstHalfWidth = 0
    for (let i = 0; i < halfLength; i++) {
      firstHalfWidth += children[i].offsetWidth
    }

    this.scrollWidth = firstHalfWidth

    // Start the animation
    this.startAnimation()

    // Add hover pause functionality
    this.containerTarget.addEventListener("mouseenter", () => this.pause())
    this.containerTarget.addEventListener("mouseleave", () => this.resume())
  }

  startAnimation() {
    this.lastTimestamp = performance.now()
    this.animate()
  }

  animate(timestamp) {
    if (!this.lastTimestamp) this.lastTimestamp = timestamp

    if (!this.isPaused) {
      const deltaTime = (timestamp - this.lastTimestamp) / 1000 // Convert to seconds
      this.position -= this.speedValue * deltaTime

      // Reset position when we've scrolled through the first set of events
      if (Math.abs(this.position) >= this.scrollWidth) {
        this.position = 0
      }

      this.marqueeTarget.style.transform = `translateX(${this.position}px)`
    }

    this.lastTimestamp = timestamp
    this.animationId = requestAnimationFrame((t) => this.animate(t))
  }

  pause() {
    this.isPaused = true
  }

  resume() {
    this.isPaused = false
    this.lastTimestamp = performance.now()
  }
}
