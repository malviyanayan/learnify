let wishItems = null;
let allCourses = null;

async function getData(url) {
  let response = await fetch(url, {
    method: "GET",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
  });
  return await response.text();
}

function isCourseInWishlist(courseId) {
  if (!wishItems) return false;
  return wishItems.some((item) => item.course.courseId === courseId);
}

function addCourse(course) {
  // Course card ka parent container dhundhna
  let courseContainer = document.getElementById("course-container");

  // Naya course card banayenge
  let courseCard = document.createElement("div");
  courseCard.className = "col-12 col-md-6 col-lg-4 mb-3";

  // Course link wrapper
  let courseLink = document.createElement("a");
  courseLink.href = `show_course.do?course=${course.courseId}`;
  courseLink.className = "text-decoration-none text-dark";

  // Card
  let card = document.createElement("div");
  card.className = "card shadow-sm border-0 rounded-3 course-card";

  // Thumbnail Image
  let img = document.createElement("img");
  img.src = `get_image.do?type=thumbnail&course=${course["courseId"]}&img=${course["thumbnail"]}`;
  img.className = "card-img-top";
  img.alt = "Course Thumbnail";
  card.appendChild(img);

  // Card Body
  let cardBody = document.createElement("div");
  cardBody.className = "card-body d-flex flex-column";

  // Course Title
  let title = document.createElement("h6");
  title.className = "card-title";
  title.innerText = course.courseName;
  cardBody.appendChild(title);

  // Trainer Name & Rating
  let trainerRatingDiv = document.createElement("div");
  trainerRatingDiv.className =
    "d-flex justify-content-between align-items-center";

  let trainer = document.createElement("p");
  trainer.className = "text-muted small mb-0";
  trainer.innerText = `Trainer: ${course.trainer.trainerName}`;

  let ratingDiv = document.createElement("div");
  ratingDiv.className = "rating text-warning";

  // Dynamic rating stars
  let ratingValue = course.rating || 4.7; // Default rating
  let fullStars = Math.floor(ratingValue);
  let halfStar = ratingValue % 1 !== 0 ? "&#9734;" : ""; // Half star logic
  let starsHTML =
    "&#9733;".repeat(fullStars) + halfStar + "&#9734;".repeat(5 - fullStars);
  ratingDiv.innerHTML = `${starsHTML} <span class='text-dark'>(${ratingValue.toFixed(
    1
  )})</span>`;

  trainerRatingDiv.appendChild(trainer);
  trainerRatingDiv.appendChild(ratingDiv);
  cardBody.appendChild(trainerRatingDiv);

  // Price & Discount Section
  let priceDiscountDiv = document.createElement("div");
  priceDiscountDiv.className =
    "d-flex justify-content-between align-items-center mb-2";

  let discountedPrice = course.price - course.discount;
  let discountPercentage =
    course.price > 0 ? Math.round((course.discount / course.price) * 100) : 0;

  let price = document.createElement("span");
  price.className = "text-success fw-bold";
  price.innerHTML = `&#8377;${discountedPrice} <del class="text-danger small">&#8377;${course.price}</del>`;

  let discount = document.createElement("span");
  discount.className = "badge bg-info text-dark";
  discount.innerText = `${discountPercentage}% Off`;

  priceDiscountDiv.appendChild(price);
  priceDiscountDiv.appendChild(discount);
  cardBody.appendChild(priceDiscountDiv);

  // Buttons Container
  let buttonContainer = document.createElement("div");
  buttonContainer.className = "mt-auto d-flex justify-content-between";

  let wishlistBtn = document.createElement("button");
  wishlistBtn.className = "btn btn-sm";

  // wishlist ka dekhna padega....
  if (isCourseInWishlist(course.courseId))
    wishlistBtn.classList.add("btn-danger");
  else wishlistBtn.classList.add("btn-outline-danger");
  // #### ----------------
  wishlistBtn.innerHTML = `<i class="fa-solid fa-heart me-1"></i>Wish`;
  wishlistBtn.id = `w-${course["courseId"]}`;

  let buttonGroup = document.createElement("div");
  buttonGroup.className = "d-flex gap-2";

  let cartBtn = document.createElement("button");
  cartBtn.className = "btn btn-outline-info btn-sm";
  cartBtn.innerHTML = `<i class="fa-solid fa-cart-shopping me-1"></i>Cart`;
  cartBtn.id = `c-${course["courseId"]}`;

  let buyBtn = document.createElement("button");
  buyBtn.className = "btn btn-outline-success btn-sm";
  buyBtn.innerHTML = `<i class="fa-solid fa-credit-card me-1"></i>Buy`;
  buyBtn.id = `b-${course["courseId"]}`;

  buttonGroup.appendChild(cartBtn);
  buttonGroup.appendChild(buyBtn);

  buttonContainer.appendChild(wishlistBtn);
  buttonContainer.appendChild(buttonGroup);

  cardBody.appendChild(buttonContainer);
  card.appendChild(cardBody);
  courseLink.appendChild(card);
  courseCard.appendChild(courseLink);
  courseContainer.appendChild(courseCard);
}

function loadCourses(params) {
  getData(params)
    .then((data) => {
      let courses = JSON.parse(data);
      allCourses = courses;
      let courseContainer = document.getElementById("course-container");
      courseContainer.innerHTML = "";
      document.getElementById("sort-select").value = "default";
      for (let course of courses) {
        addCourse(course);
      }
    })
    .catch((error) => {
      console.log("Error : " + error);
    });
}

function loadWishList() {
  let temp = getData("my_wishlist.do");
  temp
    .then((data) => {
      wishItems = JSON.parse(data);
      loadCourses("get_courses.do?type=popular&target=course");
    })
    .catch((error) => {
      console.log("Error : " + error);
    });
}

loadWishList();

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

document.addEventListener("click", (event) => {
  let target = event.target;

  let work = target.id.split("-")[0];
  let courseId = target.id.split("-")[1];

  if (work === "w") {
    event.preventDefault();
    if (event.target.classList.contains("btn-outline-danger")) {
      let params =
        "target=course&course-id=" + courseId + "&act-on=wishlist&task=add";
      simplePost("event.do", params).then((data) => {
        if (data === "true") {
          event.target.classList.remove("btn-outline-danger");
          event.target.classList.add("btn-danger");
        } else if (data === "signin") {
          alert("Please Singin/SignUp");
        } else {
          console.log(data);
        }
      });
    } else {
      let params =
        "target=course&course-id=" + courseId + "&act-on=wishlist&task=remove";
      simplePost("event.do", params).then((data) => {
        if (data === "true") {
          event.target.classList.remove("btn-danger");
          event.target.classList.add("btn-outline-danger");
        } else if (data === "signin") {
          alert("Please Singin/SignUp");
        } else {
          console.log(data);
        }
      });
    }
  } else if (work === "c") {
    event.preventDefault();
    alert("Added to Cart : " + courseId);
  } else if (work === "b") {
    event.preventDefault();
    let params =
      "target=course&course-id=" + courseId + "&act-on=carts&task=add";
    simplePost("event.do", params).then((data) => {
      if (data === "true") {
        window.location.href = "mycarts.do";
      } else if (data === "signin") {
        alert("Please Singin/SignUp");
      } else {
        console.log(data);
      }
    });
  }
});

// ######################### Course Searching Functionalities #############
document.getElementById("search-btn").addEventListener("click", (e) => {
  e.preventDefault();
  let searchText = document.getElementById("search-input").value;
  let params = "get_courses.do?type=popular&target=course&search=" + searchText;
  loadCourses(params);
});

// ######################### courses sorting functionalities #########################
function compare(a, b) {
  if (a.price < b.price) {
    return -1;
  }
  if (a.price > b.price) {
    return 1;
  }
  return 0;
}

function descCompare(a, b) {
  if (b.price < a.price) {
    return -1;
  }
  if (b.price > a.price) {
    return 1;
  }
  return 0;
}

let sortselect = document.getElementById("sort-select");
sortselect.addEventListener("change", (e) => {
  e.preventDefault();
  if (sortselect.value === "price_low_high") {
    allCourses.sort(compare);
  } else {
    allCourses.sort(descCompare);
  }

  let courseContainer = document.getElementById("course-container");
  courseContainer.innerHTML = "";
  for (let course of allCourses) {
    addCourse(course);
  }
});
