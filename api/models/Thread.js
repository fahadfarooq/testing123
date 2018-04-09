/**
 * Thread.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  schema:true,
  attributes: {
    lastmessageid:{
      model:'message'
    },
    lastpersonid:{
      model:'student'
    },
    icon:{
      type:'string'
    },
    roomid:{
      type:'string'
    },
    name:{
      type:'string'
    },
    messages:{
      collection:'threadmessage',
      via:'thread'
    },
    members:{
      collection:'threadmember',
      via:'thread'
    }
  }
};

