// DEPENDENCY INJECTION

// User Service
import { Injectable } from '@angular/core';

@Injectable({
 providedIn: 'root'
})
export class UserService {
 getUsers() {
   return [
     { id: 1, name: 'John Doe', age: 30 },
     { id: 2, name: 'Jane Doe', age: 25 }
   ];
 }
}

// User List Component.ts
import { Component } from '@angular/core';
import { UserService } from './user.service';

@Component({
 selector: 'app-user-list',
 templateUrl: './user-list.component.html',
 styleUrls: ['./user-list.component.css']
})
export class UserListComponent {
 users: any[]; // Assuming your user data structure

 constructor(private userService: UserService) {
   this.users = this.userService.getUsers();
 }
}


// user-list.component.html 
<div *ngFor="let user of users">
  <!-- Display user information -->
  <div>
    <h3>{{ user.name | uppercase }}</h3>
    <p>Age: {{ user.age }}</p>
    <p>Formatted Name: {{ user.name  }}</p>
  </div>
</div>
