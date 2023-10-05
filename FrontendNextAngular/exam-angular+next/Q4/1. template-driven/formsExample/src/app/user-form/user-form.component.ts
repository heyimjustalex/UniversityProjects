// user-form.component.ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css'],
})
export class UserFormComponent {
  user = {
    name: '',
    email: '',
    phone: '',
  };

  onSubmit() {
    // Handle form submission logic here
    console.log('Form submitted:', this.user);
  }
}
