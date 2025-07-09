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
                <button class="btn d-lg-none" data-bs-toggle="offcanvas" data-bs-target="#sidebar">
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
                <!-- Sidebar (Topics) -->
                <c:if test="${course.uploadType == 2}">
                    <div
                        class="col-lg-3 d-none d-lg-block border-end bg-light p-3 pt-4 overflow-auto custom-scrollbar mt-5 mb-2">
                        <h5 class="text-center mt-2">Lectures</h5>
                        <div class="accordion" id="lectureAccordion">
                            <c:forEach var="topic" items="${content}">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#${topic.key.courseTopicId}">
                                            ${topic.key.topicName}
                                        </button>
                                    </h2>
                                    <div id="${topic.key.courseTopicId}" class="accordion-collapse collapse"
                                        data-bs-parent="#lectureAccordion">
                                        <div class="accordion-body">
                                            <ul class="list-group">
                                                <c:forEach var="lecture" items="${topic.value}">
                                                    <c:choose>
                                                        <c:when test="${lecture.subTopicId == current.subTopicId}">
                                                            <li class="list-group-item active">
                                                                <a href="view_lecture.do?play=${course.courseId}+${topic.key.courseTopicId}+${lecture.subTopicId}"
                                                                    class="text-white text-decoration-none">${lecture.title}</a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="list-group-item">
                                                                <a href="view_lecture.do?play=${course.courseId}+${topic.key.courseTopicId}+${lecture.subTopicId}"
                                                                    class="text-decoration-none">${lecture.title}</a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
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
                    <div class="col-lg-3 d-none d-lg-block border-end bg-light vh-100 p-3 pt-4 overflow-auto mt-5 mb-2 custom-scroll"
                        style="scrollbar-width: none;">
                        <h5 class="text-center mt-2">Lectures</h5>
                        <div class="overflow-auto"
                            style="max-height: 80vh; -ms-overflow-style: none; scrollbar-width: none;">
                            <c:forEach var="topic" items="${content}">
                                <ul class="list-group mb-3">
                                    <c:forEach var="lecture" items="${topic.value}">
                                        <c:choose>
                                            <c:when test="${lecture.subTopicId == current.subTopicId}">
                                                <li class="list-group-item active mb-1 border border-2 rounded-2">
                                                    <a href="view_lecture.do?play=${course.courseId}+${topic.key.courseTopicId}+${lecture.subTopicId}" class="text-white text-decoration-none d-block text-dark">${lecture.title}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="list-group-item mb-1 border border-2 rounded-2">
                                                    <a href="view_lecture.do?play=${course.courseId}+${topic.key.courseTopicId}+${lecture.subTopicId}" class="text-decoration-none d-block text-dark">${lecture.title}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>



                <!-- Main Content (Current Lecture) -->
                <div class="col-lg-9 p-4 vh-100 overflow-auto mt-5 mb-2">
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="mb-3">
                        <c:if test="${course.uploadType == 1}">
                            <ol class="breadcrumb bg-light p-2 rounded" style="margin: 12px 0;">
                                <li class="breadcrumb-item"><a href="trainer_course.do?course_id=${course.courseId}">${course.courseName}</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${current.title}</li>
                            </ol>
                        </c:if>
                        <c:if test="${course.uploadType == 2}">
                            <ol class="breadcrumb bg-light p-2 rounded" style="margin: 12px 0;">
                                <li class="breadcrumb-item"><a
                                        href="trainer_course.do?course_id=${course.courseId}">${course.courseName}</a>
                                </li>
                                <li class="breadcrumb-item active">${current.topic.topicName}</li>
                                <li class="breadcrumb-item active" aria-current="page">${current.title}</li>
                            </ol>
                        </c:if>
                    </nav>

                    <!-- Video Section (Reduced Height) -->
                    <video controls controlsList="nodownload" class="w-100 mt-1 rounded shadow"
                        style="max-height: 400px;">
                        <source src="get_video.do?lecture=${course.courseId}+${current.subTopicId}&for=trainer"
                            type="video/mp4">
                        Your browser does not support the video tag.
                    </video>

                    <!-- Lecture Title (Formatted) -->
                    <h4 class="mt-3 fw-bold"> ${current.title}</h4>

                    <!-- Tabs for Description, Discussion, Notes -->
                    <ul class="nav nav-tabs mt-3" id="lectureTabs">
                        <li class="nav-item">
                            <a class="nav-link active" id="desc-tab" data-bs-toggle="tab"
                                href="#description">Description</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="disc-tab" data-bs-toggle="tab" href="#discussion">Discussion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="notes-tab" data-bs-toggle="tab" href="#notes">Notes</a>
                        </li>
                    </ul>

                    <!-- Tab Content -->
                    <div class="tab-content p-3 border border-top-0 rounded-bottom">
                        <div class="tab-pane fade show active" id="description">
                            <p>This lecture covers the basics of servlets, including lifecycle methods and request
                                handling.</p>
                        </div>
                        <div class="tab-pane fade" id="discussion">
                            <p>Discuss your doubts and questions about this lecture here.</p>
                        </div>
                        <div class="tab-pane fade" id="notes">
                            <p>Key points and important notes from the lecture.</p>
                        </div>
                    </div>
                </div>
                <br><br><br>

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