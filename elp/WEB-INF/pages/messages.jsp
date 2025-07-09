<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Messages - (Learnify)</title>
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
                <div class="row justify-content-between">
                    <div class="col-5 col-md-6 col-sm-7">
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search Messages..."
                                aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>

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
                        <button class="nav-link active" id="messages-tab" data-bs-toggle="tab"
                            data-bs-target="#messages" type="button" role="tab" aria-controls="messages"
                            aria-selected="true">Messages</button>
                    </li>
                </ul>
                <div class="tab-content overflow-y-scroll" id="myTabContent"
                    style="min-height: 300px;max-height: 370px;">
                    <div class="tab-pane fade show active gap-3" id="messages" role="tabpanel"
                        aria-labelledby="messages">
                        <div class="list-group">
                            <!-- Contact 1 -->
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center gap-3">
                                <img src="static/media/images/user.png" class="rounded-circle" alt="User" width="50" height="50">
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-0">John Doe</h6>
                                        <small class="text-muted">10:45 AM</small>
                                    </div>
                                    <p class="text-muted small mb-0">You: Thanks for your help! 😊</p>
                                </div>
                            </a>
                        
                            <!-- Contact 2 -->
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center gap-3">
                                <img src="static/media/images/user.png" class="rounded-circle" alt="User" width="50" height="50">
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-0">AI Assistant</h6>
                                        <small class="text-muted">Yesterday</small>
                                    </div>
                                    <p class="text-muted small mb-0">AI: Sure! Here’s an example of recursion...</p>
                                </div>
                            </a>
                        
                            <!-- Contact 3 -->
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center gap-3">
                                <img src="static/media/images/user.png" class="rounded-circle" alt="User" width="50" height="50">
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-0">Elena Smith</h6>
                                        <small class="text-muted">Sunday</small>
                                    </div>
                                    <p class="text-muted small mb-0">Elena: Let’s schedule a meeting...</p>
                                </div>
                            </a>
                        </div>
                        
                    </div>

                </div>

                
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