import { Component, OnInit } from '@angular/core';
import { Createaccount } from '../model/createaccount.model';
import {CreateAccountService} from '../services/create-account.service';


@Component({
  selector: 'app-create-account',
  templateUrl: './create-account.component.html',
  styleUrls: ['./create-account.component.css'],
  
})
export class CreateAccountComponent implements OnInit {
  
  accountCreate = new Createaccount("","","","","","","","","");


  constructor(private createaccount:CreateAccountService) { }

  
  message:string="";



  ngOnInit() {
  }

  onSubmit(){
    //console.log(this.accountCreate);
    this.createaccount.storeCreateInformation(this.accountCreate)
    .subscribe(
      (response)=> {
        let accountCreationResponse  = JSON.parse(response.text());
        this.message=accountCreationResponse.message;
        console.log(accountCreationResponse);
        alert(this.message);
      },
      (error)=> console.log(error)
    );
    
  }
 
   
 


}
