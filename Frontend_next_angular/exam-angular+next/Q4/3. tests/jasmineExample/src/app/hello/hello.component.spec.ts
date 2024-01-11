// hello.component.spec.ts

import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HelloComponent } from './hello.component';

describe('HelloComponent', () => {
  let component: HelloComponent;
  let fixture: ComponentFixture<HelloComponent>;

  // configure the testing module and declare the HelloComponent
  // ng test to start test
  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [HelloComponent],
    });

    fixture = TestBed.createComponent(HelloComponent);
    component = fixture.componentInstance;
  });

  it('should create the component', () => {
    expect(component).toBeTruthy();
  });

  it('should display the greeting message', () => {
    fixture.detectChanges(); // Trigger change detection

    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('p').textContent).toContain('Hello, World!');
  });

  it('should update the greeting message', () => {
    component.greeting = 'This is the exam!';
    fixture.detectChanges(); // Trigger change detection

    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('p').textContent).toContain(
      'This is the exam!'
    );
  });
});
