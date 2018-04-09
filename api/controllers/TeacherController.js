/**
 * TeacherController
 *
 * @description :: Server-side logic for managing teachers
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	customGet:function(req,res,next){
        console.log(req.param('id'))
            Teacher.findOne({id: req.params.id})
            .populate('personId')
            .populate('MasterCourses')
            .populate('Experience')
            .exec(function (err,teacher) {
                if(!teacher) return next();
                Person.findOne({id:teacher.personId.id})
                .populate('InterestedCourses')
                .populate('Education')
                .exec(function(err,person){
                    teacher.Education = person.Education
                    teacher.InterestedCourses = person.InterestedCourses
                    return res.json({
                        teacher
                    });
                })
            });
        }
    }


