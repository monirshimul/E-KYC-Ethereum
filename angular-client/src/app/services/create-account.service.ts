import { Injectable } from '@angular/core';
import {Http} from '@angular/http';
import { Createaccount} from '../model/createaccount.model';

@Injectable({
  providedIn: 'root'
})
export class CreateAccountService {

 

  constructor(private http:Http) { }

storeCreateInformation(accountCreate:Createaccount){
  return this.http.post('http://127.0.0.1:3000/kyc/create-account',accountCreate);
}

}