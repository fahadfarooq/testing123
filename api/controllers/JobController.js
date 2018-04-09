/**
 * JobController
 *
 * @description :: Server-side logic for managing jobs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	create : function(req, res, next){
        Job.create(req.params.all(),function(err,job){
            if(err) {Log.create({message:"Error inserting job"},function(err){}); res.send(err)}
            else {Log.create({message:"Job Inserted"},function(err){}); res.send(job)}
        })
    }
};

