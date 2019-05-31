import axios from "axios";
import Rails from "rails-ujs";

export const CSRF = "X-CSRF_Token";
export const PATCH = "PATCH";

export const APPLICATION_JSON = "application/json";
export const CONTENT_TYPE = "Content-Type";
export const CONTENT_TYPE_APPLICATION_JSON = {
  [CONTENT_TYPE]: APPLICATION_JSON
};

export const http = axios.create({
  headers: {
    ...CONTENT_TYPE_APPLICATION_JSON,
    [CSRF]: Rails.csrfToken(),
    accept: "application/json"
  }
});
