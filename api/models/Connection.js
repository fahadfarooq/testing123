/**
 * Connection.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
 
  attributes: {
    connectionOf:{
      model:'student'
    },
    connectionWith:{
      model:'student'
    },
    status:{
      type:'string',
      enum:['active','removed']
    },
    username:{
      type:'string'
    },
    name:{
      type:'string'
    },
    image_url:{
      type:'string'
    }
  }
};

