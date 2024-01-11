// user-form.component.ts
import { Component, OnInit } from '@angular/core';
import {
  FormGroup,
  FormControl,
  Validators,
  AbstractControl,
} from '@angular/forms';

// Custom Validator Function
function phoneNumberValidator(
  control: AbstractControl
): { [key: string]: any } | null {
  const valid = /^\d+$/.test(control.value);
  return valid ? null : { invalidPhoneNumber: { value: control.value } };
}

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css'],
})
export class UserFormComponent {
  userForm: FormGroup;
  formControls: any;
  constructor() {
    this.userForm = new FormGroup({
      name: new FormControl('', Validators.required),
      email: new FormControl('', [Validators.required, Validators.email]),
      phone: new FormControl('', [Validators.required, phoneNumberValidator]),
    });
    this.formControls = this.userForm.controls;
  }

  onSubmit() {
    // Handle form submission logic here
    console.log('Form submitted:', this.userForm.value);
  }
}
