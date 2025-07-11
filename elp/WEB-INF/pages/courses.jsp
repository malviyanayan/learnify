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
                    <!-- Main Navbar -->
                    <c:set var="nav_active" value="courses" scope="request" />
                    <%@ include file="navbar.jsp" %>

                        <!-- Sub Navbar -->
                        <div class="filter-sort-bar-wrapper bg-light shadow-sm w-100 px-3 py-2 sticky-top"
                            style="top: 84px; z-index: 1020;">
                            <div
                                class="filter-sort-bar-container d-flex justify-content-between align-items-center flex-wrap gap-2">

                                <!-- Left Filter Dropdown -->
                                <div class="filter-sort-bar-dropdown position-relative">
                                    <i class="fas fa-star filter-sort-bar-icon"></i>
                                    <select class="filter-sort-bar-select form-select form-select-sm rounded-3">
                                        <option value="popular" selected>Most Popular</option>
                                        <option value="latest">Latest Courses</option>
                                        <option value="rating">Top Rated</option>
                                    </select>
                                </div>

                                <!-- Right Sort Dropdown -->
                                <div class="filter-sort-bar-dropdown position-relative">
                                    <i class="fas fa-sort filter-sort-bar-icon"></i>
                                    <select class="filter-sort-bar-select form-select form-select-sm rounded-3"
                                        id="sort-select">
                                        <option value="default" selected>Sort By</option>
                                        <option value="price_low_high">Price: Low to High</option>
                                        <option value="price_high_low">Price: High to Low</option>
                                    </select>
                                </div>

                            </div>
                        </div>

                        <!-- Scoped Unique Styles -->
                        <style>
                            .filter-sort-bar-wrapper {
                                background: #f8f9fa;
                                padding: 10px 15px;
                                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                border-radius: 10px;
                            }

                            .filter-sort-bar-container {
                                width: 100%;
                            }

                            .filter-sort-bar-dropdown {
                                flex: 1;
                                max-width: 250px;
                            }

                            .filter-sort-bar-select {
                                padding: 6px 30px 6px 12px;
                                font-size: 14px;
                                font-weight: 500;
                                border: 1px solid #ddd;
                                cursor: pointer;
                                background: #fff;
                                appearance: none;
                                border-radius: 6px;
                            }

                            .filter-sort-bar-icon {
                                position: absolute;
                                right: 12px;
                                top: 50%;
                                transform: translateY(-50%);
                                color: #007bff;
                                font-size: 14px;
                            }

                            @media (max-width: 768px) {
                                .filter-sort-bar-container {
                                    flex-wrap: nowrap !important;
                                    overflow-x: auto;
                                    justify-content: center;
                                }

                                .filter-sort-bar-dropdown {
                                    flex: none;
                                    width: auto;
                                    min-width: 120px;
                                }
                            }
                        </style>



                        <!-- Home -->

                        <div id="main-container" style="margin-top: 80px;">
                            <div class="container mt-3">
                                <div class="row" id="course-container">

                                    <!-- Course 1 -->
                                    <!-- <div class="col-12 col-md-6 col-lg-4 mb-3">
                                        <a href="show_course.do?course=7" class="text-decoration-none text-dark">
                                            <div class="card shadow-sm border-0 rounded-3 course-card">
                                                <img src="static/media/images/course/thumbnail.png" class="card-img-top" alt="Course Thumbnail">
                                                <div class="card-body d-flex flex-column">
                                                    <h6 class="card-title">Full Stack Web Development</h6>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <p class="text-muted small mb-0">Trainer: John Doe</p>
                                                        <div class="rating text-warning">
                                                            &#9733;&#9733;&#9733;&#9733;&#9734; <span class="text-dark">(4.7)</span>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-success fw-bold">
                                                            &#8377;4999 <del class="text-danger small">&#8377;7999</del>
                                                        </span>
                                                        <span class="badge bg-info text-dark">38% Off</span>
                                                    </div>
                                                    <div class="mt-auto d-flex justify-content-between">
                                                        <button class="btn btn-outline-danger btn-sm"><i class="fa-solid fa-heart me-1"></i>Wish</button>
                                                        
                                                        <div class="d-flex gap-2">
                                                            <button class="btn btn-outline-info btn-sm"><i class="fa-solid fa-cart-shopping me-1"></i>Cart</button>
                                                            <button class="btn btn-outline-success btn-sm"><i
                                                                    class="fa-solid fa-credit-card me-1"></i>buy</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div> -->


                                </div>
                            </div>
                        </div>

                        <%@ include file="footer.jsp" %>

                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                crossorigin="anonymous"></script>

                            <script src="static/js/courses.js"></script>

            </body>

            </html>