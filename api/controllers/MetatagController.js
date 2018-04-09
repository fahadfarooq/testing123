/**
 * MetatagController
 *
 * @description :: Server-side logic for managing metatags
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	create:function(req,res,next){
        var parameters = req.params.all();
        Metatag.create(parameters,function(err,tag){
            if(err) console.log(err)
            else if(tag){
                res.json({
                    tag
                })
            }
        })
    },
    GetAll:function(req,res,next){
        Metatag.find({},function(err,tags){
            if(err) console.log(err)
            else if(tags){
                var meta = {}

                tags.forEach(element => {
                    meta [element.key] = element.value
                });
                Sidebar.find({},function(err,sidebars){
                    if(err) console.log(err)
                    else if (sidebars){
                        Forum_sort_option.find({},function(err,options){
                            if(err) console.log(err);
                            else if(options){
                                res.json({
                                    meta,
                                    sidebars,
                                    options
                                })

                            }
                        })

                    }
                })
            }
        })
    },
    updatetag:function(req,res,next){
        var parameters = req.params.all();
        Metatag.update({key:parameters.key},{value:parameters.value},function(err,updated){
            if(err) console.log(err)
            else if(updated){
                res.json({
                    updated
                })
            }
        })
    }
};

