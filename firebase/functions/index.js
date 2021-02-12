const functions = require("firebase-functions");
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
admin.initializeApp();

var transport = nodemailer.createTransport({
    host: "smtp.mailtrap.io",
    port: 2525,
    auth: {
        user: "e7a9df7fdb25ab",
        pass: "61e0741363f1db"
    }
});

exports.emailSender = functions.https.onRequest((req, res) => {
    const mailOptions = {
        from: 'augustinevickky@gmail.com',
        to: req.query.dest,
        subject: 'Hello this is Victor from Nigeria',
        html: '<b>Sending emails with Firebase is easy!</b>'
    };
    return transport.sendMail(mailOptions, (err, info) => {
        if (err) {
            return res.send(err.toString());
        }
        return res.send('Email sent successfully');
    });
});