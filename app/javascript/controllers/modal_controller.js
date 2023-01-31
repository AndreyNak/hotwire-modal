import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    let modal = document.getElementById("chatModal");
    let span = document.getElementsByClassName("close")[0];
    const body = document.querySelector("body");
    body.style.overflow = "hidden";

    modal.style.display = "block";

    span.onclick = function() {
      modal.style.display = "none";
      body.style.overflow = "auto";
    }

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
        body.style.overflow = "auto";
      }
    }
  }
}
