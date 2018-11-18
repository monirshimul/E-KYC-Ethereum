import { Component, OnInit } from '@angular/core';
import {Bankaccess} from '../model/bankaccess.model';
import {AccessAccountService} from '../services/access-account.service';

@Component({
  selector: 'app-access-account',
  templateUrl: './access-account.component.html',
  styleUrls: ['./access-account.component.css'],
  providers:[AccessAccountService]
})
export class AccessAccountComponent implements OnInit {

  bankUid : string = "";
  bankPasscode : string = "";
  name : string = "";
  fatherName: string ="";
  dob:string ="";
  mobileNumber:string ="";
  currentAddress: string ="";
  gender : string ="";

  isVisible : boolean = false;

  Accessaccount= new Bankaccess("","","");
  
  constructor(private accessaccount:AccessAccountService) { }
  

  ngOnInit() {
  }
  
  onAccessAccount(){
    this.accessaccount.storeAccess(this.Accessaccount)
    .subscribe(
      (response)=> {
       let  accesskycResponse  = JSON.parse(response.text());
        this.name=accesskycResponse.name;
        this.fatherName=accesskycResponse.fatherName;
        this.dob=accesskycResponse.dob;
        this. mobileNumber=accesskycResponse. mobileNumber;
        this.currentAddress=accesskycResponse.currentAddress;
        this.gender=accesskycResponse.gender;

        this.isVisible = true;
        //console.log(accountCreationResponse);
       // console.log(response);
      },
      (error)=> console.log(error)
    );
   
    
  }

}
