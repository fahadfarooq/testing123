/**
 * ThreadController
 *
 * @description :: Server-side logic for managing threads
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var jwt =  require('jsonwebtoken')
var nestedPop = require('nested-pop');
module.exports = {
	all:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var person = payload.person

        Thread.find({}).populate("messages").populate("members").populate("lastpersonid").populate("lastmessageid").exec(function(err,threads){
            if(err) {
                console.log(err)
            } else if(threads){
                async.each(threads, function (thread, callback) {
                    console.log(thread)
                })
                nestedPop(threads, {
                    messages: {
                        as:'threadmessage',
                        populate:[
                            'message'
                        ]
                    }
                }).then(function(threads){
                    console.log(threads)
                    threads.forEach(element=>{
                        element.messages.sort(function(a,b){
                            return a.createdAt > b.createdAt
                          })
                          element.messages.sort()
                    })
                    Student.find({}).populate("personId").exec(function(err,students){
                        if(err) console.log(err)
                        else if(students){
                            res.json({threads,students})
                        }
                    })
                })
            }
        })
    },
    create:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var person = payload.person

        var parameters = req.params.all()
        var message = {
            msg: "Created this group",
            student:person.id,
            isImage:false,
            imageLink:null
        }

        function getRoomId(){
            var text = ""
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
            for(var i=0;i<7;i++){
                text += possible.charAt(Math.floor(Math.random()*possible.length));
            }
            return text;
        }

        Message.create(message,function(err,resmessage){
            if(err){
                console.log(err)
            } else if (resmessage){
                console.log(resmessage)
                var name = "";
                parameters.members.forEach(element=>{
                    name += element.personId.username + ", "
                })
                name =  name.substring(0,name.length-2);

                var thread = {
                    lastmessageid:resmessage.id,
                    lastpersonid:person.id,
                    icon:'default',
                    name:name,
                    roomId:getRoomId()
                }
                Thread.create(thread,function(err,thread){
                    if(err) console.log(err)
                    else if (thread){
                        console.log(thread)
                        var members = [];
                        parameters.members.forEach(element => {
                            members.push({
                                thread:thread.id,
                                student:element.id,
                                image:element.personId.photo_url,
                                username:element.personId.username,
                                status:true
                            })
                        });
                        members.push({
                            thread:thread.id,
                            student:person.id,
                            image:person.photo_url,
                            username:person.username,
                            status:true
                        })
                        console.log(person)
                        console.log(members)
                        ThreadMember.create(members,function(err,members){
                            if(err) console.log(err)
                            else if (members){
                                console.log(members)
                                var threadmessage = {
                                    thread: thread.id,
                                    message:resmessage.id,
                                    student:person.id
                                }
                                console.log(threadmessage);
                                nestedPop(message,{
                                    message:[
                                        'message'
                                    ]
                                }).then(function(ms){
                                    ThreadMessage.create(threadmessage,function(err,response){
                                    if(err) console.log(err)
                                    else if(response){
                                        console.log(response)
                                            thread.lastmessageid = resmessage
                                            thread.messages = ms
                                            members.forEach(element=>{
                                                sails.sockets.broadcast("message_"+element.student,'thread',thread)
                                            })
                                            res.json({
                                                "message":"sab khushal mangal"
                                            })
                                        }
                                    })
                                })
                            }
                        })
                    }
                })
            }
        })
    },
    newMessage:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var person = payload.person
        var parameters  = req.params.all();
        
        var newmessage = {
            msg : parameters.msg,
            isImage:parameters.isImage,
            imageLink:parameters.imageLink,
            student:person.id
        }

        Message.create(newmessage,function(err,message){
            if(err) console.log(err)
            else if(message){
                var threadmessage = {
                    thread: parameters.threadid,
                    message:message.id,
                    student:person.id
                }
                ThreadMessage.create(threadmessage,function(err,response){
                    if(err) console.log(err)
                    else if(response){
                        Thread.update({id:parameters.threadid},
                            {lastmessageid:message.id,lastpersonid:person.id},
                            function(err,thread){
                                if(err) console.log(err)
                                else if(thread){
                                    ThreadMember.find({thread:parameters.threadid},function(err,members){
                                        if(err) console.log(err)
                                        if(members){
                                            response.message = message
                                            thread[0].lastmessageid = message
                                            var message_payload = {
                                                message : response,
                                                thread : parameters.threadid,
                                                newThread:false,
                                                threadobj : thread[0]
                                            }
                                            members.forEach(element=>{
                                                console.log("broadcast to " + element.student )
                                                sails.sockets.broadcast('message_'+element.student, 'comment', message_payload);
                                            })
                                            res.json({
                                                thread
                                            })    
                                        }
                                    })
                                }
                            })  
                    }
                })
                
            }
        })
    }
};

