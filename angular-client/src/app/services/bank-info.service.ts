import { Injectable } from '@angular/core';
import {Http} from '@angular/http';
import { Bankinfo } from '../model/bankinformation.model';

@Injectable({
  providedIn: 'root'
})
export class BankInfoService {

  constructor(private http:Http) { }

storeInformation(InfoBank:Bankinfo){
  return this.http.post('http://127.0.0.1:3000/kyc/get-bank-info',InfoBank);
}  

}
