/**
 * AdminController
 *
 * @description :: Server-side logic for managing admins
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var bcrypt = require('bcrypt');

var jwt = require('jsonwebtoken');
module.exports = {
    
	teacher:function(req,res,next){
        var teacherList = [];
        Teacher.find({isPublished: false})
        .populate('personId')
        .populate('position')
        .populate('MasterCourses')
        .populate('Experience')
        .exec(function (err,teacher) {
            if(!teacher) return next();
            else {
                var personIds = []
                teacher.forEach(element => {
                    personIds.push(element.personId.id)
                }); 
                Person.find().where({ id:personIds })
                .populate("InterestedCourses")
                .populate("Education")
                .populate("gender")
                .exec(function(err,person){
                    if(err) console.log(err)
                    else if(person){
                        teacher.forEach(element=>{
                            person.forEach(person=>{
                                if(person.id == element.personId.id){
                                    element.Education = person.Education
                                    element.InterestedCourses = person.InterestedCourses
                                    element.gender = person.gender
                                }
                            })
                        })
                        User.find().where({personId:personIds})
                        .populate('personId')
                        .exec(function(err,user){
                            if(err) console.log(err)
                            else if(user){
                                console.log(user)
                                teacher.forEach(element=>{
                                    user.forEach(user=>{
                                        if(user.personId.id == element.personId.id){
                                            element.username = user.username
                                        }
                                    })
                                })    
                                return res.json({
                                    teacher
                                })
                            }
                        })
                    }
                })
            }
        });
    },
    teacherOne:function(req,res,next){
        User.findOne({username:req.param('id')},function(err,user){
            if(err) console.log(err)
            else if(user){
                Teacher.findOne({personId:user.personId})
                .populate('personId')
                .populate('position')
                .populate('MasterCourses')
                .populate('Experience')
                .exec(function (err,teacher) {
                    if(!teacher) return next();
                    else {
                        Person.findOne({id:teacher.personId.id})
                        .populate('InterestedCourses')
                        .populate('Education')
                        .populate('gender')
                        .exec(function(err,person){
                            teacher.Education = person.Education
                            teacher.InterestedCourses = person.InterestedCourses
                            Category.find({},function(err, categories){
                                EducationLevel.find({},function(err,levels){
                                    Job.find({},function(err,positions){
                                            User.findOne({personId:person.id},function(err,user){
                                                if(err) console.log(err)
                                                else if (user){
                                                    teacher.user = user;
                                                    return res.json({
                                                        teacher,
                                                        categories,
                                                        levels,
                                                        positions
                                                    })
                                                }
                                            })
                                        })
                                    })
                                })
                            })
                    }
                });
            }
        })
    },
    create:function(req,res,next){
        var parameters = req.params.all()
        bcrypt.hash(parameters.password,10,function(err,encryptedPassword){
            if(err) {console.log(err);Log.create({message:"Something went wrong encrypting admin password"},function(err){})}
            else {
                parameters.password =  encryptedPassword
                console.log(encryptedPassword)
                Admin.create(parameters,function(err,admin){
                    if(err) {console.log(err); Log.create({message:"Something went wrong creating new admin"},function(err){})}
                    else {console.log(admin); Log.create({message:"Admin Created"},function(err){})}
                })
            }
        })
    },
    login:function(req,res,next){
        var parameters = req.params.all()
        Admin.findOneByUsername(parameters.username,function(err,admin){
            if(err) console.log(err)
            if(!admin){
                var noAccount = {name:"AdminNotFound"}
                res.send(noAccount)
                return;
            }
            // Compare password from the form params to the encrypted password of the user found.
            bcrypt.compare(parameters.password, admin.password, function(err, valid) {
                if (err) return res.send({err:err.message});
                // If the password from the form doesn't match the password from the database...
                if (!valid) {
                    var usernamePasswordMismatchError = {name: 'usernamePasswordMismatch', message: 'Invalid username and password combination.'}
                    res.send(usernamePasswordMismatchError);
                    return;
                }

                // Log user in
                //Redirect to their profile page (e.g. /views/user/show.ejs)
                var token = jwt.sign({admin},'322b8527aa325403cba54d205f0ebd7b');
                Log.create({message:admin.username + " logs in"},function(err){})
                res.send({name:"ok",token:token});
                return;		
            });  
        })
    },
    home:function(req,res,next){
        var response = {};
        Log.find()
            .limit(100)
            .sort({createdAt: 'desc'}).exec(function(err,log){
                response.log = log
                User.find({},function(err,users){
                    var student = users.filter(user=>user.personType==1)
                    var teacher = users.filter(user=>user.personType==2)
                    response.studentPer = student.length / users.length * 100
                    response.teacherPer = teacher.length / users.length * 100
                    return res.json({
                        response
                    })
                })
        })
    },
    masterdata:function(req,res,next){
        var response = {}
        Job.find({},function(err,job){
            EducationLevel.find({},function(err,educationlevel){
                Category.find({},function(err,category){
                    response.job = job
                    response.level = educationlevel
                    response.category = category
                    return res.json({
                        response
                    })
                })
            })
        })
    },
    publish:function(req,res,next){
        var parameters = req.params.all()
        Teacher.update({id:parameters.teacherId},{isPublished:true},function(err,teacher){
            if(err) console.log(err)
            else if(teacher){
                return res.json({
                    teacher
                })
            }
        })
    }
};

