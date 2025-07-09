document.addEventListener('click',(e)=>{
    let target = e.target.closest('.prv-btn');
    if(target){
        let set = false;
        if(target.checked){
            set = true;
        }else{
            set = false;
        }

        let id = target.id;
        let course_id = id.split('-')[1];
        
        let params = "type=subtopics&to="+course_id+"&target=preview&set="+set;
        
        simplePost("edit_all.do",params).then(data=>{
            if(data === "true"){
                console.log("success");
            }else{
                console.log("something went wrong");
            }
        }).catch(error=>{
            console.log(error);
        })
        
    }
})