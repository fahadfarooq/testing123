/**
 * Teacher.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  schema : true,
  attributes: {
    id:{
      type:"int",
      primaryKey: true,
      autoIncrement: true
    },
    position : {
      model:'job',
      required:true
    },
    institute:{
      type:'string',
      required:true
    },
    isPublished: {
      type:'boolean',
      defaultsTo:false
    },
    personId:{
      model:'person',
      unique: true
    },
    Experience:{
      collection:'experience',
      via:'teacherId'
    },
    MasterCourses:{
      collection:'mastercourse',
      via:'teacherId'
    }
  }
};

