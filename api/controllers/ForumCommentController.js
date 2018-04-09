/**
 * ForumCommentController
 *
 * @description :: Server-side logic for managing Forumcomments
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var jwt = require('jsonwebtoken')
module.exports = {
	create:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var parameters = req.params.all()
        parameters.person = payload.person.id
        ForumComment.create(parameters,function(err,comment){
            if(err) {Log.create({message:"Something went wrong while creating forum comment"},function(err){});res.send(err)}
            else if(comment){
                Log.create({message:"username commented on forum"},function(err){
                    comment.person = payload.person
                    console.log(comment)
                    console.log('broadcasting comment ot forum ' + parameters.forum)
                    sails.sockets.broadcast('forum'+parameters.forum, 'comment', comment);
                  //  res.send(comment)
                });
            }
        })
    }
};

