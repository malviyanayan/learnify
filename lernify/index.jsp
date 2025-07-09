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

                    .hide-scrollbar {
                        scrollbar-width: none;
                        /* Firefox */
                        -ms-overflow-style: none;
                        /* IE 10+ */
                    }

                    .hide-scrollbar::-webkit-scrollbar {
                        display: none;
                        /* Chrome, Safari, Opera */
                    }
                </style>
            </head>

            <body>
                <!-- Main Container -->
                <div class="container-fluid mt-5">
                    <!-- Navbar including -->
                    <c:set var="nav_active" value="home" scope="request" />
                    <%@ include file="WEB-INF/pages/navbar.jsp" %>

                        <style>
                            .main-width {
                                width: 95%;
                                margin: 0 auto;
                                margin-top: 80px;
                            }

                            #home-boy {
                                max-width: 100vw;
                            }

                            #grow-shrink-box {
                                height: 400px;
                                width: 75%;
                            }

                            @media (max-width: 700px) {
                                #home-boy {
                                    display: none;
                                }

                                #home-inf-bx {
                                    width: 80%;
                                    margin: 0 auto;
                                }

                                #grow-shrink-box {
                                    height: 300px;
                                    width: 100%;
                                }
                            }
                        </style>
                        <!-- Home -->
                        <div class="main-width mt-8">
                            <div class="row position-relative d-flex justify-content-between"
                                style="min-height: 300px; height: max-content;">
                                <div class="col-5 z-1">
                                    <img src="static/media/images/home_boy.png" id="home-boy" class="h-100">
                                </div>
                                <div class="col-6 z-2" id="home-inf-bx">
                                    <h4 class="mt-5 fs-3 fw-bold">Learnify</h4>
                                    <h1 class="mt-3 mb-4 fw-bolder" style="color: #0D47A1;">Master New Skills with
                                        Engaging Video
                                        Lectures <i class="bi bi-plus-circle-dotted"></i></h1>
                                    <button
                                        class="btn btn-success text-white fw-medium rounded-4 ms-1 me-2 d-flex align-items-center button">Explore
                                        <i class="bi bi-forward-fill fs-4 ms-2"></i></button>

                                </div>
                                <!-- Styling box -->
                                <div id="grow-shrink-box"
                                    class="position-absolute bg-info-subtle animate-box z-0 bottom-0"
                                    style="border-radius: 60% 22% 20% 50% / 100% 83% 57% 0% ;"></div>
                            </div>
                        </div>

                        <hr>

                        <div class="container p-1 hs-1">
                            <div class="row bg-def p-4 text-white fw-bold fs-5 rounded-1 text-center">
                                <div
                                    class="col-6 col-md-3 mb-4 mb-md-0 d-flex flex-column align-items-center justify-content-center">
                                    <div>250+</div>
                                    <span>Total Courses</span>
                                </div>
                                <div
                                    class="col-6 col-md-3 mb-4 mb-md-0 d-flex flex-column align-items-center justify-content-center">
                                    <div>300+</div>
                                    <span>Total Instructors</span>
                                </div>
                                <div
                                    class="col-6 col-md-3 mb-4 mb-md-0 d-flex flex-column align-items-center justify-content-center">
                                    <div>35k+</div>
                                    <span>Total Students</span>
                                </div>
                                <div
                                    class="col-6 col-md-3 d-flex flex-column align-items-center justify-content-center">
                                    <div>42+</div>
                                    <span>Total Categories</span>
                                </div>
                            </div>
                        </div>


                        <hr>





                        <!-- Font Awesome CDN -->
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

                        <style>
                            .card-custom {
                                transition: transform 0.3s ease, box-shadow 0.3s ease;
                                border: none;
                                max-width: 95%;
                                width: 100%;
                            }

                            .card-custom:hover {
                                transform: translateY(-8px);
                                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                            }

                            .icon-box {
                                font-size: 3.5rem;
                                color: #0D47A1;
                                margin-bottom: 1rem;
                            }

                            .card-title {
                                font-size: 1.4rem;
                                font-weight: 600;
                            }

                            .card-text {
                                font-size: 1rem;
                                padding: 0 1.2rem;
                            }

                            .section-heading-custom {
                                font-size: 1.75rem;
                                font-weight: bold;
                                color: #0D47A1;
                                margin-bottom: 2.5rem;
                            }

                            @media (max-width: 992px) {
                                .card-custom {
                                    max-width: 100%;
                                    padding: 1.5rem !important;
                                }

                                .icon-box {
                                    font-size: 2.8rem;
                                }

                                .card-title {
                                    font-size: 1.2rem;
                                }

                                .card-text {
                                    font-size: 0.95rem;
                                }

                                .btn {
                                    font-size: 0.95rem;
                                }

                                .section-heading-custom svg {
                                    width: 24px;
                                    height: 24px;
                                }

                                .section-heading-custom {
                                    font-size: 1.5rem;
                                }

                                .container-fluid {
                                    padding-left: 1rem;
                                    padding-right: 1rem;
                                }
                            }

                            @media (max-width: 576px) {
                                .icon-box {
                                    font-size: 2.4rem;
                                }

                                .card-title {
                                    font-size: 1.1rem;
                                }

                                .card-text {
                                    font-size: 0.9rem;
                                    padding: 0 1rem;
                                }
                            }
                        </style>

                        <div class="container-fluid my-5 px-3 px-sm-4 px-md-5">
                            <h2
                                class="section-heading-custom text-center d-flex align-items-center justify-content-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" class="me-2"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M15 20l-6 -3l-6 3v-13l6 -3l6 3l6 -3v7.5" />
                                    <path d="M9 4v13" />
                                    <path d="M15 7v5.5" />
                                    <path d="M19 22v.01" />
                                    <path d="M19 19a2.003 2.003 0 0 0 .914 -3.782a1.98 1.98 0 0 0 -2.414 .483" />
                                </svg>
                                Explore & Elevate
                            </h2>

                            <div class="row g-4 justify-content-center">
                                <!-- Card 1 -->
                                <div class="col-12 col-md-6 col-lg-4 d-flex justify-content-center">
                                    <div
                                        class="card card-custom p-4 shadow-sm rounded-4 d-flex flex-column align-items-center text-center">
                                        <i class="fas fa-book-open icon-box"></i>
                                        <h5 class="card-title mb-2">Diverse Learning Paths</h5>
                                        <p class="card-text text-muted">Explore courses designed to upskill you in
                                            various fields and industries.</p>
                                        <a href="#" class="btn btn-outline-primary mt-3">Search Courses</a>
                                    </div>
                                </div>

                                <!-- Card 2 -->
                                <div class="col-12 col-md-6 col-lg-4 d-flex justify-content-center">
                                    <div
                                        class="card card-custom p-4 shadow-sm rounded-4 d-flex flex-column align-items-center text-center">
                                        <i class="fas fa-chalkboard-teacher icon-box"></i>
                                        <h5 class="card-title mb-2">Meet the Mentors</h5>
                                        <p class="card-text text-muted">Learn directly from expert mentors with
                                            real-world experience.</p>
                                        <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                                    </div>
                                </div>

                                <!-- Card 3 -->
                                <div class="col-12 col-md-6 col-lg-4 d-flex justify-content-center">
                                    <div
                                        class="card card-custom p-4 shadow-sm rounded-4 d-flex flex-column align-items-center text-center">
                                        <i class="fas fa-crown icon-box"></i>
                                        <h5 class="card-title mb-2">Unlock Premium Benefits</h5>
                                        <p class="card-text text-muted">Access exclusive content, early releases, and
                                            premium tools.</p>
                                        <a href="#" class="btn btn-outline-primary mt-3">View Plans</a>
                                    </div>
                                </div>
                            </div>
                        </div>





                        <hr>

                        <!-- Learning steps -->
                        <div class="container my-5">
                            <div class="row align-items-center p-4 rounded shadow-lg"
                                style="background-color: #1E88E5;">
                                <!-- Image Section -->
                                <div class="col-md-6 d-flex justify-content-center">
                                    <img src="static/media/images/learning_steps.jpg" alt="Learning steps"
                                        class="img-fluid rounded hs-1">
                                </div>

                                <!-- Text Section -->
                                <div class="col-md-6 text-white">
                                    <h2
                                        class="d-flex align-items-center justify-content-center mt-sm-4 mt-xm-4 mt-md-4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" class="me-2"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M3 17h4v4h-4z" />
                                            <path d="M17 3h4v4h-4z" />
                                            <path d="M11 19h5.5a3.5 3.5 0 0 0 0 -7h-8a3.5 3.5 0 0 1 0 -7h4.5" />
                                        </svg>
                                        Learning Steps
                                    </h2>

                                    <div class="mt-3">
                                        <div class="d-flex align-items-start">
                                            <i class="bi bi-1-square-fill fs-4 me-2"></i>
                                            <div>
                                                <strong>Discover & Explore</strong>
                                                <p class="mb-2">Understand the basics, ask questions, and explore new
                                                    ideas.</p>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-start">
                                            <i class="bi bi-2-square-fill fs-4 me-2"></i>
                                            <div>
                                                <strong>Learn & Apply</strong>
                                                <p class="mb-2">Follow structured learning and apply concepts through
                                                    practice.</p>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-start">
                                            <i class="bi bi-3-square-fill fs-4 me-2"></i>
                                            <div>
                                                <strong>Practice & Improve</strong>
                                                <p class="mb-2">Refine skills with regular practice and learning from
                                                    mistakes.</p>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-start">
                                            <i class="bi bi-4-square-fill fs-4 me-2"></i>
                                            <div>
                                                <strong>Master & Share</strong>
                                                <p class="mb-0">Teach others, build projects, and keep improving.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <hr>

                        <style>
                            .scrolling-wrapper {
                                display: flex;
                                overflow-x: auto;
                                gap: 1.5rem;
                                scroll-behavior: smooth;
                                padding-bottom: 15px;
                                -ms-overflow-style: none;
                                scrollbar-width: none;
                            }

                            .scrolling-wrapper::-webkit-scrollbar {
                                display: none;
                            }

                            .card {
                                min-width: 250px;
                                height: 230px;
                                flex: 0 0 auto;
                                border-radius: 1.2rem;
                                transition: all 0.3s ease-in-out;
                                background: linear-gradient(145deg, #f0f0f0, #ffffff);
                            }

                            .card:hover {
                                transform: translateY(-6px);
                                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
                            }

                            .icon-wrapper {
                                font-size: 64px;
                                color: #2e74ff;
                                padding-top: 35px;
                            }

                            .card-body {
                                padding: 1rem;
                            }

                            .card-title {
                                font-size: 1.2rem;
                                font-weight: 600;
                                margin-top: 10px;
                            }

                            h2 {
                                font-size: 2rem;
                            }
                        </style>

                        <div class="container mb-5">
                            <h2 class="mt-4 text-center fw-bold" style="color: #0D47A1;">Top Categories</h2>

                            <!-- <div class="position-relative">
                                
                                <button id="scrollLeft" class="btn btn-light position-absolute"
                                    style="left: 0; top: 50%; transform: translateY(-50%); z-index: 10; display: none;">
                                    &#9665;
                                </button>

                                <div class="overflow-hidden px-5">
                                    <ul class="nav nav-tabs flex-nowrap d-flex" id="courseTabs" role="tablist"
                                        style="white-space: nowrap; transition: scroll 0.3s;">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="web-tab" data-bs-toggle="tab"
                                                data-bs-target="#web" type="button" role="tab">Web Development</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="ai-tab" data-bs-toggle="tab"
                                                data-bs-target="#ai" type="button" role="tab">AI & Data Science</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="cyber-tab" data-bs-toggle="tab"
                                                data-bs-target="#cyber" type="button" role="tab">Cybersecurity</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="cloud-tab" data-bs-toggle="tab"
                                                data-bs-target="#cloud" type="button" role="tab">Cloud
                                                Computing</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="mobile-tab" data-bs-toggle="tab"
                                                data-bs-target="#mobile" type="button" role="tab">Mobile App
                                                Development</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="devops-tab" data-bs-toggle="tab"
                                                data-bs-target="#devops" type="button" role="tab">DevOps</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="blockchain-tab" data-bs-toggle="tab"
                                                data-bs-target="#blockchain" type="button"
                                                role="tab">Blockchain</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="game-tab" data-bs-toggle="tab"
                                                data-bs-target="#game" type="button" role="tab">Game
                                                Development</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link text-primary fw-bold" id="showmore-tab"
                                                data-bs-toggle="tab" data-bs-target="#showmore" type="button"
                                                role="tab">Show More</button>
                                        </li>
                                    </ul>
                                </div>

                                
                                <button id="scrollRight" class="btn btn-light position-absolute"
                                    style="right: 0; top: 50%; transform: translateY(-50%); z-index: 10; display: none;">
                                    &#9655;
                                </button>
                            </div> -->

                            <!-- <style>
                                .slider-container {
                                    position: relative;
                                    overflow: hidden;
                                    padding: 20px 50px;
                                    /* Buttons ke liye space */
                                    background: white;
                                }

                                .card-slider {
                                    display: flex;
                                    gap: 15px;
                                    overflow-x: auto;
                                    scroll-behavior: smooth;
                                    padding: 10px;
                                    padding-top: 1px;
                                    scrollbar-width: none;
                                    -webkit-overflow-scrolling: touch;
                                }


                                .card-slider::-webkit-scrollbar {
                                    display: none;
                                }

                                .card {
                                    min-width: 250px;
                                    max-width: 250px;
                                    flex: 0 0 auto;
                                    text-align: center;
                                    background: white;
                                    /* Background white */
                                    border: 1px solid #ddd;
                                    /* Light border */
                                }
                            </style> -->

                            <!-- <div class="tab-content mt-3 rounded" id="courseContent" style="background-color: #fff;">

                                <div class="tab-pane fade show active" id="web" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                            
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>



                                        </div>



                                    </div>
                                </div>

                                <div class="tab-pane fade" id="ai" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>



                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade" id="cyber" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>


                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade" id="cloud" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>


                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade" id="mobile" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>


                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade" id="devops" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>



                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade" id="blockchain" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade" id="game" role="tabpanel">
                                    <div class="my-4">

                                        
                                        <div class="d-flex overflow-auto hide-scrollbar px-3"
                                            style="gap: 1rem; scroll-behavior: smooth;">

                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        
                                            <div class="flex-shrink-0" style="width: 280px;">
                                                <a href="http://localhost:8080/elp15/show_course.do?course=7"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card border shadow-sm rounded-4">
                                                        <img src="http://localhost:8080/elp15/static/media/images/course/thumbnail.png"
                                                            class="card-img-top rounded-top-4" alt="Course Thumbnail">
                                                        <div class="card-body d-flex flex-column">
                                                            <h6 class="card-title fw-semibold text-left text-truncate">
                                                                Full Stack Web
                                                                Development</h6>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center small text-muted">
                                                                <span>Trainer: John Doe</span>
                                                                <span
                                                                    class="text-warning">&#9733;&#9733;&#9733;&#9733;&#9734;
                                                                    <span class="text-dark">(4.7)</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                                <div class="tab-pane fade text-center" id="showmore" role="tabpanel">
                                    <a href="courses.do" class="fw-bold text-primary"
                                        style="text-decoration: none; font-size: 18px;">Click here to explore more
                                        categories</a>
                                </div>
                            </div> -->

                            <div class="container mb-5 mt-4">

                                <div class="scrolling-wrapper">

                                    <div class="card text-center shadow-sm border-0">
                                        <div class="icon-wrapper"><i class="fas fa-code"></i></div>
                                        <div class="card-body">
                                            <h6 class="card-title">Web Development</h6>
                                        </div>
                                    </div>

                                    <div class="card text-center shadow-sm border-0">
                                        <div class="icon-wrapper"><i class="fas fa-mobile-alt"></i></div>
                                        <div class="card-body">
                                            <h6 class="card-title">App Development</h6>
                                        </div>
                                    </div>

                                    <div class="card text-center shadow-sm border-0">
                                        <div class="icon-wrapper"><i class="fas fa-cloud"></i></div>
                                        <div class="card-body">
                                            <h6 class="card-title">Cloud Computing</h6>
                                        </div>
                                    </div>

                                    <div class="card text-center shadow-sm border-0">
                                        <div class="icon-wrapper"><i class="fas fa-brain"></i></div>
                                        <div class="card-body">
                                            <h6 class="card-title">AI & ML</h6>
                                        </div>
                                    </div>

                                    <div class="card text-center shadow-sm border-0">
                                        <div class="icon-wrapper"><i class="fas fa-shield-alt"></i></div>
                                        <div class="card-body">
                                            <h6 class="card-title">Cyber Security</h6>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="container">
                            <h2 class="mt-4 text-center fw-bold" style="color: #0D47A1;">Frequently Asked Questions</h2>

                            <div class="mt-4">
                                <div class="accordion" id="faqAccordion">


                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq1" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> How can I sell my course on
                                                this platform?
                                            </button>
                                        </h2>
                                        <div id="faq1" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                To sell your course, you need to register as a trainer, create your
                                                course content, and submit it for approval. Once approved, your course
                                                will be listed on the platform.
                                            </div>
                                        </div>
                                    </div>


                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq2" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> What percentage of the course
                                                price will I receive as a trainer?
                                            </button>
                                        </h2>
                                        <div id="faq2" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Trainers receive a percentage of each course sale. The exact percentage
                                                depends on the platform's revenue-sharing policy, which you can check in
                                                the trainer dashboard.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Question 3 -->
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq3" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> How can students purchase a
                                                course?
                                            </button>
                                        </h2>
                                        <div id="faq3" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Students can browse the available courses, select a course, and click
                                                the "Buy Now" button. Payment can be made via Credit/Debit Card, UPI, or
                                                PayPal.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Question 4 -->
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq4" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> Will I get a certificate after
                                                completing a course?
                                            </button>
                                        </h2>
                                        <div id="faq4" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Yes, after completing the course and passing the required assessments,
                                                students can download their certificate from the dashboard.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Question 5 -->
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq5" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> Can I access purchased courses
                                                forever?
                                            </button>
                                        </h2>
                                        <div id="faq5" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Yes, once you purchase a course, you will have lifetime access to it,
                                                unless specified otherwise by the trainer.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Question 6 -->
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq6" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> Can I get a refund if I am not
                                                satisfied with the course?
                                            </button>
                                        </h2>
                                        <div id="faq6" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Yes, we offer a refund policy within the first 7 days of purchase,
                                                provided you have not completed more than 20% of the course.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Question 7 -->
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#faq7" aria-expanded="false">
                                                <i class="fas fa-chevron-right me-2"></i> How can I contact support?
                                            </button>
                                        </h2>
                                        <div id="faq7" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                You can contact our support team via email at support@example.com or use
                                                the live chat option available on the website.
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>



                        <%@ include file="WEB-INF/pages/footer.jsp" %>

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