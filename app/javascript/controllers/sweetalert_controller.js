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
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

      Toast.fire({
        icon: 'info',
        title: this.textValue,
      })
  }

  success() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'top',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    if (this.event) {
      Toast.fire({
        icon: 'success',
        title: 'Votre candidature a bien été envoyée'
      })
    }
    else {
      Toast.fire({
        icon: 'error',
        title: 'Vous avez déjà postulé à cette offre'
      })
    }
  }

  error() {
    Swal.fire({
      icon: 'error',
      title: 'Oops...',
      text: this.textValue,
      confirmButtonText: 'Ok'
    })
  };

  warning() {
    Swal.fire({
      icon: 'warning',
      title: 'Warning!',
      text: this.textValue,
      confirmButtonText: 'Ok'
    })
  };
}
