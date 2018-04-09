/**
 * File.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  schema:true,
  attributes: {
    name: {
      type:'string',
      required:true
    },
    person:{
      model:'person'
    },
    description:{
      type:'string'
    },
    combineRating:{
      type:'double'
    },
    downloadLink:{
      type:'string',
      required:true
    },
    downloads:{
      collection:'filedownload',
      via:'file'
    },
    categories:{
      collection:'filecategory',
      via:'file'
    },
    keywords:{
      collection:'filekeyword',
      via:'file'
    }
  }
};

