
/**
 * TokenController
 *
 * @description :: Server-side logic for managing tokens
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var crypto = require('crypto');
var nodemailer = require('nodemailer');
module.exports = {
	confirmation : function(req,res,next){
        console.log(req.params);
        // Find a matching token
        Token.findOne({ value: req.params.id }, function (err, token) {
        if (!token) {
            var tokenNotFound = [{name:'tokenNotFound',message:'We were unable to find a valid token'}];
            res.redirect('http://localhost:4200/token/notfound');
        } else {
            var now = new Date();
            console.log(now);
            console.log(token.expiresAt);
            if(token.expiresAt < now){
                Token.destroy({id:token.id},function(err){
                    if(err) console.log(err)
                    else{
                        var tokenExpire = [{name:'tokenExpire',message:'Your token expires request a new one'}];
                        res.redirect('http://localhost:4200/token/resend');    
                    }
                })
            } // If we found a token, find a matching user
            else {
                User.findOne({ id: token.user }, function (err, user) {
                    if (!user) res.redirect('http://localhost:4200/token/notfound')
                    else if (user.isVerified) res.redirect('http://localhost:4200/signup');
                    else {
                        // Verify and save the user
                        user.isVerified = true;
                        Token.destroy({id:token.id},function(err){
                            if(err) console.log(err)
                            User.update({'id':user.id},{'isVerified':true},function (err,user) {
                                    if (err) { return res.status(500).send({ msg: err.message }); }
                                    Log.create({message:user.username+ " email verified"},function(err){})
                                    res.redirect('http://localhost:4200/verified');
                                });
                            });
                        }
                })
            }
        }
    });
},
    resend : function(req,res,next){
        User.findOne(req.params.all(), function (err, user) {
            if (!user) return res.send({msg: 'We were unable to find a user with that email.' });
            else if (user.isVerified) res.redirect('http://localhost:4200/signup')
            else {
                var odlDateObj = new Date();
                var newDateObj =new Date(odlDateObj.getTime() + 12*60*60*1000);
                // var newDateObj =new Date(odlDateObj.getTime() + 60*1000);
                // Save the token
                Token.create({value:  crypto.randomBytes(16).toString('hex') ,user:user.id, expiresAt: newDateObj},function(err,token){
                    if(err){
                        return res.redirect('http://localhost:4200/signup');
                    }
                    console.log('Token created now sending email ' + token )
                    var transporter = nodemailer.createTransport({ 
                        service: 'gmail', 
                        auth: { 
                            user: 'vollage123@gmail.com', 
                            pass: 'kuchbara' 
                        } 
                    });
                    var mailOptions = { 
                        from: 'no-reply@yourwebapplication.com', 
                        to: user.email, 
                        subject: 'Account Verification Token', 
                        text: 'Hello,\n\n' + 'Please verify your account by clicking the link: \nhttp:\/\/' + req.headers.host + '\/token/confirmation\/' + token.value + '.\n',
                        // html : `<h1>Hello</h1>, <br><p>Please verify your account by clicking the <a href='"http://" + ${req.headers.host}+"/confirmation/" +${token.value}'>link</a>.<br>`
                    };
                    transporter.sendMail(mailOptions, function (err) {
                        if (err) { return res.status(500).send({ msg: err.message }); }
    
                        var requireEmailVerification = {name:'emailVerfication',message:'Email has been sent to your email address please verify your email before login'};
                        console.log('mail send succesfull');
                        res.send(requireEmailVerification);                
                    });
                });
            }
        });
    }
};

