import { Controller } from "@hotwired/stimulus"

// Contrôleur pour le formulaire d'images du carrousel
export default class extends Controller {
  static targets = ["pageSelect", "sectionSelect"]

  // Sections disponibles par page (doit correspondre au modèle Ruby)
  sections = {
    "home": [
      ["Hero principal", "hero"],
      ["Section Terrasse (galerie)", "terrasse"],
      ["Section Événements (carrousel)", "evenements"]
    ],
    "carte": [
      ["Hero", "hero"]
    ],
    "vins": [
      ["Carrousel photos", "main"]
    ],
    "evenements": [
      ["Carrousel principal", "main"]
    ]
  }

  updateSections() {
    const page = this.pageSelectTarget.value
    const sectionSelect = this.sectionSelectTarget
    const currentSection = sectionSelect.value

    // Vider les options actuelles
    sectionSelect.innerHTML = ""

    // Ajouter les nouvelles options
    const options = this.sections[page] || [["Principal", "main"]]
    options.forEach(([label, value]) => {
      const option = document.createElement("option")
      option.value = value
      option.textContent = label
      if (value === currentSection) {
        option.selected = true
      }
      sectionSelect.appendChild(option)
    })
  }
}
