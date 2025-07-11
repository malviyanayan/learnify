<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Activity Log - (Learnify)</title>
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


    </head>

    <body>


        <div class="d-flex overflow-hidden">
            <!-- Left Sidebar -->
            <%@ include file="left_sidebar.jsp" %>

                <!-- Right Main Content -->
                <div class="right-panel overflow-y-hidden">
                    <div class="row justify-content-between">
                        <button class="menu-btn btn btn-sm btn-light" id="menu-btn-lft-sdbr" onclick="toggleSidebar()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="icon icon-tabler icon-tabler-menu-2">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M4 6l16 0" />
                                <path d="M4 12l16 0" />
                                <path d="M4 18l16 0" />
                            </svg>
                            <span class="ms-1">Menu</span>
                        </button>
                        <!-- <div class="col-5 col-md-6 col-sm-7">
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search Courses..."
                                aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div> -->

                        <div class="col-3 d-flex me-2 justify-content-end">
                            <div style="width: max-content;height: 100%;">
                                <div class="btn btn-link"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icons-tabler-outline icon-tabler-bell-ringing">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path
                                            d="M10 5a2 2 0 0 1 4 0a7 7 0 0 1 4 6v3a4 4 0 0 0 2 3h-16a4 4 0 0 0 2 -3v-3a7 7 0 0 1 4 -6" />
                                        <path d="M9 17v1a3 3 0 0 0 6 0v-1" />
                                        <path d="M21 6.727a11.05 11.05 0 0 0 -2.794 -3.727" />
                                        <path d="M3 6.727a11.05 11.05 0 0 1 2.792 -3.727" />
                                    </svg></div>
                                <img src="profile_pic.do" alt="USER" width="32" height="32"
                                    class="border p-1 rounded-circle border-secondary">
                            </div>
                        </div>
                    </div>

                    <!-- Navtabs start from here -->
                    <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="history-tab" data-bs-toggle="tab"
                                data-bs-target="#history" type="button" role="tab" aria-controls="history"
                                aria-selected="true">History</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="notes-tab" data-bs-toggle="tab" data-bs-target="#notes"
                                type="button" role="tab" aria-controls="notes" aria-selected="false">Notes</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="insights-tab" data-bs-toggle="tab" data-bs-target="#insights"
                                type="button" role="tab" aria-controls="insights"
                                aria-selected="false">Insights</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent"
                        style="min-height: 300px; max-height: 370px; overflow-y: auto; -ms-overflow-style: none; scrollbar-width: none;">
                        <div class="tab-pane fade show active" id="history" role="tabpanel" aria-labelledby="history">
                            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-2">
                                <!-- Lecture Card -->
                                <c:forEach var="history" items="${histories}">
                                    <div class="col">
                                        <a href="study.do?course=${history.subTopic.topic.course.courseId}"
                                            class="text-decoration-none text-dark d-block">
                                            <div class="card border border-light shadow-sm rounded overflow-hidden position-relative transition"
                                                style="max-width: 260px; margin: auto;">
                                                <div class="position-relative">
                                                    <img src="get_image.do?type=thumbnail&course=${history.subTopic.topic.course.courseId}&img=${history.subTopic.topic.course.thumbnail}"
                                                        class="w-100 rounded-top" alt="Lecture Thumbnail"
                                                        style="height: 120px; object-fit: cover;">
                                                    <span
                                                        class="badge bg-dark position-absolute bottom-0 end-0 m-1 px-2 py-1 small">${history.subTopic.formattedTime()}</span>
                                                </div>
                                                <div class="card-body p-2">
                                                    <h6 class="fw-semibold mb-1 text-truncate"
                                                        style="font-size: 0.85rem;">${history.subTopic.title}</h6>
                                                    <p class="text-muted small m-0 text-truncate"><i
                                                            class="fas fa-book me-1"></i>${history.subTopic.topic.course.courseName}
                                                    </p>
                                                    <p class="text-muted small mt-1"><i class="far fa-clock"></i>
                                                        ${history.getTimeDifference()}</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>

                    <style>
                        /* Hide Scrollbar */
                        #myTabContent::-webkit-scrollbar {
                            display: none;
                        }

                        /* Hover Effect */
                        .transition:hover {
                            transform: translateY(-2px);
                            box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
                            border-color: #ddd;
                        }

                        /* Badge Styling */
                        .badge {
                            font-size: 0.7rem;
                            font-weight: 500;
                        }
                    </style>




                    <!-- Navtabs end here -->
                </div>
        </div>

        <script>
            function toggleSidebar() {
                document.getElementById("sidebar").classList.toggle("show");
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>