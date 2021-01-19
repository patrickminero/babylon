import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'mapView', 'listView', 'toggleButton' ]

  toggle() {
    this.mapViewTarget.classList.toggle('transition')
    this.listViewTarget.classList.toggle('transition')
  }
}