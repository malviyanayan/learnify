<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@ page import="utils.Utility" %>

        <% request.setAttribute("utils",new Utility()); %>

            <!doctype html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>DashBoard-(Learnify)</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

                <link rel="stylesheet" href="static/css/dashboard.css">

                <!-- dash_common css -->
                <link rel="stylesheet" href="static/css/dash_common.css">

                <!-- favicon image  -->
                <link rel="icon" href="static/media/images/favicon.ico" type="image/x-icon">

                <!-- Bootstrap Icon cdn -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

                <!-- Font Awesome cdn -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
                    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />


                <style>
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


                    .edit-btn {
                        background: #123a65;
                        color: white;
                        border: none;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        cursor: pointer;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                        transition: 0.3s ease-in-out;
                    }

                    .edit-btn:hover {
                        background: #0056b3;
                    }

                    #lecture-container {
                        max-height: 70vh;
                        overflow-x: scroll;
                        scrollbar-width: none;
                        /* For Firefox */
                    }

                    #lecture-container::-webkit-scrollbar {
                        display: none;
                        /* For Chrome, Safari, and Opera */
                    }

                    .custom-btn {
                        width: 100%;
                        /* Buttons will take full width of their container */
                        min-height: 50px;
                        /* Same height for all buttons */
                        font-size: 14px;
                        /* Keep font readable */
                        white-space: nowrap;
                        /* Prevent text from breaking */
                        text-overflow: ellipsis;
                        /* Add '...' if text is too long */
                        overflow: hidden;
                        padding: 10px 15px;
                        text-align: center;
                    }

                    .row-cols-2 .col {
                        flex: 1 1 calc(50% - 10px);
                        /* 2 columns on small screens */
                    }

                    .row-cols-md-3 .col {
                        flex: 1 1 calc(33.33% - 10px);
                        /* 3 columns on medium screens */
                    }
                </style>

            </head>

            <body>

                <!-- Menu Button for Small Screens -->
                <button class="menu-btn" onclick="toggleSidebar()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icons-tabler-outline icon-tabler-menu-2">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M4 6l16 0" />
                        <path d="M4 12l16 0" />
                        <path d="M4 18l16 0" />
                    </svg> Menu
                </button>

                <div class="d-flex overflow-hidden">
                    <!-- Left Sidebar -->
                    <%@ include file="left_sidebar.jsp" %>

                        <!-- Right Main Content -->
                        <div class="right-panel overflow-y-hidden overflow-x-hidden">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="col-5 col-md-6 col-sm-7 fs-5 fw-bold d-flex align-items-center">
                                    <span class="fs-6 fw-semibold me-2">status :</span> ${course.status.name}
                                </div>


                                <div class="col-3 d-flex me-2 justify-content-end">
                                    <button class="btn" type="button" data-bs-toggle="offcanvas"
                                        data-bs-target="#offcanvas" aria-controls="offcanvas">
                                        <svg style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="24"
                                            height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class="icon icon-tabler icons-tabler-outline icon-tabler-menu-2">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M4 6l16 0" />
                                            <path d="M4 12l16 0" />
                                            <path d="M4 18l16 0" />
                                        </svg>
                                    </button>
                                </div>


                            </div>

                            <hr>

                            <!-- <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                                <ol class="breadcrumb fs-6">
                                    <li class="breadcrumb-item"><a href="trainer.do">${trainer.trainerName}</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">${course.courseName}</li>
                                </ol>
                            </nav> -->



                            <div id="course-box" style="display: none;">

                                <!-- <div class="row">
                                    <div class="col d-flex justify-content-between align-items-center mx-2">
                                        <span class="d-block m-1" id="back-to-course" style="cursor: pointer;"><i
                                                class="fa-solid fa-arrow-left"></i> back</span>
                                        <button class="btn btn-outline-secondary d-block" data-bs-toggle="modal"
                                            data-bs-target="#edit-course-model"><i
                                                class="bi bi-pen me-2"></i>Edit</button>
                                    </div>
                                </div>  -->

                                <div class="row border py-2 border-2 rounded-2 mt-2 mx-2 shadow">
                                    <div class="col">
                                        <h6 class="fw-normal">Course Name : </h6>
                                        <h4>${course.courseName}</h4>
                                    </div>
                                </div>

                                <div class="row mt-2 mx-2 overflow-y-scroll overflow-x-hidden" style="height: 60vh;">
                                    <div class="col">
                                        <div class="row mt-4">
                                            <div class="col d-flex justify-content-between align-items-center m-2 p-0">
                                                <div class="col-12 border rounded-3 p-3 pt-1 mb-3 shadow-sm"
                                                    style="width: 32%; background: #f8f9fa; border: 1px solid #dee2e6;">
                                                    <span class="fw-bold fs-6 d-flex align-items-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="me-2">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                            <path
                                                                d="M5 21v-16a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v16l-3 -2l-2 2l-2 -2l-2 2l-2 -2l-3 2" />
                                                            <path d="M15 7h-6h1a3 3 0 0 1 0 6h-1l3 3" />
                                                            <path d="M9 10h6" />
                                                        </svg>
                                                        Price (<i class="bi bi-currency-rupee"></i>)
                                                    </span>
                                                    <div class="fw-normal ms-2 fs-6 text-muted">${course.price}
                                                    </div>
                                                </div>

                                                <div class="col-12 border rounded-3 p-3 pt-1 mb-3 shadow-sm"
                                                    style="width: 32%; background: #f8f9fa; border: 1px solid #dee2e6;">
                                                    <span class="fw-bold fs-6 d-flex align-items-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="me-2">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                            <path d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                            <path d="M9 15.075l6 -6" />
                                                            <path d="M9 9.105v.015" />
                                                            <path d="M15 15.12v.015" />
                                                        </svg>
                                                        Discount (<i class="bi bi-currency-rupee"></i>)
                                                    </span>
                                                    <div class="fw-normal ms-2 fs-6 text-muted">${course.discount}
                                                    </div>
                                                </div>

                                                <div class="col-12 border rounded-3 p-3 pt-1 mb-3 shadow-sm"
                                                    style="width: 32%; background: #f8f9fa; border: 1px solid #dee2e6;">
                                                    <span class="fw-bold fs-6 d-flex align-items-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="me-2">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                            <path d="M14 6m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                                            <path d="M4 6l8 0" />
                                                            <path d="M16 6l4 0" />
                                                            <path d="M8 12m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                                            <path d="M4 12l2 0" />
                                                            <path d="M10 12l10 0" />
                                                        </svg>
                                                        Total Price (<i class="bi bi-currency-rupee"></i>)
                                                    </span>
                                                    <div class="fw-normal ms-2 fs-6 text-muted">${course.price -
                                                        course.discount}</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col d-flex justify-content-between align-items-center m-2 p-0">
                                                <div class="col-12 border rounded-3 p-3 pt-1 mb-3 shadow-sm"
                                                    style="width: 32%; background: #f8f9fa; border: 1px solid #dee2e6;">
                                                    <span class="fw-bold fs-6 d-flex align-items-center">
                                                        <i class="bi bi-collection me-2"></i> Subscribers
                                                    </span>
                                                    <div class="fw-normal ms-2 fs-6 text-muted">
                                                        ${course.subscribers}
                                                    </div>
                                                </div>

                                                <div class="col-12 border rounded-3 p-3 pt-1 mb-3 shadow-sm"
                                                    style="width: 32%; background: #f8f9fa; border: 1px solid #dee2e6;">
                                                    <span class="fw-bold fs-6 d-flex align-items-center">
                                                        <i class="fa-regular fa-eye me-2"></i> Views
                                                    </span>
                                                    <div class="fw-normal ms-2 fs-6 text-muted">
                                                        ${course.totalClicks}
                                                    </div>
                                                </div>

                                                <div class="col-12 border rounded-3 p-3 pt-1 mb-3 shadow-sm"
                                                    style="width: 32%; background: #f8f9fa; border: 1px solid #dee2e6;">
                                                    <span class="fw-bold fs-6 d-flex align-items-center">
                                                        <i class="fa-solid fa-equals me-2"></i> Total Lectures
                                                    </span>
                                                    <div class="fw-normal ms-2 fs-6 text-muted">
                                                        ${course.totalVideos}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row p-2">
                                            <div class="col-md-6 position-relative">
                                                <img src="get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}"
                                                    class="img-fluid w-100 h-100" alt="Thumbnail">

                                                <button
                                                    class="edit-btn position-absolute end-0 bottom-0 me-3 m-1 rounded-1 py-1 px-2"
                                                    data-bs-toggle="modal" data-bs-target="#edit-thumbnail-model">
                                                    <i class="bi bi-arrow-repeat me-2"></i>Change
                                                </button>
                                            </div>
                                            <div
                                                class="col-md-6 p-1 ps-2 d-flex flex-column justify-content-between align-items-center">
                                                <div class="border rounded-2 p-2 w-100" style="height: 47%;">
                                                    <span class="fw-bold fs-6">Validity -
                                                    </span>
                                                    <div id="course-features" class="fw-normal ms-2 fs-6">
                                                        <div>${course.validity}</div>
                                                    </div>
                                                </div>
                                                <div class="border rounded-2 p-2 w-100" style="height: 47%;">
                                                    <span class="fw-bold fs-6">Course Level - </span>
                                                    <div id="course-features" class="fw-normal ms-2 fs-6">
                                                        <div>${course.level.name}</div>
                                                    </div>
                                                </div>
                                                <!-- <small class="fw-bold fs-6">Course Title</small>
                                                <h5 id="course-title">${course.courseName}</h5> -->
                                            </div>

                                        </div>
                                        <div class="row px-2">
                                            <div class="col">
                                                <div class="row d-flex justify-content-evenly mt-4">
                                                    <div class="border rounded-3">
                                                        <small class="fw-bold fs-6">Description : </small>
                                                        <div id="course-description" class="p-2">
                                                            ${course.description}
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mt-4">
                                                    <div
                                                        class="col d-flex justify-content-between align-items-center m-0 p-0">
                                                        <div class="p-3 pt-1 mb-3 h-100" style="width: 48%;">
                                                            <span class="fw-bold fs-6">Key Features - </span>
                                                            <div id="course-features" class="fw-normal ms-2"
                                                                style="font-size: 16px;">
                                                                <!-- <div class="border rounded bg-success-subtle p-2 my-2">
                                                                    <span class="fs-6 fw-medium">1. </span> Lorem ipsum
                                                                    dolor sit amet consectetur adipisicing elit. Atque,
                                                                    aliquam!
                                                                </div> -->
                                                                <c:set var="count" value="1" scope="page" />
                                                                <c:forEach var="feature"
                                                                    items="${course.getFeaturesArray()}">
                                                                    <div
                                                                        class="border rounded bg-success-subtle p-2 my-2">
                                                                        <span class="fs-6 fw-medium">${count}.
                                                                        </span>${feature}
                                                                    </div>
                                                                    <c:set var="count" value="${count + 1}"
                                                                        scope="page" />
                                                                </c:forEach>

                                                            </div>
                                                        </div>
                                                        <div class="p-3 pt-1 mb-3 h-100" style="width: 48%;">
                                                            <span class="fw-bold fs-6">Covered Topics - </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <c:set var="count" value="1" scope="page" />
                                                                <c:forEach var="temptopic"
                                                                    items="${course.getCoveredTopicsArray()}">
                                                                    <div
                                                                        class="border rounded bg-success-subtle p-2 my-2">
                                                                        <span class="fs-6 fw-medium">${count}.
                                                                        </span>${temptopic}
                                                                    </div>
                                                                    <c:set var="count" value="${count + 1}"
                                                                        scope="page" />
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row mt-4">
                                                    <div
                                                        class="col d-flex justify-content-between align-items-center m-0 p-0">
                                                        <div class="col-12 p-3 pt-1 mb-3 h-100" style="width: 48%;">
                                                            <span class="fw-bold fs-6">Learing Outcomes - </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <c:set var="count" value="1" scope="page" />
                                                                <c:forEach var="outcome"
                                                                    items="${course.getLerningOutcomeArray()}">
                                                                    <div
                                                                        class="border rounded bg-success-subtle p-2 my-2">
                                                                        <span class="fs-6 fw-medium">${count}.
                                                                        </span>${outcome}
                                                                    </div>
                                                                    <c:set var="count" value="${count + 1}"
                                                                        scope="page" />
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 p-3 pt-1 mb-3  h-100" style="width: 48%;">
                                                            <span class="fw-bold fs-6">Prerequisites - </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <c:set var="count" value="1" scope="page" />
                                                                <c:forEach var="prerequisite"
                                                                    items="${course.getPrerequisitesArray()}">
                                                                    <div
                                                                        class="border rounded bg-success-subtle p-2 my-2">
                                                                        <span class="fs-6 fw-medium">${count}.
                                                                        </span>${prerequisite}
                                                                    </div>
                                                                    <c:set var="count" value="${count + 1}"
                                                                        scope="page" />
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row mt-4">
                                                    <div
                                                        class="col d-flex justify-content-between align-items-center m-0 p-0">
                                                        <div class="col-12 border rounded-3 p-3 pt-1 mb-3  h-100"
                                                            style="width: 48%;">
                                                            <span class="fw-bold fs-6">Certification - </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <div>${course.certification}</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 border rounded-3 p-3 pt-1 mb-3  h-100"
                                                            style="width: 48%;">
                                                            <span class="fw-bold fs-6">Refund Policy - </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <div>${course.refundPolicy}</div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row mt-4">
                                                    <div
                                                        class="col d-flex justify-content-between align-items-center m-0 p-0">
                                                        <div class="col-12 border rounded-3 p-3 pt-1 mb-3  h-100"
                                                            style="width: 48%;">
                                                            <span class="fw-bold fs-6">Validity -
                                                            </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <div>${course.validity}</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 border rounded-3 p-3 pt-1 mb-3  h-100"
                                                            style="width: 48%;">
                                                            <span class="fw-bold fs-6">Course Level - </span>
                                                            <div id="course-features" class="fw-normal ms-2 fs-6">
                                                                <div>${course.level.name}</div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row mt-3 mb-4">
                                                    <div class="col">
                                                        <div>Download pdf from here</div>
                                                        <button class="btn btn-outline-info rounded-2 ms-0 mt-3"><i
                                                                class="fa-regular fa-file-pdf me-1"></i>View
                                                            PDF</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <span id="lecture-box">
                                <c:if test="${course.uploadType == 0}">
                                    <div class="row">
                                        <div class="col">
                                            <div class="alert alert-info">
                                                If you want to upload a lecture, first go to the menu and select the
                                                upload
                                                type,
                                                then upload the lecture.
                                            </div>
                                        </div>
                                    </div>
                                </c:if>


                                <div class="row" style="max-height: 70vh;overflow-x: scroll;" id="lecture-container">
                                    <div class="col">
                                        <c:if test="${course.uploadType == 2}">
                                            <c:set var="count1" value="1" />

                                            <c:forEach var="topic" items="${content}">
                                                <div class="row mt-2">
                                                    <h4 class="mb-1 lh-1"><span class="text-secondary">${count1}.</span>
                                                        ${topic.key.topicName}</h4>
                                                    <div class="slider-container">
                                                        <div class="card-slider">
                                                            <c:forEach var="item" items="${topic.value}">
                                                                <div class="card fw-normal text-decoration-none"
                                                                    style="font-size: 20px;">
                                                                    <span
                                                                        class="border border-2 border-info rounded-2 position-relative"><img
                                                                            src="get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}"
                                                                            class="card-img-top rounded-2"
                                                                            height="150px" alt="Course 1">
                                                                        <div
                                                                            class="position-absolute text-white bottom-0 end-0 z-3 m-2 me-2 bg-secondary bg-gradient px-2 py-1 rounded-2">
                                                                            ${item.formattedTime()}</div>

                                                                        <div
                                                                            class="position-absolute text-white top-0 end-0 z-3 m-1 rounded-2 p-0 btn-group dropstart">
                                                                            <button
                                                                                class="btn btn-secondary m-0 p-0 fs-5 w-100 h-100"
                                                                                data-bs-toggle="dropdown"
                                                                                aria-expanded="false">
                                                                                <i
                                                                                    class="bi bi-three-dots-vertical"></i>
                                                                            </button>

                                                                            <ul class="dropdown-menu">
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="view_lecture.do?play=${course.courseId}+${topic.key.courseTopicId}+${item.subTopicId}"
                                                                                        class="dropdown-item">
                                                                                        <i
                                                                                            class="fa-solid fa-circle-play me-1"></i>Play
                                                                                    </a>
                                                                                </li>
                                                                                <!-- <li class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="#" class="dropdown-item">
                                                                                        <i class="fa-solid fa-eye me-1"></i>Status
                                                                                    </a>
                                                                                    <span>Restricted</span>
                                                                                </li> -->
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="#" class="dropdown-item">
                                                                                        <i
                                                                                            class="fa-solid fa-magnifying-glass-location me-1"></i>Preview
                                                                                    </a>
                                                                                    <div class="form-check form-switch">
                                                                                        <input
                                                                                            class="form-check-input previewToggle prv-btn"
                                                                                            type="checkbox"
                                                                                            id="prev-${topic.key.courseTopicId}+${item.subTopicId}"
                                                                                            ${item.preview ? 'checked'
                                                                                            : '' }>
                                                                                    </div>
                                                                                </li>
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="#" class="dropdown-item">
                                                                                        <i
                                                                                            class="fa-solid fa-pencil me-1"></i>Edit
                                                                                    </a>
                                                                                </li>
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1 text-danger">
                                                                                    <a href="#"
                                                                                        class="dropdown-item text-danger">
                                                                                        <i
                                                                                            class="fa-solid fa-trash-can me-1"></i>Delete
                                                                                    </a>
                                                                                </li>
                                                                            </ul>

                                                                        </div>

                                                                    </span>
                                                                    <span class="m-2 d-block text-start ms-3 fw-medium"
                                                                        style="font-size: 16px;">${item.title}</span>
                                                                </div>

                                                            </c:forEach>
                                                        </div>

                                                    </div>
                                                </div>

                                                <c:set var="count1" value="${count1+1}" />
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${course.uploadType == 1}">
                                            <c:forEach var="topic" items="${content}">
                                                <div class="row mt-2">
                                                    <h4 class="mb-1 lh-1">All Lectures</h4>
                                                    <div class="slider-container">
                                                        <div class="card-slider">
                                                            <c:forEach var="item" items="${topic.value}">
                                                                <div class="card fw-normal" style="font-size: 20px;">
                                                                    <span
                                                                        class="border border-2 border-info rounded-2 position-relative"><img
                                                                            src="get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}"
                                                                            class="card-img-top rounded-2"
                                                                            height="150px" alt="Course 1">
                                                                        <div
                                                                            class="position-absolute text-white bottom-0 end-0 z-3 m-2 mr-3 bg-secondary bg-gradient px-2 py-1 rounded-2">
                                                                            ${item.formattedTime()}</div>

                                                                        <div
                                                                            class="position-absolute text-white top-0 end-0 z-3 m-1 rounded-2 p-0 btn-group dropstart">
                                                                            <button
                                                                                class="btn btn-secondary m-0 p-0 fs-5 w-100 h-100"
                                                                                data-bs-toggle="dropdown"
                                                                                aria-expanded="false">
                                                                                <i
                                                                                    class="bi bi-three-dots-vertical"></i>
                                                                            </button>

                                                                            <ul class="dropdown-menu">
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="view_lecture.do?play=${course.courseId}+${topic.key.courseTopicId}+${item.subTopicId}"
                                                                                        class="dropdown-item">
                                                                                        <i
                                                                                            class="fa-solid fa-circle-play me-1"></i>Play
                                                                                    </a>
                                                                                </li>
                                                                                <!-- <li class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="#" class="dropdown-item">
                                                                                        <i class="fa-solid fa-eye me-1"></i>Status
                                                                                    </a>
                                                                                    <span>Restricted</span>
                                                                                </li> -->
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="#" class="dropdown-item">
                                                                                        <i
                                                                                            class="fa-solid fa-magnifying-glass-location me-1"></i>Preview
                                                                                    </a>
                                                                                    <div class="form-check form-switch">
                                                                                        <input
                                                                                            class="form-check-input previewToggle prv-btn"
                                                                                            type="checkbox"
                                                                                            id="prev-${topic.key.courseTopicId}+${item.subTopicId}"
                                                                                            ${item.preview ? 'checked'
                                                                                            : '' }>
                                                                                    </div>
                                                                                </li>
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1">
                                                                                    <a href="#" class="dropdown-item">
                                                                                        <i
                                                                                            class="fa-solid fa-pencil me-1"></i>Edit
                                                                                    </a>
                                                                                </li>
                                                                                <li
                                                                                    class="d-flex justify-content-between align-items-center px-1 text-danger">
                                                                                    <a href="#"
                                                                                        class="dropdown-item text-danger">
                                                                                        <i
                                                                                            class="fa-solid fa-trash-can me-1"></i>Delete
                                                                                    </a>
                                                                                </li>
                                                                            </ul>

                                                                        </div>
                                                                    </span>
                                                                    <span class="m-2 d-block text-start ms-3 fw-medium"
                                                                        style="font-size: 16px;">${item.title}</span>
                                                                </div>
                                                            </c:forEach>
                                                        </div>

                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </span>
                        </div>
                </div>

                <!-- Offcanvas yha se start hai -->
                <div class="offcanvas offcanvas-end rounded-start mt-2 shadow-lg bg-white"
                    style="max-height: 70vh; min-height: 50vh; width: 260px;" id="offcanvas">

                    <div class="offcanvas-header m-1 border-bottom">
                        <h5 class="offcanvas-title text-truncate" id="offcanvasLabel">${trainer.trainerName}
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"
                            id="offcanvase-close"></button>
                    </div>

                    <div class="offcanvas-body p-2 d-flex flex-column gap-2">
                        <a href="#" class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2"
                            data-bs-toggle="modal" data-bs-target="#change-status-model">
                            <i class="fa-solid fa-dice-d6 me-2"></i>Change Status
                        </a>

                        <c:if test="${course.uploadType == 0}">
                            <button class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2"
                                data-bs-toggle="modal" data-bs-target="#set-lac-type">
                                <i class="fa-solid fa-list-check me-2"></i>Set Lecture Type
                            </button>
                        </c:if>

                        <c:if test="${course.uploadType != 0}">
                            <a class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2"
                                data-bs-toggle="modal" data-bs-target="#upload-lecture-model">
                                <i class="fa-regular fa-window-restore me-2"></i>Add Lecture
                            </a>
                        </c:if>

                        <c:if test="${course.uploadType == 2}">
                            <a href="#" class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2"
                                data-bs-toggle="modal" data-bs-target="#add-course-topic">
                                <i class="fa-regular fa-id-card me-2"></i>Add New Topic
                            </a>
                        </c:if>

                        <a id="view-course-btn"
                            class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2">
                            <i class="fa-solid fa-circle-info me-2"></i>View Course
                        </a>

                        <button
                            class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2 d-flex align-items-center"
                            id="back-to-course" style="cursor: pointer;">
                            <i class="bi bi-person-video2 me-2"></i> Lectures</button>

                        <a class="btn btn-light border rounded-2 d-flex align-items-center ps-3 py-2"
                            data-bs-toggle="modal" data-bs-target="#edit-course-model">
                            <i class="fa-solid fa-pen me-2"></i>Edit</a>
                    </div>
                </div>



                <!-- Modal -->
                <div class="modal fade" id="change-status-model" tabindex="-1" aria-labelledby="changeStatusLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="changeStatusLabel">Change Status</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <label for="new-status-id" class="form-label">Select New Status</label>
                                <select id="new-status-id" class="form-select">
                                    <option value="${course.status.statusId}">${course.status.name}</option>
                                    <c:forEach var="status" items="${course.allStatus()}">
                                        <option value="${status.statusId}">${status.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="number" id="change-status-course-id" value="${course.courseId}"
                                    class="d-none">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal"><i
                                        class="fa-regular fa-rectangle-xmark me-1"></i>
                                    Close</button>
                                <button type="button" id="change-status-btn"
                                    class="btn btn-outline-info d-flex align-items-center"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="me-1"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icons-tabler-outline icon-tabler-replace">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path
                                            d="M3 3m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z" />
                                        <path
                                            d="M15 15m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z" />
                                        <path d="M21 11v-3a2 2 0 0 0 -2 -2h-6l3 3m0 -6l-3 3" />
                                        <path d="M3 13v3a2 2 0 0 0 2 2h6l-3 -3m0 6l3 -3" />
                                    </svg> Change</button>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Modal -->
                <c:if test="${course.uploadType != 0}">
                    <div class="modal fade" id="upload-lecture-model" tabindex="-1"
                        aria-labelledby="uploadLectureModelLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="uploadLectureModelLabel">Upload New Lecture
                                    </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row m-2 mt-1">
                                        <div class="col d-flex justify-content-end">
                                            <button class="edit-btn border rounded-2 p-2 ms-2" id="select-new-lecture"
                                                style="font-size: 14px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    class="me-1" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="icon icon-tabler icons-tabler-outline icon-tabler-upload">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                                    <path d="M7 9l5 -5l5 5" />
                                                    <path d="M12 4l0 12" />
                                                </svg> Select
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row m-2">
                                        <div class="col-lg-6 col-sm-12 ">
                                            <video class="img-thumbnail rounded-2 mx-auto d-block border border-3"
                                                id="new-lecture-preview"
                                                style="background-image: url('static/media/images/lecture/lecture_thumbnail.png');background-size: cover;"></video>
                                            <input type="file" id="new-lecture-input" class="d-none">
                                        </div>
                                        <div class="col-lg-6 col-sm-12">
                                            <div class="mb-3 w-100 mt-2">
                                                <label for="new-lecture-title" class="form-label fw-medium">Lecture
                                                    Title</label>
                                                <!-- <input type="text" > -->
                                                <textarea class="form-control fs-5 fw-bold" id="new-lecture-title"
                                                    placeholder="Enter Lecture Title..." required maxlength="100"
                                                    style="min-height: 100px;"></textarea>
                                            </div>
                                            <div id="select-topic-box">
                                                <label for="topic-id" class="form-label fw-medium">Lecture
                                                    Topic</label>
                                                <select class="form-select" aria-label="Default select example"
                                                    id="topic-id">
                                                    <c:forEach var="topic" items="${content}">
                                                        <option value="${topic.key.courseTopicId}">
                                                            ${topic.key.topicName}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <c:if test="${course.uploadType == 1}">
                                                <script>
                                                    document.getElementById("select-topic-box").classList.add("d-none");
                                                </script>
                                            </c:if>
                                            <input type="number" id="course-id" class="d-none"
                                                value="${course.courseId}">
                                            <!-- <input type="number" id="topic-id" class="d-none" value="${defaultTopic}"> -->
                                            <input type="number" class="d-none" id="new-duration">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer d-flex justify-content-between">
                                    <span>
                                        <div class="alert alert-dark d-none" role="alert" id="lecture-upload-alert">

                                        </div>
                                    </span>
                                    <span class="d-flex justify-content center g-2">
                                        <button type="reset"
                                            class="btn btn-outline-secondary rounded-4 align-items-center me-2"
                                            data-bs-dismiss="modal" id="close"><i
                                                class="fa-regular fa-rectangle-xmark me-1"></i>Close</button>
                                        <button type="button"
                                            class="btn btn-outline-success rounded-4 d-flex align-items-center"
                                            id="lecture-upload"><i class="bi bi-cloud-upload me-1"></i>Upload</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>

                <!-- Bootstrap Model for edit Profile image image -->
                <div class="modal" tabindex="-1" id="edit-thumbnail-model">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Course Thumbnail</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col d-flex justify-content-center">
                                        <img src="get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}"
                                            class="img-thumbnail rounded-2" alt="Course Thumbnail" id="new-thumbnail">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col d-flex gap-2">
                                        <!-- Hidden File Input -->
                                        <input type="file" id="input-thumbnail" style="display: none;">

                                        <!-- New Button -->
                                        <button type="button" id="input-thumbnail-btn"
                                            class="btn btn-outline-primary d-flex align-items-center gap-2">
                                            <i class="fa-solid fa-plus"></i>
                                            <span>New</span>
                                        </button>

                                        <!-- Delete Button -->
                                        <button type="button" id="delete-thumbnail-btn"
                                            class="btn btn-outline-danger d-flex align-items-center gap-2">
                                            <i class="fa-solid fa-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary"
                                    data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline-success" id="upload-confirm"
                                    disabled>Confirm</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Edit Course options model box -->
                <!-- Modal -->
                <div class="modal fade" id="dynamicModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="change-target"></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="modalBody">
                                <input type="number" class="form-control d-none" id="edit-target-btn"
                                    placeholder="clicked btn here">
                                <input type="number" id="edit-course-id" class="d-none" value="${course.courseId}">
                                <div id="edit-discount-box" class="d-none">
                                    <div class="row justify-content-start mt-2">
                                        <div class="col-5 me-3">
                                            <div class="fw-medium">Old Discount</div>
                                            <div class="border rounded-2 py-1 px-2">${course.discount}</div>
                                        </div>
                                        <div class="col-5">
                                            <div class="fw-medium">Course Price</div>
                                            <div class="border rounded-2 py-1 px-2" id="original-price">
                                                ${course.price}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-start mt-2">
                                        <div class="col-md-5 me-md-3">
                                            <div class="fw-medium mb-1">New Discount</div>
                                            <input type="number" class="form-control py-2 px-3" id="new-discount-input"
                                                placeholder="Enter Discount...">
                                        </div>
                                        <div class="col-md-5">
                                            <div class="fw-medium mb-1">% or <i class="bi bi-currency-rupee"></i></div>
                                            <select class="form-select py-2 px-3" id="new-discount-type">
                                                <option selected value="1">&#8377; (Rupee)</option>
                                                <option value="2">% (Percentage)</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row justify-content-start mt-3">
                                        <div class="col-md-5 me-md-3">
                                            <div class="fw-medium mb-1">After Discount</div>
                                            <!-- <input type="text" class="form-control py-2 px-3" id="discounted-price" placeholder="Final Price" readonly> -->
                                            <div id="discounted-price" class="form-control py-2 px-3">00</div>
                                        </div>
                                        <div class="col-md-5 d-flex align-items-end">
                                            <button class="btn btn-primary w-100 py-2"
                                                id="evaluate-btn">Evaluate</button>
                                        </div>
                                    </div>

                                </div>

                                <div class="row justify-content-center mt-3 d-none" id="add-pdf-box">
                                    <div class="col-md-6">
                                        <div class="card shadow-sm p-3 border rounded-3">
                                            <div class="fw-medium mb-2">Upload PDF File</div>
                                            <div class="input-group">
                                                <input type="text" class="form-control py-2 px-3" id="pdf-file-name"
                                                    placeholder="No file selected" readonly>
                                                <button class="btn btn-primary" id="select-pdf-btn">Select
                                                    PDF</button>
                                                <input type="file" id="pdf-file-input" accept=".pdf" class="d-none">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="certification-box">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="edit-certification" class="form-label">Certification</label>
                                            <textarea class="form-control" id="edit-certification" rows="3"
                                                style="min-height: 70px;"
                                                placeholder="Enter Certification Message...">${course.certification}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="edit-price-box">
                                    <div class="col-12">
                                        <div class="d-flex gap-3">
                                            <div class="flex-fill border p-2 rounded text-center"
                                                style="height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                                <label class="form-label mb-0">Old Price</label>
                                                <div class="fw-bold">${course.price}</div>
                                            </div>
                                            <div class="flex-fill border p-2 rounded text-center"
                                                style="height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                                <label class="form-label mb-0">Discount (%)</label>
                                                <div class="fw-bold">${course.discount}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mt-2">
                                        <div class="alert alert-warning p-2 text-center" role="alert">
                                            If you change the price, the discount will be reset.
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="new-price" class="form-label">New Price</label>
                                            <input type="text" class="form-control" id="new-price"
                                                placeholder="Enter New Price">
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="edit-course-level-box">
                                    <div class="col-12">
                                        <label class="form-label">Current Level</label>
                                        <div class="border p-2 rounded" style="text-align: left;">
                                            <span class="fw-bold">${course.level.name}</span>
                                        </div>
                                    </div>
                                    <div class="col-12 mt-2">
                                        <div class="mb-3">
                                            <label for="course-level" class="form-label">Select New
                                                Level</label>
                                            <select class="form-select" id="new-course-level">
                                                <c:forEach var="templevel" items="${course.getAvailableLevels()}">
                                                    <option value="${templevel.courseLevelId}">${templevel.name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="edit-description-box">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="edit-description" class="form-label">Description</label>
                                            <textarea class="form-control" id="edit-description" rows="5"
                                                style="min-height: 120px;"
                                                placeholder="Enter Description...">${course.description}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="covered-topics-box">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="new-topic" class="form-label">Add New Topic</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="new-topic"
                                                    placeholder="Enter a topic...">
                                                <button class="btn btn-outline-primary"
                                                    id="add-new-topic-btn">Add</button>
                                            </div>
                                        </div>
                                        <div id="topics-list">
                                            <script>let coveredTopics = [];</script>
                                            <c:forEach var="temptpk" items="${course.getCoveredTopicsArray()}">
                                                <div class="alert alert-secondary d-flex justify-content-between align-items-center topic-item"
                                                    role="alert">
                                                    ${temptpk}
                                                    <button
                                                        class="btn btn-sm btn-danger remove-topic-btn">Remove</button>
                                                </div>
                                                <script>coveredTopics.push("${temptpk}");</script>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="course-features-section">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="feature-input-field" class="form-label">Add New
                                                Feature</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="feature-input-field"
                                                    placeholder="Enter a feature...">
                                                <button class="btn btn-outline-primary"
                                                    id="add-feature-btn">Add</button>
                                            </div>
                                        </div>
                                        <div id="features-container">
                                            <script>let courseFeaturesArray = [];</script>
                                            <c:forEach var="featureItem" items="${course.getFeaturesArray()}">
                                                <div class="alert alert-secondary d-flex justify-content-between align-items-center feature-box"
                                                    role="alert">
                                                    ${featureItem}
                                                    <button
                                                        class="btn btn-sm btn-danger remove-feature-btn">Remove</button>
                                                </div>
                                                <script>courseFeaturesArray.push("${featureItem}");</script>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>


                                <div class="row d-none" id="learning-outcomes-section">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="outcome-input-field" class="form-label">Add New Learning
                                                Outcome</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="outcome-input-field"
                                                    placeholder="Enter a learning outcome...">
                                                <button class="btn btn-outline-primary"
                                                    id="add-outcome-btn">Add</button>
                                            </div>
                                        </div>
                                        <div id="outcomes-container">
                                            <script>let learningOutcomesArray = [];</script>
                                            <c:forEach var="outcomeItem" items="${course.getLerningOutcomeArray()}">
                                                <div class="alert alert-secondary d-flex justify-content-between align-items-center outcome-box"
                                                    role="alert">
                                                    ${outcomeItem}
                                                    <button
                                                        class="btn btn-sm btn-danger remove-outcome-btn">Remove</button>
                                                </div>
                                                <script>learningOutcomesArray.push("${outcomeItem}");</script>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="prerequisites-section">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="prerequisite-input-field" class="form-label">Add New
                                                Prerequisite</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="prerequisite-input-field"
                                                    placeholder="Enter a prerequisite...">
                                                <button class="btn btn-outline-primary"
                                                    id="add-prerequisite-btn">Add</button>
                                            </div>
                                        </div>
                                        <div id="prerequisites-container">
                                            <script>let prerequisitesArray = [];</script>
                                            <c:forEach var="prerequisiteItem" items="${course.getPrerequisitesArray()}">
                                                <div class="alert alert-secondary d-flex justify-content-between align-items-center prerequisite-box"
                                                    role="alert">
                                                    ${prerequisiteItem}
                                                    <button
                                                        class="btn btn-sm btn-danger remove-prerequisite-btn">Remove</button>
                                                </div>
                                                <script>prerequisitesArray.push("${prerequisiteItem}");</script>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>


                                <div class="row d-none" id="refund-policy-box">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="edit-refund-policy" class="form-label">Refund
                                                Policy</label>
                                            <textarea class="form-control" id="edit-refund-policy" rows="3"
                                                style="min-height: 70px;"
                                                placeholder="Enter Refund Policy...">${course.refundPolicy}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="edit-title-box">
                                    <div class="col">
                                        <!-- Current Title (Non-Editable) -->
                                        <div class="mb-3">
                                            <label class="form-label">Current Title</label>
                                            <input type="text" class="form-control" id="current-title"
                                                value="${course.courseName}" disabled>
                                        </div>
                                        <!-- New Title (Editable) -->
                                        <div class="mb-3">
                                            <label for="edit-title" class="form-label">New Title</label>
                                            <textarea class="form-control" id="new-edit-title"
                                                placeholder="Enter New Title..." rows="2" maxlength="100"
                                                style="resize: none;"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="course-validity-box">
                                    <div class="col">
                                        <!-- Current Validity Display -->
                                        <div class="mb-3">
                                            <label class="form-label">Current Validity</label>
                                            <div
                                                class="alert alert-info d-flex justify-content-between align-items-center">
                                                <span id="current-validity">${course.validity}</span>
                                            </div>
                                        </div>

                                        <!-- Set New Validity -->
                                        <div class="mb-3">
                                            <label class="form-label">Set New Validity</label>
                                            <div class="input-group">
                                                <input type="number" class="form-control" id="new-validity-duration"
                                                    placeholder="Enter duration" min="1">
                                                <select class="form-select" id="new-validity-unit">
                                                    <option value="Days">Days</option>
                                                    <option value="Months">Months</option>
                                                    <option value="Years">Years</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="modal-footer d-flex justify-content-between align-items-center w-100">
                                <!-- Hidden Success Alert -->
                                <div id="changes-alert"
                                    class="alert alert-success alert-dismissible fade show mb-0 py-2 px-3 " role="alert"
                                    style="visibility: hidden;">
                                    Changes saved successfully!
                                </div>

                                <div>
                                    <button type="button" class="btn btn-outline-secondary rounded-4 px-3"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-outline-success rounded-4 px-3"
                                        id="save-edit-changes">Save Changes</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


                <!-- Modal -->
                <div class="modal fade" id="edit-course-model" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="editCourseModel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content shadow-lg rounded-4 border-0">
                            <div class="modal-header bg-light">
                                <h1 class="modal-title fs-5 fw-bold" id="editCourseModel">Edit Course
                                    Information</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body p-4">
                                <div class="row row-cols-2 row-cols-md-3 g-3">
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Add Discount"
                                            id="add-discount-btn">
                                            Add Discount
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Add New PDF"
                                            id="add-new-pdf-btn">
                                            Add New PDF
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Certification"
                                            id="edit-certification-btn">
                                            Certification
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Change Price"
                                            id="change-price-btn">
                                            Change Price
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Course Level"
                                            id="change-course-level-btn">
                                            Course Level
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Covered Topics"
                                            id="change-covered-topics-btn">
                                            Covered Topics
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Description"
                                            id="change-description-btn">
                                            Description
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Features"
                                            id="change-features-btn">
                                            Features
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Learning Outcomes"
                                            id="change-learning-outcome-btn">
                                            Learning Outcomes
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Prerequisites"
                                            id="change-prerequeisits-btn">
                                            Prerequisites
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Completion Time"
                                            id="completion-time-btn">
                                            Completion Time
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Refund Policy"
                                            id="change-refund-policy-btn">
                                            Refund Policy
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary custom-btn" data-bs-toggle="modal"
                                            data-bs-target="#dynamicModal" data-title="Title" id="change-title-btn">
                                            Title
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Modal -->
                <div class="modal fade" id="add-course-topic" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="addCourseTopicLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="addCourseTopicLabel">Add New Topic</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="m-2">
                                    <label for="new-topic-name" class="form-label">Topic Name</label>
                                    <input type="text" class="form-control" id="new-topic-name"
                                        placeholder="Enter Topic Name..." required>
                                </div>
                                <input type="number" id="new-topic-course-id" value="${course.courseId}" class="d-none">
                            </div>
                            <div class="modal-footer">
                                <button type="button"
                                    class="btn btn-outline-secondary rounded-4 align-items-center me-2"
                                    data-bs-dismiss="modal"><i class="fa-regular fa-rectangle-xmark me-1"></i>
                                    Close</button>
                                <button type="button" id="add-topic-btn"
                                    class="btn btn-outline-success rounded-4 d-flex align-items-center"><i
                                        class="bi bi-calendar-plus me-1"></i>add</button>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- for Setting upload type model -->
                <c:if test="${course.uploadType == 0}">
                    <div class="modal fade border-warning border-2" id="set-lac-type" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="setlactypeLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-4" id="setlactypeLabel">Set Lecture Type</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <select class="form-select form-select-lg mb-3" aria-label="Large select example"
                                        id="upload-type">
                                        <option selected value="1">Simple Upload</option>
                                        <option value="2">Upload Topicwise</option>
                                    </select>

                                    <input type="number" class="d-none" id="course-id" value="${course.courseId}">

                                    <div class="alert alert-primary" role="alert">
                                        If you want to upload lectures topic-wise, select "Upload Topicwise" or
                                        "Simple
                                        Upload". Once you set the lecture type, you cannot change it.
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button"
                                        class="btn btn-outline-secondary rounded-3 d-flex align-items-center"
                                        data-bs-dismiss="modal"><i
                                            class="fa-regular fa-rectangle-xmark me-1"></i>Close</button>
                                    <button type="button" id="confirm-upload-type"
                                        class="btn btn-outline-success rounded-3 d-flex align-items-center"><svg
                                            xmlns="http://www.w3.org/2000/svg" class="me-1" width="22" height="22"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="icon icon-tabler icons-tabler-outline icon-tabler-category-2">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M14 4h6v6h-6z" />
                                            <path d="M4 14h6v6h-6z" />
                                            <path d="M17 17m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" />
                                            <path d="M7 7m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" />
                                        </svg>Set</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!-- upload type model close -->

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


                <c:if test="${course.uploadType == 0}">
                    <script>
                        let confirmUploadType = document.getElementById("confirm-upload-type");
                        let uploadType = document.getElementById("upload-type");
                        let courseId = document.getElementById("course-id");

                        confirmUploadType.addEventListener("click", (e) => {
                            e.preventDefault();

                            let params = "type=" + uploadType.value + "&course_id=" + courseId.value;

                            fetch('set_upload_type.do', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded'
                                },
                                body: params
                            })
                                .then(response => response.text())
                                .then(data => {
                                    if (data === "true") {
                                        location.reload();
                                    } else if (data === "login") {
                                        window.location.href = 'index.do';
                                    } else {
                                        alert('Failed to set upload type');
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                        })
                    </script>
                </c:if>


                <script>


                    function toggleSidebar() {
                        document.getElementById("sidebar").classList.toggle("show");
                    }



                    // document.addEventListener("DOMContentLoaded", function () {
                    //     const slider = document.querySelector(".card-slider");
                    //     const prevBtn = document.querySelector(".prev-btn");
                    //     const nextBtn = document.querySelector(".next-btn");

                    //     nextBtn.addEventListener("click", function () {
                    //         slider.scrollBy({ left: 270, behavior: "smooth" });
                    //     });

                    //     prevBtn.addEventListener("click", function () {
                    //         slider.scrollBy({ left: -270, behavior: "smooth" });
                    //     });

                    //     // Touch Swipe Support
                    //     let isDown = false;
                    //     let startX;
                    //     let scrollLeft;

                    //     slider.addEventListener("mousedown", (e) => {
                    //         isDown = true;
                    //         slider.classList.add("active");
                    //         startX = e.pageX - slider.offsetLeft;
                    //         scrollLeft = slider.scrollLeft;
                    //     });

                    //     slider.addEventListener("mouseleave", () => {
                    //         isDown = false;
                    //     });

                    //     slider.addEventListener("mouseup", () => {
                    //         isDown = false;
                    //     });

                    //     slider.addEventListener("mousemove", (e) => {
                    //         if (!isDown) return;
                    //         e.preventDefault();
                    //         const x = e.pageX - slider.offsetLeft;
                    //         const walk = (x - startX) * 2;
                    //         slider.scrollLeft = scrollLeft - walk;
                    //     });
                    // });

                </script>

                <script src="static/js/trainer_course.js"></script>


                <!-- Script for edit thumbnail and edit pdf -->
                <script>
                    let newThumbnailBtn = document.getElementById("input-thumbnail-btn");
                    let inputThumbnail = document.getElementById("input-thumbnail");
                    let newThumbnail = document.getElementById("new-thumbnail");
                    let updloadConfirmBtn = document.getElementById("upload-confirm");

                    newThumbnailBtn.addEventListener("click", (e) => {
                        e.preventDefault();
                        inputThumbnail.click();
                    })

                    inputThumbnail.addEventListener("change", (event) => {
                        event.preventDefault();
                        const file = event.target.files[0];

                        if (file) {
                            const reader = new FileReader();
                            reader.onload = (event) => {
                                newThumbnail.src = event.target.result;
                                updloadConfirmBtn.removeAttribute("disabled");
                            };
                            reader.readAsDataURL(file);
                        }
                    });

                    // async function postData(url, params) {
                    //     let response = await fetch(url, {
                    //         method: "POST",
                    //         body: params, // FormData directly pass kar raha hai
                    //     });

                    //     return await response.text();
                    // }

                    updloadConfirmBtn.addEventListener("click", (e) => {
                        e.preventDefault();
                        let courseId = document.getElementById("edit-course-id").value;
                        let file = inputThumbnail.files[0];
                        let formData = new FormData();

                        formData.append("target", "course");
                        formData.append("course-id", courseId);
                        formData.append("act-on", "thumbnail");
                        formData.append("task", "change");
                        formData.append("file", file);

                        postData("update_file.do", formData).then((data) => {
                            if (data === "true") {
                                location.reload();
                            } else if (data === "login") {
                                window.location = "index.do";
                            } else {
                                alert(data);
                            }
                        }).catch((error) => {
                            console.log("Error : " + error);
                        })

                    })
                </script>

                <script src="static/js/trainer_course_1.js"></script>



            </body>

            </html>