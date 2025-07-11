function handleMenuBtnDisplay() {
                    const menuBtn = document.getElementById("menu-btn-lft-sdbr");
                    const leftSidebarBtn = document.getElementById("left-sdbr-clg-btn");
                    if (window.innerWidth > 780) {
                        if (menuBtn) menuBtn.style.visibility = "hidden";
                        if (leftSidebarBtn) leftSidebarBtn.style.visibility = "hidden";
                    } else {
                        if (menuBtn) menuBtn.style.visibility = "visible";
                        if (leftSidebarBtn) leftSidebarBtn.style.visibility = "visible";
                    }
                }

                window.addEventListener("resize", handleMenuBtnDisplay);
                window.addEventListener("DOMContentLoaded", handleMenuBtnDisplay);