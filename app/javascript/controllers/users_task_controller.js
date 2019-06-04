import { Controller } from "stimulus";
import { http } from "Utils/http";

const IS_COMPLETED = "isCompleted";
const PATCH_URL = "patchUrl";

export default class extends Controller {
  static targets = ["completeCheckbox", "error"];

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
        }
      })
      .catch(e => {
        this.errorTarget.innerText = e;
      });
  }
}
