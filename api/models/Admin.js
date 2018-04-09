/**
 * Admin.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  schema:true,
  attributes: {
    fullname:{
      type:'string'
    },
    photo_url:{
      type:'string'
    },
    username:{
      type:'string',
      unique:true
    },
    password:{
      type:'string'
    },
    toJSON:function(){
      var obj = this.toObject();
      delete obj.password;
      delete obj.createdAt;
      delete obj.updatedAt;
      return obj;
    },
  }
};

