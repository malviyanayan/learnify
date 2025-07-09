/**
 * Reloads the page if it was reloaded from cache.
 * This ensures that the page is always loaded fresh.
 * 
 * Redirects to "index.jsp" when the page is shown from the back/forward cache.
 * This handles the scenario when the user navigates back to the page using the browser's "Back" button.
 */
// reload cache on page reload
window.onload = function () {
  if (performance.navigation.type === 2) {
    // if page reloaded from cache
    location.reload(true);
  }
};

window.onpageshow = function (event) {
  if (event.persisted) {
    window.location.href = "index.do";
  }
};
