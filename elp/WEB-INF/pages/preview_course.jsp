<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lecture Dashboard</title>

        <!-- Bootstrap CSS & JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    </head>

    <body class="overflow-hidden">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom fixed-top">
            <div class="container-fluid">
                <button class="btn btn-light d-lg-none" id="openSidebarBtn">
                    <i class="fas fa-bars"></i>
                </button>

                <a class="navbar-brand ms-3" href="index.do">
                    <img src="static/media/images/logo.png" height="45" alt="Lernify">
                </a>

                <button class="btn border-0">
                    <img src="profile_pic.do" alt="USER" width="34" height="34"
                        class="border p-1 rounded-circle border-secondary">
                </button>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">

                <style>
                    #left-sidebar-topics {
                        /* Default (desktop): show as column */
                        width: 25%;
                    }

                    @media (max-width: 991px) {
                        #left-sidebar-topics {
                            position: fixed;
                            top: 56px;
                            left: 0;
                            width: 100%;
                            height: calc(100vh - 56px);
                            background-color: #fff;
                            z-index: 2000;
                            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.15);
                            overflow-y: auto;
                            display: none;
                        }
                    }
                </style>

                <!-- Sidebar (Topics) -->
                <c:if test="${course.uploadType == 2}">
                    <c:set var="count1" value="1" />
                    <c:set var="count2" value="1" />

                    <div id="left-sidebar-topics" class="bg-light p-3 pt-4 custom-scrollbar">
                        <h5 class="text-center mt-2 fw-bold text-primary">Lectures</h5>
                        <div class="accordion" id="lectureAccordion">

                            <c:forEach var="topic" items="${content}">
                                <div class="accordion-item border shadow-sm mb-2">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed fw-bold text-dark" type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#topic_${topic.key.courseTopicId}">
                                            ${count1}. ${topic.key.topicName}
                                        </button>
                                    </h2>
                                    <div id="topic_${topic.key.courseTopicId}" class="accordion-collapse collapse"
                                        data-bs-parent="#lectureAccordion">
                                        <div class="accordion-body p-2">
                                            <ul class="list-group">

                                                <c:set var="count2" value="1" />
                                                <c:forEach var="lecture" items="${topic.value}">
                                                    <c:choose>
                                                        <c:when test="${lecture.subTopicId == current.subTopicId}">
                                                            <li
                                                                class="list-group-item active d-flex align-items-center gap-2 bg-primary text-white rounded">
                                                                <i
                                                                    class="fa-solid ${lecture.preview ? 'fa-lock-open' : 'fa-lock'}"></i>
                                                                <a href="preview_course.do?course_id=${course.courseId}&subtopic=${lecture.subTopicId}"
                                                                    class="text-white text-decoration-none flex-grow-1 fw-bold">
                                                                    ${count1}.${count2} ${lecture.title}
                                                                </a>

                                                                <c:set var="loc" value="${count1}.${count2}" />
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li
                                                                class="list-group-item d-flex align-items-center gap-2 border-bottom">
                                                                <i
                                                                    class="fa-solid ${lecture.preview ? 'fa-lock-open text-success' : 'fa-lock text-danger'}"></i>
                                                                <a href="preview_course.do?course_id=${course.courseId}&subtopic=${lecture.subTopicId}"
                                                                    class="text-decoration-none text-dark flex-grow-1">
                                                                    ${count1}.${count2} ${lecture.title}
                                                                </a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:set var="count2" value="${count2 + 1}" />
                                                </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <c:set var="count1" value="${count1 + 1}" />
                            </c:forEach>
                        </div>
                    </div>
                </c:if>




                <style>
                    /* Sidebar should be full height and scrollable */
                    .custom-scrollbar {
                        max-height: calc(100vh - 80px);
                        /* Adjust based on navbar/footer height */
                        overflow-y: auto;
                        /* Allow vertical scrolling */
                        scrollbar-width: thin;
                        /* For better UX */
                    }

                    /* Hide scrollbar in WebKit browsers */
                    .custom-scrollbar::-webkit-scrollbar {
                        width: 5px;
                    }

                    .custom-scrollbar::-webkit-scrollbar-thumb {
                        background-color: #ccc;
                        border-radius: 5px;
                    }
                </style>

                <c:if test="${course.uploadType == 1}">
                    <c:set var="count1" value="1" />

                    <div
                        class="col-lg-3 d-none d-lg-block bg-light vh-100 p-3 pt-4 overflow-auto mt-5 mb-2 custom-scrollbar">
                        <h5 class="text-center mt-2 fw-bold text-primary">Lectures</h5>

                        <div class="overflow-auto"
                            style="max-height: 80vh; -ms-overflow-style: none; scrollbar-width: none;">
                            <ul class="list-group list-group-flush">
                                <c:forEach var="topic" items="${content}">
                                    <c:forEach var="lecture" items="${topic.value}">
                                        <c:choose>
                                            <c:when test="${lecture.subTopicId == current.subTopicId}">
                                                <li
                                                    class="list-group-item active d-flex align-items-center gap-2 bg-primary text-white rounded shadow-sm border border-1 m-1">
                                                    <i
                                                        class="fa-solid ${lecture.preview ? 'fa-lock-open' : 'fa-lock'}"></i>
                                                    <a href="preview_course.do?course_id=${course.courseId}&subtopic=${lecture.subTopicId}"
                                                        class="text-white text-decoration-none flex-grow-1 fw-bold">
                                                        ${count1}. ${lecture.title}
                                                    </a>

                                                    <c:set var="loc" value="${count1}." />
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li
                                                    class="list-group-item d-flex align-items-center gap-2 border-0 rounded shadow-sm border m-1">
                                                    <i
                                                        class="fa-solid ${lecture.preview ? 'fa-lock-open text-success' : 'fa-lock text-danger'}"></i>
                                                    <a href="preview_course.do?course_id=${course.courseId}&subtopic=${lecture.subTopicId}"
                                                        class="text-decoration-none text-dark flex-grow-1">
                                                        ${count1}. ${lecture.title}
                                                    </a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="count1" value="${count1+1}" />
                                    </c:forEach>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </c:if>





                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var sidebar = document.getElementById("left-sidebar-topics");
                        var openBtn = document.getElementById("openSidebarBtn");

                        if (sidebar && openBtn) {
                            function hideSidebar() {
                                sidebar.style.display = "none";
                            }

                            function showSidebar() {
                                sidebar.style.display = "block";
                            }

                            if (window.innerWidth < 992) hideSidebar();

                            openBtn.addEventListener("click", function (e) {
                                e.stopPropagation(); // Prevent immediate closing
                                if (sidebar.style.display === "block") {
                                    hideSidebar();
                                } else {
                                    showSidebar();
                                }
                            });

                            document.addEventListener("click", function (e) {
                                if (window.innerWidth < 992 && sidebar.style.display === "block") {
                                    if (!sidebar.contains(e.target) && e.target !== openBtn) {
                                        hideSidebar();
                                    }
                                }
                            });

                            window.addEventListener("resize", function () {
                                if (window.innerWidth >= 992) {
                                    sidebar.style.display = "block";
                                } else {
                                    hideSidebar();
                                }
                            });
                        }
                    });

                </script>

                <!-- Main Content (Current Lecture) -->
                <div class="col-lg-9 p-4 vh-100 overflow-auto mt-5 mb-2 z-2">
                    <!-- Breadcrumb -->
                    <div class="mt-2">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-light p-3 rounded shadow-sm">
                                <li class="breadcrumb-item">
                                    <a href="trainer_course.do?course_id=${course.courseId}"
                                        class="text-decoration-none text-dark fw-semibold">
                                        ${course.courseName}
                                    </a>
                                </li>
                                <c:if test="${course.uploadType == 2}">
                                    <li class="breadcrumb-item text-secondary">${current.topic.topicName}</li>
                                </c:if>
                                <li class="breadcrumb-item active text-primary fw-bold" aria-current="page"><span
                                        class="text-secondary">${loc}</span> ${current.title}</li>
                            </ol>
                        </nav>
                    </div>

                    <!-- Video Section -->
                    <div class="mx-auto rounded overflow-hidden shadow-sm mt-3"
                        style="max-width: 92%; aspect-ratio: 16/9; background: #000; position: relative;">

                        <c:choose>
                            <c:when test="${current.preview}">
                                <video controls controlsList="nodownload" class="w-100 h-100 rounded"
                                    style="object-fit: cover;">
                                    <source
                                        src="get_video.do?lecture=${course.courseId}+${current.subTopicId}&for=preview"
                                        type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            </c:when>
                            <c:otherwise>
                                <div class="d-flex justify-content-center align-items-center w-100 h-100 text-white position-relative"
                                    style="background: url('get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}') center/cover no-repeat;">

                                    <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-50">
                                    </div>

                                    <div
                                        class="position-relative text-center p-3 bg-white text-dark rounded shadow-lg opacity-90">
                                        <i class="fas fa-exclamation-circle text-danger fs-4"></i>
                                        <p class="fw-bold mt-2 mb-1">To continue watching, please subscribe.</p>
                                        <a href="subscribe.do" class="btn btn-primary btn-sm fw-semibold">Subscribe
                                            Now</a>
                                    </div>

                                    <span
                                        class="position-absolute bottom-0 end-0 m-2 px-3 py-1 bg-black bg-opacity-75 rounded text-white small">
                                        <i class="far fa-clock"></i> ${current.formattedTime()}
                                    </span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Lecture Title -->
                    <div class="mt-4 mb-5 z-3">
                        <h2 class="fw-bold text-dark rounded border bg-white shadow-sm p-2 mx-4 fs-2"
                            style="margin: auto;">
                            <span class="text-secondary">${loc}</span> ${current.title}
                        </h2>
                    </div>
                </div>


            </div>
        </div>

        <style>
            /* Hide scrollbar */
            .overflow-auto::-webkit-scrollbar {
                display: none;
            }
        </style>



    </body>

    </html>