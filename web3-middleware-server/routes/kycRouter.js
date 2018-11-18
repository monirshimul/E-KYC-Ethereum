const express = require('express');
const kycRouter = express.Router();
const kycService = require('../services/kycService.js');
var kycServiceInstance = new kycService();


/*
 *for accessing bank information 
 */

kycRouter.post('/get-bank-info', function(req, res){
    console.log("got the request");
    let result = kycServiceInstance.getBankInfo(req.body.bank_uid, req.body.bank_passcode);
    console.log("result : " , result);
    if(result){
        res.status(200).json({
            bankName : result
        });
    }
    res.status(500).json({error : "check your uid and passcode"});
});

/**
 * for creating new account
 */

kycRouter.post('/create-account', function(req, res) {
    let txs = kycServiceInstance.createAccount(
        req.body.bank_uid,
        req.body.bank_passcode,
        req.body.name,
        req.body.nid,
        req.body.dob,
        req.body.mobile_number,
        req.body.current_address,
        req.body.father_name,
        req.body.gender
    );
    res.status(200).json({
        message : "account created",
        txLog : txs
    });
    
});

kycRouter.post('/access-account-info', function(req, res){
    let accountInfo = kycServiceInstance.getAccountInfo(req.body.bank_uid, req.body.bank_passcode, req.body.nid);
    if(accountInfo.name == "")
        res.status(500).json({error : "Check your input"});
    res.status(200).json(accountInfo);
});


module.exports = kycRouter;

