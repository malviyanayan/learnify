<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="models.User" %>
        <% User user=(User)session.getAttribute("user"); %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Lecture Dashboard</title>

                <!-- Bootstrap CSS -->
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

                        <!-- for previous and next button -->
                        <c:set var="isprev" value="${false}" />
                        <c:set var="iscurrent" value="${false}" />
                        <c:set var="isnext" value="${false}" />

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
                        <c:if test="${playCourse.course.uploadType == 2}">
                            <c:set var="count1" value="1" />
                            <c:set var="count2" value="1" />

                            <div id="left-sidebar-topics" class="bg-light p-3 pt-4 custom-scrollbar">
                                <h5 class="text-center mt-2 fw-bold text-primary">Lectures</h5>
                                <div class="accordion" id="lectureAccordion">

                                    <c:forEach var="topic" items="${playContent}">
                                        <div class="accordion-item border shadow-sm mb-2">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed fw-bold text-dark"
                                                    type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#topic_${topic.key.courseTopicId}">
                                                    ${count1}. ${topic.key.topicName}
                                                </button>
                                            </h2>
                                            <div id="topic_${topic.key.courseTopicId}"
                                                class="accordion-collapse collapse" data-bs-parent="#lectureAccordion">
                                                <div class="accordion-body p-2">
                                                    <ul class="list-group">

                                                        <c:set var="count2" value="1" />
                                                        <c:forEach var="lecture" items="${topic.value}">
                                                            <c:choose>
                                                                <c:when
                                                                    test="${lecture.subTopicId == playCurrent.subTopicId}">
                                                                    <li
                                                                        class="list-group-item active d-flex align-items-center gap-2 bg-primary text-white rounded">
                                                                        <i
                                                                            class="fa-solid ${playCourse.isCompleted(lecture.subTopicId) ? 'fa-solid fa-check text-success' : 'fa-solid fa-clock-rotate-left text-primary-emphasis'}"></i>
                                                                        <a href="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}"
                                                                            class="text-white text-decoration-none flex-grow-1 fw-bold">
                                                                            ${count1}.${count2} ${lecture.title}
                                                                        </a>

                                                                        <c:set var="iscurrent" value="${true}" />
                                                                        <c:set var="loc" value="${count1}.${count2}" />
                                                                    </li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <li
                                                                        class="list-group-item d-flex align-items-center gap-2 border-bottom">
                                                                        <i
                                                                            class="fa-solid ${playCourse.isCompleted(lecture.subTopicId) ? 'fa-solid fa-check text-success' : 'fa-solid fa-clock-rotate-left text-primary-emphasis'}"></i>
                                                                        <a href="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}"
                                                                            class="text-decoration-none text-dark flex-grow-1">
                                                                            ${count1}.${count2} ${lecture.title}
                                                                        </a>
                                                                    </li>

                                                                    <c:choose>
                                                                        <c:when test="${iscurrent == true}">
                                                                            <c:if test="${isnext == false}">
                                                                                <c:set var="next"
                                                                                    value="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}" />
                                                                                <c:set var="isnext" value="${true}" />
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:set var="prev"
                                                                                value="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}" />
                                                                            <c:set var="isprev" value="${true}" />
                                                                        </c:otherwise>
                                                                    </c:choose>
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


                        <c:if test="${playCourse.course.uploadType == 1}">
                            <c:set var="count1" value="1" />

                            <div
                                class="col-lg-3 d-none d-lg-block bg-light vh-100 p-3 pt-4 overflow-auto mt-5 mb-2 custom-scrollbar">
                                <h5 class="text-center mt-2 fw-bold text-primary">Lectures</h5>

                                <div class="overflow-auto"
                                    style="max-height: 80vh; -ms-overflow-style: none; scrollbar-width: none;">
                                    <ul class="list-group list-group-flush">
                                        <c:forEach var="topic" items="${playContent}">
                                            <c:forEach var="lecture" items="${topic.value}">
                                                <c:choose>
                                                    <c:when test="${lecture.subTopicId == playCurrent.subTopicId}">
                                                        <li
                                                            class="list-group-item active d-flex align-items-center gap-2 bg-primary text-white rounded shadow-sm border border-1 m-1">
                                                            <i
                                                                class="fa-solid ${playCourse.isCompleted(lecture.subTopicId) ? 'fa-solid fa-check text-success' : 'fa-solid fa-clock-rotate-left text-primary-emphasis'}"></i>
                                                            <a href="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}"
                                                                class="text-white text-decoration-none flex-grow-1 fw-bold">
                                                                ${count1}. ${lecture.title}
                                                            </a>

                                                            <c:set var="iscurrent" value="${true}" />
                                                            <c:set var="loc" value="${count1}." />
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li
                                                            class="list-group-item d-flex align-items-center gap-2 border-0 rounded shadow-sm border m-1">
                                                            <i
                                                                class="fa-solid ${playCourse.isCompleted(lecture.subTopicId) ? 'fa-solid fa-check text-success' : 'fa-solid fa-clock-rotate-left text-primary-emphasis'}"></i>
                                                            <a href="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}"
                                                                class="text-decoration-none text-dark flex-grow-1">
                                                                ${count1}. ${lecture.title}
                                                            </a>
                                                        </li>

                                                        <c:choose>
                                                            <c:when test="${iscurrent == true}">
                                                                <c:if test="${isnext == false}">
                                                                    <c:set var="next"
                                                                        value="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}" />
                                                                    <c:set var="isnext" value="${true}" />
                                                                </c:if>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="prev"
                                                                    value="study.do?course=${playCourse.course.courseId}&current=${lecture.subTopicId}" />
                                                                <c:set var="isprev" value="${true}" />
                                                            </c:otherwise>
                                                        </c:choose>
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
                        <div class="col-12 col-lg-9 px-3 px-lg-4 pt-4 pb-5 overflow-auto mt-lg-5 mb-2"
                            id="main-content-right">

                            <!-- Breadcrumb -->
                            <div class="mt-2">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-light p-3 rounded shadow-sm">
                                        <div
                                            class="w-100 d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-2">

                                            <!-- Left: Breadcrumb Path -->
                                            <div class="d-flex flex-wrap">
                                                <li class="breadcrumb-item">
                                                    <a href="view_course.do?course_id=${course.courseId}"
                                                        class="text-decoration-none text-dark fw-semibold">
                                                        ${playCourse.course.courseName}
                                                    </a>
                                                </li>
                                                <c:if test="${playCourse.course.uploadType == 2}">
                                                    <li class="breadcrumb-item text-secondary">
                                                        ${playCurrent.topic.topicName}</li>
                                                </c:if>
                                                <li class="breadcrumb-item active text-primary fw-bold"
                                                    aria-current="page">
                                                    <span class="text-secondary">${loc}</span> ${playCurrent.title}
                                                </li>
                                            </div>

                                            <!-- Right: Completed Checkbox -->
                                            <div class="d-flex align-items-center gap-2">
                                                <span class="fw-semibold text-success">Mark as Completed</span>
                                                <input class="form-check-input" type="checkbox" id="markascompleted"
                                                    style="width: 18px; height: 18px; cursor: pointer;"
                                                    ${playCourse.isCompleted(playCurrent.subTopicId) ? 'checked' : '' }>
                                                <input type="number" class="d-none" id="lecture-id"
                                                    value="${playCurrent.subTopicId}">
                                            </div>
                                        </div>
                                    </ol>
                                </nav>
                            </div>

                            <!-- Video Section -->
                            <div class="mx-auto rounded overflow-hidden shadow-sm mt-3"
                                style="width: 100%; max-width: 900px; aspect-ratio: 16/9; background: #000;">
                                <video controls controlsList="nodownload" class="w-100 h-100 rounded"
                                    style="object-fit: cover;" id="video-player">
                                    <source src="get_video.do?lecture=${playCurrent.subTopicId}&for=study"
                                        type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            </div>

                            <!-- Navigation Buttons and Title -->
                            <div class="row mt-3">
                                <div
                                    class="col-12 d-flex flex-column flex-md-row justify-content-between align-items-center gap-3 px-3">
                                    <a href="${prev}"
                                        class="btn btn-info text-black fw-bold ${isprev ? '' : 'disabled'}">
                                        <i class="fa-solid fa-caret-left me-1"></i> Prev
                                    </a>

                                    <h2
                                        class="fw-bold text-dark rounded border bg-white shadow-sm p-2 fs-5 text-center m-0">
                                        <span class="text-secondary">${loc}</span> ${playCurrent.title}
                                    </h2>

                                    <a href="${next}" id="next-lec"
                                        class="btn btn-info text-black fw-bold ${isnext ? '' : 'disabled'}">
                                        Next <i class="fa-solid fa-caret-right ms-1"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="mb-5 mt-4">
                                <hr>
                            </div>
                        </div>



                    </div>
                </div>

                <div class="floating-buttons">
                    <button class="btn btn-primary shadow-sm" data-bs-toggle="modal" data-bs-target="#addNotesModal">
                        <i class="fas fa-sticky-note"></i> Add Note
                    </button>
                    <button class="btn btn-success shadow-sm" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#chat-with-ai" aria-controls="chat-with-ai">
                        <i class="fas fa-robot"></i> Ask to AI
                    </button>
                </div>


                <!-- Offcanvas for AI Chat -->
                <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="chat-with-ai"
                    aria-labelledby="chatWithAiLabel">
                    <div class="offcanvas-header bg-light border-bottom">
                        <h5 class="offcanvas-title" id="chatWithAiLabel">Ask AI - Instant Doubt Solver</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body d-flex flex-column p-3" style="background-color: #f8f9fa;">
                        <!-- Chat Display Area -->
                        <div id="chat-box" class="border rounded p-3 mb-3 flex-grow-1 overflow-auto"
                            style="height: 350px; background-color: white;">
                            <p class="p-2 rounded bg-primary text-white w-75">AI: Hello! Ask me any doubt related to
                                your studies.</p>
                        </div>

                        <!-- User Input -->
                        <div class="input-group">
                            <input type="text" id="user-input" class="form-control rounded-start border-1"
                                placeholder="Type your doubt here..." style="background-color: white; color: black;">
                            <button class="btn btn-primary rounded-end">Send</button>
                        </div>
                    </div>
                </div>




                <!-- Modal for Adding Notes -->
                <div class="modal fade" id="addNotesModal" tabindex="-1" aria-labelledby="addNotesLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header with Light Blue Shade -->
                            <div class="modal-header" style="background-color: #e3f2fd; color: #333;">
                                <h5 class="modal-title fw-bold" id="addNotesLabel">
                                    <i class="fas fa-sticky-note"></i> Add Your Notes
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <!-- Notes Heading Input -->
                                <div class="mb-3">
                                    <label for="noteTitle" class="form-label fw-bold">
                                        <i class="fas fa-heading"></i> Note Title
                                    </label>
                                    <input type="text" class="form-control border-1 shadow-sm" id="noteTitle"
                                        placeholder="Enter note title"
                                        style="background-color: #fdfdfd; border-color: #ddd;">
                                </div>

                                <!-- Notes Text Area -->
                                <div class="mb-3">
                                    <label for="noteContent" class="form-label fw-bold">
                                        <i class="fas fa-pen"></i> Your Notes
                                    </label>
                                    <textarea class="form-control border-1 shadow-sm" id="noteContent" rows="5"
                                        placeholder="Write your notes here..."
                                        style="background-color: #fdfdfd; border-color: #ddd;"></textarea>
                                </div>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                    <i class="fas fa-times"></i> Close
                                </button>
                                <button type="button" class="btn btn-primary fw-bold">
                                    <i class="fas fa-save"></i> Save Note
                                </button>
                            </div>
                        </div>
                    </div>
                </div>




                <style>
                    .floating-buttons {
                        position: fixed;
                        bottom: 10px;
                        left: 10px;
                        display: flex;
                        gap: 10px;
                        background: rgba(255, 255, 255, 0.9);
                        padding: 8px 12px;
                        border-radius: 8px;
                        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                        align-items: center;
                    }

                    .floating-buttons button {
                        font-weight: bold;
                        border-radius: 6px;
                        transition: all 0.3s ease-in-out;
                        padding: 6px 12px;
                        font-size: 14px;
                    }

                    .floating-buttons button:hover {
                        transform: scale(1.05);
                    }
                </style>


                <style>
                    /* Hide scrollbar */
                    .overflow-auto::-webkit-scrollbar {
                        display: none;
                    }
                </style>

                <script>

                    async function simplePost(url, params) {
                        let response = await fetch(url, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded",
                            },
                            body: params,
                        });

                        return await response.text();
                    }

                    let markAsCompleted = document.getElementById("markascompleted");
                    let lectureId = document.getElementById("lecture-id").value;
                    let myCourseId = parseInt("${playCourse.myCourseId}");

                    markAsCompleted.addEventListener("click", (e) => {
                        let params = "target=study&course=" + myCourseId + "&lecture=" + lectureId;
                        if (markAsCompleted.checked) {
                            params += "&mark=true"
                        } else {
                            params += "&mark=false"
                        }

                        simplePost("event.do", params).then(data => {
                            if (data != "true") {
                                alert(data)
                            }
                        }).catch(error => {
                            console.log("Error : " + error)
                        })
                    })

                    document.getElementById("video-player").addEventListener("ended", (e) => {
                        let params = "target=study&course=" + myCourseId + "&lecture=" + lectureId;
                        params += "&mark=true"

                        simplePost("event.do", params).then(data => {
                            if (data != "true") {
                                alert(data)
                            }
                        }).catch(error => {
                            console.log("Error : " + error)
                        })

                        let nextLecture = document.getElementById("next-lec").href;
                        if (nextLecture != "") {
                            window.location = nextLecture;
                        }

                    })
                </script>
            </body>

            </html>