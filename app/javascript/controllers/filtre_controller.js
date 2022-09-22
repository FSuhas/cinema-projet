import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "figuration", "silhouette", "doublure", "role","homme", "femme", "filtrable" ]

  connect() {
    console.log("Hello, filtres qui ne marche pas encore :) ")
  }

  filtrable() {
    console.log(this.element)
  }

  figuration() {
    console.log("figuration")
  }

  silhouette() {
    console.log("silhouette")
  }

  doublure() {
    console.log("doublure")
  }

  role() {
    console.log("role")
  }

  homme() {
    console.log("homme")
  }

  femme() {
    console.log("femme")
  }
}
