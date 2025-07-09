let selectLectureBtn = document.getElementById("select-new-lecture");
let newLectureInput = document.getElementById("new-lecture-input");
let videoPreview = document.getElementById("new-lecture-preview");

selectLectureBtn.addEventListener("click", (e) => {
  e.preventDefault();
  newLectureInput.click();
});

async function postData(url, params) {
  let response = await fetch(url, {
    method: "POST",
    body: params, // FormData directly pass kar raha hai
  });

  return await response.text();
}

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

newLectureInput.addEventListener("change", function () {
  let file = newLectureInput.files[0];
  if (file) {
    let url = URL.createObjectURL(file);
    videoPreview.src = url;
    videoPreview.onloadedmetadata = function () {
      document.getElementById("new-duration").value =
        videoPreview.duration.toFixed(2); // Show duration in seconds
    };
  }
});

document.getElementById("lecture-upload").addEventListener("click", (e) => {
  e.preventDefault();

  let formData = new FormData();

  // lecture upload
  let lecture = newLectureInput.files[0];
  formData.append("lecture", lecture);
  let title = document.getElementById("new-lecture-title").value;
  formData.append("title", title);
  let topicId = document.getElementById("topic-id").value;
  let courseId = document.getElementById("course-id").value;
  let duration = document.getElementById("new-duration").value;
  formData.append("course-id", courseId);
  formData.append("topic-id", topicId);
  formData.append("duration", duration);

  if (!topicId) {
    alert("Please Add Any topic before adding lecture....");
  } else {
    postData("upload-lecture.do", formData)
      .then((data) => {
        if (data === "login") {
          window.location = "index.do";
        } else if (data === "true") {
          location.reload();
        } else {
          console.log(data);
        }
      })
      .catch((error) => {
        console.log("Error : " + error);
      });
  }
});

document.getElementById("add-topic-btn").addEventListener("click", (e) => {
  e.preventDefault();
  let topicName = "" + document.getElementById("new-topic-name").value;
  let courseId = "" + document.getElementById("new-topic-course-id").value;
  courseId = courseId.trim();

  let params = "topic=" + topicName + "&course_id=" + courseId;
  console.log(params);

  simplePost("add_topic.do", params)
    .then((data) => {
      if (data === "true") {
        location.reload();
      } else if (data === "login") {
        window.location = "index.do";
      } else {
        console.log(data);
      }
    })
    .catch((error) => {
      console.log("Error : " + error);
    });
});

document.getElementById("change-status-btn").addEventListener("click", (e) => {
  e.preventDefault();
  let statusId = document.getElementById("new-status-id").value;
  let courseId = document.getElementById("change-status-course-id").value;
  // alert(statusId + "-" + courseId)
  let params =
    "target=" + "course" + "&status-id=" + statusId + "&course-id=" + courseId;
  simplePost("change_status.do", params)
    .then((data) => {
      if (data === "true") {
        location.reload();
      } else if (data === "login") {
        window.location = "index.do";
      } else {
        alert(data);
      }
    })
    .catch((error) => {
      console.log("Error : " + error);
    });
});

let courseBox = document.getElementById("course-box");
let backToBox = document.getElementById("back-to-course");
let lectureBox = document.getElementById("lecture-box");
let viewCourse = document.getElementById("view-course-btn");

viewCourse.addEventListener("click", (e) => {
  e.preventDefault();
  courseBox.style.display = "block";
  lectureBox.style.display = "none";
});

backToBox.addEventListener("click", (e) => {
  e.preventDefault();
  lectureBox.style.display = "block";
  courseBox.style.display = "none";
});

// Edit Course code starts ----------------------------

let editTargetBtn = document.getElementById("edit-target-btn");
let changeTarget = document.getElementById("change-target");

function disableAll() {
  document.getElementById("edit-discount-box").classList.add("d-none");
  document.getElementById("add-pdf-box").classList.add("d-none");
  document.getElementById("certification-box").classList.add("d-none");
  document.getElementById("edit-price-box").classList.add("d-none");
  document.getElementById("edit-course-level-box").classList.add("d-none");
  document.getElementById("refund-policy-box").classList.add("d-none");
  document.getElementById("edit-description-box").classList.add("d-none");
  document.getElementById("edit-title-box").classList.add("d-none");
  document.getElementById("covered-topics-box").classList.add("d-none");
  document.getElementById("course-features-section").classList.add("d-none");
  document.getElementById("learning-outcomes-section").classList.add("d-none");
  document.getElementById("prerequisites-section").classList.add("d-none");
  document.getElementById("course-validity-box").classList.add("d-none");
}

document.getElementById("add-discount-btn").addEventListener("click", () => {
  editTargetBtn.value = "1";
  changeTarget.innerText = "Add Discount";
  disableAll();
  document.getElementById("edit-discount-box").classList.remove("d-none");
});
document.getElementById("add-new-pdf-btn").addEventListener("click", () => {
  editTargetBtn.value = "2";
  changeTarget.innerText = "Add New PDF";
  disableAll();
  document.getElementById("add-pdf-box").classList.remove("d-none");
});
document
  .getElementById("edit-certification-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "3";
    changeTarget.innerText = "Edit Certification";
    disableAll();
    document.getElementById("certification-box").classList.remove("d-none");
  });
document.getElementById("change-price-btn").addEventListener("click", () => {
  editTargetBtn.value = "4";
  changeTarget.innerText = "Change Price";
  disableAll();
  document.getElementById("edit-price-box").classList.remove("d-none");
});
document
  .getElementById("change-course-level-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "5";
    changeTarget.innerText = "Change Course Level";
    disableAll();
    document.getElementById("edit-course-level-box").classList.remove("d-none");
  });
document
  .getElementById("change-covered-topics-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "6";
    changeTarget.innerText = "Edit Topics";
    disableAll();
    document.getElementById("covered-topics-box").classList.remove("d-none");
  });
document
  .getElementById("change-description-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "7";
    changeTarget.innerText = "Edit Description";
    disableAll();
    document.getElementById("edit-description-box").classList.remove("d-none");
  });
document.getElementById("change-features-btn").addEventListener("click", () => {
  editTargetBtn.value = "8";
  changeTarget.innerText = "Edit Features";
  disableAll();
  document.getElementById("course-features-section").classList.remove("d-none");
});
document
  .getElementById("change-learning-outcome-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "9";
    changeTarget.innerText = "Edit Learning Outcomes";
    disableAll();
    document
      .getElementById("learning-outcomes-section")
      .classList.remove("d-none");
  });

document
  .getElementById("change-prerequeisits-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "10";
    changeTarget.innerText = "Edit Prerequisites";
    disableAll();
    document.getElementById("prerequisites-section").classList.remove("d-none");
  });
document.getElementById("completion-time-btn").addEventListener("click", () => {
  editTargetBtn.value = "11";
  changeTarget.innerText = "Edit Course Validity";
  disableAll();
  document.getElementById("course-validity-box").classList.remove("d-none");
});
document
  .getElementById("change-refund-policy-btn")
  .addEventListener("click", () => {
    editTargetBtn.value = "12";
    changeTarget.innerText = "Edit Refund Policy";
    disableAll();
    document.getElementById("refund-policy-box").classList.remove("d-none");
  });
document.getElementById("change-title-btn").addEventListener("click", () => {
  editTargetBtn.value = "13";
  changeTarget.innerText = "Edit Course Title";
  disableAll();
  document.getElementById("edit-title-box").classList.remove("d-none");
});

document.getElementById("evaluate-btn").addEventListener("click", function () {
  let discount = document.querySelector("#new-discount-input").value;
  let discountType = document.querySelector("#new-discount-type").value;
  let originalPrice = document.getElementById("original-price").innerText;

  originalPrice = parseFloat(originalPrice.replace(/[^0-9.-]+/g, ""));

  let finalPrice;

  if (discountType == "1") {
    finalPrice = originalPrice - discount; // Fixed Amount Discount
  } else {
    finalPrice = originalPrice - originalPrice * (discount / 100); // Percentage Discount
  }

  if (finalPrice < 0) finalPrice = 0;

  document.getElementById("discounted-price").innerHTML = `${finalPrice.toFixed(
    2
  )}`;
});

document
  .getElementById("select-pdf-btn")
  .addEventListener("click", function () {
    document.getElementById("pdf-file-input").click();
  });

document
  .getElementById("pdf-file-input")
  .addEventListener("change", function (event) {
    let file = event.target.files[0];
    if (file) {
      document.getElementById("pdf-file-name").value = file.name;
    } else {
      document.getElementById("pdf-file-name").value = "No file selected";
    }
  });

document.addEventListener("DOMContentLoaded", function () {
  const topicInput = document.getElementById("new-topic");
  const addTopicBtn = document.getElementById("add-new-topic-btn");
  const topicsList = document.getElementById("topics-list");

  // Function to add a new topic
  addTopicBtn.addEventListener("click", function () {
    const topicText = topicInput.value.trim();
    if (topicText === "" || coveredTopics.includes(topicText)) return;

    coveredTopics.push(topicText); // Add to array

    const topicDiv = document.createElement("div");
    topicDiv.className =
      "alert alert-secondary d-flex justify-content-between align-items-center topic-item";
    topicDiv.role = "alert";
    topicDiv.innerHTML = `${topicText} <button class="btn btn-sm btn-danger remove-topic-btn">Remove</button>`;

    topicsList.appendChild(topicDiv);
    topicInput.value = "";

    attachRemoveEvent(topicDiv.querySelector(".remove-topic-btn"), topicText);
  });

  // Function to remove a topic
  function attachRemoveEvent(button, topicText) {
    button.addEventListener("click", function () {
      button.parentElement.remove();
      coveredTopics = coveredTopics.filter((topic) => topic !== topicText); // Remove from array
    });
  }

  // Attach remove event to initial topics
  document.querySelectorAll(".remove-topic-btn").forEach((button, index) => {
    attachRemoveEvent(button, coveredTopics[index]);
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const featureInput = document.getElementById("feature-input-field");
  const addFeatureBtn = document.getElementById("add-feature-btn");
  const featuresContainer = document.getElementById("features-container");

  // Function to add a new feature
  addFeatureBtn.addEventListener("click", function () {
    const featureText = featureInput.value.trim();
    if (featureText === "" || courseFeaturesArray.includes(featureText)) return;

    courseFeaturesArray.push(featureText); // Add to array

    const featureDiv = document.createElement("div");
    featureDiv.className =
      "alert alert-secondary d-flex justify-content-between align-items-center feature-box";
    featureDiv.role = "alert";
    featureDiv.innerHTML = `${featureText} <button class="btn btn-sm btn-danger remove-feature-btn">Remove</button>`;

    featuresContainer.appendChild(featureDiv);
    featureInput.value = "";

    attachRemoveEvent(
      featureDiv.querySelector(".remove-feature-btn"),
      featureText
    );
  });

  // Function to remove a feature
  function attachRemoveEvent(button, featureText) {
    button.addEventListener("click", function () {
      button.parentElement.remove();
      courseFeaturesArray = courseFeaturesArray.filter(
        (feature) => feature !== featureText
      ); // Remove from array
    });
  }

  // Attach remove event to existing features
  document.querySelectorAll(".remove-feature-btn").forEach((button, index) => {
    attachRemoveEvent(button, courseFeaturesArray[index]);
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const outcomeInput = document.getElementById("outcome-input-field");
  const addOutcomeBtn = document.getElementById("add-outcome-btn");
  const outcomesContainer = document.getElementById("outcomes-container");

  // Function to add a new learning outcome
  addOutcomeBtn.addEventListener("click", function () {
    const outcomeText = outcomeInput.value.trim();
    if (outcomeText === "" || learningOutcomesArray.includes(outcomeText))
      return;

    learningOutcomesArray.push(outcomeText); // Add to array

    const outcomeDiv = document.createElement("div");
    outcomeDiv.className =
      "alert alert-secondary d-flex justify-content-between align-items-center outcome-box";
    outcomeDiv.role = "alert";
    outcomeDiv.innerHTML = `${outcomeText} <button class="btn btn-sm btn-danger remove-outcome-btn">Remove</button>`;

    outcomesContainer.appendChild(outcomeDiv);
    outcomeInput.value = "";

    attachRemoveEvent(
      outcomeDiv.querySelector(".remove-outcome-btn"),
      outcomeText
    );
  });

  // Function to remove a learning outcome
  function attachRemoveEvent(button, outcomeText) {
    button.addEventListener("click", function () {
      button.parentElement.remove();
      learningOutcomesArray = learningOutcomesArray.filter(
        (outcome) => outcome !== outcomeText
      ); // Remove from array
    });
  }

  // Attach remove event to existing learning outcomes
  document.querySelectorAll(".remove-outcome-btn").forEach((button, index) => {
    attachRemoveEvent(button, learningOutcomesArray[index]);
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const prerequisiteInput = document.getElementById("prerequisite-input-field");
  const addPrerequisiteBtn = document.getElementById("add-prerequisite-btn");
  const prerequisitesContainer = document.getElementById(
    "prerequisites-container"
  );

  // Function to add a new prerequisite
  addPrerequisiteBtn.addEventListener("click", function () {
    const prerequisiteText = prerequisiteInput.value.trim();
    if (
      prerequisiteText === "" ||
      prerequisitesArray.includes(prerequisiteText)
    )
      return;

    prerequisitesArray.push(prerequisiteText); // Add to array

    const prerequisiteDiv = document.createElement("div");
    prerequisiteDiv.className =
      "alert alert-secondary d-flex justify-content-between align-items-center prerequisite-box";
    prerequisiteDiv.role = "alert";
    prerequisiteDiv.innerHTML = `${prerequisiteText} <button class="btn btn-sm btn-danger remove-prerequisite-btn">Remove</button>`;

    prerequisitesContainer.appendChild(prerequisiteDiv);
    prerequisiteInput.value = "";

    attachRemoveEvent(
      prerequisiteDiv.querySelector(".remove-prerequisite-btn"),
      prerequisiteText
    );
  });

  // Function to remove a prerequisite
  function attachRemoveEvent(button, prerequisiteText) {
    button.addEventListener("click", function () {
      button.parentElement.remove();
      prerequisitesArray = prerequisitesArray.filter(
        (prerequisite) => prerequisite !== prerequisiteText
      ); // Remove from array
    });
  }

  // Attach remove event to existing prerequisites
  document
    .querySelectorAll(".remove-prerequisite-btn")
    .forEach((button, index) => {
      attachRemoveEvent(button, prerequisitesArray[index]);
    });
});

// -------------------------------
document.getElementById("save-edit-changes").addEventListener("click", (e) => {
  e.preventDefault();
  let temp = editTargetBtn.value;
  let alertBox = document.getElementById("changes-alert");
  let courseId = parseInt(document.getElementById("edit-course-id").value);
  // alert(temp)

  switch (temp) {
    case "1":
      document.getElementById("evaluate-btn").click();
      let coursePrice = parseInt(
        document.getElementById("original-price").innerText
      );
      let discount = parseInt(
        document.getElementById("discounted-price").innerText
      );

      discount = coursePrice - discount;

      let param1 =
        "target=discount" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&discount=" +
        discount;
      simplePost("edit_all.do", param1)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });

      break;

    case "2":
      let courseIdd = document.getElementById("edit-course-id").value;
      let file = document.getElementById("pdf-file-input").files[0];
      let formData = new FormData();

      formData.append("target", "course");
      formData.append("course-id", courseIdd);
      formData.append("act-on", "pdf");
      formData.append("task", "change");
      formData.append("file", file);

      postData("update_file.do", formData).then((data) => {
        if (data === "true") {
            location.reload();
        } else if (data === "login") {
            window.location = "index.do";
        } else {
            alert(data);
        }
    }).catch((error) => {
        console.log("Error : " + error);
    })
      break;

    case "3":
      let certification = document.getElementById("edit-certification").value;
      let param3 =
        "target=certification" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&certification=" +
        certification;
      simplePost("edit_all.do", param3)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "4":
      let newPrice = document.getElementById("new-price").value;
      let param4 =
        "target=price" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&price=" +
        newPrice;
      simplePost("edit_all.do", param4)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });

      break;

    case "5":
      let newLevel = document.getElementById("new-course-level").value;
      let param5 =
        "target=level" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&level-id=" +
        newLevel;
      simplePost("edit_all.do", param5)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "6":
      let topics = JSON.stringify(coveredTopics);

      let param6 =
        "target=covered-topics" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&topics=" +
        topics;
      simplePost("edit_all.do", param6)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "7":
      let description = document.getElementById("edit-description").value;

      let param7 =
        "target=description" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&description=" +
        description;
      simplePost("edit_all.do", param7)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "8":
      let features = JSON.stringify(courseFeaturesArray);

      let param8 =
        "target=features" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&features=" +
        features;
      simplePost("edit_all.do", param8)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "9":
      let outcomes = JSON.stringify(learningOutcomesArray);

      let param9 =
        "target=learning-outcomes" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&learning-outcomes=" +
        outcomes;
      simplePost("edit_all.do", param9)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "10":
      let prerequeisits = JSON.stringify(prerequisitesArray);

      let param10 =
        "target=prerequisites" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&prerequisites=" +
        prerequeisits;
      simplePost("edit_all.do", param10)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "11":
      let validityDuration = document.getElementById(
        "new-validity-duration"
      ).value;
      let validityUnit = document.getElementById("new-validity-unit").value;

      let param11 =
        "target=validity" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&duration=" +
        validityDuration +
        "&unit=" +
        validityUnit;
      simplePost("edit_all.do", param11)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "12":
      let refundPolicy = document.getElementById("edit-refund-policy").value;

      let param12 =
        "target=refund-policy" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&refund-policy=" +
        refundPolicy;
      simplePost("edit_all.do", param12)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;

    case "13":
      let newTitle = document.getElementById("new-edit-title").value;

      let param13 =
        "target=title" +
        "&type=course" +
        "&course-id=" +
        courseId +
        "&title=" +
        newTitle;
      simplePost("edit_all.do", param13)
        .then((data) => {
          if (data === "true") {
            location.reload();
          } else if (data === "login") {
            window.location = "index.do";
          } else {
            alert(data);
          }
        })
        .catch((error) => {
          console.log("Error : " + error);
        });
      break;
  }
});

// Edit Course code ends ----------------------------
