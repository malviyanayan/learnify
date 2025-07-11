<%@ page import="models.User" %>


    <% User user=(User)session.getAttribute("user"); if(user==null){ response.sendRedirect("index.do"); } %>

        <!-- response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate" ); // HTTP 1.1
            response.setHeader("Pragma", "no-cache" ); // HTTP 1.0 for old servers response.setHeader("Expires", "0" );
            // for proxies server %> -->



        <style>
            .selected {
                background-color: #0056b3 !important;
                /* Dark Blue */
                color: white !important;
                font-weight: bold;
                border-left: 5px solid #ffc107;
                /* Yellow Highlight */
                border-radius: 5px;
                box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease-in-out;
            }

            .selected:hover {
                background-color: #003f7f !important;
                /* Darker Shade on Hover */
                border-left: 5px solid #ffeb3b;
                /* Lighter Yellow */
            }
        </style>
        <script src="static/js/backbtn.js"></script>


        <div class="left-panel z-3" id="sidebar">
            <div class="logo-container mb-3 d-flex justify-content-between align-items-center">
                <a href="index.do"><img src="static/media/images/logo.png" alt="LOGO"></a>

                <!-- Close Icon (Mobile Only) -->
                <button class="btn-close-sidebar btn border shadow" id="left-sdbr-clg-btn" onclick="toggleSidebar()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-x">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M18 6L6 18" />
                        <path d="M6 6l12 12" />
                    </svg>
                </button>
            </div>


            <div class="user-box m-3">
                <img src="profile_pic.do" alt="USER">
                <div class="user-info">
                    <h6>${user.name}</h6>
                    <small>Created on 12 July 2025</small>
                </div>
            </div>

            <div class="container-fluid mt-3 h-50 d-flex flex-column">
                <a href="dashboard.do"
                    class="btn btn-light w-100 mb-2 ps-4 text-start d-flex align-items-center shadow-sm ${target eq 'dash' ? 'selected' : ''}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-briefcase-2">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M3 9a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v9a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-9z" />
                        <path d="M8 7v-2a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v2" />
                    </svg>
                    <span class="ms-3 fw-semibold">My Courses</span>
                </a>

                <a href="activity.do"
                    class="btn btn-light w-100 mb-2 ps-4 text-start d-flex align-items-center shadow-sm ${target eq 'act' ? 'selected' : ''}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-history">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M12 8l0 4l2 2" />
                        <path d="M3.05 11a9 9 0 1 1 .5 4m-.5 5v-5h5" />
                    </svg>
                    <span class="ms-3 fw-semibold">Activity Log</span>
                </a>

                <!-- <a href="messages.do" class="btn btn-light w-100 mb-2 ps-4 text-start d-flex align-items-center shadow-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icon-tabler-message">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                            <path d="M8 9h8" />
                            <path d="M8 13h6" />
                            <path d="M18 4a3 3 0 0 1 3 3v8a3 3 0 0 1 -3 3h-5l-5 3v-3h-2a3 3 0 0 1 -3 -3v-8a3 3 0 0 1 3 -3h12z" />
                        </svg>
                        <span class="ms-3 fw-semibold">Messages</span>
                    </a> -->

                <a href="trainer.do"
                    class="btn btn-light w-100 mb-2 ps-4 text-start d-flex align-items-center shadow-sm ${target eq 'trnr' ? 'selected' : ''}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-school">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M22 9l-10 -4l-10 4l10 4l10 -4v6" />
                        <path d="M6 10.6v5.4a6 3 0 0 0 12 0v-5.4" />
                    </svg>
                    <span class="ms-3 fw-semibold">Trainer</span>
                </a>

                <a href="profile.do"
                    class="btn btn-light w-100 mb-2 ps-4 text-start d-flex align-items-center shadow-sm ${target eq 'prfl' ? 'selected' : ''}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-user-circle">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" />
                        <path d="M12 10m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" />
                        <path d="M6.168 18.849a4 4 0 0 1 3.832 -2.849h4a4 4 0 0 1 3.834 2.855" />
                    </svg>
                    <span class="ms-3 fw-semibold">My Profile</span>
                </a>

                <hr>

                <a href="logout.do"
                    class="btn btn-outline-danger text-dark w-100 btn-sm ps-4 text-start d-flex align-items-center shadow-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-logout-2">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M10 8v-2a2 2 0 0 1 2 -2h7a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-7a2 2 0 0 1 -2 -2v-2" />
                        <path d="M15 12h-12l3 -3" />
                        <path d="M6 15l-3 -3" />
                    </svg>
                    <span class="ms-3 fw-semibold">Log Out</span>
                </a>

                <button
                    class="btn btn-outline-info text-dark w-100 btn-sm ps-4 text-start d-flex align-items-center shadow-sm mt-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icon-tabler-help">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" />
                        <path d="M12 17l0 .01" />
                        <path d="M12 13.5a1.5 1.5 0 0 1 1 -1.5a2.6 2.6 0 1 0 -3 -4" />
                    </svg>
                    <span class="ms-3 fw-semibold">Help</span>
                </button>

            </div>

        </div>


        <script src="static/js/leftsidebar.js" defer></script>