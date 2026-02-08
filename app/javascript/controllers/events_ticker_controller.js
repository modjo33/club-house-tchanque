import { Controller } from "@hotwired/stimulus"

// Handles pause/resume of the CSS marquee animation on hover and touch.
// The actual animation is done purely in CSS via the .animate-marquee class.
export default class extends Controller {
  static targets = ["marquee"]

  connect() {
    if (!this.hasMarqueeTarget) return

    // Pause on hover (desktop)
    this.element.addEventListener("mouseenter", this.pause)
    this.element.addEventListener("mouseleave", this.resume)

    // Pause on touch (mobile)
    this.element.addEventListener("touchstart", this.pause, { passive: true })
    this.element.addEventListener("touchend", this.resume, { passive: true })
  }

  disconnect() {
    this.element.removeEventListener("mouseenter", this.pause)
    this.element.removeEventListener("mouseleave", this.resume)
    this.element.removeEventListener("touchstart", this.pause)
    this.element.removeEventListener("touchend", this.resume)
  }

  pause = () => {
    if (this.hasMarqueeTarget) {
      this.marqueeTarget.style.animationPlayState = "paused"
      this.marqueeTarget.style.webkitAnimationPlayState = "paused"
    }
  }

  resume = () => {
    if (this.hasMarqueeTarget) {
      this.marqueeTarget.style.animationPlayState = "running"
      this.marqueeTarget.style.webkitAnimationPlayState = "running"
    }
  }
}
