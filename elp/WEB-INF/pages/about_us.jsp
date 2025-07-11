<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="models.User" %>

        <% User user=(User)session.getAttribute("user"); %>

            <!doctype html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Home-(Learnify)</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">

                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
                    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />

                <!-- favicon image  -->
                <link rel="icon" href="static/media/images/favicon.ico" type="image/x-icon">
                <style>
                    .nav-link {
                        font-family: 'Arial', sans-serif;
                        font-size: 16px;
                        transition: color 0.6s ease, border-bottom 0.7s ease;
                        border-bottom: 2px solid transparent;
                        padding-bottom: 5px;
                        /* Adjust padding to bring border closer */
                    }

                    .nav-link:hover,
                    .nav-link.active {
                        color: #0056b3;
                        border-bottom: 2px solid #0056b3;
                    }

                    .animate-box {
                        animation: growShrink 4s infinite;
                    }

                    @keyframes growShrink {

                        0%,
                        100% {
                            transform: scale(1);
                        }

                        50% {
                            transform: scale(1.05);
                        }
                    }

                    .button {
                        background: linear-gradient(45deg, #154BA6, #1A56B3);
                        color: white;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 5px;
                        font-size: 16px;
                        cursor: pointer;
                        transition: 0.3s ease-in-out;
                    }

                    .button:hover {
                        background: linear-gradient(45deg, #003C8F, #0044CC);
                    }

                    .nav-link {
                        font-size: 16px;
                        color: #0044CC;
                    }

                    .text-def {
                        color: #0044CC;
                    }

                    .bg-def {
                        background-color: #2054ba;
                    }

                    .sd-c {
                        box-shadow: 2px 2px 6px #9cb4e3;
                    }

                    .hs-1 {
                        transition: all 0.3s ease-in-out;
                        cursor: pointer;
                    }

                    .hs-1:hover {
                        transform: scale(1.05);
                    }

                    .mt-8 {
                        margin-top: 100px;
                    }

                    /* Search Box should always remain fixed at top */
                    .search-box {
                        position: sticky;
                        top: 0;
                        z-index: 1050;
                    }

                    /* Navbar remains fixed */
                    .navbar {
                        position: fixed;
                        width: 100%;
                        top: 0;
                        left: 0;
                        z-index: 1030;
                    }

                    /* Sub-navbar remains below main navbar */
                    .sub-navbar {
                        position: sticky;
                        top: 90px;
                        z-index: 1020;
                    }

                    .course-card {
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                        max-width: 280px;
                        transition: transform 0.3s ease-in-out;
                    }

                    .course-card:hover {
                        transform: scale(1.05);
                    }

                    .course-card img {
                        height: 150px;
                        object-fit: cover;
                    }

                    .course-card .card-body {
                        flex-grow: 1;
                        font-size: 14px;
                    }

                    .rating {
                        display: flex;
                        align-items: center;
                        gap: 5px;
                    }

                    @media (max-width: 768px) {
                        .course-card {
                            max-width: 100%;
                        }
                    }

                    .profile-img {
                        width: 80px;
                        /* Image ko thoda bada kiya */
                        height: 80px;
                        border-radius: 50%;
                        object-fit: cover;
                    }

                    .account-name {
                        font-size: 1.2rem;
                        /* Account name ka size halka sa bada kiya */
                        font-weight: bold;
                    }
                </style>
            </head>

            <body>
                <!-- Main Container -->
                <div class="container-fluid mt-5">
                    <!-- Navbar including -->
                    <c:set var="nav_active" value="home" scope="request" />
                    <c:set var="nav_active" value="about" scope="request" />

                    <%@ include file="navbar.jsp" %>

                        <div class="container" style="margin-top: 100px;">
                            <div class="card p-5">
                                <h2 class="text-center mb-4"><i class="fas fa-question-circle"></i> Help & Support</h2>
                                <p class="text-center">We are here to assist you with any queries related to our
                                    platform. Explore the FAQs or reach out to us for personalized support.</p>

                                <div class="row mt-4">
                                    <div>
                                        <h4 class="my-3 fs-2"><i class="fas fa-info-circle text-primary"></i> Frequently
                                            Asked Questions</h4>
                                        <div class="accordion" id="faqAccordion">
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq1" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> How do I enroll in a
                                                        course?
                                                    </button>
                                                </h2>
                                                <div id="faq1" class="accordion-collapse collapse"
                                                    data-bs-parent="#faqAccordion">
                                                    <div class="accordion-body">
                                                        You can enroll by selecting a course and clicking on the "Enroll
                                                        Now" button.
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq2" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> What payment methods
                                                        do you accept?
                                                    </button>
                                                </h2>
                                                <div id="faq2" class="accordion-collapse collapse"
                                                    data-bs-parent="#faqAccordion">
                                                    <div class="accordion-body">
                                                        We accept Credit/Debit Cards, PayPal, and UPI transactions.
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq3" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> How do I get my course
                                                        certificate?
                                                    </button>
                                                </h2>
                                                <div id="faq3" class="accordion-collapse collapse"
                                                    data-bs-parent="#faqAccordion">
                                                    <div class="accordion-body">
                                                        After completing the course and passing the assessment, you can
                                                        download your certificate from your dashboard.
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- FAQ 4 -->
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq4" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> Will I get a
                                                        certificate after completing a course?
                                                    </button>
                                                </h2>
                                                <div id="faq4" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        Yes, after completing the course and passing the required
                                                        assessments, students can download their certificate from the
                                                        dashboard.
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- FAQ 5 -->
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq5" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> Can I access purchased
                                                        courses forever?
                                                    </button>
                                                </h2>
                                                <div id="faq5" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        Yes, once you purchase a course, you will have lifetime access
                                                        to it, unless specified otherwise by the trainer.
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- FAQ 6 -->
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq6" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> Can I get a refund if
                                                        I am not satisfied with the course?
                                                    </button>
                                                </h2>
                                                <div id="faq6" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        Yes, we offer a refund policy within the first 7 days of
                                                        purchase, provided you have not completed more than 20% of the
                                                        course.
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- FAQ 7 -->
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq7" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> How can I contact
                                                        support?
                                                    </button>
                                                </h2>
                                                <div id="faq7" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        You can contact our support team via email at
                                                        support@example.com or use the live chat option available on the
                                                        website.
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- FAQ 8 -->
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                        data-bs-target="#faq8" aria-expanded="false">
                                                        <i class="fas fa-chevron-right me-2"></i> How do I enroll in a
                                                        course?
                                                    </button>
                                                </h2>
                                                <div id="faq8" class="accordion-collapse collapse">
                                                    <div class="accordion-body">
                                                        You can enroll by selecting a course and clicking on the "Enroll
                                                        Now" button.
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="mt-5">
                                        <h4
                                            class="d-flex gap-2 align-items-center fs-1 justify-content-center fw-bold my-3">
                                            <i class="fas fa-envelope text-success fs-3 fw-bold"></i> Contact Us</h4>
                                        <form>
                                            <div class="mb-3">
                                                <label class="form-label"><i class="fas fa-user"></i> Your Name</label>
                                                <input type="text" class="form-control" placeholder="Enter your name">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label"><i class="fas fa-envelope"></i> Email
                                                    Address</label>
                                                <input type="email" class="form-control" placeholder="Enter your email">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label"><i class="fas fa-comments"></i> Your
                                                    Question</label>
                                                <textarea class="form-control" rows="4"
                                                    placeholder="Type your question here"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100" disabled><i
                                                    class="fas fa-paper-plane"></i> Submit</button>
                                        </form>
                                    </div>
                                </div>

                                <div class="text-center mt-5">
                                    <h5><i class="fas fa-life-ring text-primary"></i> Need More Help?</h5>
                                    <p>Our team is available 24/7 to assist you with any queries. Don't hesitate to get
                                        in touch.</p>
                                    <button disabled class="btn btn-lg btn-success"><i class="fas fa-headset"></i> Live
                                        Chat Support</button>
                                </div>
                            </div>
                        </div>





                        <%@ include file="footer.jsp" %>

                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    let tabsContainer = document.getElementById("courseTabs").parentElement;
                                    let leftBtn = document.getElementById("scrollLeft");
                                    let rightBtn = document.getElementById("scrollRight");

                                    function updateButtons() {
                                        leftBtn.style.display = tabsContainer.scrollLeft > 0 ? "block" : "none";
                                        rightBtn.style.display = tabsContainer.scrollLeft + tabsContainer.clientWidth < tabsContainer.scrollWidth ? "block" : "none";
                                    }

                                    leftBtn.addEventListener("click", function () {
                                        tabsContainer.scrollBy({ left: -150, behavior: "smooth" });
                                    });

                                    rightBtn.addEventListener("click", function () {
                                        tabsContainer.scrollBy({ left: 150, behavior: "smooth" });
                                    });

                                    tabsContainer.addEventListener("scroll", updateButtons);
                                    updateButtons();
                                });
                            </script>

                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                crossorigin="anonymous"></script>
            </body>

            </html>