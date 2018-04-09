/**
 * MessageController
 *
 * @description :: Server-side logic for managing messages
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var jwt = require('jsonwebtoken')
module.exports = {
    join:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var person = payload.person
        console.log('join')
        if (!req.isSocket) { 
            return res.badRequest();
        }
        console.log('socket join to ' + person.id)
            sails.sockets.join(req, 'message_'+person.id);
        return res.ok();
    }
};

