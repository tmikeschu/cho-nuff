import { Controller } from "stimulus";
import { http } from "Utils/http";

const BUTTON_LABELS = {
  true: "Mark Incomplete",
  false: "Mark Complete"
};
const IS_COMPLETED = "isCompleted";
const PATCH_URL = "patchUrl";

export default class extends Controller {
  static targets = ["completeButton", "infoCompleted", "error"];

  connect() {
    this.setButtonText();
  }

  setButtonText() {
    const label = BUTTON_LABELS[this.data.get(IS_COMPLETED)];
    this.completeButtonTarget.innerText = label;
  }

  setCompletedState(state) {
    this.infoCompletedTarget.innerText = `Completed: ${state}`;
  }

  completeTask(e) {
    e.preventDefault();

    const attrs = [PATCH_URL, IS_COMPLETED];
    const [url, isCompleted] = attrs.map(attr => this.data.get(attr));
    const newStatus = !JSON.parse(isCompleted);

    http
      .patch(url, {
        users_task: {
          completed: newStatus
        }
      })
      .then(({ data: { success } }) => {
        if (success) {
          this.data.set(IS_COMPLETED, newStatus);
          this.setButtonText();
          this.setCompletedState(newStatus);
        }
      })
      .catch(e => {
        this.errorTarget.innerText = e;
      });
  }
}
