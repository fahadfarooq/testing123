/**
 * Person.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  schema : true,
  
  attributes: {
    type:{
      type:'string',
      required:true
    },
    fullname : {
      type:'string',
      required : true
    },
    country:{
      type:'string'
    },
    gender:{
      model:'gender'
    },
    pictureFD:{
      type:'string'
    },
    dob:{
      type:'string'
    },
    phone:{
      type:'string'
    },
    username:{
      type:'string'
    },
    uploads:{
      collection : 'resource',
      via :'person'
    },
    downloads:{
      collection:'filedownload',
      via : 'person'
    },
    photo_url:{
      type : 'string',
      defaultsTo:'/user_images/default.png'
    },
    isDeleted:{
      type : 'boolean',
      defaultsTo:false
    },
    Education:{
      collection:'education',
      via:'personId'
    },
    InterestedCourses:{
      collection:'interestedcourse',
      via:'personId'
    },
    description:{
      type:'string'
    },
    oneliner:{
      type:'string'
    }
  }
};

