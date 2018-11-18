accountRouter.post('/create-account', function(req, res){
    let accountInfo = [req.body.name, req.body.nid, req.body.dob, req.body.mobile, req.body.address, req.body.father_name, req.body.gender];
    console.log(accountInfo);
    let estimatedGas = kycContractInstance.createAccount.estimateGas(
        req.body.bank_uid,
        req.body.bank_passcode,
        [req.body.name, req.body.nid, req.body.dob, req.body.mobile, req.body.address, req.body.father_name, req.body.gender]
        );
    console.log(accountInfo);
    res.send(estimatedGas);
    /*let estimatedGas = 5000000; 
    console.log("gas: ", estimatedGas);
    kycContractInstance.createAccount(
        req.body.bank_uid,
        req.body.bank_passcode,
        [req.body.name, req.body.nid, req.body.dob, req.body.mobile, req.body.address, req.body.father_name, req.body.gender],
        {value: 0, gas: estimatedGas},
        (error, result) => {
            if(error){
                console.log(error);
                res.status(500).json({
                    message : "error"
                });
            }
            else{
                res.status(200).json({
                    tx_hash : result
                });
            }
        });*/
});

// for accessing account
accountRouter.post('/access-account', function(req, res){
    let estimatedGas = kycContractInstance.accessAccount.estimateGas(req.body.bank_uid, req.body.bank_passcode, req.body.customer_nid);
    kycContractInstance.accessAccount(
        req.body.bank_uid,
        req.body.bank_passcode,
        req.body.customer_nid,
        {value: 0, gas: estimatedGas},
        (err, result) => {
            if(err){
                res.status(500).json({
                    message : "error"
                });
            }
            else{
                res.status(200).json({
                    name : result[0],
                    nid : result[1],
                    age : result[2],
                    seeder_bank : result[3],
                    time : result[4]
                });
            }
        });
});

// for updating customer name
accountRouter.post('/update-name', function(req, res){
    let estimatedGas = kycContractInstance.updateAccountName.estimateGas(
        req.body.bank_uid,
        req.body.bank_passcode,
        req.body.customer_nid,
        req.body.customer_newname
        );

        kycContractInstance.updateAccountName(
            req.body.bank_uid,
            req.body.bank_passcode,
            req.body.customer_nid,
            req.body.customer_newname,
            {value: 0, gas: estimatedGas},
            (err, result) => {
                if(err){
                    res.status(500).json({
                        message : "error"
                    });
                }
                else{
                    res.status(200).json({
                        tx_hash : result
                    });
                }
        });

});

// for updating customer nid
accountRouter.post('/update-nid', function(req, res){
    let estimatedGas = kycContractInstance.updateAccountNid.estimateGas(
        req.body.bank_uid,
        req.body.bank_passcode,
        req.body.customer_nid,
        req.body.customer_newnid
        );

        kycContractInstance.updateAccountNid(
            req.body.bank_uid,
            req.body.bank_passcode,
            req.body.customer_nid,
            req.body.customer_newnid,
            {value: 0, gas: estimatedGas},
            (err, result) => {
                if(err){
                    res.status(500).json({
                        message : "error"
                    });
                }
                else{
                    res.status(200).json({
                        tx_hash : result
                    });
                }
        });

});
