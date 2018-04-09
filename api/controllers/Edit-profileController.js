/**
 * Edit-profileController
 *
 * @description :: Server-side logic for managing edit-profiles
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var jwt = require('jsonwebtoken')
module.exports = {
	details:function(req,res,next){
        var parameters =  req.params.all()
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        Person.update({id:payload.person.id},parameters,function(err,updated){
            if(err) console.log(err)
            else if(updated){
                console.log(updated)
                Log.create({message:payload.user.username +  " has updated personal details"},function(){
                    payload.person = updated[0]
                  if(updated[0].type == 1){
                      
                      Student.update({id:updated[0].id},parameters,function(err,updatedStudent){
                          if(err) console.log(err)
                          else if(updatedStudent){
                            var token = jwt.sign({user:payload.user,person:updated[0],data:updatedStudent[0],isStudent:true},'322b8527aa325403cba54d205f0ebd7b');
                            uploadPicture(err,token,updatedStudent[0],true)
                          }
                      })
                  } else {
                    Teacher.update({id:updated[0].id},parameters,function(err,updatedTeacher){
                        if(err) console.log(err)
                        else if(updatedTeacher){
                            var token = jwt.sign({user:payload.user,person:updated[0],data:updatedTeacher[0],isStudent:false},'322b8527aa325403cba54d205f0ebd7b');
                            uploadPicture(err,token,updatedTeacher[0],false)
                        }
                    })
                  }
                    
                })
            }
        })
        
        function uploadPicture(err,token, data,isStudent){
            if(parameters.file){
                var base64Data = decodeBase64Image(parameters.file)
                require("fs").writeFile("./assets/user_images/" + payload.person.id + "_" + parameters.filename, base64Data.data, 'base64', function(err,file) {
                    if(err) console.log(err);
                    else{
                        console.log("updating path")
                        Person.update(payload.person.id, { // give real ID
                            photo_url: "/user_images/" + payload.person.id + "_" + parameters.filename, // GIVE REAL ID
                        })
                        .exec(function(err,person){
                            var token = jwt.sign({user:payload.user,person:person[0],data:data,isStudent:isStudent},'322b8527aa325403cba54d205f0ebd7b'); 
                            res.json({
                                token
                            })
                        })   
                    } 
                });    
            } else {
                res.json({
                    token
                })
            }
        }
        function decodeBase64Image(dataString) {
            var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
            response = {};
            console.log(matches)
            if (matches.length !== 3) {
             return new Error('Invalid input string');
            }

            response.type = matches[1];
            response.data = new Buffer(matches[2], 'base64');

            return response;
          }
    },
    description:function(req,res,next){
        var parameters = req.params.all()
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        Person.update({id:payload.person.id},parameters,function(err,updatePeson){
            if(err) console.log(err)
            else {
                var token = jwt.sign({user:payload.user,person:updatePeson[0],data:payload.data,isStudent:payload.isStudent},'322b8527aa325403cba54d205f0ebd7b'); 
                res.json({
                    token
                })
            }
        })
    },
    interested:function(req,res,next){
        var parameters =  req.params.all()
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        InterestedCourse.destroy({personId:payload.person.id},function(err){
            if(err) console.log(err)
            else{
                var interestedCoursesArray = []
                for(var i=0;i<parameters.interestedCourse.length;i++){
                    var newInterestedCourse = {
                        categoryId : parameters.interestedCourse[i],
                        personId : payload.person.id
                    }
                    interestedCoursesArray.push(newInterestedCourse);
                }
                InterestedCourse.create(interestedCoursesArray,function(err,courses){
                    payload.person.InterestedCourses = courses
                    var token = jwt.sign({user:payload.user,person:payload.person,data:payload.data,isStudent:payload.isStudent},'322b8527aa325403cba54d205f0ebd7b'); 
                    res.json({
                        token
                    })
                })
            }
        })
    },
    master:function(req,res,next){
        var parameters =  req.params.all()
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        MasterCourse.destroy({teacherId:payload.person.id},function(err){
            if(err) console.log(err)
            else{
                var masterCoursesArray = []
                for(var i=0;i<parameters.masterCourse.length;i++){
                    var newMasterCourse = {
                        categoryId : parameters.masterCourse[i],
                        teacherId : payload.person.id
                    }
                    masterCoursesArray.push(newMasterCourse);
                }
                MasterCourse.create(masterCoursesArray,function(err,courses){
                    payload.data.MasterCourses = courses
                    var token = jwt.sign({user:payload.user,person:payload.person,data:payload.data,isStudent:payload.isStudent},'322b8527aa325403cba54d205f0ebd7b'); 
                    res.json({
                        token
                    })
                })
            }
        })
    },
    experience:function(req,res,next){
            var parameters =  req.params.all()
            var token = req.headers.authorization.split(' ')[1];
            var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
            Experience.destroy({teacherId:payload.person.id},function(err){
                if(err) console.log(err)
                else{
                    var experienceArray = []
                    for(var i=0;i<parameters.experience.length;i++){
                        var newExperience = {
                            position : parameters.experience[i].position,
                            start_date : parameters.experience[i].start_date,
                            end_date : parameters.experience[i].end_date,
                            institute : parameters.experience[i].institute,
                            teacherId : payload.person.id
                        }
                        experienceArray.push(newExperience)
                        
                    }
                    Experience.create(experienceArray,function(err,experience){
                        payload.data.Experience = experience
                        console.log(payload)
                        var token = jwt.sign({user:payload.user,person:payload.person,data:payload.data,isStudent:payload.isStudent},'322b8527aa325403cba54d205f0ebd7b');     
                        
                        res.json({
                            token
                        })
                    })
                }
            })
          
    },
    education:function(req,res,next){
        var parameters =  req.params.all()
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        Education.destroy({personId:payload.person.id},function(err){
            if(err) console.log(err)
            else{
                var educationArray = []
                for(var i=0;i<parameters.education.length;i++){
                    var newEducation = {
                        level : parameters.education[i].level,
                        start_date : parameters.education[i].start_date,
                        end_date : parameters.education[i].end_date,
                        institute : parameters.education[i].institute,
                        personId : payload.person.id
                    }
                    educationArray.push(newEducation)
                }
                Education.create(educationArray,function(err,education){
                    payload.person.Education = education
                    console.log(payload)
                    var token = jwt.sign({user:payload.user,person:payload.person,data:payload.data,isStudent:payload.isStudent},'322b8527aa325403cba54d205f0ebd7b');     
                    res.json({
                        token
                    })
                })
            }
        })
    }
};

