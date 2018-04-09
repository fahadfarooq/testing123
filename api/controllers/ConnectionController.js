/**
 * ConnectionController
 *
 * @description :: Server-side logic for managing connections
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	create:function(req,res,next){
        var parameters = req.params.all();
        Connection.create(parameters,function(err,connection){
            if(err) console.log(err)
            else if(connection){
                res.json({
                    connection
                })
            }
        })
    }
};

