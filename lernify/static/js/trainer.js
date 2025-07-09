const createTrainerBtn = document.getElementById('create-trainer-btn');
const editTrainerBtn = document.getElementById('edit-trainer-btn');

async function simplePostData(url, params) {
    let response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: params,
    });
  
    const result = await response.text();
    return result;
}

createTrainerBtn.addEventListener('click',(e)=>{
    e.preventDefault();
    const trainerName = document.getElementById('new-trainer-name').value;
    const trainerProfession = document.getElementById('new-trainer-profession').value;
    const trainerExperience = document.getElementById('new-trainer-experience').value;
    const trainerEducation = document.getElementById('new-trainer-education').value;
    const trainerSkills = document.getElementById('new-trainer-skills').value;

    if (!trainerName || !trainerProfession || !trainerExperience || !trainerEducation || !trainerSkills) {
        alert('Please fill in all the required fields.');
        return;
    }
    
    let params = "name=" + trainerName + "&profession=" + trainerProfession + "&experience=" + trainerExperience + "&education=" + trainerEducation + "&skills=" + trainerSkills;
    // console.log(params);
    console.log(params);
    

    simplePostData('create_trainer.do', params).then((data)=>{
        let errBx = document.getElementById("new-trainer-error");
        // errBx.classList.remove = 'd-none';
        errBx.style.display = "block";
        if (data === "true") {
            errBx.textContent = "Trainer Account created successfully.";
            errBx.style.color = "green";
            window.location = 'trainer.do';
        }else if(data === "login"){
            window.location = "index.do";
        }else if (data === "exist") {
            errBx.textContent = "Trainer already exists.";
            errBx.style.color = "orange";
            console.log("exist")
        } else {
            errBx.textContent = "Failed to create trainer.";
            errBx.style.color = "red";
        }
    }).catch((error)=>{
        console.error(error);
    })
})

editTrainerBtn.addEventListener("click",(e)=>{
    e.preventDefault();
    const trainerName = document.getElementById('edit-trainer-name').value;
    const trainerProfession = document.getElementById('edit-trainer-profession').value;
    const trainerExperience = document.getElementById('edit-trainer-experience').value;
    const trainerEducation = document.getElementById('edit-trainer-education').value;
    const trainerSkills = document.getElementById('edit-trainer-skills').value;

    if (!trainerName ||!trainerProfession ||!trainerExperience ||!trainerEducation ||!trainerSkills) {
        alert('Please fill in all the required fields.');
        return;
    }
    
    let params = "name=" + trainerName + "&profession=" + trainerProfession + "&experience=" + trainerExperience + "&education=" + trainerEducation + "&skills=" + trainerSkills;
    // console.log(params);
    simplePostData('edit_trainer.do', params).then((data)=>{
        let errBx = document.getElementById("edit-trainer-error");
        // errBx.classList.remove = 'd-none';
        errBx.style.display = "block";
        if (data === "true") {
            errBx.textContent = "Trainer details updated successfully.";
            errBx.style.color = "green";
            window.location = 'trainer.do';
        }else if(data === "login"){
            window.location = "index.do";
        }else if (data === "notfound") {
            errBx.textContent = "Trainer not found.";
            errBx.style.color = "orange";
            console.log("notfound")
        } else {
            errBx.textContent = "Failed to update trainer details.";
            errBx.style.color = "red";
        }
    }).catch((error)=>{
        console.error(error);
    })
})