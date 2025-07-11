let signInBox = document.getElementById("signinbox");
let signUpBox = document.getElementById("signupbox");
let isSignIn = true;

document.getElementById("signupbtn").addEventListener("click", (e) => {
  e.preventDefault();
  signInBox.style.display = "none";
  signUpBox.style.display = "block";
  isSignIn = false;
});

document.getElementById("signinbtn").addEventListener("click", (e) => {
  e.preventDefault();
  signUpBox.style.display = "none";
  signInBox.style.display = "block";
  isSignIn = false;
});

// ######## ------------------------------------
// Add event listeners to all input boxes
const codeBoxes = document.querySelectorAll(".form-control.text-center");

codeBoxes.forEach((box, index) => {
  box.addEventListener("input", (event) => {
    const value = event.target.value;

    // Ensure only digits are allowed
    if (!/^\d$/.test(value)) {
      event.target.value = ""; // Clear invalid input
      return;
    }

    // Automatically move to the next box
    if (value && index < codeBoxes.length - 1) {
      codeBoxes[index + 1].focus();
    }
  });

  // Handle backspace to move to the previous box
  box.addEventListener("keydown", (event) => {
    if (event.key === "Backspace" && !box.value && index > 0) {
      codeBoxes[index - 1].focus();
    }
  });
});

// Continue button logic

// ######## ------------------------------------

const signinbtn = document.querySelector("#signinsbmt");
const signinemail = document.querySelector("#signinemail");
const signinpassword = document.querySelector("#signinpassword");
const firstname = document.querySelector("#firstname");
const lastname = document.querySelector("#lastname");
const signupemail = document.querySelector("#signupemail");
const signuppassword = document.querySelector("#signuppassword");
const signupcofirmpass = document.querySelector("#signupcofirmpass");
const forgetPasswordBox = document.querySelector("#forget-password-box");

let flag1 = false,
  flag2 = false;

let emailCheck = new RegExp(/^[^\s@]+@([^\s@.,]+\.)+[^\s@.,]{2,}$/);
let passwordCheck = new RegExp(/^[A-Za-z0-9_$#]{6,12}$/);
let singlename = new RegExp(/^[A-Za-z]{2,18}$/);

const fieldCheck = (elm, regx) => {
  if (!regx.test(elm.value)) {
    elm.classList.add("ib");
    return false;
  }

  return true;
};

//---------- email --------------- start ---
signinemail.addEventListener("focus", () => {
  signinemail.classList.remove("ib");
});

signinemail.addEventListener("blur", () => {
  flag1 = fieldCheck(signinemail, emailCheck);
});
//---------- email --------------- end ---

//---------- password --------------- start ---
signinpassword.addEventListener("focus", () => {
  signinpassword.classList.remove("ib");
});

signinpassword.addEventListener("blur", () => {
  flag2 = fieldCheck(signinpassword, passwordCheck);
});
//---------- password --------------- end ---

// form.addEventListener("submit", (ev) => {
//   ev.preventDefault();

//   if (flag1 && flag2) form.submit();
//   else {
//     fieldCheck(email, emailCheck, eml_err);
//     fieldCheck(password, passwordCheck, pwd_err);
//   }
// });

// const checkEmailExists = async () => {
//   console.log("Hello");
//   let response = await fetch("check_email.do?email=" + email.value);
//   console.log(response);
//   let result = await response.text();
//   console.log(result);

//   return result;
// };

let sflag1 = false;
let sflag2 = false;
let sflag3 = false;
let sflag4 = false;
let sflag5 = false;

// firstname------------------start
// firstname------------------start
firstname.addEventListener("focus", () => {
  firstname.classList.remove("ib"); // Remove the error class on focus
});

firstname.addEventListener("blur", () => {
  sflag1 = fieldCheck(firstname, singlename); // Validate on blur
});
// firstname------------------end

// lastname------------------start
lastname.addEventListener("focus", () => {
  lastname.classList.remove("ib"); // Remove the error class on focus
});

lastname.addEventListener("blur", () => {
  sflag2 = fieldCheck(lastname, singlename); // Validate on blur
});
// lastname------------------end

// signupemail------------------start
signupemail.addEventListener("focus", () => {
  signupemail.classList.remove("ib"); // Remove the error class on focus
});

signupemail.addEventListener("blur", () => {
  sflag3 = fieldCheck(signupemail, emailCheck); // Validate on blur
});
// signupemail------------------end

// signupemail------------------start
signuppassword.addEventListener("focus", () => {
  signuppassword.classList.remove("ib"); // Remove the error class on focus
});

signuppassword.addEventListener("blur", () => {
  sflag4 = fieldCheck(signuppassword, passwordCheck);
  signupcofirmpass.value = "";
  sflag5 = false;
});
// signuppassword------------------end

// signupemail------------------start
signupcofirmpass.addEventListener("focus", () => {
  signupcofirmpass.classList.remove("ib"); // Remove the error class on focus
});

signupcofirmpass.addEventListener("blur", () => {
  if (sflag4) {
    if (signuppassword.value == signupcofirmpass.value) sflag5 = true;
    else {
      signupcofirmpass.classList.add("ib");
    }
  }
});
// signupcofirmpass------------------end

async function postData(url, params) {
  let response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: params,
  });

  const result = await response.text();
  return result;
}

async function getData(url) {
  let response = await fetch(url);

  const result = await response.text();
  return result;
}

function startResetCount(count) {
  document.getElementById("reset-otp-btn").setAttribute("disabled", "true");
  let interval = setInterval(() => {
    document.getElementById("reset-count").innerText = "" + --count;
    if (count == 0) {
      clearInterval(interval);
      document.getElementById("reset-otp-btn").removeAttribute("disabled");
    }
  }, 1000);
}

let tempemail = null;

document.getElementById("signupform").addEventListener("submit", (e) => {
  e.preventDefault();

  // console.log(sflag1 + " - " + sflag2 + " - " + sflag3 + " - " + sflag4 + " - " + sflag5);

  if (sflag1 && sflag2 && sflag3 && sflag4 && sflag5) {
    tempemail = document.getElementById("signupemail").value;
    let params =
      "firstname=" +
      document.getElementById("firstname").value +
      "&lastname=" +
      document.getElementById("lastname").value +
      "&email=" +
      document.getElementById("signupemail").value +
      "&password=" +
      document.getElementById("signuppassword").value;

    postData("registor.do", params)
      .then((data) => {
        // console.log(data);
        if (data == "true") {
          document.getElementById("otp-email").value =
            document.getElementById("signupemail").value;
          document.getElementById("otpbox").style.display = "block";
          document.getElementById("signupbox").style.display = "none";
          startResetCount(60);
        } else if (data == false) {
        } else {
          document.getElementById(
            "signupError"
          ).innerHTML = `<small>${data}</small>`;
          document.getElementById("signupError").style.visibility = "visible";
        }
      })
      .catch((error) => {
        console.log(error);
      });
  } else {
    sflag1 = fieldCheck(firstname, singlename);
    sflag2 = fieldCheck(lastname, singlename);
    sflag3 = fieldCheck(signupemail, emailCheck);
    sflag4 = fieldCheck(signuppassword, passwordCheck);
    if (sflag4) {
      sflag5 = signuppassword.value == signupcofirmpass.value;
    }
  }
});

function getInp(inp) {
  return document.getElementById(inp).value;
}

document.getElementById("confirm-otp").addEventListener("click", (e) => {
  e.preventDefault();
  let params =
    "email=" +
    document.getElementById("otp-email").value +
    "&otp=" +
    getInp("c1") +
    getInp("c2") +
    getInp("c3") +
    getInp("c4") +
    getInp("c5") +
    getInp("c6");

  postData("verifyemail.do", params)
    .then((data) => {
      if (data == "false") {
        document.getElementById("otp-error").style.visibility = "visible";
      } else if (data == "true") {
        window.location = "get_started.do";
      } else {
        console.log(data);
      }
    })
    .catch((error) => {
      console.log("Error : " + error);
    });
});

document.getElementById("reset-otp-btn").addEventListener("click", (e) => {
  e.preventDefault();
  getData("resendotp.do?email=" + tempemail)
    .then((data) => {
      if (data == "true") {
        console.log(data);
        startResetCount(60);
      } else {
        console.log("OOps...Something Went Wrong");
      }
    })
    .then((error) => {
      console.log("Error : " + error);
    });
});

// Sign in --- Functionalities -----------------------------
document.getElementById("sign-in-form").addEventListener("submit", (e) => {
  e.preventDefault();
  if (flag1 && flag2) {
    let params =
      "email=" +
      document.getElementById("signinemail").value +
      "&password=" +
      document.getElementById("signinpassword").value;

    postData("signin.do", params)
      .then((data) => {
        if (data == "true") {
          window.location = "index.do";
        } else if (data == "verify") {
          document.getElementById("signinbox").style.display = "none";
          document.getElementById("verification-email-box").style.display =
            "block";
        } else {
          document.getElementById("sign-in-error").style.visibility = "visible";
        }
      })
      .catch((error) => {
        console.log("Error : " + error);
      });
  }
});

// ######### Forget Password code ############
document
  .getElementById("forget-password-btn")
  .addEventListener("click", (e) => {
    e.preventDefault();
    signInBox.style.display = "none";
    forgetPasswordBox.style.display = "block";
  });

document.getElementById("send-reset-link").addEventListener("click", (e) => {
  e.preventDefault();
  let forgetEmail = document.getElementById("forget-email");
  let params = "email=" + forgetEmail.value;

  postData("forget_password.do", params)
    .then((data) => {
      if (data == "true") {
        // Hide email input box
        document.getElementById("forget-otp-email").value = forgetEmail.value;
        document.getElementById("forget-password-box").style.display = "none";

        // Show OTP + Password box
        document.getElementById("forget-otp-box").style.display = "block";
      } else {
        document.getElementById("forget-error").classList.remove("d-none");
        document.getElementById("forget-error").classList.add("d-flex");
      }
    })
    .catch((error) => {
      console.log("Error : " + error);
    });
});

// ######### Forget Password code end ############

// ------------------ verification email code ---------------
let verifyemailflag = false;
let verificationEmail = document.getElementById("verification-email");

//---------- email --------------- start ---
verificationEmail.addEventListener("focus", () => {
  verificationEmail.classList.remove("ib");
});

verificationEmail.addEventListener("blur", () => {
  verifyemailflag = fieldCheck(verificationEmail, emailCheck);
});
//---------- email --------------- end ---

document.getElementById("verification-form").addEventListener("submit", (e) => {
  e.preventDefault();
  if (verifyemailflag) {
    let params = "email=" + verificationEmail.value;

    postData("reverifyemail.do", params)
      .then((data) => {
        if (data == "true") {
          document.getElementById("otpbox").style.display = "block";
          document.getElementById("verification-email-box").style.display =
            "none";
          document.getElementById("otp-email").value = verificationEmail.value;
          startResetCount(60);
          tempemail = verificationEmail.value;
        } else {
          document.getElementById("verify-email-error").style.visibility =
            "visible";
        }
      })
      .catch((error) => {
        console.log("Error : " + error);
      });
  } else {
    fieldCheck(verificationEmail, emailCheck);
  }
});

// ############### Toggle Password Visibility ###############
function togglePasswordVisibility() {
  const input = document.getElementById("signinpassword");
  const icon = document.getElementById("togglePasswordIcon");

  if (input.type === "password") {
    input.type = "text";
    icon.classList.remove("fa-eye-slash");
    icon.classList.add("fa-eye");
  } else {
    input.type = "password";
    icon.classList.remove("fa-eye");
    icon.classList.add("fa-eye-slash");
  }
}

function toggleSignupPassword() {
  const input = document.getElementById("signuppassword");
  const icon = document.getElementById("toggleSignupPasswordIcon");

  if (input.type === "password") {
    input.type = "text";
    icon.classList.remove("fa-eye-slash");
    icon.classList.add("fa-eye");
  } else {
    input.type = "password";
    icon.classList.remove("fa-eye");
    icon.classList.add("fa-eye-slash");
  }
}
