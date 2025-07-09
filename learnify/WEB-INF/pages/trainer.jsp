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
        <link rel="stylesheet" href="static/css/trainer.css">

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
                    <div class="row align-items-center justify-content-between">
                        <!-- Trainer Name -->
                        <div class="col-auto">
                            <div class="fw-bold fs-5 ms-2">
                                <span class="text-secondary me-1">--/</span> ${trainer.trainerName}
                            </div>
                        </div>

                        <!-- Buttons Section -->
                        <div class="col-auto d-flex align-items-center gap-2">
                            <!-- New Trainer Button -->
                            <button class="btn btn-success btn-sm d-flex align-items-center gap-1 px-3" type="button"
                                data-bs-toggle="modal" data-bs-target="#new-trainer-model">
                                <i class="fas fa-plus"></i> New
                            </button>

                            <!-- Switch Trainer Dropdown -->
                            <c:if test="${not empty trainer and trainer.inactiveTrainers.size() > 0}">
                                <div class="dropdown">
                                    <button
                                        class="btn btn-outline-primary btn-sm d-flex align-items-center gap-1 px-3 dropdown-toggle"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fas fa-user-exchange"></i> Switch
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <c:forEach var="temp" items="${trainer.inactiveTrainers}">
                                            <li>
                                                <a class="dropdown-item d-flex align-items-center gap-2"
                                                    href="switch_trainer.do?trainer=${temp}">
                                                    <i class="fas fa-user-tie text-primary"></i> ${temp}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                    </div>


                    <c:if test="${empty trainer}">
                        <div class="row justify-content-center">
                            <div class="col-8 text-danger mt-5 fs-5 text-center border border-2 rounded-4 p-3">
                                You don't have any trainer account. Please create one to get started.
                            </div>
                        </div>
                    </c:if>
                    <!-- Navtabs start from here -->
                    <c:if test="${not empty trainer}">
                        <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="settings-tab" data-bs-toggle="tab"
                                    data-bs-target="#settings" type="button" role="tab" aria-controls="settings"
                                    aria-selected="false">Launched
                                    Courses</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="details-tab" data-bs-toggle="tab" data-bs-target="#details"
                                    type="button" role="tab" aria-controls="details"
                                    aria-selected="true">Details</button>
                            </li>
                        </ul>
                        <div class="tab-content overflow-hidden overflow-y-scroll" id="myTabContent"
                            style="min-height: 300px;max-height: 370px;">


                            <div class="tab-pane fade active overflow-hidden overflow-y-hidden" id="settings"
                                role="tabpanel" aria-labelledby="settings-tab">

                                <div class="row">
                                    <div class="col text-end me-3">
                                        <div class="btn btn-outline-primary" data-bs-toggle="modal"
                                            data-bs-target="#new-course-model"><i
                                                class="bi bi-window-fullscreen me-2"></i>New Course</div>
                                    </div>
                                </div>


                                <div class="container my-4">
                                    <div class="row gx-3 gy-4">
                                        <c:forEach var="course" items="${courses}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <a href="trainer_course.do?course_id=${course.courseId}"
                                                    class="course-card card border-0 shadow-sm rounded-3 overflow-hidden text-decoration-none"
                                                    style="width: 100%; max-width: 300px; transition: transform 0.3s ease-in-out;">

                                                    <!-- Image Section -->
                                                    <div class="position-relative w-100"
                                                        style="aspect-ratio: 16/9; overflow: hidden;">
                                                        <img src="get_image.do?type=thumbnail&course=${course.courseId}&img=${course.thumbnail}"
                                                            class="w-100 h-100 object-fit-cover" alt="Course Image"
                                                            style="transition: transform 0.3s ease;">
                                                    </div>

                                                    <!-- Course Title -->
                                                    <div class="course-info p-3 bg-white text-center">
                                                        <h6 class="fw-bold text-dark text-truncate mb-0"
                                                            style="max-width: 100%;">
                                                            ${course.courseName}
                                                        </h6>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>



                            </div>


                            <div class="tab-pane fade show gap-3 mb-5" id="details" role="tabpanel"
                                aria-labelledby="details">

                                <div class="row">
                                    <div class="col text-end me-3">
                                        <div class="btn btn-outline-secondary" data-bs-toggle="modal"
                                            data-bs-target="#edit-trainer-model"><i class="bi bi-pen me-2"></i>Edit
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-flex justify-content-evenly mt-4">
                                    <div class="col-5 border rounded-3 p-1 ps-2">
                                        <small>Trainer Name</small>
                                        <h6 id="my-name">${trainer.trainerName}</h6>
                                    </div>
                                    <div class="col-5 border rounded-3 p-1 ps-2">
                                        <small>Launched Courses</small>
                                        <h6>${trainer.lauchedCourses}</h6>
                                    </div>
                                </div>

                                <div class="row d-flex justify-content-evenly mt-4">
                                    <div class="col-5 border rounded-3 p-1 ps-2">
                                        <small>Experience</small>
                                        <h6 id="my-name">${trainer.experience}</h6>
                                    </div>
                                    <div class="col-5 border rounded-3 p-1 ps-2">
                                        <small>Education</small>
                                        <h6>${trainer.education}</h6>
                                    </div>
                                </div>

                                <div class="row d-flex justify-content-evenly mt-4">
                                    <div class="col-5 border rounded-3 p-1 ps-2">
                                        <small>Skills</small>
                                        <h6 id="my-name">${trainer.skills}</h6>
                                    </div>
                                    <div class="col-5 border rounded-3 p-1 ps-2">
                                        <small>Profession</small>
                                        <h6>${trainer.profession}</h6>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </c:if>

                    <!-- Navtabs end here -->
                </div>
        </div>


        <!-- New Trainer Account Modal -->
        <div class="modal fade" id="new-trainer-model" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content" style="border-radius: 10px; border: none;">
                    <!-- Modal Header -->
                    <div class="modal-header bg-light" style="border-bottom: 1px solid #ddd; padding: 12px;">
                        <h5 class="modal-title mx-auto fw-bold" style="font-size: 18px; color: #333;">
                            <i class="fas fa-user-plus me-2"></i> Create New Trainer Account
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Modal Body -->
                    <div class="modal-body px-4" style="padding-bottom: 10px;">
                        <form id="new-trainer-form" method="post">
                            <!-- Trainer Name -->
                            <div class="mb-3">
                                <label for="new-trainer-name" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-user"></i> Trainer Account Name
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-at"></i></span>
                                    <input type="text" class="form-control" id="new-trainer-name" name="trainer-name"
                                        required>
                                </div>
                                <small class="text-warning" style="font-size: 12px;">It must be Unique...</small>
                            </div>

                            <!-- Profession -->
                            <div class="mb-3">
                                <label for="new-trainer-profession" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-briefcase"></i> Profession
                                </label>
                                <input list="professions" class="form-control" name="profession"
                                    id="new-trainer-profession" required>
                                <datalist id="professions">
                                    <option value="Software Engineer">
                                    <option value="Data Scientist">
                                    <option value="Product Manager">
                                    <option value="Designer">
                                    <option value="Trainer">
                                </datalist>
                            </div>

                            <!-- Experience -->
                            <div class="mb-3">
                                <label for="new-trainer-experience" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-chart-line"></i> Experience
                                </label>
                                <textarea class="form-control" placeholder="Enter Your Experience..."
                                    id="new-trainer-experience" maxlength="500" required rows="3"
                                    style="resize: none; height: 80px;"></textarea>
                            </div>

                            <!-- Education -->
                            <div class="mb-3">
                                <label for="new-trainer-education" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-graduation-cap"></i> Education
                                </label>
                                <textarea class="form-control" placeholder="Enter Your Education..."
                                    id="new-trainer-education" maxlength="255" required rows="3"
                                    style="resize: none; height: 80px;"></textarea>
                            </div>

                            <!-- Skills -->
                            <div class="mb-3">
                                <label for="new-trainer-skills" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-lightbulb"></i> Skills
                                </label>
                                <textarea class="form-control"
                                    placeholder="Enter Your Skills like (Programming, Editing, etc.)"
                                    id="new-trainer-skills" maxlength="255" required rows="3"
                                    style="resize: none; height: 80px;"></textarea>
                            </div>

                            <!-- Error Alert -->
                            <div id="new-trainer-error" class="alert alert-danger d-none" role="alert"
                                style="display: none; font-size: 14px; padding: 8px;">
                                <i class="fas fa-exclamation-circle"></i> An error occurred while creating the trainer
                                account. Please try again.
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-end gap-2 mt-3">
                                <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal"
                                    style="padding: 8px 16px; font-size: 14px;">
                                    <i class="fas fa-times"></i> Close
                                </button>
                                <button type="submit" id="create-trainer-btn" class="btn btn-primary"
                                    style="padding: 8px 16px; font-size: 14px;">
                                    <i class="fas fa-check"></i> Create
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <!-- Edit Trainer Account Modal -->
        <div class="modal fade" id="edit-trainer-model" tabindex="-1" aria-labelledby="editTrainerLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content" style="border-radius: 10px; border: none;">
                    <!-- Modal Header -->
                    <div class="modal-header bg-light" style="border-bottom: 1px solid #ddd; padding: 12px;">
                        <h5 class="modal-title mx-auto fw-bold" style="font-size: 18px; color: #333;">
                            <i class="fas fa-user-edit me-2"></i> Edit Trainer Account
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Modal Body -->
                    <div class="modal-body px-4" style="padding-bottom: 10px;">
                        <form id="edit-trainer-form">
                            <!-- Trainer Name -->
                            <div class="mb-3">
                                <label for="edit-trainer-name" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-user"></i> Trainer Account Name
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-at"></i></span>
                                    <input type="text" class="form-control" id="edit-trainer-name" name="trainer-name"
                                        required value="${trainer.trainerName}">
                                </div>
                            </div>

                            <!-- Profession -->
                            <div class="mb-3">
                                <label for="edit-trainer-profession" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-briefcase"></i> Profession
                                </label>
                                <input list="professions" class="form-control" id="edit-trainer-profession" required
                                    value="${trainer.profession}">
                                <datalist id="professions">
                                    <option value="Software Engineer">
                                    <option value="Data Scientist">
                                    <option value="Product Manager">
                                    <option value="Designer">
                                    <option value="Trainer">
                                </datalist>
                            </div>

                            <!-- Experience -->
                            <div class="mb-3">
                                <label for="edit-trainer-experience" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-chart-line"></i> Experience
                                </label>
                                <textarea class="form-control" id="edit-trainer-experience" maxlength="500" required
                                    rows="3" style="resize: none; height: 80px;">${trainer.experience}</textarea>
                            </div>

                            <!-- Education -->
                            <div class="mb-3">
                                <label for="edit-trainer-education" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-graduation-cap"></i> Education
                                </label>
                                <textarea class="form-control" id="edit-trainer-education" maxlength="255" required
                                    rows="3" style="resize: none; height: 80px;">${trainer.education}</textarea>
                            </div>

                            <!-- Skills -->
                            <div class="mb-3">
                                <label for="edit-trainer-skills" class="form-label fw-semibold"
                                    style="font-size: 14px; color: #333;">
                                    <i class="fas fa-lightbulb"></i> Skills
                                </label>
                                <textarea class="form-control" id="edit-trainer-skills" maxlength="255" required
                                    rows="3" style="resize: none; height: 80px;">${trainer.skills}</textarea>
                            </div>

                            <!-- Error Alert -->
                            <div id="edit-trainer-error" class="alert alert-danger d-none" role="alert"
                                style="display: none; font-size: 14px; padding: 8px;">
                                <i class="fas fa-exclamation-circle"></i> An error occurred while updating the trainer
                                account. Please try again.
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-end gap-2 mt-3">
                                <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal"
                                    style="padding: 8px 16px; font-size: 14px;">
                                    <i class="fas fa-times"></i> Close
                                </button>
                                <button type="submit" id="edit-trainer-btn" class="btn btn-primary"
                                    style="padding: 8px 16px; font-size: 14px;">
                                    <i class="fas fa-check"></i> Confirm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <!-- Button trigger modal -->
        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#new-course-model">
            Launch demo modal
        </button> -->


        <style>
            /* New Trainer Account Modal Styling */
            #new-trainer-model .modal-content {
                border-radius: 10px;
                border: none;
                background: #f8f9fa;
            }

            #new-trainer-model .modal-header {
                background: #e9ecef;
                border-bottom: 1px solid #ddd;
                padding: 12px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            #new-trainer-model .modal-header h5 {
                font-size: 18px;
                color: #333;
                font-weight: bold;
            }

            #new-trainer-model .modal-body {
                padding: 20px;
            }

            #new-trainer-model textarea,
            #new-trainer-model input,
            #new-trainer-model select {
                border-radius: 8px;
                border: 1px solid #ced4da;
                padding: 10px;
                font-size: 14px;
            }

            #new-trainer-model textarea::placeholder,
            #new-trainer-model input::placeholder {
                color: #6c757d;
            }

            #new-trainer-model .input-group {
                border-radius: 8px;
                overflow: hidden;
            }

            #new-trainer-model .input-group .btn {
                border-radius: 0 8px 8px 0;
            }

            #new-trainer-model .alert {
                font-size: 14px;
                padding: 8px;
            }

            #new-trainer-model .modal-footer {
                background: #f1f1f1;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
                padding: 15px;
            }

            #new-trainer-model .btn-outline-secondary {
                border-radius: 20px;
            }

            #new-trainer-model .btn-primary {
                border-radius: 20px;
                font-weight: bold;
            }

            #new-trainer-model .form-label {
                font-size: 14px;
                color: #333;
                font-weight: 600;
            }

            #new-trainer-model .text-warning {
                font-size: 12px;
            }

            #new-trainer-model .d-flex.gap-2 {
                gap: 10px;
            }
        </style>

        <!-- Create New Course Model Modal -->
        <!-- The Modal -->
        <div class="modal fade" id="new-course-model" tabindex="-1" aria-labelledby="newCourseModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-xl">
                <!-- Extra Large Modal for 80% width -->
                <form class="modal-content" id="new-course-form">
                    <div class="modal-header">
                        <h5 class="modal-title w-100 text-center fs-4" id="newCourseModalLabel">Set up a Course</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row m-2">
                            <div class="col-lg-6 col-sm-12 position-relative">
                                <img src="static/media/images/course/thumbnail.png"
                                    class="img-thumbnail rounded-2 mx-auto d-block" id="new-thumbnail-img">
                                <button class="edit-btn position-absolute border rounded-2 bottom-0 end-0 m-3 me-4"
                                    id="edit-course-thumbnail-btn">
                                    <i class="fa-solid fa-pen"></i> add
                                </button>
                                <input type="file" id="new-course-thumbnail" class="d-none">
                            </div>
                            <div class="col-lg-6 col-sm-12">
                                <div class="mb-3 w-100 mt-2">
                                    <label for="new-course-title" class="form-label fw-medium">Course Title</label>
                                    <!-- <input type="text" > -->
                                    <textarea class="form-control fs-5 fw-bold" id="new-course-title"
                                        placeholder="Enter Course Title..." required maxlength="255"
                                        style="min-height: 100px;"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2">
                            <div class="col">
                                <div class="my-2 w-100">
                                    <label for="new-course-description" class="form-label fw-medium">Course
                                        Description</label>
                                    <textarea class="form-control" id="new-course-description"
                                        placeholder="Enter Course Description...    (add   #xyz #abc #www #something  ..... to enhance search)"
                                        required maxlength="5000" style="min-height: 100px;"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <div>
                                    <label for="new-feature" class="form-label fw-medium d-block">Course
                                        Features</label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" id="new-feature"
                                            placeholder="Enter a Feature..." aria-label="Search for courses">
                                        <button class="btn btn-outline-primary" type="button"
                                            id="new-feature-btn">Add</button>
                                    </div>
                                </div>
                                <div class="border rounded-2 overflow-y-scroll" style="min-height: 80px;height: 100px;"
                                    id="new-feature-list">
                                    <span class="d-block m-2 opacity-25">1. Example Feature 1</span>
                                    <span class="d-block m-2 opacity-25">2. Example Feature 2</span>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <div>
                                    <label for="new-coverd-topics" class="form-label fw-medium d-block">Covered
                                        Topics</label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" id="new-coverd-topics"
                                            placeholder="Enter a topic..." aria-label="Search for courses">
                                        <button class="btn btn-outline-primary" type="button"
                                            id="new-topic-add-btn">Add</button>
                                    </div>
                                </div>
                                <div class="border rounded-2" style="min-height: 80px;" id="new-topic-list">
                                    <span class="d-block m-2 opacity-25">1. Example Topic 1</span>
                                    <span class="d-block m-2 opacity-25">2. Example Topic 2</span>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <div>
                                    <label for="new-learning-outcomes" class="form-label fw-medium d-block">Learning
                                        Outcomes</label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" id="new-learning-outcomes"
                                            placeholder="Enter a learning outcome..." aria-label="Search for courses">
                                        <button class="btn btn-outline-primary" type="button"
                                            id="learning-outcome-btn">Add</button>
                                    </div>
                                </div>
                                <div class="border rounded-2" style="min-height: 80px;" id="learning-outcome-list">
                                    <span class="d-block m-2 opacity-25">1. Example outcome 1</span>
                                    <span class="d-block m-2 opacity-25">2. Example outcome 2</span>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <div>
                                    <label for="new-course-prereq"
                                        class="form-label fw-medium d-block">Prerequisits</label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" id="new-course-prereq"
                                            placeholder="Enter a Prerequisits..." aria-label="Search for courses">
                                        <button class="btn btn-outline-primary" type="button"
                                            id="new-course-preq-btn">Add</button>
                                    </div>
                                </div>
                                <div class="border rounded-2" style="min-height: 80px;" id="prereq-list">
                                    <span class="d-block m-2 opacity-25">1. Example Prerequisits 1</span>
                                    <span class="d-block m-2 opacity-25">2. Example Prerequisits 2</span>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <div>
                                    <label for="new-course-pdf" class="form-label">Upload Course PDF</label>
                                    <input class="form-control" type="file" id="new-course-pdf"
                                        accept="application/pdf">
                                </div>
                            </div>
                        </div>

                        <div class="row m-2">
                            <div class="col">
                                <div class="my-2 w-100">
                                    <label for="new-course-certification"
                                        class="form-label fw-medium">Certification</label>
                                    <textarea class="form-control" id="new-course-certification"
                                        placeholder="Enter Certification ... type (if not any certification ignone)"
                                        required maxlength="255" style="min-height: 60px;"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2">
                            <div class="col">
                                <div class="my-2 w-100">
                                    <label for="new-course-refund-policy" class="form-label fw-medium">Refund
                                        Policy</label>
                                    <textarea class="form-control" id="new-course-refund-policy"
                                        placeholder="Enter refund policy ... type (if not any policy ignone it)"
                                        required maxlength="255" style="min-height: 60px;"></textarea>
                                </div>
                            </div>
                        </div>


                        <div class="row m-2">
                            <div class="col">
                                <label for="new-course-level" class="form-label fw-medium d-block">Course Level</label>
                                <div class="input-group">
                                    <label class="input-group-text" for="new-course-level">select</label>
                                    <select class="form-select" name="level" id="new-course-level">
                                        <option value="1" selected>select level</option>
                                        <option value="2">Basic</option>
                                        <option value="3">Intermediate</option>
                                        <option value="4">Advanced</option>
                                        <option value="5">Basic to intermediate</option>
                                        <option value="6">Basic to Advanced</option>
                                        <option value="7">Intermediate to Advanced</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <label for="new-course-recomended-comp" class="form-label fw-medium d-block">Recomended
                                    Completion Time</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="new-course-recomended-comp"
                                        placeholder="Enter number" aria-label="Number">
                                    <select class="form-select" id="new-course-recomended-comp-type"
                                        style="width: 100px;">
                                        <option selected value="days">Days</option>
                                        <option value="months">Months</option>
                                        <option value="years">Years</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row m-2 mt-3">
                            <div class="col">
                                <label for="new-course-price" class="form-label fw-medium d-block">Course Price</label>
                                <div class="input-group">
                                    <span class="input-group-text">&#8377;</span>
                                    <input type="number" id="new-course-price" class="form-control"
                                        aria-label="Dollar amount (with dot and two decimal places)">
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="modal-footer d-flex justify-content-between">
                        <span>
                            <div class="alert alert-dark d-none" role="alert" id="new-course-alert">
                                A simple dark alert—check it out!
                            </div>
                        </span>
                        <span>
                            <button type="reset" class="btn btn-outline-secondary rounded-4" data-bs-dismiss="modal"
                                id="new-course-close">Close</button>
                            <button type="button" class="btn btn-outline-success rounded-4"
                                id="new-course-submit-btn">Add</button>
                        </span>
                    </div>
                </form>
            </div>
        </div>




        <script>
            function toggleSidebar() {
                document.getElementById("sidebar").classList.toggle("show");
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/trainer.js"></script>
        <script src="static/js/newcourse.js"></script>

    </body>

    </html>