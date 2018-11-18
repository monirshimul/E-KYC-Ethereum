pragma solidity ^0.4.23;

import "./AccountInfo.sol";


contract KYC  {
    address private owner;
    
    AccountInfo accInfo;
    
    struct Bank {
        string name;
        string uid;
        string passcode;
    }
    
    Bank[] private banks;
    
    mapping(string => bool) uniqueUid;
    
    mapping(string => bool) uniqueNid;
    
    constructor() public {
        owner = msg.sender;
        accInfo = new AccountInfo();
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "Not Authorized");
        _;
    }
    
    modifier uniqueAccount(string nid) {
        require(uniqueNid[nid] == false, "Account exists");
        _;
    }
    
    
    modifier validBankInput(string name, string uid, string pass) {
        bytes memory n = bytes(name);
        bytes memory u = bytes(uid);
        bytes memory p = bytes(pass);
        require(uniqueUid[uid] == false, "UID exists");
        require(n.length > 0, "Valid bank name required");
        require(u.length > 8, "UID should be greater than 8 character");
        require(p.length > 8, "Passcode should be greater than 8 character");
        _;
    }
    
    // bank management related functions
    
    function registerNewBank(string name, string uid, string passcode) external 
    onlyOwner validBankInput(name, uid, passcode) returns(bool) {
        Bank memory newBank = Bank(name, uid, passcode);
        banks.push(newBank);
        uniqueUid[uid] = true;
        return true;
    }
    
    function getBankCount() public view onlyOwner returns(uint){
        return banks.length;
    }
    
    function getBankInfo(string uid, string passcode) external view returns(string) {
        Bank memory currentBank;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(uid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(passcode))){
                currentBank = banks[i];
                break;
            }
        }
        return currentBank.name;
    }
    
    // Account Related functions
    
    function createAccount(string bankUid, string bankPass, string nid, string name)
    public uniqueAccount(nid) returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                accInfo.accountInit(name, nid, banks[i].name);
                uniqueNid[nid] = true;
                return true;
            }
        }
        return false;
    }
    
    // setters
    
    function setAccountDOB(string bankUid, string bankPass, string nid, string dob) public {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                accInfo.setDOB(nid, dob);
                break;
            }
        }
    }
    
    function setAccountMobileNumber(string bankUid, string bankPass, string nid, string mobile) public {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                accInfo.setMobileNumber(nid, mobile);
                break;
            }
        }
    }
    
    function setAccountCurrentAddress(string bankUid, string bankPass, string nid, string caddress) public {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                accInfo.setCurrentAddress(nid, caddress);
                break;
            }
        }
    }
    
    function setAccountFatherName(string bankUid, string bankPass, string nid, string fatherName) public {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                accInfo.setFatherName(nid, fatherName);
                break;
            }
        }
    }
    
    function setAccountGender(string bankUid, string bankPass, string nid, string gender) public {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                accInfo.setGender(nid, gender);
                break;
            }
        }
    }
    
    // getters
    
    function getAccountName(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getName(nid);
                break;
            }
        }
        return str;
    }
    
    function getAccountDOB(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getDOB(nid);
                break;
            }
        }
        return str;
    }
    
    function getAccountMobileNumber(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getMobileNumber(nid);
                break;
            }
        }
        return str;
    }
    
    function getAccountCurrentAddress(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getCurrentAddress(nid);
                break;
            }
        }
        return str;
    }
    
    function getAccountFatherName(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getFatherName(nid);
                break;
            }
        }
        return str;
    }
    
    function getAccountGender(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getGender(nid);
                break;
            }
        }
        return str;
    }
    
    function getAccountSeederBank(string bankUid, string bankPass, string nid) public view returns(string) {
        string memory str;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(bankPass))){
                str = accInfo.getSeederBank(nid);
                break;
            }
        }
        return str;
    }
    
}