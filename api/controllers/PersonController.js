/**
 * PersonController
 *
 * @description :: Server-side logic for managing people
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var crypto = require('crypto');
var bcrypt = require('bcrypt');
var nodemailer = require('nodemailer');
var jwt = require('jsonwebtoken');
var url = "http://localhost:4200/"
var fs = require('fs');
module.exports = {
	create : function(req,res,next) {
        var parameters =  req.params.all();
        var newPerson = {
            type : parameters.type,
            fullname : parameters.fullname,
            country : parameters.country,
            dob : parameters.dob,
            gender:parameters.gender,
            phone : parameters.phone,
            username :parameters.username
        }
        var person;
        var teacher;
        var user;
        var token
        function createUser(err,per){
            if(err) console.log(err)
            else if(per) {
                person = per
                console.log(person)
                bcrypt.hash(parameters.encryptedPassword,10,function(err,encryptedPassword){
                    if(err) console.log(err)
                    else if(encryptedPassword){
                    parameters.encryptedPassword =  encryptedPassword
                    var newUser = {
                        username : parameters.username,
                            email : parameters.email,
                            encryptedPassword : parameters.encryptedPassword,
                            provider : 'Registeration',
                            isVerified : false,
                            personId : person.id,
                            personType : person.type
                        }
                    User.create(newUser,function(err,user){
                        createToken(err,user)
                    })
                    }
                })
            }
        }
        function createToken(err,us){
            var odlDateObj =    new Date();
            var newDateObj =    new Date(odlDateObj.getTime() + 12*60*60*1000);
            if(err) console.log(err)
            else if(us) {
                user = us
                var token = {
                    value : crypto.randomBytes(16).toString('hex'),
                    user:user.id,
                    expiresAt:newDateObj
                }
                Token.create(token,function(err,token){
                    addInterestedCourses(err,token)
                })
            }
        }
        function addInterestedCourses(err,tok){
            if(err) console.log(err)
            else if(tok){
                token = tok
                var interestedCoursesArray = []
                for(var i=0;i<parameters.interestedCourse.length;i++){
                    var newInterestedCourse = {
                        categoryId : parameters.interestedCourse[i],
                        personId : person.id
                    }
                    interestedCoursesArray.push(newInterestedCourse);
                }
                if(parameters.education)
                    InterestedCourse.create(interestedCoursesArray,function(err,courses){
                        addEducation(err,courses);
                    })
                else
                    InterestedCourse.create(interestedCoursesArray,function(err,courses){
                        createUserType(err,courses);
                    })
            }
        }
        function addEducation(err,courses){
            if(err) console.log(err)
            else if(courses){
                var educationArray = []
                for(var i=0;i<parameters.education.length;i++){
                    var newEducation = {
                        level : parameters.education[i].level,
                        start_date : parameters.education[i].start_date,
                        end_date : parameters.education[i].end_date,
                        institute : parameters.education[i].institute,
                        personId : person
                    }
                    educationArray.push(newEducation)
                }
                Education.create(educationArray,function(err,education){
                    createUserType(err,courses)
                })
            }
        }
        function createUserType(err,education){
            if(err) console.log(err)
            else if(education){
                if(parameters.type == "1"){
                    var newStudent =  {
                        id:person.id,
                        educationalLevel : parameters.educationalLevel,
                        institute : parameters.institute,
                        personId :person.id
                    }
                    Student.create(newStudent , function(err,student){
                        uploadPicture(err,student)
                    })
                } else if(parameters.type == "2"){
                    var newTeacher =  {
                        id:person.id,
                        position : parameters.position,
                        institute : parameters.institute,
                        personId :person.id
                    }
                    Teacher.create(newTeacher , function(err,teacher){
                        addMasterCourse(err,teacher)
                    })
                }
            }
        }
        function addMasterCourse(err,teach){
            if(err) console.log(err)
            else if(teach){
                teacher = teach
                var masterCoursesArray =[]
                for(var i=0;i< parameters.masterCourse.length;i++){
                    var newMasterCourse = {
                        categoryId :  parameters.masterCourse[i],
                        teacherId : teacher.id
                    }
                    masterCoursesArray.push(newMasterCourse)
                }
                if(parameters.experience)
                    MasterCourse.create(masterCoursesArray,function(err,courses){
                        addExperience(err,courses)
                    })
                else
                    MasterCourse.create(masterCoursesArray,function(err,courses){
                        uploadPicture(err,courses)
                    })
            }
        }
        function addExperience(err,courses){
            if(err) console.log(err)
            else  if (courses){
                var experienceArray = []
                for(var i=0;i<parameters.experience.length;i++){
                    var newExperience = {
                        position : parameters.experience[i].position,
                        start_date : parameters.experience[i].start_date,
                        end_date : parameters.experience[i].end_date,
                        institute : parameters.experience[i].institute,
                        teacherId : teacher.id
                    }
                    experienceArray.push(newExperience)
                    
                }
                Experience.create(experienceArray,function(err,experience){
                    uploadPicture(err,experience)
                })
            } 
        }
        function uploadPicture(err,experience){
            if(parameters.file){
                var base64Data = decodeBase64Image(parameters.file)
                require("fs").writeFile("./assets/user_images/" + person.id + "_" + parameters.filename, base64Data.data, 'base64', function(err,file) {
                    if(err) console.log(err);
                    else{
                        console.log("updating path")
                        Person.update(person.id, { // give real ID
                            photo_url: "/user_images/" + person.id + "_" + parameters.filename, // GIVE REAL ID
                        })
                        .exec(function(err,person){
                            sendMail(err,person)
                        })   
                    } 
                });    
            } else {
                sendMail(err,experience)
            }
        }
        
        function decodeBase64Image(dataString) {
            var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
            response = {};

            if (matches.length !== 3) {
             return new Error('Invalid input string');
            }

            response.type = matches[1];
            response.data = new Buffer(matches[2], 'base64');

            return response;
          }
  
        function sendMail(err,payload){
            var transporter = nodemailer.createTransport({ 
                service: 'gmail', 
                    auth: { 
                        user: 'vollage123@gmail.com', 
                        pass: 'kuchbara' 
                    },
                    tls: { rejectUnauthorized: false }
                });
                var mailOptions = { 
                    from: 'no-reply@vollage.com', 
                    to: user.email, 
                    subject: 'Account Verification Token', 
                    text: 'Hello,\n\n' + 'Please verify your account by clicking the link: \nhttp:\/\/' + req.headers.host + '\/token/confirmation\/' + token.value + '.\n',
                    // html : `<h1>Hello</h1>, <br><p>Please verify your account by clicking the <a href='"http://" + ${req.headers.host}+"/confirmation/" +${token.value}'>link</a>.<br>`
                };
                
                transporter.sendMail(mailOptions, function(err,payload){
                    sendResponce(err,payload)
                })
        }
        function sendResponce(err,payload){
            if (err) console.log(err)
            Log.create({message:person.fullname+" registered!"},function(err){
                var requireEmailVerification = {name:'emailVerfication',message:'Email has been sent to your email address please verify your email before login'};
                res.send(requireEmailVerification);                
            })
            
        }
        Person.create(newPerson).exec(function(err,person){
            createUser(err,person)
        })
    },
    isPublished:function(req,res,next){
        var id = req.param('id')
        console.log(id)
        Teacher.findOne({id:id},function(err,teacher){
            if(err) console.log(err)
            else if(teacher){
                return res.json({
                    isPublished:teacher.isPublished
                })
            }
        })
        
    },
    reset :  function(req,res,next){
        User.findOne({ email: req.body.email }, function (err, user) {
            if (!user) return res.status(400).send({ msg: 'We were unable to find a user with that email.' });
            
            var odlDateObj = new Date();
            var newDateObj =new Date(odlDateObj.getTime() + 12*60*60*1000);
            // var newDateObj =new Date(odlDateObj.getTime() + 60*1000);
            // Save the token
            User.update({email:  req.body.email},{passwordResetToken:  crypto.randomBytes(16).toString('hex') , passwordResetExpires: newDateObj},function(err,user){
                if(err){
                    req.session.flash = {
                        err:err
                    }
                    return res.redirect('/user/forgetpassword');
                }
                console.log(user);
             //   console.log('Token created now sending email ' + token )
                var transporter = nodemailer.createTransport({ 
                    service: 'gmail', 
                    auth: { 
                        user: 'vollage123@gmail.com', 
                        pass: 'kuchbara' 
                    } ,
                    
                    tls: { rejectUnauthorized: false }
                });
                var mailOptions = { 
                    from: 'no-reply@yourwebapplication.com', 
                    to: user[0].email, 
                    subject: 'Password Reset', 
                    text: 'Hello,\n\n' + 'Resetyour password by clicking the link: \nhttp:\/\/' + req.headers.host + '\/person/resetlink\/' + user[0].passwordResetToken + '.\n',
                    // html : `<h1>Hello</h1>, <br><p>Please verify your account by clicking the <a href='"http://" + ${req.headers.host}+"/confirmation/" +${token.value}'>link</a>.<br>`
                };
                transporter.sendMail(mailOptions, function (err) {
                    if (err) { return res.status(500).send({ msg: err.message }); }

                    var passwordReset = [
                        {
                            name:'passwordReset',
                            message:'Email has been sent to your email address please reset your password',
                            reset_id: user[0].passwordResetToken
                        }
                    ];
                    Log.create({message:user[0].username+" Requested a password reset"})
                    res.send(passwordReset);                
                });
            });
     
        });
            
      },
      resetlink  : function(req,res,next){
          console.log(req.params);
          User.findOneByPasswordResetToken(req.params.id,function(err,user){
            if(err) { return res.status(500).send({ msg: err.message }); }

            var now = new Date();
            console.log(user);
            if(user.passwordResetExpires < now){
                var resetLinkExpires = [{name:'resetLinkMessage',message:'You request link has been expired! Please enter your email to request a new one!'}];
            
                User.update({email:user.email},{passwordReset:"",passwordResetExpires:""},function(err,user){
                    if(err) { return res.status(500).send({ msg: err.message }); }
                    res.send(resetLinkExpires);
                }); 
            } else  {
                res.redirect(url+'changepass')
            }
          });
      },
      updatePassword : function(req,res,next){
        User.findOneByPasswordResetToken(req.body.reset_id,function(err,user){
            if(err) console.log(err)
            else{
                var now = Date();
                console.log('comparing date');
                console.log(req.body);
                if(user.passwordResetExpires < now){
                    var resetLinkExpires = [{name:'resetLinkMessage',message:'You request link has been expired! Please enter your email to request a new one!'}];
                    User.update({email:user.email},{passwordReset:"",passwordResetExpires:""},function(err,user){
                        if(err) res.status(500).send({msg:'user not updated'})
                        res.send(resetLinkExpires);
                    }); 
                } else {
                    console.log('encrypting password');
                    bcrypt.hash(req.body.password,10,function(err,encryptedPassword){
                        if(err) return next(err);
                        //user.encryptedPassword =  encryptedPassword
                        User.update({email:user.email},{
                            encryptedPassword:encryptedPassword,
                            passwordResetToken:"",
                            passwordResetExpires:""
                        },function(err,user){
                            if(err) { return res.status(500).send({ msg: err.message }); }
                            var passwordReset = [{name:'passwordReset',message:'Password has been reset'}];
                            Log.create({message:user[0].username+ " Password has been reset"})
                            res.send(passwordReset);
                        });
                      });
                }    
            }
            
        });
      },
      getOne:function(req,res,next){
          console.log(req.param('id'))
        User.findOne({username:req.param('id')},function(err,user){
            if(err) console.log(err)
            else if(user) {
                if(user.personType=="1"){
                    Person.findOne({id:user.personId})
                    .populate('InterestedCourses')
                    .populate('Education')
                    .populate('gender')
                    .populate('uploads')
                    .populate('downloads')
                    .exec(function(err,person){
                        if(err) console.log(err)
                        else {
                            require('nested-pop')(person,{
                                downloads :{
                                    as:
                                    'filedownload',
                                    populate:[
                                        'person',
                                        'file'
                                    ]
                                    }
                            }).then(function(person){

                                console.log(person)
                                user.person = person
                                console.log(user)
                                Student.findOne({id:user.personId})
                                .populate('educationalLevel')
                                .populate('connection')
                                .exec(function(err,student){
                                    user.profile = student
                                    Category.find({},function(err, categories){
                                        EducationLevel.find({},function(err,levels){
                                            Job.find({},function(err,positions){
                                                return res.json({
                                                    user,
                                                    categories,
                                                    levels,
                                                    positions
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        }
                    })
                } else if (user.personType == "2"){
                    Person.findOne({id:user.personId})
                    .populate('InterestedCourses')
                    .populate('Education')
                    .populate('gender')
                    .exec(function(err,person){
                        if(err) console.log(err)
                        else {
                            console.log(person)
                            user.person = person
                            console.log(user)
                            Teacher.findOne({id:user.personId})
                            .populate('position')
                            .populate('Experience')
                            .populate('MasterCourses')
                            .exec(function(err,teacher){
                                user.profile = teacher
                                Category.find({},function(err, categories){
                                    EducationLevel.find({},function(err,levels){
                                        Job.find({},function(err,positions){
                                            return res.json({
                                                user,
                                                categories,
                                                levels,
                                                positions
                                            })
                                        })
                                    })
                                })
                            })
                        }
                    })
                }
                
            }
        })
      },
      sabDelete:function(req,res,next){
        Teacher.destroy({}).exec(function (err) {
        });
        Student.destroy({}).exec(function (err) {
        });
        Education.destroy({}).exec(function (err) {
        });
        Experience.destroy({}).exec(function (err) {
        });
        Person.destroy({}).exec(function (err) {
        });
        MasterCourse.destroy({}).exec(function (err) {
        });
        InterestedCourse.destroy({}).exec(function (err) {
        });
        Token.destroy({}).exec(function (err) {
        });
        User.destroy({}).exec(function (err) {
        });
        ForumComment.destroy({}).exec(function (err) {
        });
        ForumCategory.destroy({}).exec(function (err) {
        });
        ForumTopic.destroy({}).exec(function (err) {
        });
        ForumKeyword.destroy({}).exec(function (err) {
        });
        res.send('hogya')
      }
};

