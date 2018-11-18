import { TestBed } from '@angular/core/testing';

import { AccessAccountService } from './access-account.service';

describe('AccessAccountService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: AccessAccountService = TestBed.get(AccessAccountService);
    expect(service).toBeTruthy();
  });
});
