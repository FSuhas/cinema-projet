import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = {text: String}
  connect() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'top',
      showConfirmButton: false,
      showCloseButton: true,
      timer: 3000,
      timerProgressBar: true
    })

    Toast.fire({
      icon: 'info',
      title: this.textValue
    })
  }
}
