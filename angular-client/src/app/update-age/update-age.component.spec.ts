import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateAgeComponent } from './update-age.component';

describe('UpdateAgeComponent', () => {
  let component: UpdateAgeComponent;
  let fixture: ComponentFixture<UpdateAgeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UpdateAgeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UpdateAgeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
