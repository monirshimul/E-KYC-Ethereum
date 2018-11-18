import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import  {HttpModule} from '@angular/http';
import { RouterModule} from '@angular/router';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { AccessAccountComponent } from './access-account/access-account.component';
import { BankInfoComponent } from './bank-info/bank-info.component';
import { CreateAccountComponent } from './create-account/create-account.component';
import { UpdateNameComponent } from './update-name/update-name.component';
import { UpdateNidComponent } from './update-nid/update-nid.component';
import { UpdateAgeComponent } from './update-age/update-age.component';
//import {BankInfoService} from '../services/bank-info.service';
@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    AccessAccountComponent,
    BankInfoComponent,
    CreateAccountComponent,
    UpdateNameComponent,
    UpdateNidComponent,
    UpdateAgeComponent 
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpModule,
    RouterModule.forRoot([
      {
        path:'', 
        component:CreateAccountComponent
       }, 
       {
        path:'bankInfo', 
        component: BankInfoComponent 
       }, 
      {
         path:'access-account', 
         component: AccessAccountComponent 
        },
        {
          path:'create-account', 
          component:CreateAccountComponent  
         },
         
         {
          path:'update-name', 
          component:UpdateNameComponent  
         },

         {
          path:'update-age', 
          component:UpdateAgeComponent  
         },

         {
          path:'update-nid', 
          component:UpdateNidComponent  
         },


    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
