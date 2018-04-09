/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  schema : true,
  attributes: {
    provider:{
      type:'string'
    },
    username:{
      type:'string',
      required:true,
      unique:true
    },
    email:{
      type:'string',
      email:true,
      required:true
    },
    encryptedPassword:{
      type:'string',
      required:true
    },
    isVerified:{
      type:'boolean',
      defaultsTo:false
    },
    passwordResetToken:{
      type:'string'
    },
    passwordResetExpires:{
      type:'datetime'
    },
    facebookId:{
      type:'string'
    },
    gmailId:{
      type:'string'
    },
    token: {
      collection:'token',
      via :'user'
    },
    personId:{
      model:'person',
      unique: true
    },
    personType:{
      type:'string',
      required:true
    },
    toJSON:function(){
      var obj = this.toObject();
      delete obj.encryptedPassword;
      delete obj.token;
      delete obj.provider;
      delete obj.facebookId;
      delete obj.gmailId;
      delete obj.createdAt;
      delete obj.updatedAt;
      return obj;
    },
    beforeCreate : function(values,next){
      if(!values.encryptedPassword){
        return next({err:["Password doesn't match password confirmation"]});
      }
      require('bcrypt').hash(values.encryptedPassword,10,function(err,encryptedPassword){
        if(err) return next(err);
        values.encryptedPassword =  encryptedPassword
        next();
      });
    }
  }
};

