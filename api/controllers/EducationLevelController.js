/**
 * EducationLevelController
 *
 * @description :: Server-side logic for managing educationlevels
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	create : function(req, res, next){
        EducationLevel.create(req.params.all(),function(err,educationlevel){
            if(err) {Log.create({message:"Something went wrong creating Education Level"},function(err){}); res.send(err);}
            else {Log.create({message:"New Education Level Created"},function(err){});res.send(educationlevel)}
        })
    }
};

