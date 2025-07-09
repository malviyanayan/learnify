<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile - (Learnify)</title>
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

        <!-- Profile CSS (static folder) -->
        <link rel="stylesheet" href="static/css/profile.css">

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
                <div class="right-panel overflow-y-hidden">
                    <div class="row">
                        <div class="col fw-bold fs-4 ms-2">Profile</div>
                    </div>

                    <!-- Navtabs start from here -->
                    <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                        <!-- This is for Personal Informaion tab-button -->
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="p-info-tab" data-bs-toggle="tab"
                                data-bs-target="#p-info" type="button" role="tab" aria-controls="p-info"
                                aria-selected="true">Persolnal
                                Information</button>
                        </li>

                        <!-- Sesstions tab button -->
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings"
                                type="button" role="tab" aria-controls="settings"
                                aria-selected="false">Settings</button>
                        </li>
                    </ul>
                    <div class="tab-content overflow-hidden overflow-y-scroll" id="myTabContent"
                        style="min-height: 300px;max-height: 370px;">
                        <div class="tab-pane fade show active gap-3 mb-5" id="p-info" role="tabpanel"
                            aria-labelledby="p-info">
                            <!-- Content for Personal Information -->
                            <div class="row position-relative d-inline-block">
                                <div class="col">
                                    <img src="profile_pic.do" alt="USER" width="100" height="100"
                                        class="border p-1 ms-5 mt-2 rounded-circle border-secondary position-relative">
                                    <button class="edit-btn" data-bs-toggle="modal" data-bs-target="#edit-profile-pic">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col ms-5"><small>Created on 12 nov 2003</small></div>
                            </div>

                            <div class="row d-flex justify-content-evenly mt-4">
                                <div class="col-5 border rounded-3 p-1 ps-2">
                                    <small>Name</small>
                                    <h6 id="my-name">${user.name}</h6>
                                </div>
                                <div class="col-5 border rounded-3 p-1 ps-2">
                                    <small>Email</small>
                                    <h6>${user.email}</h6>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-11 ms-5 border rounded-3 p-1 ps-2 mt-3">
                                    <small>About Me</small>
                                    <div class="p-3 pt-1 fw-normal" id="about-me">${user.aboutMe}</div>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-evenly mt-4">
                                <div class="col-5 border rounded-3 p-1 ps-2">
                                    <small>Gender</small>
                                    <h6 id="gender">${user.parseGender()}</h6>
                                </div>
                                <div class="col-5 border rounded-3 p-1 ps-2">
                                    <small>DOB</small>
                                    <h6 id="dob">${user.dob}</h6>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-evenly mt-4">
                                <div class="col-5 border rounded-3 p-1 ps-2">
                                    <small>Phone</small>
                                    <h6>${user.phone}</h6>
                                </div>
                                <div class="col-5 border rounded-3 p-1 ps-2">
                                    <small>Country</small>
                                    <div class="d-flex align-items-center">
                                        <c:if test="${not empty user.country}">
                                            <span>+${user.country.countryCode}</span>
                                            <img src="static/media/images/countries/${user.country.flag}" alt="in"
                                                width="32" height="32" class="ms-2">
                                            <h6 class="d-inline-block ms-2 mb-0">${user.country.name}</h6>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade overflow-hidden overflow-y-hidden" id="settings" role="tabpanel"
                            aria-labelledby="settings-tab">
                            <!-- Content for Settings -->
                            <div class="row mt-4 me-2">
                                <div
                                    class="col-11 ms-5 border rounded p-2 px-3 d-flex justify-content-between align-items-center bg-white shadow-sm">
                                    <div style="font-size: 17px; color: rgb(20, 20, 60); font-weight: 600;">Edit
                                        Personal
                                        Details</div>
                                    <button class="btn btn-primary px-4 py-1 shadow-sm rounded" data-bs-toggle="modal"
                                        data-bs-target="#edit-info-box">Edit</button>
                                </div>
                            </div>

                        </div>

                    </div>


                    <!-- Navtabs end here -->
                </div>
        </div>



        <!-- Bootstrap Model for edit Profile image image -->
        <div class="modal" tabindex="-1" id="edit-profile-pic">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Profile Pic</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col d-flex justify-content-center">
                                <img src="profile_pic.do" id="profile_upload_pic" width="170" height="170"
                                    class="border rounded-circle border-2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <!-- <button class="btn btn-primary">Upload</button> -->
                                <input type="file" id="input-profile-pic" style="display: none;">
                                <button type="button" id="input-pic-btn" class="btn btn-secondary">New Pic</button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="upload-confirm" disabled>Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Model for Edit Dialog box -->
        <div class="modal" tabindex="-1" id="edit-info-box">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Personal Information</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <button type="button" class="btn btn-outline-secondary m-2" data-bs-toggle="modal"
                            data-bs-target="#edit-name-model" id="edit-name-btn">Name</button>
                        <button type="button" class="btn btn-outline-secondary m-2" data-bs-toggle="modal"
                            data-bs-target="#about-me-model" id="edit_about_me_btn">About</button>
                        <button type="button" class="btn btn-outline-secondary m-2">Phone</button>
                        <button type="button" class="btn btn-outline-secondary m-2" data-bs-toggle="modal"
                            data-bs-target="#edit-dob-model" id="edit-dob-btn">DOB</button>
                        <button type="button" class="btn btn-outline-secondary m-2" data-bs-toggle="modal"
                            data-bs-target="#edit-gender-model" id="edit-gender-btn">Gender</button>
                        <button type="button" class="btn btn-outline-secondary m-2" data-bs-toggle="modal"
                            data-bs-target="#edit-country-model" id="edit-country-btn">Country</button>
                    </div>
                    <!-- <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" disabled>E</button>
        </div> -->
                </div>
            </div>
        </div>


        <!-- Name Edit model -->
        <div class="modal" tabindex="-1" id="edit-name-model">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Your Name</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="m-3">
                        <label for="edit-name" class="form-label">Name </label>
                        <input type="text" class="form-control" id="edit-name">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-name-confirm">Confirm</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit About Me Model -->
        <div class="modal" tabindex="-1" id="about-me-model">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit About Me</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="about_text_area"
                                style="height: 100px"></textarea>
                            <label for="about_text_area">About Me</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="about-confirm">Confirm</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Date Of Birth -->
        <div class="modal" tabindex="-1" id="edit-dob-model">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit DOB </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="date" class="form-control" id="edit-dob">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="dob-confirm">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Edit Gender Model -->
        <div class="modal" tabindex="-1" id="edit-gender-model">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Change Gender</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <select class="form-select form-select-lg mb-3" aria-label="Large select example"
                            id="edit-gender">
                            <option value="N">Not Selected</option>
                            <option value="M">Male</option>
                            <option value="F">Femal</option>
                            <option value="O">Other</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="confirm-gender">Confirm Change</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit County Model -->
        <div class="modal" tabindex="-1" id="edit-country-model">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Country</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <select class="form-select form-select-lg mb-3" id="edit-country">
                            <c:forEach var="country" items="${countries}">
                                <option value="${country.countryId}">${country.name}</option>
                            </c:forEach>
                        </select>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="confirm-country">Confirm Change</button>
                    </div>
                </div>
            </div>
        </div>


        <script>
            function toggleSidebar() {
                document.getElementById("sidebar").classList.toggle("show");
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/profile.js"></script>
    </body>

    </html>