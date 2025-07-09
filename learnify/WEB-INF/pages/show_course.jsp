<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="models.User,models.WishList,models.Course" %>
        <% User user=(User)session.getAttribute("user"); Course course=(Course)request.getAttribute("course"); WishList
            wish=new WishList(user,course); request.setAttribute("wish",wish); %>

            <!-- Yadi user ke wishlist me hai course to ye karo -->
            <c:set var="iswish" value="${false}" scope="page" />
            <c:forEach var="tempwish" items="${user.wishlist}">
                <c:if test="${tempwish.equals(wish)}">
                    <c:set var="iswish" value="${true}" scope="page" />
                </c:if>
            </c:forEach>
            <!-- yadi item cart me already added hai to ye karo -->
            <c:set var="iscart" value="${empty user ? false : user.isInCart(course)}" scope="page" />


            <!doctype html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>${course.courseName}-${course.trainer.trainerName}(Learnify)</title>
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
                </style>
            </head>

            <body>
                <!-- Main Container -->
                <div class="container-fluid mt-5">
                    <!-- Main Navbar -->
                    <nav class="navbar navbar-expand-lg pe-2 z-3 w-100 bg-white shadow-sm"
                        style="position: fixed; top: 0; left: 0; width: 100%; z-index: 1030;">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="#">
                                <img src="static/media/images/logo.png" height="60" alt="Lernify">
                            </a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item me-1">
                                        <a class="nav-link" href="index.do">Home</a>
                                    </li>
                                    <li class="nav-item me-1">
                                        <a class="nav-link active" aria-current="page" href="courses.do">Courses</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">About us</a>
                                    </li>
                                </ul>



                                <% if(user !=null) { %>
                                    <a href="dashboard.do">
                                        <img src="profile_pic.do" alt="USER" width="34" height="34"
                                            class="border p-1 ms-2 rounded-circle border-secondary">
                                    </a>
                                    <% } else { %>
                                        <a href="get_started.do"
                                            class="btn btn-info text-white fw-medium rounded-4 ms-2 d-flex align-items-center"
                                            type="button">Get Started <i class="bi bi-arrow-right fw-bold ms-1"></i></a>
                                        <% } %>
                            </div>
                        </div>
                    </nav>

                    <!-- Home -->

                    <div id="main-container" style="margin-top: 120px;">
                        <div class="mt-3 mx-4">
                            <div class="row align-items-stretch" id="course-container">
                                <!-- Thumbnail Column -->
                                <div class="col-md-6 rounded-2 d-flex position-relative">
                                    <img src="get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}"
                                        class="img-fluid w-100 h-100 d-block border border-info border-2 rounded-2 object-fit-cover"
                                        alt="Thumbnail">
                                    <a href="preview_course.do?course_id=${course.courseId}&subtopic=start"
                                        class="btn btn-secondary position-absolute fs-6 d-flex align-items-center"
                                        style="left: 50%;top: 50%;transform: translate(-50%,-50%);"><i
                                            class="bi bi-play-fill me-2"></i>Preview</a>
                                </div>

                                <!-- Course Details Column -->
                                <div class="col-md-6 border rounded-2 p-3 shadow d-flex flex-column">
                                    <!-- Course Title -->
                                    <div class="text-center fw-bold fs-4 py-2">
                                        ${course.courseName}
                                    </div>

                                    <!-- Ratings & Views -->
                                    <div
                                        class="d-flex justify-content-between align-items-center px-4 py-2 border-bottom">
                                        <div class="rating text-warning">
                                            <span class="text-dark">Ratings:</span> &#9733;&#9733;&#9733;&#9733;&#9734;
                                            <span class="text-dark">(4.7)</span>
                                        </div>
                                        <div class="fw-medium">
                                            ${course.totalClicks} <span class="fs-6 fw-normal">views</span>
                                        </div>
                                    </div>

                                    <!-- Price & Discount -->
                                    <div
                                        class="d-flex justify-content-between align-items-center px-4 py-2 border-bottom">
                                        <span class="text-success fw-bold">
                                            <span class="text-dark fw-medium">Price: </span>&#8377;${course.price -
                                            course.discount}
                                            <del class="text-danger small">&#8377;${course.price}</del>
                                        </span>

                                        <!-- iska jugad karna hai -->
                                        <span class="badge bg-info text-dark" id="discount-percent">38% Off</span>
                                    </div>

                                    <!-- Level & Duration -->
                                    <div class="d-flex justify-content-between px-4 py-2 border-bottom">
                                        <div>
                                            <div class="fs-6 fw-medium">Level:</div>
                                            <span class="text-muted">${course.level.name}</span>
                                        </div>
                                        <div>
                                            <div class="fs-6 fw-medium">Duration:</div>
                                            <span class="text-muted">${course.validity}</span>
                                        </div>
                                    </div>


                                    <!-- Action Buttons -->
                                    <div class="mt-auto d-flex justify-content-center gap-3 mt-3 pt-2">
                                        <button class="btn btn-light btn-sm px-3 fw-medium"><i
                                                class="bi bi-hand-thumbs-up me-1"></i>Like</button>
                                        <!-- <button class="btn btn-light text-info btn-sm px-4"><i class="bi bi-hand-thumbs-up-fill me-1"></i>Like</button> -->
                                        <button class="btn btn-light btn-sm px-3" id="share-button"><i
                                                class="fa-solid fa-share me-1"></i>Share</button>

                                        <c:choose>
                                            <c:when test="${iswish}">
                                                <button class="btn btn-danger btn-sm px-3" id="wish-button"><i
                                                        class="fa-regular fa-heart me-1"></i>Wish</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-outline-danger btn-sm px-3" id="wish-button"><i
                                                        class="fa-regular fa-heart me-1"></i>Wish</button>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${iscart}">
                                                <button class="btn btn-info btn-sm px-3" id="cart"><i
                                                        class="fa-solid fa-cart-shopping me-1"></i>Cart</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-outline-info btn-sm px-3" id="cart"><i
                                                        class="fa-solid fa-cart-shopping me-1"></i>Cart</button>
                                            </c:otherwise>
                                        </c:choose>



                                        <button class="btn btn-outline-success btn-sm px-3" id="buy-button"><i
                                                class="fa-solid fa-credit-card me-1"></i>buy</button>
                                    </div>
                                </div>
                            </div>


                            <div class="row my-4 border rounded-2">
                                <div class="col">
                                    <div class="fs-4 fw-medium mt-3"><i
                                            class="fa-regular fa-file-lines me-2 text-info fw-bolder ms-2"></i>Description
                                    </div>
                                    <div class="p-3 ps-2 text-start">
                                        ${course.description}
                                    </div>
                                </div>
                            </div>

                            <div class="row d-flex my-4 p-0 gap-2">
                                <div class="col w-100">
                                    <div class="fs-4 fw-medium"><i
                                            class="bi bi-journal-check me-2 text-info fw-bolder ms-2"></i>Covered Topics
                                    </div>
                                    <div class="ps-2 text-start m-2">
                                        <c:set var="count" value="1" scope="page" />
                                        <c:forEach var="topic" items="${course.getCoveredTopicsArray()}">
                                            <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span
                                                    class="fw-medium">${count}.</span> ${topic}</div>
                                            <c:set var="count" value="${count + 1}" scope="page" />
                                        </c:forEach>
                                        <!-- <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span class="fw-medium">2.</span> Lorem, ipsum dolor sit amet consectetur adipisicing elit.</div>
                                    <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span class="fw-medium">3.</span> Lorem, ipsum dolor sit amet consectetur adipisicing elit.</div>
                                    <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span class="fw-medium">4.</span> Lorem, ipsum dolor sit amet consectetur adipisicing elit.</div> -->
                                    </div>
                                </div>
                                <div class="col w-100">
                                    <div class="fs-4 fw-medium"><i
                                            class="bi bi-pin-angle me-2 text-danger fw-bolder ms-2"></i>Key Features
                                    </div>
                                    <div class="ps-2 text-start m-2">
                                        <c:set var="count" value="1" scope="page" />
                                        <c:forEach var="feature" items="${course.getFeaturesArray()}">
                                            <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span
                                                    class="fw-medium">${count}.</span> ${feature}</div>
                                            <c:set var="count" value="${count + 1}" scope="page" />
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>



                            <div class="row d-flex my-4 p-0 gap-2">
                                <div class="col w-100">
                                    <div class="fs-4 fw-medium"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                            height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class="icon icon-tabler icons-tabler-outline icon-tabler-target-arrow me-2 ms-2 text-success">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M12 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
                                            <path d="M12 7a5 5 0 1 0 5 5" />
                                            <path d="M13 3.055a9 9 0 1 0 7.941 7.945" />
                                            <path d="M15 6v3h3l3 -3h-3v-3z" />
                                            <path d="M15 9l-3 3" />
                                        </svg>Learning Outcomes</div>
                                    <div class="ps-2 text-start m-2">
                                        <c:set var="count" value="1" scope="page" />
                                        <c:forEach var="outcome" items="${course.getLerningOutcomeArray()}">
                                            <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span
                                                    class="fw-medium">${count}.</span> ${outcome}</div>
                                            <c:set var="count" value="${count + 1}" scope="page" />
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col w-100">
                                    <div class="fs-4 fw-medium"><i
                                            class="fa-solid fa-bolt me-2 text-warning fw-bolder ms-2"></i>Prerequisites
                                    </div>
                                    <div class="ps-2 text-start m-2">
                                        <c:set var="count" value="1" scope="page" />
                                        <c:forEach var="preq" items="${course.getPrerequisitesArray()}">
                                            <div class="border bg-light bg-gradient rounded-3 p-2 fs-6 my-2"><span
                                                    class="fw-medium">${count}.</span> ${preq}</div>
                                            <c:set var="count" value="${count + 1}" scope="page" />
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="row d-flex my-4 p-0 gap-2">
                                <div class="col w-100">
                                    <div class="ps-2 text-start m-2 border rounded-2">
                                        <div class="fs-4 fw-medium d-flex align-items-center mt-2"><i
                                                class="fa-solid fa-award me-2 text-success-emphasis fw-bolder ms-2"></i>Certification
                                        </div>
                                        <div class="p-3 ps-2 text-start">
                                            ${course.certification}
                                        </div>
                                    </div>
                                </div>
                                <div class="col w-100">
                                    <div class="ps-2 text-start m-2 border rounded-2">
                                        <div class="fs-4 fw-medium d-flex align-items-center mt-2"><svg
                                                xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="icon icon-tabler icons-tabler-outline icon-tabler-credit-card-refund me-2 text-warning fw-bolder ms-2 text-info-emphasis">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                <path
                                                    d="M12 19h-6a3 3 0 0 1 -3 -3v-8a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v4.5" />
                                                <path d="M3 10h18" />
                                                <path d="M7 15h.01" />
                                                <path d="M11 15h2" />
                                                <path d="M16 19h6" />
                                                <path d="M19 16l-3 3l3 3" />
                                            </svg>Refund Policy</div>
                                        <div class="p-3 ps-2 text-start">
                                            ${course.refundPolicy}
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <c:set var="count" value="0" scope="page" />
                            <c:forEach var="ttemp" items="${user.wishlist}">
                                <script>console.log('${ttemp}');
                                </script>
                                <c:set var="count" value="${count + 1}" scope="page" />

                            </c:forEach>




                            <div class="row my-5 d-flex justify-content-center" style="min-height: 150px;">
                                <div class="col-md-5 border rounded-3 shadow-sm bg-white p-4">
                                    <!-- Trainer Heading -->


                                    <!-- Trainer Section -->
                                    <div class="row align-items-center">
                                        <!-- Profile Image -->
                                        <div class="col-md-4 d-flex justify-content-center">
                                            <img src="static/media/images/user.png"
                                                class="img-thumbnail rounded-circle border w-75 shadow-sm"
                                                alt="Trainer">
                                        </div>

                                        <!-- Trainer Details -->
                                        <div class="col-md-8">
                                            <div class="fw-bold fs-5 text-dark">${course.trainer.trainerName}</div>
                                            <div class="fs-5">About :
                                                <div></div>
                                            </div>
                                            <div class="mt-2">
                                                <button class="btn btn-outline-primary btn-sm px-3">
                                                    <i class="fa-solid fa-user"></i> View Profile
                                                </button>
                                                <button class="btn btn-outline-secondary btn-sm px-3">
                                                    <i class="fa-solid fa-info-circle"></i> About
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <c:if test="${course.pdf != 'pdf_9_9_9_9_no_pdf.pdf'}">
                                    <a href="get_pdf.do?course-id=${course.courseId}" target="_blank"
                                        class="btn btn-outline-info rounded-2 py-2 d-block w-100 fs-6" id="get-pdf"><i
                                            class="fa-regular fa-file-pdf me-1"></i>Course PDF</a>
                                </c:if>
                            </div>

                            <%-- <div class="row">
                                <c:choose>
                                    <c:when test="${course.pdf eq 'pdf_9_9_9_9_no_pdf.pdf'}">
                                        No pdf
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-outline-info rounded-2 py-2 d-block w-100 fs-6"
                                            id="get-pdf"><i class="fa-regular fa-file-pdf me-1"></i>Course PDF</button>
                                    </c:otherwise>
                                </c:choose>
                        </div> --%>

                        <div class="row mt-3">
                            <div class="col d-flex justify-content-end align-items-center gap-2">
                                <button class="btn btn-outline-dark"><i
                                        class="bi bi-question-square me-2"></i>Help</button>
                                <button class="btn btn-outline-dark"><i
                                        class="fa-regular fa-message me-2"></i>Contact</button>
                            </div>
                        </div>
                    </div>
                </div>

                <br><br>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>

                <script>
                    let courseId = parseInt("${course.courseId}");
                    let price = parseInt("${course.price}");
                    let discount = parseInt("${course.discount}");

                    document.getElementById("discount-percent").innerText = price > 0 ? Math.round((discount / price) * 100) + "% Off" : "0% Off"

                    document.getElementById("share-button").addEventListener("click", async () => {
                        if (navigator.share) {
                            try {
                                await navigator.share({
                                    title: "Check this out!",
                                    text: "This is an awesome website!",
                                    url: window.location.href
                                });
                                console.log("Shared successfully");
                            } catch (error) {
                                console.error("Error sharing:", error);
                            }
                        } else {
                            alert("Sharing is not supported in this browser.");
                        }
                    });

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


                    let wishButton = document.getElementById("wish-button");

                    wishButton.addEventListener("click", (e) => {
                        e.preventDefault();
                        if (wishButton.classList.contains("btn-outline-danger")) {

                            // let params = "target=course&course-id=" + courseId + "&type=wishlist&type=wishlist";
                            let params = "target=course&course-id=" + courseId + "&act-on=wishlist&task=add";
                            simplePost("event.do", params).then((data) => {
                                if (data === "true") {
                                    wishButton.classList.remove("btn-outline-danger");
                                    wishButton.classList.add("btn-danger");
                                } else if (data === "signin") {
                                    alert("Please Singin/SignUp");
                                } else {
                                    console.log(data);
                                }
                            })

                        } else {

                            let params = "target=course&course-id=" + courseId + "&act-on=wishlist&task=remove";
                            simplePost("event.do", params).then((data) => {
                                if (data === "true") {
                                    wishButton.classList.remove("btn-danger");
                                    wishButton.classList.add("btn-outline-danger");
                                } else if (data === "signin") {
                                    alert("Please Singin/SignUp");
                                } else {
                                    console.log(data);
                                }
                            })
                        }
                    })


                    let cartBtn = document.getElementById("cart");

                    cartBtn.addEventListener("click", (e) => {
                        e.preventDefault();

                        if (e.target.classList.contains("btn-outline-info")) {
                            let params = "target=course&course-id=" + courseId + "&act-on=carts&task=add";
                            simplePost("event.do", params).then((data) => {
                                if (data === "true") {
                                    cartBtn.classList.remove("btn-outline-info");
                                    cartBtn.classList.add("btn-info");
                                } else if (data === "signin") {
                                    alert("Please Singin/SignUp");
                                } else {
                                    console.log(data);
                                }
                            })
                        } else {
                            let params = "target=course&course-id=" + courseId + "&act-on=carts&task=remove";
                            simplePost("event.do", params).then((data) => {
                                if (data === "true") {
                                    cartBtn.classList.remove("btn-info");
                                    cartBtn.classList.add("btn-outline-info");
                                } else if (data === "signin") {
                                    alert("Please Singin/SignUp");
                                } else {
                                    console.log(data);
                                }
                            })
                        }
                    })


                    document.getElementById("buy-button").addEventListener("click", e => {
                        let params = "target=course&course-id=" + courseId + "&act-on=carts&task=add";
                        simplePost("event.do", params).then((data) => {
                            if (data === "true") {
                                window.location.href = "mycarts.do";
                            } else if (data === "signin") {
                                alert("Please Singin/SignUp");
                            } else {
                                console.log(data);
                            }
                        })
                    })

                </script>
            </body>

            </html>