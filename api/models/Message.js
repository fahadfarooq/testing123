/**
 * Message.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  schema:true,
  attributes: {
    msg:{
      type:'string'
    },
    isImage:{
      type:'boolean'
    },
    imageLink:{
      type:'string'
    },
    student:{
      model:'student'
    }
  }
};

