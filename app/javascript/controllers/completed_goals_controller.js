import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="completed-goals"
export default class extends Controller {
  static targets = ["congrats", "checkbox", "disappear"]
  connect() {
    console.log("Congrats")
  }

  sayCongrats() {
    // let arrayB = this.checkboxTargets.map(checkbox => {
    //   checkbox.checked
    // })
    // console.log(this.checkboxTargets.map(c => c.checked))
    // const allEqual = arr => arr.every( v => v.checked === true )  // true
    const allChecked = this.checkboxTargets.every( checkbox => checkbox.checked)
    console.log(allChecked)
    // console.log(arrayB)
    if (allChecked) {
      this.congratsTarget.classList.remove('d-none')
     }
    // this.checkboxTargets.forEach((box) => {
    //   // find a way to know if all have been checked
    //   console.log(arrayB)

    // })
  }
}



    // this.congratsTarget.classList.remove('d-none')

    // this.disappearTarget.classList.add('d-none')
    // this.checkboxTargets.forEach((box) => {
    //   // find a way to know if all have been checked
    //   console.log(box)
    //   this.congratsTarget.classList.remove('d-none')

    // })
    // if all checked,
    // this.congratsTarget.classList.remove('d-none')
