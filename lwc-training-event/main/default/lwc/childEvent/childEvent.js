import { LightningElement, api } from "lwc";

export default class ChildEvent extends LightningElement {
  @api title;
  @api status;

  get buttonInfo() {
    const acceptedStatus = ["Selected", "Deselected"];
    if (acceptedStatus.includes(this.status)) {
      const variant = this.status === "Selected" ? "destructive" : "success";
      const label = this.status === "Selected" ? "Deselected" : "Select";
      return { variant, label }; // return buttonInfo object
    } else {
      throw "Invalid button status!";
    }
  }

  handleClick() {
    const event = new CustomEvent("button_click", { bubbles: true });
    this.dispatchEvent(event);
  }
}
