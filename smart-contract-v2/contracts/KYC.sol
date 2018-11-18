pragma experimental ABIEncoderV2;
pragma solidity ^0.4.23;


contract KYC {
    
    address private owner;
    
    struct Bank {
        string name;
        string uid;
        string passcode;
    }
    
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
    
    Bank[] private banks;
    
    Account[] private accounts;
    
    mapping(string => bool) uniqueUid;
    
    mapping(string => bool) uniqueNid;
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "Owner authentication required");
        _;
    }
    
    modifier uniqueAccount(string nid) {
        require(uniqueNid[nid] == false, "Account exists already");
        _;
    }
    
    modifier validBankInput(string name, string uid, string pass) {
        bytes memory n = bytes(name);
        bytes memory u = bytes(uid);
        bytes memory p = bytes(pass);
        require(uniqueUid[uid] == false, "UID exists already");
        require(n.length > 0, "Please provide a valid bank name");
        require(u.length > 8, "UID should be greater than 8 character");
        require(p.length > 8, "Passcode should be greater than 8 character");
        _;
    }
    
    function registerNewBank(string _name, string _uid, string _passcode) external 
    onlyOwner validBankInput(_name, _uid, _passcode) returns(bool) {
        Bank memory newBank = Bank(_name, _uid, _passcode);
        banks.push(newBank);
        uniqueUid[_uid] = true;
        return true;
    }
    
    function getBankCount() public view onlyOwner returns(uint){
        return banks.length;
    }
    
    function getAccountCount() public view onlyOwner returns(uint) {
        return accounts.length;
    }
    
    function getBankInfo(string _uid, string _passcode) external view returns(string) {
        Bank memory currentBank;
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_uid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_passcode))){
                currentBank = banks[i];
                break;
            }
        }
        return currentBank.name;
    }
    
    
    
    function createAccount(string _bankUid, string _bankPass, string[] _customerInfo)
    public uniqueAccount(_customerInfo[1]){
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))){
                Account memory newAccount = Account(_customerInfo[0],_customerInfo[1],_customerInfo[2],_customerInfo[3],_customerInfo[4],_customerInfo[5],_customerInfo[6],banks[i].name, uint(now));
                accounts.push(newAccount);
                uniqueNid[_customerInfo[1]] = true;
            }
        }
    }
    
    function accessAccount(string _bankUid, string _bankPass, string _customerNid) 
    external view returns(string[]) {
        string[] memory accountInfo = new string[](8);
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                Account memory acc = getAcoount(_customerNid);
                accountInfo[0] = acc.name;
                accountInfo[1] = acc.nid;
                accountInfo[2] = acc.dob;
                accountInfo[3] = acc.mobileNumber;
                accountInfo[4] = acc.currentAddress;
                accountInfo[5] = acc.fatherName;
                accountInfo[6] = acc.gender;
                accountInfo[7] = acc.seederBank;
                //accountInfo[8] = string(acc.regUnixTime);
                break;
            }
        }
        return accountInfo;
    }
    
    function getAcoount(string _nid) private view returns(Account) {
        Account memory acc;
        for(uint i = 0; i < accounts.length; i++){
            if(sha256(bytes(accounts[i].nid)) == sha256(bytes(_nid)))
                acc = accounts[i];
        }
        return acc;
    }
    
    function updateAccountName(string _bankUid, string _bankPass, string _customerNid, string newName) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].name = newName;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    function updateAccountNid(string _bankUid, string _bankPass, string _customerNid, string newNid) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        uniqueNid[accounts[j].nid] = false;
                        uniqueNid[newNid] = true;
                        accounts[j].nid = newNid;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    function updateAccountDOB(string _bankUid, string _bankPass, string _customerNid, string newDOB) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].dob = newDOB;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    
    function updateAccountMobile(string _bankUid, string _bankPass, string _customerNid, string newMobile) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].mobileNumber = newMobile;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    function updateAccountAddress(string _bankUid, string _bankPass, string _customerNid, string newAddress) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].currentAddress = newAddress;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    
    function updateAccountFatherName(string _bankUid, string _bankPass, string _customerNid, string newFatherName) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].fatherName = newFatherName;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    
    
    function updateAccountGender(string _bankUid, string _bankPass, string _customerNid, string gender) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].gender = gender;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
    
}