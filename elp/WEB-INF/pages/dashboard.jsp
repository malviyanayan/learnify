<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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


        </head>

        <body>



            <div class="d-flex overflow-hidden">
                <!-- Left Sidebar -->
                <%@ include file="left_sidebar.jsp" %>

                    <!-- Right Main Content -->
                    <div class="right-panel overflow-y-hidden">
                        <div class="row justify-content-between align-items-center z-0">
                            <!-- Mobile Menu Toggle Button -->
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
                                    <div class="btn btn-link"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                            height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
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
                                <button class="nav-link active" id="my-courses-tab" data-bs-toggle="tab"
                                    data-bs-target="#my-courses" type="button" role="tab" aria-controls="my-courses"
                                    aria-selected="true">My Courses</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
                                    data-bs-target="#wishlist" type="button" role="tab" aria-controls="wishlist"
                                    aria-selected="false">Wishlist</button>
                            </li>
                        </ul>
                        <div class="tab-content overflow-y-scroll" id="myTabContent"
                            style="min-height: 300px;max-height: 370px;">
                            <div class="tab-pane fade show active gap-3" id="my-courses" role="tabpanel"
                                aria-labelledby="my-courses-tab">

                                <c:forEach var="myCourse" items="${myCourses}">
                                    <div class="course-card card border-0 d-inline-block shadow-sm rounded p-3">
                                        <img src="get_image.do?type=thumbnail&course=${myCourse.course.courseId}&img=${myCourse.course.thumbnail}"
                                            class="course-img rounded-top" alt="Course Image">
                                        <div class="course-info p-3">
                                            <h6 class="fw-bold mb-1">${myCourse.course.courseName}</h6>
                                            <p class="text-muted small m-0">Instructor:
                                                ${myCourse.course.trainer.trainerName}</p>

                                            <div class="progress mt-2" style="height: 6px;">
                                                <div class="progress-bar bg-success"
                                                    id="progress-width-${myCourse.myCourseId}"
                                                    aria-valuenow="${myCourse.completed}" aria-valuemin="0"
                                                    aria-valuemax="100">
                                                </div>
                                            </div>

                                            <script>document.getElementById("progress-width-${myCourse.myCourseId}").style.width = parseInt("${myCourse.completed}") + "%";</script>

                                            <div class="d-flex justify-content-between align-items-center mt-2">
                                                <span class="small text-muted">${myCourse.completed}% Completed</span>
                                                <a href="study.do?course=${myCourse.course.courseId}"
                                                    class="btn btn-sm btn-primary">Continue</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>



                            <div class="tab-pane fade overflow-y-hidden" id="wishlist" role="tabpanel"
                                aria-labelledby="wishlist-tab">
                                <!-- Content for Wishlist -->

                                <div class="row" id="wishlist-items">
                                    <!-- Course 1 -->
                                    <!-- <div class="col-12 col-md-6 col-lg-5 mb-3">
                                <div class="card shadow-sm border-0 rounded-3 course-card">
                                    <img src="static/media/images/course/thumbnail.png" class="card-img-top"
                                        alt="Course Thumbnail">
                                    <div class="card-body d-flex flex-column">
                                        <h6 class="card-title">Full Stack Web DevelopmentFull Stack Web Development</h6>
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
                                        <div class="d-flex justify-content-between align-items-center mt-2">
                                            <button class="btn btn-sm btn-outline-danger align-items-center"><svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-backspace"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M20 6a1 1 0 0 1 1 1v10a1 1 0 0 1 -1 1h-11l-5 -5a1.5 1.5 0 0 1 0 -2l5 -5z" /><path d="M12 10l4 4m0 -4l-4 4" /></svg> Remove</button>
                                            <button class="btn btn-sm btn-primary d-flex align-items-center"><i class="fa-solid fa-cart-shopping fs-6 m-1"></i>Move to Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                                    <c:forEach var="ttemp" items="${user.wishlist}">
                                        <div class="col-12 col-md-6 col-lg-5 mb-3">
                                            <a href="show_course.do?course=${ttemp.course.courseId}"
                                                class="card shadow-sm border-0 rounded-3 course-card text-decoration-none wish-card"
                                                style="cursor: pointer;">
                                                <img src="get_image.do?type=thumbnail&course=${ttemp.course.courseId}&img=${ttemp.course.thumbnail}"
                                                    class="card-img-top" alt="Course Thumbnail">
                                                <div class="card-body d-flex flex-column">
                                                    <h6 class="card-title">${ttemp.course.courseName}</h6>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <p class="text-muted small mb-0 text-truncate">Trainer:
                                                            ${ttemp.course.trainer.trainerName}</p>
                                                        <div class="rating text-warning text-truncate">
                                                            &#9733;&#9733;&#9733;&#9733;&#9734; <span
                                                                class="text-dark">(4.7)</span>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-success fw-bold">
                                                            &#8377;${ttemp.course.price - ttemp.course.discount} <del
                                                                class="text-danger small">&#8377;${ttemp.course.price}</del>
                                                        </span>
                                                        <span class="badge bg-info text-dark">
                                                            <c:choose>
                                                                <c:when test="${ttemp.course.price > 0}">
                                                                    <c:set var="discountPercent"
                                                                        value="${(ttemp.course.discount * 100) div ttemp.course.price}" />
                                                                    <c:set var="roundedDiscount"
                                                                        value="${discountPercent + 0.5}" />
                                                                    <c:set var="discountFinal"
                                                                        value="${fn:substringBefore(roundedDiscount, '.')}" />
                                                                    ${discountFinal}% Off
                                                                </c:when>
                                                                <c:otherwise>
                                                                    0% Off
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </span>

                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center mt-2">
                                                        <button class="btn btn-sm btn-outline-danger align-items-center"
                                                            id="rmv-${ttemp.course.courseId}"><svg
                                                                xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-backspace">
                                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                <path
                                                                    d="M20 6a1 1 0 0 1 1 1v10a1 1 0 0 1 -1 1h-11l-5 -5a1.5 1.5 0 0 1 0 -2l5 -5z" />
                                                                <path d="M12 10l4 4m0 -4l-4 4" />
                                                            </svg> Remove</button>
                                                        <button class="btn btn-sm btn-primary d-flex align-items-center"
                                                            id="mtc-${ttemp.course.courseId}"><i
                                                                class="fa-solid fa-cart-shopping fs-6 m-1"></i>Move to
                                                            Cart</button>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>

                        </div>
                        <!-- Navtabs end here -->
                    </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                function toggleSidebar() {
                    document.getElementById("sidebar").classList.toggle("show");
                }
            </script>


            <script>
                let wishlistItems = document.getElementById("wishlist-items");

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

                wishlistItems.addEventListener("click", (e) => {
                    e.preventDefault();

                    let item = e.target.closest(".wish-card");

                    if (item) {
                        let button = e.target.closest("button");
                        if (button) {
                            // alert(button.id)
                            let task = ((button.id + "").split("-")[0]).trim();
                            if (task === "rmv") {
                                let id = ((button.id + "").split("-")[1]).trim();
                                let params = "target=course&course-id=" + id + "&act-on=wishlist&task=remove";
                                simplePost("event.do", params).then((data) => {
                                    if (data === "true") {
                                        location.reload();
                                    } else if (data === "signin") {
                                        alert("session expired ho gya Jaani....");
                                    } else {
                                        console.log(data);
                                    }
                                })
                            } else if (task === "mtc") {
                                let id = ((button.id + "").split("-")[1]).trim();
                                let params = "target=course&course-id=" + id + "&act-on=wishlist&task=remove";
                                simplePost("event.do", params).then((data) => {
                                    if (data === "true") {
                                        let params = "target=course&course-id=" + id + "&act-on=carts&task=add";
                                        simplePost("event.do", params).then((data) => {
                                            if (data === "true") {
                                                location.reload();
                                            } else if (data === "signin") {
                                                alert("Please Singin/SignUp");
                                            } else {
                                                console.log(data);
                                            }
                                        })
                                    } else if (data === "signin") {
                                        alert("Please Singin/SignUp");
                                    } else {
                                        console.log(data);
                                    }
                                })
                            }
                        } else {
                            window.location.href = item.href;
                        }
                    }
                })


            </script>


        </body>

        </html>