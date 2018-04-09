var jwt = require('jsonwebtoken')
module.exports = function isAdmin (req, res, next) {
    if (req.headers && req.headers.authorization) {
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        Admin.findOne({id:payload.admin.id},function(err,admin){
            if(admin.username == payload.admin.username){
                console.log(admin)
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