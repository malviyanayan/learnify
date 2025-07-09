let editCourseThumbnailBtn = document.getElementById('edit-course-thumbnail-btn');
let newCourseThumbnail = document.getElementById('new-course-thumbnail');
let newThumbnailImg = document.getElementById('new-thumbnail-img');

async function postData(url, params) {
    let response = await fetch(url, {
      method: "POST",
      body: params, // FormData directly pass kar raha hai
    });
  
    return await response.text();
}
  

editCourseThumbnailBtn.addEventListener('click', (e) => {
    e.preventDefault();
    newCourseThumbnail.click();
});

newCourseThumbnail.addEventListener('change', (e) => { // when the user selects a file
    let file = e.target.files[0];
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
        newThumbnailImg.src = reader.result;
    }
});

// --------------------------
let newFeatureBtn = document.getElementById('new-feature-btn');
let newFeatureInput = document.getElementById('new-feature');
let newFeatureList = document.getElementById('new-feature-list');
let newFeatures = [];

newFeatureBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let newFeature = newFeatureInput.value.trim();
    if (!newFeature) return;

    newFeatures.push(newFeature);
    renderFeatureList();
    newFeatureInput.value = "";
});

function renderFeatureList() {
    newFeatureList.innerHTML = ""; // Clear the list
    newFeatures.forEach((feature, index) => {
        let span = document.createElement('span');
        span.className = 'd-block m-2 bg-light p-2 rounded-2';
        span.innerText = (index + 1) + ". " + feature;

        let removeBtn = document.createElement('button');
        removeBtn.className = 'rmv btn btn-outline-danger btn-sm float-end';
        removeBtn.dataset.index = index; // Use dataset instead of ID
        removeBtn.innerText = 'Remove';

        span.appendChild(removeBtn);
        newFeatureList.appendChild(span);
    });
}

newFeatureList.addEventListener('click', (e) => {
    let target = e.target.closest(".rmv");
    if (target) {
        let index = target.dataset.index;
        newFeatures.splice(index, 1);
        renderFeatureList();
    }
});


// --------------------------
let newTopicBtn = document.getElementById('new-topic-add-btn');
let newTopicInput = document.getElementById('new-coverd-topics');
let newTopicList = document.getElementById('new-topic-list');
let topics = [];

newTopicBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let topic = newTopicInput.value.trim();
    if (!topic) return;

    topics.push(topic);
    renderTopicList();
    newTopicInput.value = "";
});

function renderTopicList() {
    newTopicList.innerHTML = ""; // Clear list before re-rendering

    topics.forEach((topic, index) => {
        let span = document.createElement('span');
        span.className = 'd-block m-2 bg-light p-2 rounded-2';

        span.innerText = (index + 1) + ". " + topic;

        let removeBtn = document.createElement('button');
        removeBtn.className = 'rmv btn btn-outline-danger btn-sm float-end';
        removeBtn.dataset.index = index;
        removeBtn.innerText = 'Remove';

        span.appendChild(removeBtn);
        newTopicList.appendChild(span);
    });

    if (topics.length === 0) {
        newTopicList.innerHTML = `<span class="d-block m-2 opacity-25">1. Example Topic 1</span>
                                  <span class="d-block m-2 opacity-25">2. Example Topic 2</span>`;
    }
}

newTopicList.addEventListener('click', (e) => {
    let target = e.target.closest(".rmv");
    if (target) {
        let index = target.dataset.index;
        topics.splice(index, 1);
        renderTopicList();
    }
});


// --------------------------
let learningOutcomeBtn = document.getElementById('learning-outcome-btn');
let learningOutcomeInput = document.getElementById('new-learning-outcomes');
let learningOutcomeList = document.getElementById('learning-outcome-list');
let learningOutcomes = [];

learningOutcomeBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let outcome = learningOutcomeInput.value.trim();
    if (!outcome) return;

    learningOutcomes.push(outcome);
    renderLearningOutcomes();
    learningOutcomeInput.value = "";
});

function renderLearningOutcomes() {
    learningOutcomeList.innerHTML = ""; // List clear kar raha hai before re-rendering

    learningOutcomes.forEach((outcome, index) => {
        let span = document.createElement('span');
        span.className = 'd-block m-2 bg-light p-2 rounded-2';

        span.innerText = (index + 1) + ". " + outcome;

        let removeBtn = document.createElement('button');
        removeBtn.className = 'rmv btn btn-outline-danger btn-sm float-end';
        removeBtn.dataset.index = index;
        removeBtn.innerText = 'Remove';

        span.appendChild(removeBtn);
        learningOutcomeList.appendChild(span);
    });

    if (learningOutcomes.length === 0) {
        learningOutcomeList.innerHTML = `<span class="d-block m-2 opacity-25">1. Example outcome 1</span>
                                         <span class="d-block m-2 opacity-25">2. Example outcome 2</span>`;
    }
}

learningOutcomeList.addEventListener('click', (e) => {
    let target = e.target.closest(".rmv");
    if (target) {
        let index = target.dataset.index;
        learningOutcomes.splice(index, 1);
        renderLearningOutcomes();
    }
});


// ------------------------------
let prereqBtn = document.getElementById('new-course-preq-btn');
let prereqInput = document.getElementById('new-course-prereq');
let prereqList = document.getElementById('prereq-list');
let prereqArray = [];

prereqBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let prereq = prereqInput.value.trim();
    if (!prereq) return;

    prereqArray.push(prereq);
    renderPrerequisites();
    prereqInput.value = "";
});

function renderPrerequisites() {
    prereqList.innerHTML = ""; // Purani list clear karke naya render karega

    prereqArray.forEach((prereq, index) => {
        let span = document.createElement('span');
        span.className = 'd-block m-2 bg-light p-2 rounded-2';

        span.innerText = (index + 1) + ". " + prereq;

        let removeBtn = document.createElement('button');
        removeBtn.className = 'rmv btn btn-outline-danger btn-sm float-end';
        removeBtn.dataset.index = index;
        removeBtn.innerText = 'Remove';

        span.appendChild(removeBtn);
        prereqList.appendChild(span);
    });

    if (prereqArray.length === 0) {
        prereqList.innerHTML = `<span class="d-block m-2 opacity-25">1. Example Prerequisite 1</span>
                                <span class="d-block m-2 opacity-25">2. Example Prerequisite 2</span>`;
    }
}

prereqList.addEventListener('click', (e) => {
    let target = e.target.closest(".rmv");
    if (target) {
        let index = target.dataset.index;
        prereqArray.splice(index, 1);
        renderPrerequisites();
    }
});

let newCourseSubmitBtn = document.getElementById('new-course-submit-btn');
let courseTitle = document.getElementById('new-course-title');
let newCourseDescription = document.getElementById('new-course-description');
let courseCertification = document.getElementById('new-course-certification');
let courseRefundPolicy = document.getElementById('new-course-refund-policy');

newCourseSubmitBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let title = courseTitle.value.trim();
    let description = newCourseDescription.value.trim();

    if (!title) {
        alert('Please enter a course title.');
        return;
    }else if (!description) {
        alert('Please enter a course description.');
        return;
    }

    // This is Mandetory columns
    let formData = new FormData();
    formData.append('course-name', title);
    formData.append('description', description);


    // courseImage and Course Pdf
    let thumbnail = newCourseThumbnail.files[0];
    let coursePdf = document.getElementById('new-course-pdf').files[0];

    // add thumbnail image if exists
    if (thumbnail) {
        formData.append('thumbnail', thumbnail);
    }
    // add course pdf if exists
    if(coursePdf) {
        formData.append('pdf', coursePdf);
    }
    // --------

    // adding course Features
    formData.append('features', JSON.stringify(newFeatures));
    // adding Covered Topics
    formData.append('topics', JSON.stringify(topics));
    // adding learning outcomes
    formData.append('outcomes', JSON.stringify(learningOutcomes));
    // adding Prerequisits
    formData.append('prerequisites', JSON.stringify(prereqArray));
    
    // add certification
    let certification = courseCertification.value.trim();
    formData.append('certification', certification);

    // course refund policy
    let refundPolicy = courseRefundPolicy.value.trim();
    formData.append('refund-policy', refundPolicy);
    
    // add course level
    let courseLevel = document.getElementById('new-course-level').value;
    formData.append('level', courseLevel);

    // add recommended completion time (days/months/years)
    let courseTime = document.getElementById('new-course-recomended-comp').value;
    formData.append('time', courseTime);
    let timeType = document.getElementById('new-course-recomended-comp-type').value;
    formData.append('time-type', timeType);

    // course price
    let coursePrice = document.getElementById('new-course-price').value;
    formData.append('price', coursePrice);

    // post data
    postData("create_course.do", formData).then((data) => {
        // conditions for response
        // session expired (login)
        // Trainer not exist (reload)
        // if course name already exist (name_exist)
        // if course created (true)
        // if not multipart request (not multipart request)
        // if course not created (something went wrong) 
        //default false
        let alertBox = document.getElementById("new-course-alert");
        alertBox.style.display = "block";

        let flag = false;
        
        if(data === "true"){
            alertBox.innerText = "Successfully added Reloading ....";
            alertBox.classList.add("alert-info");
            flag = true;
            setTimeout(() => {
                window.location = "trainer.do";
            }, 2000);
        }else if(data === "login"){
            alertBox.innerText = "Session Expired";
        }else if(data === "reload"){
            alertBox.innerText = "Trainer not found Reload";
        }else if(data === "name_exist"){
            alertBox.innerText = "Title is Already Exist";
        }else{
            console.log("Error Message : " + data);
        }
        if(!flag){
            alertBox.classList.add("alert-danger");
        }
    }).catch((error) => {
        console.error(error);
    });
});



// --------------------------
// course close btn
let closeCourseBtn = document.getElementById('new-course-close');

closeCourseBtn.addEventListener('click', (e) => {
    e.preventDefault();
    newThumbnailImg.src = "static/media/images/course/thumbnail.png";

    // reset course features
    newFeatures = [];
    renderFeatureList();

    // reset course topics
    topics = [];
    renderTopicList();

    // reset learning outcomes
    learningOutcomes = [];
    renderLearningOutcomes();

    // reset prerequisites
    prereqArray = [];
    renderPrerequisites();

    // closeCourseBtn (reset) button ka defalut bahaviear
    document.getElementById('new-course-form').reset();
    closeCourseBtn.click();

});