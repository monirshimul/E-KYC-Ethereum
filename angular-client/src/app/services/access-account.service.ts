import { Injectable } from '@angular/core';
import {Http} from '@angular/http';
import { Bankaccess } from '../model/bankaccess.model';
@Injectable({
  providedIn: 'root'
})
export class AccessAccountService {

  
  constructor(private http:Http) { }

  storeAccess(Accessaccount:Bankaccess){
    return this.http.post('http://127.0.0.1:3000/kyc/access-account-info',Accessaccount);
  }  
  
  }

