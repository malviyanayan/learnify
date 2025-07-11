<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Get Started(Learnify - signup/signin)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="static/css/poppins.css">
    <link rel="icon" href="static/media/images/favicon.ico" type="image/x-icon">

    <!-- font awesome link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        .trans {
            transition: display 0.5s ease-in-out;
        }

        .ib {
            box-shadow: 0 0 6px #DC4C64;
        }
    </style>
</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <nav class="navbar navbar-expand-lg pe-2 z-3 w-100 bg-white sd-c"
                    style="position: absolute;position: fixed;top: 0; left: 0;"
                    style="height: 50px;box-shadow: 0 4px 4px rgb(104, 101, 101);">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="index.do">
                            <img src="static/media/images/logo.png" height="60" alt="Lernify">
                        </a>

                    </div>
                </nav>
            </div>
        </div>
    </div>

    <!-- Registor Account Container -->
    <div class="container trans border p-4 rounded-3 border-success-subtle" id="signupbox"
        style="margin-top: 80px; display: none;">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 d-none d-md-block">
                <img src="static/media/images/sign/7.jpg" class="img-fluid rounded" alt="Sign Up Image">
            </div>
            <div class="col-12 col-md-6">
                <form id="signupform" class="p-4 shadow-lg bg-white rounded">
                    <h3 class="text-center mb-4"><i class="fas fa-user-plus"></i> Registor</h3>

                    <div class="row g-2 mb-3">
                        <div class="col">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" id="firstname" class="form-control" placeholder="First Name"
                                    aria-label="First name">
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" id="lastname" class="form-control" placeholder="Last Name"
                                    aria-label="Last name">
                            </div>
                        </div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="signupemail" placeholder="name@example.com">
                        <label for="signupemail"><i class="fas fa-envelope"></i> Email address</label>
                    </div>

                    <div class="form-floating mb-3 position-relative">
                        <input type="password" class="form-control" id="signuppassword" placeholder="Password">
                        <label for="signuppassword"><i class="fas fa-lock"></i> Password</label>

                        <!-- Toggle Icon -->
                        <span class="position-absolute top-50 end-0 translate-middle-y me-3" style="cursor: pointer;"
                            onclick="toggleSignupPassword()">
                            <i id="toggleSignupPasswordIcon" class="fas fa-eye-slash text-muted"></i>
                        </span>
                    </div>


                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="signupcofirmpass"
                            placeholder="Confirm Password">
                        <label for="signupcofirmpass"><i class="fas fa-lock"></i> Confirm Password</label>
                    </div>

                    <div class="alert alert-danger text-center p-2 fs-6 d-flex justify-content-center align-items-center"
                        id="signupError" style="visibility: hidden;">
                        <i class="fas fa-exclamation-circle me-1"></i>
                        <small>Email or password is invalid.</small>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-user-check"></i> Register
                        </button>
                    </div>

                    <div class="text-center mt-3">
                        <p>Already have an account?
                            <a href="signin.jsp" id="signinbtn" class="text-success fw-bold">
                                <i class="fas fa-sign-in-alt"></i> Sign in here
                            </a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <!-- Verify OTP Box -->
    <div class="container trans border p-4 rounded-3 border-success-subtle" id="otpbox"
        style="margin-top: 80px; display: none;">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 d-none d-md-block">
                <img src="static/media/images/sign/verify.jpg" class="img-fluid rounded" alt="Verify OTP">
            </div>
            <div class="col-12 col-md-6">
                <div class="p-4 shadow-lg bg-white rounded">
                    <h3 class="text-center mb-3"><i class="fas fa-shield-alt"></i> Email Verification</h3>
                    <p class="text-center">Enter the 6-digit code sent to your registered email to verify your identity
                        and secure your account.</p>

                    <!-- OTP Input Fields -->
                    <div class="row g-2 justify-content-center mt-4">
                        <input type="email" style="display: none;" id="otp-email">
                        <div class="col-2">
                            <input type="text" maxlength="1" class="form-control text-center fs-4" id="c1">
                        </div>
                        <div class="col-2">
                            <input type="text" maxlength="1" class="form-control text-center fs-4" id="c2">
                        </div>
                        <div class="col-2">
                            <input type="text" maxlength="1" class="form-control text-center fs-4" id="c3">
                        </div>
                        <div class="col-2">
                            <input type="text" maxlength="1" class="form-control text-center fs-4" id="c4">
                        </div>
                        <div class="col-2">
                            <input type="text" maxlength="1" class="form-control text-center fs-4" id="c5">
                        </div>
                        <div class="col-2">
                            <input type="text" maxlength="1" class="form-control text-center fs-4" id="c6">
                        </div>
                    </div>

                    <div class="alert alert-danger text-center mt-3 p-2 fs-6 d-flex justify-content-center align-items-center"
                        id="otp-error" style="visibility: hidden;">
                        <i class="fas fa-exclamation-circle me-1"></i>
                        <small>Invalid OTP.</small>
                    </div>

                    <!-- Buttons -->
                    <div class="d-grid mt-4">
                        <button type="button" class="btn btn-success" id="confirm-otp">
                            <i class="fas fa-check-circle"></i> Continue
                        </button>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <button type="button" class="btn btn-info" id="reset-otp-btn" disabled>
                            <i class="fas fa-redo"></i> Resend OTP
                        </button>
                        <div class="bg-white border rounded px-3 py-2 fw-bold" id="reset-count">60</div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Forgot Password Box -->
    <div class="container trans border p-4 rounded-3 border-success-subtle" id="forget-password-box"
        style="margin-top: 80px; display: none;">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-5 d-none d-md-block text-center">
                <img src="static/media/images/sign/forget_pass.jpg" class="img-fluid rounded" alt="Forgot Password">
            </div>
            <div class="col-12 col-md-7">
                <div class="p-4 shadow-lg bg-white rounded">
                    <h3 class="text-center mb-3 text-success"><i class="fas fa-lock"></i> Reset Your Password</h3>
                    <p class="text-center text-muted">Enter your registered email to receive a 6-digit verification
                        code.</p>

                    <!-- Email Input -->
                    <div class="mb-3">
                        <label for="forget-email" class="form-label fw-bold"><i class="fas fa-envelope"></i>
                            Email</label>
                        <input type="email" class="form-control" id="forget-email" placeholder="Enter your email"
                            required>
                    </div>

                    <div class="alert alert-danger text-center mt-3 p-2 fs-6 d-flex justify-content-center align-items-center d-none"
                        id="forget-error">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <small>Invalid email address. Please try again.</small>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-grid gap-2 mt-4">
                        <button type="button" class="btn btn-success" id="send-reset-link">
                            <i class="fas fa-paper-plane"></i> Send Verification Code
                        </button>
                        <a href="get_started.do" id="back-to-signin" class="btn btn-outline-primary">
                            <i class="fas fa-arrow-left"></i> Back to Sign In
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- OTP + Password Reset Box -->
    <div class="container border p-4 rounded-3 border-primary-subtle" id="forget-otp-box" style="margin-top: 80px;display: none;">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 d-none d-md-block">
                <img src="static/media/images/sign/verify.jpg" class="img-fluid rounded" alt="Verify OTP">
            </div>
            <div class="col-12 col-md-6">
                <div class="p-4 shadow bg-white rounded">
                    <h3 class="text-center mb-3"><i class="fas fa-key"></i> Reset Password</h3>
                    <p class="text-center">Enter the OTP sent to your email and set a new password.</p>

                    <!-- Hidden email field -->
                    <input type="email" id="forget-otp-email" style="display: none;">

                    <!-- OTP Inputs -->
                    <div class="row g-2 justify-content-center mt-3">
                        <div class="col-2"><input type="text" maxlength="1" class="form-control text-center fs-4"
                                id="forget-c1"></div>
                        <div class="col-2"><input type="text" maxlength="1" class="form-control text-center fs-4"
                                id="forget-c2"></div>
                        <div class="col-2"><input type="text" maxlength="1" class="form-control text-center fs-4"
                                id="forget-c3"></div>
                        <div class="col-2"><input type="text" maxlength="1" class="form-control text-center fs-4"
                                id="forget-c4"></div>
                        <div class="col-2"><input type="text" maxlength="1" class="form-control text-center fs-4"
                                id="forget-c5"></div>
                        <div class="col-2"><input type="text" maxlength="1" class="form-control text-center fs-4"
                                id="forget-c6"></div>
                    </div>

                    <!-- New Password -->
                    <div class="form-group mt-4">
                        <label for="forget-new-password">New Password</label>
                        <input type="password" class="form-control" id="forget-new-password"
                            placeholder="Enter new password">
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group mt-3">
                        <label for="forget-confirm-password">Confirm Password</label>
                        <input type="password" class="form-control" id="forget-confirm-password"
                            placeholder="Confirm new password">
                    </div>

                    <!-- Error Message -->
                    <div class="alert alert-danger text-center mt-3 p-2 fs-6 d-flex justify-content-center align-items-center"
                        id="forget-otp-error" style="display: none;">
                        <i class="fas fa-exclamation-circle me-1"></i>
                        <small id="forget-otp-error-msg">Invalid input.</small>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid mt-4">
                        <button type="button" class="btn btn-primary" id="forget-otp-submit">
                            <i class="fas fa-check-circle"></i> Submit
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JS for submission -->
    <script>
        document.getElementById("forget-otp-submit").addEventListener("click", () => {
            const otp =
                document.getElementById("forget-c1").value +
                document.getElementById("forget-c2").value +
                document.getElementById("forget-c3").value +
                document.getElementById("forget-c4").value +
                document.getElementById("forget-c5").value +
                document.getElementById("forget-c6").value;

                const newPass = document.getElementById("forget-new-password").value.trim();
                const confirmPass = document.getElementById("forget-confirm-password").value.trim();
                const email = document.getElementById("forget-otp-email").value.trim();

            const errorBox = document.getElementById("forget-otp-error");
            const errorMsg = document.getElementById("forget-otp-error-msg");

            // Validation
            if (otp.length !== 6 || isNaN(otp)) {
                errorMsg.innerText = "OTP must be 6 digits.";
                errorBox.style.display = "flex";
                return;
            }

            if (newPass.length < 6) {
                errorMsg.innerText = "Password must be at least 6 characters.";
                errorBox.style.display = "flex";
                return;
            }

            if (newPass !== confirmPass) {
                errorMsg.innerText = "Passwords do not match.";
                errorBox.style.display = "flex";
                return;
            }

            // Hide error if everything is valid
            errorBox.style.display = "none";

            // Send POST request to verify and reset password
            fetch("verify_forget_otp.do", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body:
                    "otp=" + encodeURIComponent(otp) +
                    "&new_password=" + encodeURIComponent(newPass) +
                    "&email=" + encodeURIComponent(email)
            })
                .then(res => res.text())
                .then(data => {
                    if (data.trim() === "true") {
                        window.location.href = "get_started.do";
                    } else {
                        errorMsg.innerText = "OTP verification failed or password not updated.";
                        errorBox.style.display = "flex";
                    }
                })
                .catch(err => {
                    console.error("Error:", err);
                    errorMsg.innerText = "Server error. Try again.";
                    errorBox.style.display = "flex";
                });
        });
    </script>




    <!-- Sign In Option -->
    <div class="container trans border p-4 rounded-3 border-success-subtle" id="signinbox" style="margin-top: 80px;">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 d-none d-md-block">
                <img src="static/media/images/sign/3.jpg" class="img-fluid rounded" alt="Sign In Image">
            </div>
            <div class="col-12 col-md-6">
                <form class="p-4 shadow-lg bg-white rounded" id="sign-in-form">
                    <h3 class="text-center mb-4"><i class="fas fa-sign-in-alt"></i> Sign In</h3>

                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="signinemail" placeholder="name@example.com">
                        <label for="signinemail"><i class="fas fa-envelope"></i> Email address</label>
                    </div>

                    <div class="form-floating mb-3 position-relative">
                        <input type="password" class="form-control" id="signinpassword" placeholder="Password">
                        <label for="signinpassword"><i class="fas fa-lock"></i> Password</label>

                        <!-- Toggle Icon -->
                        <span class="position-absolute top-50 end-0 translate-middle-y me-3" style="cursor: pointer;"
                            onclick="togglePasswordVisibility()">
                            <i id="togglePasswordIcon" class="fas fa-eye-slash text-muted"></i>
                        </span>
                    </div>


                    <div class="text-danger text-center" id="sign-in-error" style="visibility: hidden;">
                        <small><i class="fas fa-exclamation-circle"></i> Email or password is invalid.</small>
                    </div>

                    <div class="text-center my-2">
                        <button type="button" class="btn btn-link" id="forget-password-btn">
                            <i class="fas fa-key"></i> Forgot Password?
                        </button>
                    </div>

                    <div class="d-grid">
                        <button type="submit" id="signinsbmt" class="btn btn-success">
                            <i class="fas fa-arrow-right-to-bracket"></i> Sign In
                        </button>
                    </div>

                    <div class="text-center mt-3">
                        <p>Don't have an account?
                            <a href="signup.jsp" id="signupbtn" class="text-success fw-bold">
                                <i class="fas fa-user-plus"></i> Register here
                            </a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>




    <!-- Verification Ask -->
    <div class="container trans border p-4 rounded-3 border-success-subtle" id="verification-email-box"
        style="margin-top: 100px; display: none;">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 d-none d-md-block">
                <img src="static/media/images/sign/verify_email_ask.jpg" class="img-fluid rounded" alt="Verify Email">
            </div>
            <div class="col-12 col-md-6">
                <div class="p-4 shadow-lg bg-white rounded">
                    <h3 class="text-center mb-3"><i class="fas fa-envelope-open-text"></i> Verify Account</h3>
                    <p class="text-center">Verify your account to get started! Check your email for the OTP and complete
                        the process. We are excited to have you with us!</p>

                    <form id="verification-form" class="mt-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="text" class="form-control" id="verification-email"
                                placeholder="Enter your email">
                        </div>

                        <div class="alert alert-danger text-center mt-2 p-2 fs-6 d-flex justify-content-center align-items-center"
                            id="verify-email-error" style="visibility: hidden;">
                            <i class="fas fa-exclamation-circle me-1"></i>
                            <small>Please check your email.</small>
                        </div>

                        <div class="d-grid mt-3">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-check-circle"></i> Verify
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <script src="static/js/getstarted.js"></script>
</body>

</html>