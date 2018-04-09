/**
 * SessionController
 *
 * @description :: Server-side logic for managing sessions
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var bcrypt = require('bcrypt'); 
var passport = require('passport');
var jwt = require('jsonwebtoken');

module.exports = {
    create: function(req, res, next) {
        User.findOneByUsername(req.param('username'), function foundUser (err, user) {
            if (err) return res.send({err:err.message});
            else{
                console.log(user)
                if (!user) {
                    var noAccountError = {name: 'noAccount', message: 'The username ' + req.param('username') + ' not found.'}
                    res.send(noAccountError);
                    return;
                }  
                // Compare password from the form params to the encrypted password of the user found.
                bcrypt.compare(req.param('password'), user.encryptedPassword, function(err, valid) {
                    if (err) return res.send({err:err.message});
                    // If the password from the form doesn't match the password from the database...
                    if (!valid) {
                        var usernamePasswordMismatchError = {name: 'usernamePasswordMismatch', message: 'Invalid username and password combination.'}
                        res.send(usernamePasswordMismatchError);
                        return;
                    }
                    if(!user.isVerified){
                        var requireEmailVerification = {name: 'EmailNotVerified', message: 'Cannot logged in the email address is not verified'}
                        res.send(requireEmailVerification);
                        return;
                    }

                    Person.findOne({id:user.personId},function(err,person){
                        if(err) console.log(err)
                        else if(person) {
                            console.log(person)
                            if(person.type == 1){
                                Student.findOne({id:person.id},function(err,student){
                                    if(err) console.log(err)
                                    else if(student){
                                        console.log(student)
                                         // Log user in
                                        //Redirect to their profile page (e.g. /views/user/show.ejs)
                                        var token = jwt.sign({user:user,person:person,data:student,isStudent:true},'322b8527aa325403cba54d205f0ebd7b');
                                        Log.create({message:user.username + " logs in"},function(err){})
                                        res.send({name:"ok",token:token});
                                        return;		
                                    }
                                })
                            } else {
                                Teacher.findOne({id:person.id},function(err,teacher){
                                    if(err) console.log(err)
                                    else if(teacher){
                                        console.log(teacher)
                                         // Log user in
                                        //Redirect to their profile page (e.g. /views/user/show.ejs)
                                        var token = jwt.sign({user:user,person:person,data:teacher,isStudent:false},'322b8527aa325403cba54d205f0ebd7b');
                                        Log.create({message:user.username + " logs in"},function(err){})
                                        res.send({name:"ok",token:token});
                                        return;		
                                    }
                                })
                            }
                        }
                    })

                   
                });  
            }
        });
    },
    destroy: function(req, res, next) {
            // Wipe out the session (log out)
            req.session.destroy();

            // Redirect the browser to the sign-in screen
            res.redirect('/');
            
    },
    logout: function(req, res) {
        req.logout();
        res.redirect('/session/new');
    },
    facebook: function(req, res) {
    passport.authenticate('facebook', 
                            { failureRedirect: '/session/new', 
                                scope: ['email'] } ,
                            function(err, user) {
    //   req.logIn(user, function(err) {
    //     if (err) {
    //       console.log(err);
    //       res.view('500');
    //       return;
    //     }

        // Log user in
        if(err) res.status(500).send({msg:'user not found'});
        console.log(user);
        req.session.authenticated = true;
        req.session.User = user;

        console.log(req.session);

    //     res.redirect('/user/show/'+user.id);
        res.redirect('/dashboard');
        return;
    })(req, res);
    },
    github: function(req, res) {
    passport.authenticate('github', { failureRedirect: '/session/new' }, function(err, user) {
        if(err) res.status(500).send({msg:'user not found'});
        console.log(user);
        req.session.authenticated = true;
        req.session.User = user;

        res.redirect('/user/show/'+user.id);
        return;
    })(req, res);
    },
    twitter: function(req, res) {
    passport.authenticate('twitter', { failureRedirect: '/session/new' }, function(err, user) {
        if(err) res.status(500).send({msg:'user not found'});
        console.log(user);
        req.session.authenticated = true;
        req.session.User = user;

        res.redirect('/user/show/'+user.id);
        return;
    })(req, res);
    },
    google: function(req, res) {
    passport.authenticate('google', { failureRedirect: '/session/new', scope: ['https://www.googleapis.com/auth/plus.login', 'https://www.googleapis.com/auth/plus.profile.emails.read'] }, function(err, user) {
        if(err) res.status(500).send({msg:'user not found'});
        console.log(user);
        req.session.authenticated = true;
        req.session.User = user;

            res.redirect('/user/show/'+user.id);
            return;
    })(req, res);
    },

    validate:function(req,res,next){
        console.log(req.param('username'))
        User.findOneByUsername(req.param('username'), function foundUser (err, user) {
            if (err) return res.send({err:err.message});
            // If no user is found...
            else if (user) {
                var usernameExist = {name: 'usernameExist', message: 'The username ' + req.param('username') + ' alread exist.'}
                res.send(usernameExist);
                return;
            } else {
                User.findOneByEmail(req.param('email'),function (err,user){
                    if(err) return res.send({err:err.message});
                    else if(user){
                        var emailExist = {name: 'emailExist', message: 'The email ' + req.param('email') + ' alread exist.'}
                        res.send(emailExist);
                        return;
                    } else {
                        res.send({name:'ok',message:'ok'})
                    }
                })
            }
        }) 
    }

};
