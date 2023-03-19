import axios from "axios";

const API_URL = "https://localhost:7093/api/Members";

class UserAuthService {
  register(formData) {
    return axios.post(API_URL + "/register", formData, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
    });
  }

  login(account, password) {
    const response = axios.post(API_URL + "/login", { account, password });
    return response;
  }

  getCurrentUser() {
    const data = JSON.parse(localStorage.getItem("user"));
    return data;
  }

  displayuserId(userId) {
    const response = axios.get(API_URL + "/" + userId);
    return response;
  }

  logout() {
    localStorage.removeItem("user");
    localStorage.removeItem("address");
  }

  emailConfirmation() {
    return axios.post("https://localhost:7093/api/Email/SendEmail?memberid=31");
  }

  forgotPassword(account) {
    return (
      axios.post("https://localhost:7093/api/Email/ForgetPassword"),
      {
        account: account,
      },
      {
        headers: { accept: "text/plain", "Content-Type": "application/json" },
        responseType: "text",
      }
    );
  }
}

export default new UserAuthService();
