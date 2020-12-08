import { LightningElement, api } from "lwc";

export default class ParentEvent extends LightningElement {
  @api childs;

  handleClildButtonClick(event) {
    const customEvent = new CustomEvent("button_click", {
      detail: event.target.title
    });
    this.dispatchEvent(customEvent);
  }
}
