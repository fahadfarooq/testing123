/**
 * VideosessionController
 *
 * @description :: Server-side logic for managing videosessions
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    join: function (req, res) {
        console.log('join')
        if (!req.isSocket) { 
            return res.badRequest();
        }
        console.log('socket join to ' + req.param('id'))
            sails.sockets.join(req, 'video_'+req.param('id'));
        return res.ok();
    },       
    icecandidate : function(req,res){
        var parameters = req.params.all();
        console.log("now broadcasting " + parameters.id)
        sails.sockets.broadcast('video_'+1, 'new_student', parameters);
        return res.json({
            msg:'kaise hon?'
        })
    }
};

