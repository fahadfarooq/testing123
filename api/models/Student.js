/**
 * Student.js
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
    educationalLevel : {
      model:'EducationLevel',
      required:true
    },
    institute:{
      type:'string',
      required:true
    },
    deposited_amount:{
      type : 'float',
      defaultsTo:0
    },
    personId:{
      model:'person',
      unique: true,
    },
    connection:{
      collection:'connection',
      via:'connectionOf'
    },
    threads:{
      collection:'threadmember',
      via:'student'
    }
  }
};

