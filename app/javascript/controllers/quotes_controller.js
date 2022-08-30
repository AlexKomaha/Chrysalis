import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=["quotes"]
  connect() {
    fetch("https://zenquotes.io/api/quotes")
  .then(response => response.json())
  .then((data) => {
    console.log(data[0])
  })
    console.log("Quotes")
  }
}
