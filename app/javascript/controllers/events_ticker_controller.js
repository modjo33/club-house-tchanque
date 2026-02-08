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

    // Double rAF to ensure layout is complete before measuring
    requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        this.setupMarquee()
      })
    })
  }

  disconnect() {
    if (this.animationId) {
      cancelAnimationFrame(this.animationId)
    }
  }

  setupMarquee() {
    const marquee = this.marqueeTarget

    // Remove CSS animation class (we use JS instead)
    marquee.classList.remove("animate-marquee")
    marquee.style.animation = "none"
    marquee.style.webkitAnimation = "none"

    // Enable GPU compositing for smooth mobile animation
    marquee.style.willChange = "transform"
    marquee.style.webkitBackfaceVisibility = "hidden"
    marquee.style.backfaceVisibility = "hidden"

    // Get the width of the first half of content (original events)
    const children = Array.from(marquee.children)
    const halfLength = children.length / 2

    let firstHalfWidth = 0
    for (let i = 0; i < halfLength; i++) {
      firstHalfWidth += children[i].offsetWidth
    }

    this.scrollWidth = firstHalfWidth

    // Retry if layout not ready yet (common on mobile)
    if (this.scrollWidth <= 0) {
      setTimeout(() => this.setupMarquee(), 100)
      return
    }

    // Start animation via rAF (never call animate() synchronously)
    this.animationId = requestAnimationFrame((t) => this.animate(t))

    // Pause on hover (desktop)
    this.containerTarget.addEventListener("mouseenter", () => this.pause())
    this.containerTarget.addEventListener("mouseleave", () => this.resume())

    // Pause on touch (mobile)
    this.containerTarget.addEventListener("touchstart", () => this.pause(), { passive: true })
    this.containerTarget.addEventListener("touchend", () => this.resume(), { passive: true })
  }

  animate(timestamp) {
    // Initialize lastTimestamp on first frame (deltaTime will be 0)
    if (!this.lastTimestamp) {
      this.lastTimestamp = timestamp
    }

    if (!this.isPaused) {
      const deltaTime = (timestamp - this.lastTimestamp) / 1000
      this.position -= this.speedValue * deltaTime

      // Reset position when we've scrolled through the first set of events
      if (Math.abs(this.position) >= this.scrollWidth) {
        this.position = 0
      }

      const tx = `translateX(${this.position}px)`
      this.marqueeTarget.style.transform = tx
      this.marqueeTarget.style.webkitTransform = tx
    }

    this.lastTimestamp = timestamp
    this.animationId = requestAnimationFrame((t) => this.animate(t))
  }

  pause() {
    this.isPaused = true
  }

  resume() {
    this.isPaused = false
    // Reset timestamp to avoid a jump after pause
    this.lastTimestamp = null
  }
}
