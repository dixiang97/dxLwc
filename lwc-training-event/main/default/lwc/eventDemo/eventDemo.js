import { LightningElement, track } from "lwc";
const CHILDS = [
  { title: "Child One", status: "Deselected" },
  { title: "Child Two", status: "Deselected" },
  { title: "Child Three", status: "Deselected" }
];
export default class EventDemo extends LightningElement {
  @track childs = CHILDS;

  // Number of Selected Child Getter
  get numberOfSelectedChild() {
    const selectedChild = this.childs.filter(
      (child) => child.status === "Selected"
    );
    return selectedChild.length;
  }

  handleButtonClick(event) {
    const clickedChild = event.detail;
    let copiedChilds = JSON.parse(JSON.stringify(this.childs));
    copiedChilds.forEach((child) => {
      if (child.title === clickedChild) {
        child.status =
          child.status === "Deselected" ? "Selected" : "Deselected";
      }
    });
    this.childs = copiedChilds;
  }

  handleResetButton() {
    this.childs = CHILDS;
  }
}
