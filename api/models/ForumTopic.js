/**
 * ForumTopic.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  schema:true,
  attributes: {
    topicname:{
      type:'string',
      required:true
    },
    person:{
      model:'person'
    },
    description:{
      type:'string'
    },
    categories:{
      collection:'forumcategory',
      via:'forum'
    },
    keywords:{
      collection:'forumkeyword',
      via:'forum'
    },
    comments:{
      collection:'forumcomment',
      via:'forum'
    },
    username:{
      type:'string'
    }
  }
};

