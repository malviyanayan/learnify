<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <%@ page import="models.User" %>
            <% User user=(User)session.getAttribute("user"); %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>My Cart (Learnify)</title>
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
                        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
                        crossorigin="anonymous" referrerpolicy="no-referrer" />
                    <link rel="stylesheet" href="static/css/mycarts.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css"
                        integrity="sha512-dPXYcDub/aeb08c63jRq/k6GaKccl256JQy/AnOq7CAnEZ9FzSL9wSbcZkMp4R26vBsMLFYH4kQ67/bbV8XaCQ=="
                        crossorigin="anonymous" referrerpolicy="no-referrer" />
                </head>

                <style>
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

                <link rel="stylesheet" href="static/css/dashboard.css">
                <link rel="stylesheet" href="static/css/dash_common.css">

                <body>

                    <%@ include file="navbar.jsp" %>

                        <div class="container" style="margin-top: 100px;">
                            <ul class="nav nav-tabs" id="cartTabs">
                                <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#mycarts">My
                                        Carts</a></li>
                                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
                                        href="#wishlist">Wishlist</a>
                                </li>
                                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#history">Purchase
                                        History</a></li>
                            </ul>

                            <div class="tab-content mt-3">
                                <div class="tab-pane fade show active" id="mycarts">
                                    <!-- <div class="d-flex justify-content-end mb-3">

                                    <button class="btn btn-primary">New Cart</button>
                                </div> -->

                                    <c:set var="isdef" value="${true}" />
                                    <c:set var="cartChar" value="0" />

                                    <!-- cart box -->
                                    <c:forEach var="cart" items="${carts}">
                                        
                                        <c:if test="${cart.isPurchased eq false}">
                                            <div class="cart-box mb-4" id="cart-${cart.cartId}">
                                                <div
                                                    class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                                                    <h6 class="fw-bold mb-0">
                                                        <c:choose>
                                                            <c:when test="${isdef}">Default Cart</c:when>
                                                            <c:otherwise>Cart ${cartChar}</c:otherwise>
                                                        </c:choose>
                                                    </h6>
                                                    <c:set var="isdef" value="${false}" />
                                                    <c:set var="cartChar" value="${cartChar+1}" />

                                                    <div>
                                                        <button class="btn btn-sm btn-outline-secondary"
                                                            data-bs-toggle="dropdown" aria-expanded="false"> <i
                                                                class="bi bi-three-dots-vertical"></i> </button>
                                                        <ul class="dropdown-menu">
    
                                                            <!-- <li
                                                        class="d-flex justify-content-between align-items-center px-1">
                                                        <a href="#"
                                                            class="dropdown-item">
                                                            <i class="fa-solid fa-ticket me-2"></i>Apply coupen
                                                        </a>
                                                    </li> -->
                                                            <li
                                                                class="d-flex justify-content-between align-items-center px-1 text-danger">
                                                                <a href="#" class="dropdown-item text-danger cart-btn"
                                                                    id="del-${cart.cartId}">
                                                                    <i class="fa-solid fa-trash-can me-2"></i>Delete
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
    
                                                <!-- items List -->
                                                <c:set var="cartItems" value="${cart.getAllItems()}" />
                                                <c:set var="cartPrice" value="${0}" />
                                                <c:set var="cartDiscount" value="${0}" />
    
                                                <c:forEach var="cartItem" items="${cartItems}">
                                                    <div class="product-item">
                                                        <a href="show_course.do?course=${cartItem.course.courseId}"><img src="get_image.do?type=thumbnail&course=${cartItem.course.courseId}&img=${cartItem.course.thumbnail}"
                                                            class="rounded"></a>
                                                        <div class="flex-grow-1">
                                                            <strong>${cartItem.course.courseName}</strong>
                                                            <div class="text-muted">Trainer:
                                                                ${cartItem.course.trainer.trainerName}</div>
                                                        </div>
                                                        <div class="text-center">
                                                            <strong class="text-success">&#8377; ${cartItem.course.price -
                                                                cartItem.course.discount}</strong>
                                                            <div><del class="text-danger">&#8377;
                                                                    ${cartItem.course.price}</del>
                                                            </div>
                                                        </div>
                                                        <!-- <select class="form-select form-select-sm w-auto">
                                                        <option selected>Move to Cart</option>
                                                        <option>Cart 2</option>
                                                    </select> -->
                                                        <button class="btn btn-sm btn-danger cart-btn"
                                                            id="rmv-${cart.cartId}-${cartItem.cartItemId}-${cartItem.course.courseId}">Remove</button>
                                                        <button class="btn btn-sm btn-warning cart-btn"
                                                            id="mtw-${cart.cartId}-${cartItem.cartItemId}-${cartItem.course.courseId}">Move
                                                            to Wish</button>
                                                    </div>
    
                                                    <c:set var="cartPrice" value="${cartPrice + cartItem.course.price}" />
                                                    <c:set var="cartDiscount"
                                                        value="${cartDiscount + cartItem.course.discount}" />
                                                </c:forEach>
    
                                                <!-- Card Summary (Accordion) -->
                                                <div class="accordion mt-3" id="orderSummaryAccordion">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header">
                                                            <button class="accordion-button" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#orderSummary">
                                                                Cart Summary
                                                            </button>
                                                        </h2>
                                                        <div id="orderSummary" class="accordion-collapse collapse">
                                                            <div class="accordion-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <span>Total Items</span>
                                                                    <span class="fw-bold">${cartItems.size()}</span>
                                                                </div>
                                                                <div class="d-flex justify-content-between">
                                                                    <span>Total</span>
                                                                    <span class="text-danger"><s>&#8377;
                                                                            ${cartPrice}</s></span>
                                                                </div>
                                                                <div class="d-flex justify-content-between text-success">
                                                                    <span>Discount</span>
                                                                    <span>- &#8377; ${cartDiscount}</span>
                                                                </div>
                                                                <hr class="my-2">
                                                                <div
                                                                    class="d-flex justify-content-between fw-bold text-primary">
                                                                    <span>Final Price</span>
                                                                    <span>&#8377; ${cartPrice - cartDiscount}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
    
                                                <!-- Checkout Button (Outside Accordion) -->
                                                <a href="payment.do?cart=${cart.cartId}" class="btn btn-primary mt-3 w-100">Purchase</a>
    
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <!-- End Cart Box -->


                                    <!-- cart box -->
                                    <!-- <div class="cart-box mb-4">
                                <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                                    <h6 class="fw-bold mb-0">Cart A</h6>
                                    <div>
                                        <button class="btn btn-sm btn-outline-secondary" data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-three-dots-vertical"></i> </button>
                                        <ul class="dropdown-menu">
                                            
                                            <li
                                                class="d-flex justify-content-between align-items-center px-1 text-danger">
                                                <a href="#"
                                                    class="dropdown-item text-danger">
                                                    <i
                                                        class="fa-solid fa-trash-can me-2"></i>Delete
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="product-item">
                                    <img src="html_css.jpg" class="rounded">
                                    <div class="flex-grow-1">
                                        <strong>JavaScript Mastery</strong>
                                        <div class="text-muted">Trainer: John Doe</div>
                                    </div>
                                    <div class="text-center">
                                        <strong class="text-success">&#8377; 10,000</strong>
                                        <div><del class="text-danger">&#8377; 12,000</del></div>
                                    </div>
                                    <select class="form-select form-select-sm w-auto">
                                        <option selected>Move to Cart</option>
                                        <option>Cart 2</option>
                                    </select>
                                    <button class="btn btn-sm btn-danger">Remove</button>
                                    <button class="btn btn-sm btn-warning">Wish</button>
                                </div>

                                <div class="product-item">
                                    <img src="html_css.jpg" class="rounded">
                                    <div class="flex-grow-1">
                                        <strong>Python for Beginners</strong>
                                        <div class="text-muted">Trainer: Alice Smith</div>
                                    </div>
                                    <div class="text-center">
                                        <strong class="text-success">&#8377; 10,000</strong>
                                        <div><del class="text-danger">&#8377; 12,000</del></div>
                                    </div>
                                    <select class="form-select form-select-sm w-auto">
                                        <option selected>Move to Cart</option>
                                        <option>Cart 2</option>
                                    </select>
                                    <button class="btn btn-sm btn-danger">Remove</button>
                                    <button class="btn btn-sm btn-warning">Wish</button>
                                </div>

                                
                                <div class="accordion mt-3" id="orderSummaryAccordion">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#orderSummary">
                                                Cart Summary
                                            </button>
                                        </h2>
                                        <div id="orderSummary" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                <div class="d-flex justify-content-between">
                                                    <span>Total Items</span>
                                                    <span class="fw-bold">2</span>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <span>Total</span>
                                                    <span class="text-danger"><s>&#8377; 20,000</s></span>
                                                </div>
                                                <div class="d-flex justify-content-between text-success">
                                                    <span>Discount</span>
                                                    <span>- &#8377; 4,000</span>
                                                </div>
                                                <hr class="my-2">
                                                <div class="d-flex justify-content-between fw-bold text-primary">
                                                    <span>Final Price</span>
                                                    <span>&#8377; 16,000</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <button class="btn btn-primary mt-3 w-100">Purchase</button>

                            </div>  -->
                                    <!-- End Cart Box -->



                                </div>

                                <!-- Wishlist Section -->
                                <div class="tab-pane fade" id="wishlist">
                                    <div class="row" id="wishlist-items">
                                        <c:forEach var="ttemp" items="${user.wishlist}">
                                            <div class="col-12 col-md-6 col-lg-5 mb-3" style="width: max-content;">
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
                                                        <div
                                                            class="d-flex justify-content-between align-items-center mb-2">
                                                            <span class="text-success fw-bold">
                                                                &#8377;${ttemp.course.price - ttemp.course.discount}
                                                                <del
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
                                                        <div
                                                            class="d-flex justify-content-between align-items-center mt-2">
                                                            <button
                                                                class="btn btn-sm btn-outline-danger align-items-center"
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
                                                            <button
                                                                class="btn btn-sm btn-primary d-flex align-items-center"
                                                                id="mtc-${ttemp.course.courseId}"><i
                                                                    class="fa-solid fa-cart-shopping fs-6 m-1"></i>Move
                                                                to
                                                                Cart</button>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- Purchase History Section -->
                                <div class="tab-pane fade" id="history">
                                    <!-- cart box -->
                                    <c:forEach var="cart" items="${carts}">
                                        
                                        <c:if test="${cart.isPurchased eq true}">
                                            <div class="cart-box mb-4" id="cart-${cart.cartId}">
                                                <div
                                                    class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                                                    <h6 class="fw-bold mb-0">
                                                        Purchase Time : ${cart.purchasedTime}
                                                    </h6>
                                                    <c:set var="isdef" value="${false}" />
                                                    <c:set var="cartChar" value="${cartChar+1}" />

                                                   
                                                </div>
    
                                                <!-- items List -->
                                                <c:set var="cartItems" value="${cart.getAllItems()}" />
    
                                                <c:forEach var="cartItem" items="${cartItems}">
                                                    <div class="product-item">
                                                        <a href="show_course.do?course=${cartItem.course.courseId}"><img src="get_image.do?type=thumbnail&course=${cartItem.course.courseId}&img=${cartItem.course.thumbnail}"
                                                            class="rounded"></a>
                                                        <div class="flex-grow-1">
                                                            <strong>${cartItem.course.courseName}</strong>
                                                            <div class="text-muted">Trainer:
                                                                ${cartItem.course.trainer.trainerName}</div>
                                                        </div>
                                                        
                                                    </div>
    
                                                    <c:set var="cartPrice" value="${cartPrice + cartItem.course.price}" />
                                                    <c:set var="cartDiscount"
                                                        value="${cartDiscount + cartItem.course.discount}" />
                                                </c:forEach>
    
                                                <!-- Card Summary (Accordion) -->
                                                <div class="accordion mt-3" id="orderSummaryAccordion">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header">
                                                            <button class="accordion-button" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#orderSummary">
                                                                Cart Summary
                                                            </button>
                                                        </h2>
                                                        <div id="orderSummary" class="accordion-collapse collapse">
                                                            <div class="accordion-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <span>Total Items</span>
                                                                    <span class="fw-bold">${cartItems.size()}</span>
                                                                </div>
                                                                <div class="d-flex justify-content-between">
                                                                    <span>Total</span>
                                                                    <span class="text-danger"><s>&#8377;
                                                                            ${cart.price}</s></span>
                                                                </div>
                                                                <div class="d-flex justify-content-between text-success">
                                                                    <span>Discount</span>
                                                                    <span>- &#8377; ${cart.discount}</span>
                                                                </div>
                                                                <hr class="my-2">
                                                                <div
                                                                    class="d-flex justify-content-between fw-bold text-primary">
                                                                    <span>Final Price</span>
                                                                    <span>&#8377; ${cart.price}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
    
                                                <!-- Checkout Button (Outside Accordion) -->
                                                <a href="payment.do?cart=${cart.cartId}" class="btn btn-primary mt-3 w-100">Purchase</a>
    
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <!-- End Cart Box -->
                                </div>
                            </div>
                        </div>

                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

                            document.addEventListener("click", (e) => {
                                let trgt = e.target.closest(".cart-btn");


                                if (trgt) {
                                    let trgts = trgt.id.split("-");
                                    console.log(trgts);

                                    if (trgts[0] === "rmv") {
                                        let params = "target=course&course-id=" + trgts[3] + "&act-on=carts&task=remove";
                                        simplePost("event.do", params).then((data) => {
                                            if (data === "true") {
                                                location.reload();
                                            } else if (data === "signin") {
                                                alert("Please Singin/SignUp");
                                            } else {
                                                console.log(data);
                                            }
                                        })
                                    } else if (trgts[0] === "mtw") {
                                        let params1 = "target=course&course-id=" + trgts[3] + "&act-on=carts&task=remove";
                                        simplePost("event.do", params1).then((data) => {
                                            if (data === "true") {
                                                let params2 = "target=course&course-id=" + trgts[3] + "&act-on=wishlist&task=add";
                                                simplePost("event.do", params2).then((data) => {
                                                    if (data === "true") {
                                                        location.reload();
                                                    } else if (data === "signin") {
                                                        alert("Please Singin/SignUp");
                                                    } else {
                                                        console.log(data);
                                                    }
                                                })
                                            } else if (data === "signin") {
                                                alert("Please Singin");
                                            } else {
                                                console.log(data);
                                            }
                                        })
                                    }
                                }
                            })

                            let wishlistItems = document.getElementById("wishlist-items");

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