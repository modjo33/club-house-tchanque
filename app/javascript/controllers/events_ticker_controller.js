import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["marquee"]
  static values = {
    speed: { type: Number, default: 80 }
  }

  connect() {
    if (!this.hasMarqueeTarget) return

    this.position = 0
    this.paused = false
    this.halfWidth = 0
    this.rafId = null

    // Measure after layout is fully ready
    this.startTimer = setTimeout(() => {
      this.measure()
      this.lastTime = performance.now()
      this.rafId = requestAnimationFrame(this.tick)
    }, 100)

    // Desktop: pause on hover
    this.element.addEventListener("mouseenter", this.onPause)
    this.element.addEventListener("mouseleave", this.onResume)
    // Mobile: pause on touch
    this.element.addEventListener("touchstart", this.onPause, { passive: true })
    this.element.addEventListener("touchend", this.onResume, { passive: true })
  }

  disconnect() {
    if (this.rafId) cancelAnimationFrame(this.rafId)
    if (this.startTimer) clearTimeout(this.startTimer)
    this.element.removeEventListener("mouseenter", this.onPause)
    this.element.removeEventListener("mouseleave", this.onResume)
    this.element.removeEventListener("touchstart", this.onPause)
    this.element.removeEventListener("touchend", this.onResume)
  }

  measure() {
    const children = Array.from(this.marqueeTarget.children)
    const half = Math.floor(children.length / 2)
    this.halfWidth = 0
    for (let i = 0; i < half; i++) {
      this.halfWidth += children[i].offsetWidth
    }
  }

  tick = (now) => {
    if (!this.paused && this.halfWidth > 0) {
      const delta = (now - this.lastTime) / 1000
      this.position -= this.speedValue * delta

      if (Math.abs(this.position) >= this.halfWidth) {
        this.position = 0
      }

      this.marqueeTarget.style.transform = "translateX(" + this.position + "px)"
    }

    this.lastTime = now
    this.rafId = requestAnimationFrame(this.tick)
  }

  onPause = () => {
    this.paused = true
  }

  onResume = () => {
    this.paused = false
    this.lastTime = performance.now()
  }
}
