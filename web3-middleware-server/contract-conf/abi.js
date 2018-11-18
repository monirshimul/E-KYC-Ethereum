var kycAbi =  [
  {
    "inputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "name",
        "type": "string"
      },
      {
        "name": "uid",
        "type": "string"
      },
      {
        "name": "passcode",
        "type": "string"
      }
    ],
    "name": "registerNewBank",
    "outputs": [
      {
        "name": "",
        "type": "bool"
      }
    ],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "getBankCount",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "uid",
        "type": "string"
      },
      {
        "name": "passcode",
        "type": "string"
      }
    ],
    "name": "getBankInfo",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      },
      {
        "name": "name",
        "type": "string"
      }
    ],
    "name": "createAccount",
    "outputs": [
      {
        "name": "",
        "type": "bool"
      }
    ],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      },
      {
        "name": "dob",
        "type": "string"
      }
    ],
    "name": "setAccountDOB",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      },
      {
        "name": "mobile",
        "type": "string"
      }
    ],
    "name": "setAccountMobileNumber",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      },
      {
        "name": "caddress",
        "type": "string"
      }
    ],
    "name": "setAccountCurrentAddress",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      },
      {
        "name": "fatherName",
        "type": "string"
      }
    ],
    "name": "setAccountFatherName",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      },
      {
        "name": "gender",
        "type": "string"
      }
    ],
    "name": "setAccountGender",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountName",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountDOB",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountMobileNumber",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountCurrentAddress",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountFatherName",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountGender",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "bankUid",
        "type": "string"
      },
      {
        "name": "bankPass",
        "type": "string"
      },
      {
        "name": "nid",
        "type": "string"
      }
    ],
    "name": "getAccountSeederBank",
    "outputs": [
      {
        "name": "",
        "type": "string"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  }
];


module.exports = {
    kycAbi
};