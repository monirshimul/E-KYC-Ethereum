pragma solidity ^0.4.23;


contract AccountInfo {
    
    struct Account {
        string name;
        string nid;
        string dob;
        string mobileNumber;
        string currentAddress;
        string fatherName;
        string gender;
        string seederBank;
        uint regUnixTime;
    }
    
    mapping(string => Account) accounts;
    
    modifier isAccountExists(string nid) {
        require(accounts[nid].regUnixTime > 0, "Account not exists");
        _;
    }
    
    function accountInit(string name, string nid, string seederBank) public  returns(bool) {
        accounts[nid] = Account(name, nid, "", "", "", "", "", seederBank, uint(now));
        return true;
    }
    
    
    // setter functions
    
    function setDOB(string nid, string dob) public isAccountExists(nid) returns(bool) {
        accounts[nid].dob = dob;
        return true;
    }
    
    function setMobileNumber(string nid, string mobile) public isAccountExists(nid) returns(bool) {
        accounts[nid].mobileNumber = mobile;
        return true;
    }
    
    function setCurrentAddress(string nid, string caddress) public isAccountExists(nid) returns(bool) {
        accounts[nid].currentAddress = caddress;
        return true;
    }
    
    function setFatherName(string nid, string fatherName) public isAccountExists(nid) returns(bool) {
        accounts[nid].fatherName = fatherName;
        return true;
    }
    
    function setGender(string nid, string gender) public isAccountExists(nid) returns(bool) {
        accounts[nid].gender = gender;
        return true;
    }
    
     // getter functions
     
    function getName(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].name;
    }
     
    function getDOB(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].dob;
    }
     
    function getMobileNumber(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].mobileNumber;
    }
     
    function getCurrentAddress(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].currentAddress;
    }
     
    function getFatherName(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].fatherName;
    }
     
    function getGender(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].gender;
    }
     
    function getSeederBank(string nid) public view isAccountExists(nid) returns(string) {
        return accounts[nid].seederBank;
    }
    
    
}