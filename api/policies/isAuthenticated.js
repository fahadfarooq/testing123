var jwt = require('jsonwebtoken')
module.exports = function isAuthenticated (req, res, next) {
    if (req.headers && req.headers.authorization) {
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        User.findOne({id:payload.user.id},function(err,user){
            if(user.username == payload.user.username){
                console.log(user)
               next()
            } else {
                return res.json({
                    "error":"Unauthorized"
                })
            }
        })
    } else {
        return res.json({
            "error" : "Unauthorized"
        })
    }
};