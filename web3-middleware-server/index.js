const express = require('express');
const bodyParser = require('body-parser');
const app = express();

const kycRouter = require('./routes/kycRouter.js');


// enabling cors
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

// for making angular client public 
app.use('/', express.static('public'));
//for parsing json input from angular
app.use(bodyParser.json());

// for serving angular
app.use('/', express.static('public'));

// for using application routes
app.use('/kyc', kycRouter);

// for handling bad urls
app.get('*', function(req, res) {
    res.status(404).json({
        message : "URL not found"
    });
});

app.post('*', function(req, res){
    res.status(404).json({
        message : "URL not found"
    });
});


// for starting the express server
app.listen(3000, (err, res) => {
    console.log("Server is up!!");
})