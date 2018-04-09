/**
 * ForumTopicController
 *
 * @description :: Server-side logic for managing Forumtopics
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var jwt =  require('jsonwebtoken')
module.exports = {
    joinChat: function (req, res) {
        console.log('join')
        if (!req.isSocket) { 
            return res.badRequest();
        }
        console.log('socket join to ' + req.param('id'))
            sails.sockets.join(req, 'forum'+req.param('id'));
        return res.ok();
    },        
    getComments: function(req,res,next){
        var id = req.param('id')
        ForumTopic.findOne({id:id},function(err,forum){
            if(err) console.log(err)
            else if(!forum){
                return res.json({
                    'notfound':'notfound'
                })
            }
            else if(forum){
                ForumComment.find({forum:id}).populate('person').populate('forum').exec(function(err,comments){
                    if(err) console.log(err)
                    else if(comments){
                        res.json({
                            comments,
                            forum
                        })
                    }
                })
            }
        })
    },
    get:function(req,res,next){
        ForumTopic.find({}).populate('comments').populate('keywords').populate('categories').populate('person')
        .exec(function(err,topics){
            if(err) console.log(err)
            else if(topics){
                Category.find({},function(err,categories){
                    if(err) console.log(err)
                    else if(categories){
                        res.json({
                            topics,
                            categories
                        })
                    }
                })
                    
            }
        })
    },
	create:function(req,res,next){
        var parameters = req.params.all();
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        parameters.person = payload.person.id
        console.log(parameters)
        var newForum= {
            topicname:parameters.topicname,
            description:parameters.description,
            person : parameters.person,
            username : payload.user.username
        }
        ForumTopic.create(newForum,function(err,forumtopic){
            if(err) console.log(err)
            else if(forumtopic){
               
                    parameters.categories.map(cat=>{
                        cat.forum = forumtopic.id
                        cat.category = cat.id
                        delete cat.id
                    })
                    var keywords = []
                    if(parameters.keywords){
                        parameters.keywords.forEach(element => {
                            keywords.push({keyword:element,forum:forumtopic.id})
                        });
                    }
                    console.log(keywords)
                    ForumCategory.create(parameters.categories,function(err,category){
                        if(err) res.send(err)
                        else if(category){
                            ForumKeyword.create(keywords,function(err,keyword){
                                if(err) res.send(err)
                                else {
                                    ForumComment.create({text:parameters.message,forum:forumtopic.id,person:payload.person.id},function(err,comment){
                                        if(err) console.log(err)
                                        else if(comment){
                                            Log.create({message:parameters.topicname+ " forum created"},function(err){})
                                            res.send(forumtopic)
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

