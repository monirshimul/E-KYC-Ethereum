import { Component, OnInit } from '@angular/core';
import { Bankinfo } from '../model/bankinformation.model';
import {BankInfoService} from '../services/bank-info.service';
@Component({
  selector: 'app-bank-info',
  templateUrl: './bank-info.component.html',
  styleUrls: ['./bank-info.component.css'],
  providers:[BankInfoService]
})
export class BankInfoComponent implements OnInit {

  //Infobank : any[]; //
  Infobank=new Bankinfo("","");

  bankName : string = "";

  isVisible : boolean = false;
  
  //Bankinfo={
  //  bank_uid:'',
 //   bank_passcode:''
  //}
  constructor(private bankinfo:BankInfoService ){}//public dataService:BankinformationService ) { }

  ngOnInit() {
  }
  
  onBankinfoSubmit(){
    //console.log(this.Infobank);
    this.bankinfo.storeInformation(this.Infobank)
    .subscribe(
      (response)=> {
        this.bankName = JSON.parse(response.text()).bankName;
        this.isVisible = true;
      },
      (error)=> console.log(error)
    );
   
  }

}
