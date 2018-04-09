/**
 * Experience.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */


module.exports = {
  schema:true,
  attributes: {
    teacherId:{
      model:'teacher'
    },
    position:{
      model:'job',
      required:true
    },
    start_date:{
      type:'string',
      required:true
    },
    end_date:{
      type:'string',
      required:true
    },
    institute:{
      type:'string',
      required:true
    }
  }
};



