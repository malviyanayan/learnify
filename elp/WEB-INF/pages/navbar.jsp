<link rel="stylesheet" href="static/css/navbar.css">

<nav class="navbar navbar-expand-lg bg-white shadow-sm fixed-top py-2">
    <div class="container-fluid px-3">
        <!-- Brand Logo -->
        <a class="navbar-brand" href="index.do">
            <img src="static/media/images/logo.png" height="50" alt="Learnify">
        </a>

        <!-- Navbar Toggler -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars fs-4"></i>
        </button>

        <!-- Navbar Links & Search -->
        <div class="collapse navbar-collapse justify-content-between align-items-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link ${nav_active eq 'home' ? 'active' : ''}" href="index.do">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${nav_active eq 'courses' ? 'active' : ''}" href="courses.do">Courses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${nav_active eq 'about' ? 'active' : ''}" href="about_us.do">About Us</a>
                </li>
            </ul>

            <!-- Search Box (Improved Design) -->
            <form class="d-flex flex-grow-1 mx-3 search-items-navbar">
                <div class="input-group shadow-sm w-100"
                    style="border-radius: 30px; background: white; overflow: hidden;">
                    <input class="form-control border-0 px-4 py-2" type="search" placeholder="Search Courses..." autocomplete="off"
                        id="search-input" aria-label="search" style="border-radius: 30px 0 0 30px; box-shadow: none; font-size: 18px; font-weight: 600; 
                   font-family: 'Poppins', sans-serif; letter-spacing: 0.5px; color: #3d3b3b;">
                    <button class="btn btn-success text-white px-4 py-2" id="search-btn"
                        style="border-radius: 0 30px 30px 0; transition: 0.3s;">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>


            <!-- User Profile / Get Started -->
            <% if(user !=null) { %>
                <button class="btn p-0 ms-3" style="border: none;" data-bs-toggle="offcanvas"
                    data-bs-target="#dashboard-offcanvas">
                    <img src="profile_pic.do" alt="USER" width="45" height="45"
                        class="border p-1 rounded-circle border-secondary shadow-sm">
                </button>
                <% } else { %>
                    <a href="get_started.do" class="btn btn-primary fw-medium rounded-4 ms-3 px-3 py-2">
                        Get Started <i class="fas fa-arrow-right ms-1"></i>
                    </a>
                    <% } %>
        </div>
    </div>
</nav>

<!-- User Dashboard Offcanvas -->
<% if(user !=null){ %>
    <div class="offcanvas offcanvas-end rounded-3" style="width: 230px; max-height: 360px;" tabindex="-1"
        id="dashboard-offcanvas">
        <div class="offcanvas-header py-2 border-bottom">
            <h6 class="offcanvas-title fw-bold">My Account</h6>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body text-center p-3">
            <!-- Profile Section -->
            <div class="mb-2">
                <img src="profile_pic.do" alt="Profile" class="border p-1 rounded-circle shadow-sm" width="50">
                <p class="mt-1 account-name fw-semibold mb-1">${user.name}</p>
                <small class="text-muted">${user.email}</small>
            </div>

            <!-- Navigation Links -->
            <div class="d-grid gap-2 mt-3">
                <a href="dashboard.do" class="btn btn-outline-secondary py-2 d-flex align-items-center">
                    <i class="fas fa-chart-line me-2"></i> Dashboard
                </a>
                <a href="mycarts.do" class="btn btn-outline-secondary py-2 d-flex align-items-center">
                    <i class="fas fa-shopping-cart me-2"></i> My Carts
                </a>
                <a href="logout.do" class="btn btn-outline-danger py-2 d-flex align-items-center">
                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                </a>
            </div>
        </div>
    </div>
    <% } %>