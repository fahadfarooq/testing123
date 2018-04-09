/**
 * CategoryController
 *
 * @description :: Server-side logic for managing categories
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var jwt = require('jsonwebtoken');
module.exports = {
	create : function(req, res, next){
        Category.create(req.params.all(),function(err,category){
            if(err) {Log.create({message:"Something went wrong creating category"},function(err){}); res.send(err);}
            else {Log.create({message:"New Category Created"},function(err){res.send(category)});}
        })
    }
};

