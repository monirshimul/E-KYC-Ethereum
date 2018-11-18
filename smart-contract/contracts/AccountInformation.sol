pragma solidity ^0.4.23;

contract AccountInformation {
    
    address private owner;
    
    struct Bank {
        string name;
        string uid;
        string passcode;
    }
    
    struct Account {
        string name;
        string nid;
        uint age;
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
        require(msg.sender == owner);
        _;
    }
    
    modifier uniqueAccount(string nid) {
        require(uniqueNid[nid] == false);
        _;
    }
    
    modifier validBankInput(string name, string uid, string pass) {
        bytes memory n = bytes(name);
        bytes memory u = bytes(uid);
        bytes memory p = bytes(pass);
        require(uniqueUid[uid] == false);
        require(n.length > 0);
        require(u.length > 8);
        require(p.length > 8);
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
    
    function createAccount(string _bankUid, string _bankPass, string _customerNid, string _customerName, uint _customerAge)
    external  uniqueAccount(_customerNid) returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))){
                Account memory newAccount = Account(_customerName, _customerNid, _customerAge, banks[i].name, uint(now));
                accounts.push(newAccount);
                uniqueNid[_customerNid] = true;
                return true;
            }
        }
        return false;
    }
    
    function accessAccount(string _bankUid, string _bankPass, string _customerNid) 
    external view returns(string name, string nid, uint age, string seederBank, uint time) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                Account memory acc = getAcoount(_customerNid);
                name = acc.name;
                nid = acc.nid;
                age = acc.age;
                seederBank = acc.seederBank;
                time = acc.regUnixTime;
            }
        }
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
    
    function updateAccountAge(string _bankUid, string _bankPass, string _customerNid, uint newAge) 
    external returns(bool) {
        for(uint i = 0; i < banks.length; i++){
            if(sha256(bytes(banks[i].uid)) == sha256(bytes(_bankUid)) && sha256(bytes(banks[i].passcode)) == sha256(bytes(_bankPass))) {
                for(uint j = 0; j < accounts.length; j++){
                    if(sha256(bytes(accounts[j].nid)) == sha256(bytes(_customerNid))) {
                        accounts[j].age = newAge;
                        return true;
                    }
                        
                }
            }
        }
        return false;
    }
    
}