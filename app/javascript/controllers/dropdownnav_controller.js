import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdownMenu"]

  connect() {
    this.element.addEventListener("mouseenter", this.showDropdown)
    this.element.addEventListener("mouseleave", this.hideDropdown)
  }

  showDropdown = () => {
    this.dropdownMenuTarget.classList.add("show")
    this.dropdownMenuTarget.classList.add("dropdown-menu-end")
  }

  hideDropdown = () => {
    this.dropdownMenuTarget.classList.remove("show")
    this.dropdownMenuTarget.classList.remove("dropdown-menu-end")
  }
}
