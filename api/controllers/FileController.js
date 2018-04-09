/**
 * FileController
 *
 * @description :: Server-side logic for managing files
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var jwt = require('jsonwebtoken')
var multer = require('multer');
module.exports = {
	
  get:function(req,res){
    Resource.find({}).populate('downloads').populate('keywords').populate('categories').populate('person')
    .exec(function(err,files){
        if(err) console.log(err)
        else if(files){
            Category.find({},function(err,categories){
                if(err) console.log(err)
                else if(categories){
                    res.json({
                        files,
                        categories
                    })
                }
            })
                
        }
    })
  },
  getOne:function(req,res,next){
    Resource.findOne({id:req.param('id')}).populate('downloads').populate('keywords').populate('categories').populate('person')
    .exec(function(err,files){
        if(err) console.log(err)
        else if(files){
            Category.find({},function(err,categories){
                if(err) console.log(err)
                else if(categories){
                    res.json({
                        files,
                        categories
                    })
                }
            })
                
        }
    })
  },
  update:function(req,res){
    var id = req.param('id')
    var parameters = req.params.all()
    parameters.categories.map(cat=>{
        cat.file = id
        cat.category = cat.id
        delete cat.id
    })
    var keywords = []
    if(parameters.keywords){
        parameters.keywords.forEach(element => {
            keywords.push({keyword:element,file:id})
        });
    }
    delete parameters.id
    console.log(keywords)
    Resource.update({id:id},{name:parameters.name,description:parameters.description},function(err,file){
        if(err) console.log(err)
        else {
            console.log(parameters.categories)
            FileCategory.destroy({file:id},function(err,files){
                if(err){
                    console.log(err)
                }
                else {
                    FileCategory.create(parameters.categories,function(err,categories){
                        if(err) console.log(err)
                        else if(categories) {
                            console.log(id)
                            FileKeyword.destroy({file:id},function(err,keyword){
                                if(err)console.log(err)
                                else if(keyword){
                                  

                                    FileKeyword.create(keywords,function(err,keywords){
                                        if(err) console.log(err)
                                    
                                        res.json({
                                            file
                                        })
                                    
                                    })
                                }
                            })
                        }
                    }) 
                }
            })
        }
    })
  },
  /**
   * `FileController.upload()`
   *
   * Upload file(s) to the server's disk.
   */

  upload: function (req, res) {
      var file = req.file('resource');
      if(file){
          req.file('resource').upload(
              {dirname: require('path').resolve(sails.config.appPath, 'assets/uploads')},
              function (err, files) {
              if (err)
                return res.serverError(err);
        
              return res.json({
                message: files.length + ' file(s) uploaded successfully!',
                files: files
              });
            });
      } else { 
          console.log('No file');

      }
    },

    uploadFileData:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var person = payload.person
        var parameters = req.params.all();
        var newFile = {
            name: parameters.name,
            description:parameters.description,
            downloadLink:parameters.path,
            person:person.id
        }
        Resource.create(newFile,function(err,file){
            if(err) {
                Log.create({message:"Error Uploading File"},function(err){})
                return res.send(err)
            }
            else {
                Log.create({message:"File Uploaded By .."},function(err){})
                parameters.categories.map(cat=>{
                    cat.file = file.id
                    cat.category = cat.id
                    delete cat.id
                })
                FileCategory.create(parameters.categories,function(err,categories){
                    if(err) console.log(err)
                    else if(categories){
                        var keywords = []
                        if(parameters.keywords){
                            parameters.keywords.forEach(element => {
                                keywords.push({keyword:element,file:file.id})
                            });
                        }
                    
                        FileKeyword.create(keywords,function(err,keywords){
                            if(err) console.log(err)
                        
                            res.json({
                                file
                            })
                        
                        })
                    }
                })
            }
        })
    },
    download:function(req,res,next){
        var token = req.headers.authorization.split(' ')[1];
        var payload = jwt.decode(token, "322b8527aa325403cba54d205f0ebd7b");
        var person = payload.person
        var parameters = req.params.all()

        var down = {
            person: person.id,
            file:parameters.fileid
        }
        FileDownload.find({file:parameters.fileid,person:person.id},function(err,files){
            if(err)console.log(err)
            else if(files){
                if(files.length > 0){
                    res.json({'msg':'hogye download'})
                }else{
                    FileDownload.create(down,function(err,file){
                    if(err)console.log(err)
                    else if(file){
                        res.json({file})
                        }
                    })
                }
            }
        })
    }
    
};

