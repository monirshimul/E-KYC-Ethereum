import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateNidComponent } from './update-nid.component';

describe('UpdateNidComponent', () => {
  let component: UpdateNidComponent;
  let fixture: ComponentFixture<UpdateNidComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UpdateNidComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UpdateNidComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
