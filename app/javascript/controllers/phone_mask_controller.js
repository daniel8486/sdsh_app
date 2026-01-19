import { Controller } from "@hotwired/stimulus"

// Máscara simples para telefone brasileiro (formato (99) 99999-9999)
export default class extends Controller {
  connect() {
    this.element.addEventListener('input', this.mask.bind(this))
  }

  mask(e) {
    let value = e.target.value.replace(/\D/g, "");
    if (value.length > 11) value = value.slice(0, 11);
    if (value.length > 6) {
      value = value.replace(/(\d{2})(\d{5})(\d{0,4})/, "($1) $2-$3");
    } else if (value.length > 2) {
      value = value.replace(/(\d{2})(\d{0,5})/, "($1) $2");
    } else {
      value = value.replace(/(\d{0,2})/, "($1");
    }
    e.target.value = value.trim();
  }
}
