import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="completed-goals"
export default class extends Controller {
  static targets = ["congrats", "checkbox", "disappear"]
  connect() {
  }

  sayCongrats() {
    const allChecked = this.checkboxTargets.every( checkbox => checkbox.checked)
    console.log(allChecked)
    // console.log(arrayB)
    if (allChecked) {
      this.congratsTarget.classList.remove('d-none')
      this.disappearTarget.classList.add('d-none')
     }
  }
}
