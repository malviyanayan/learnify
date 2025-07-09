// Profile Picture Upload
let inputProfilePic = document.getElementById("input-profile-pic");
let inputPicBtn = document.getElementById("input-pic-btn");
let profileUploadPic = document.getElementById("profile_upload_pic");
let uploadConfirm = document.getElementById("upload-confirm");

inputPicBtn.addEventListener("click", (e) => {
  e.preventDefault();
  inputProfilePic.click();
});

inputProfilePic.addEventListener("change", (event) => {
  event.preventDefault();
  const file = event.target.files[0];

  if (file) {
    const reader = new FileReader();
    reader.onload = (event) => {
      profileUploadPic.src = event.target.result;
      uploadConfirm.removeAttribute("disabled");
    };
    reader.readAsDataURL(file);
  }
});

uploadConfirm.addEventListener("click", (e) => {
  e.preventDefault();
  let formData = new FormData();
  formData.append("pic", inputProfilePic.files[0]);

  postImage("upload_profile_pic.do", formData)
    .then((data) => {
      if (data === "true") window.location = "profile.do";
      else if (data === "signin") window.location = "getstarted.do";
      else console.log(data);
    })
    .catch((error) => console.log("Error : " + error));
});

// Function to send data via POST
async function postData(url, params) {
  let response = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: params,
  });
  return await response.text();
}

// Function to send image via POST
async function postImage(url, params) {
  let response = await fetch(url, { method: "POST", body: params });
  return await response.text();
}

// Edit Name
let editNameModel = new bootstrap.Modal(document.getElementById("edit-name-model"));
let editName = document.getElementById("edit-name");
let editNameBtn = document.getElementById("edit-name-btn");

editNameBtn.addEventListener("click", (e) => {
  console.log("Edit Name Button Clicked...");
  e.preventDefault();
  editName.value = document.getElementById("my-name").innerText;
  editNameModel.show();
});

document.getElementById("edit-name-confirm").addEventListener("click", (e) => {
  e.preventDefault();
  let params = "name=" + editName.value + "&change=name";

  postData("edit.do", params)
    .then((data) => {
      if (data === "true") window.location = "profile.do";
      else if (data === "signin") window.location = "signup.do";
      else console.log("Please...Enter Valid Name...");
    })
    .catch((error) => console.log("Error : " + error));
});

// Edit Gender
let editGender = document.getElementById("edit-gender");

document.getElementById("edit-gender-btn").addEventListener("click", (e) => {
  e.preventDefault();
  let gender = document.getElementById("gender").innerText.trim();
  if(gender == "")editGender.value = "N";
  else if(gender == "Male")editGender.value = "M";
  else if(gender == "Female")editGender.value = "F";
  else editGender.value = "O";
});

document.getElementById("confirm-gender").addEventListener("click", (e) => {
  e.preventDefault();
  let params = "gender=" + editGender.value + "&change=gender";

  postData("edit.do", params)
    .then((data) => {
      if (data === "true") window.location = "profile.do";
      else if (data === "signin") window.location = "signup.do";
      else console.log("Please...Enter Valid Gender...");
    })
    .catch((error) => console.log("Error : " + error));
});

// Edit DOB
let editDobModel = new bootstrap.Modal(document.getElementById("edit-dob-model"));
let dob = document.getElementById("dob");
let editDobBtn = document.getElementById("edit-dob-btn");
let editDob = document.getElementById("edit-dob");

editDobBtn.addEventListener("click", (e) => {
  e.preventDefault();
  let tempdob = dob.innerText.trim();
  if (tempdob !== "--") editDob.value = tempdob;
  else console.log("Data Not Set Yet....");
});

document.getElementById("dob-confirm").addEventListener("click", (e) => {
  e.preventDefault();
  let params = "dob=" + editDob.value + "&change=dob";

  postData("edit.do", params)
    .then((data) => {
      if (data === "true") window.location = "profile.do";
      else if (data === "signin") window.location = "signup.do";
      else console.log("Please...Enter Valid DOB...");
    })
    .catch((error) => console.log("Error : " + error));
});

// Edit About Me
let editAboutMeModel = new bootstrap.Modal(document.getElementById("about-me-model"));
let aboutMe = document.getElementById("about-me");
let aboutTextArea = document.getElementById("about_text_area");

document.getElementById("edit_about_me_btn").addEventListener("click", (e) => {
  e.preventDefault();
  aboutTextArea.value = aboutMe.innerText;
  editAboutMeModel.show();
});

document.getElementById("about-confirm").addEventListener("click", (e) => {
  e.preventDefault();
  let params = "aboutme=" + aboutTextArea.value + "&change=aboutme";

  postData("edit.do", params)
    .then((data) => {
      if (data === "true") window.location = "profile.do";
      else if (data === "signin") window.location = "signup.do";
      else console.log("Please...Enter Valid About Me...");
    })
    .catch((error) => console.log("Error : " + error));
});


// Edit Gender
let editCountry = document.getElementById("edit-country");

// document.getElementById("edit-country-btn").addEventListener("click", (e) => {
//   e.preventDefault();
  
// });

document.getElementById("confirm-country").addEventListener("click", (e) => {
  e.preventDefault();
  let params = "country=" + editCountry.value + "&change=country";

  postData("edit.do", params)
    .then((data) => {
      if (data === "true") window.location = "profile.do";
      else if (data === "signin") window.location = "getstarted.do";
      else console.log("Please...Enter Valid Country...");
    })
    .catch((error) => console.log("Error : " + error));
});
