import { TestBed } from '@angular/core/testing';

import { BankInfoService } from './bank-info.service';

describe('BankInfoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BankInfoService = TestBed.get(BankInfoService);
    expect(service).toBeTruthy();
  });
});
