// COMPONENT WITH INLINE TEMPLATE

import { Component } from '@angular/core';


@Component({
  selector: 'app-root',
  template: '<h1>Hello, {{ name }}</h1>',
})
export class AppComponent {
  name = 'Angular';
}


// ATTRIBUTE DIRECTIVES - apperance change

<!-- Example of ngStyle →for example for dynamic styles
<div [ngStyle]="{ 'color': textColor, 'font-size': fontSize }">Styled Text</div>
<!-- Example of ngClass -->
<div [ngClass]="{ 'highlight': isHighlighted, 'italic': isItalic }">Styled Text</div>



// STRUCTURAL DIRECTIVES - change of structure

<!-- Example of *ngIf -->
<div *ngIf="isVisible">Visible Content</div>


<!-- Example of *ngFor -->
<ul>
  <li *ngFor="let item of items">{{ item.name }}</li>
</ul>



// MODULES


// app.module.ts
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';


@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule],
  bootstrap: [AppComponent],
})
export class AppModule {}



// SERVICES

// user.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root',
})
export class UserService {
  private apiUrl = 'https://api.example.com/users';


  constructor(private http: HttpClient) {}


  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.apiUrl);
  }


  getUserById(userId: number): Observable<User> {
    const url = `${this.apiUrl}/${userId}`;
    return this.http.get<User>(url);
  }


  updateUser(user: User): Observable<User> {
    const url = `${this.apiUrl}/${user.id}`;
    return this.http.put<User>(url, user);
  }
}

// Model
interface User {
  id: number;
  name: string;
  email: string;
}

// user.component.ts
import { Component, OnInit } from '@angular/core';
import { UserService } from './user.service';


@Component({
  selector: 'app-user',
  template: `
    <div *ngFor="let user of users">
      {{ user.name }} - {{ user.email }}
    </div>
  `,
})
export class UserComponent implements OnInit {
  users: User[];
  constructor(private userService: UserService) {}

  ngOnInit() {
    this.userService.getUsers().subscribe((users) => {
      this.users = users;
    });
  }
}




// PIPES

// In template
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: '<div>{{ currentDate | date: "short" }}</div>',
})
export class AppComponent {
  currentDate = new Date();
}

// .pipe method

// example.component.ts
import { Component, OnInit } from '@angular/core';
import { DataService } from './data.service'; // Import your service
import { Observable, of } from 'rxjs';
import { catchError, filter, map } from 'rxjs/operators';

@Component({
  selector: 'app-example',
  template: `
    <div *ngIf="filteredData$ | async as filteredData">
      <!-- Display the JSON representation of the filtered data -->
      <pre>{{ filteredData | json }}</pre>
    </div>
  `,
  styleUrls: ['./example.component.css']
})
export class ExampleComponent implements OnInit {
  data$: Observable<any>; // Assuming your service returns an Observable
  filteredData$: Observable<any>;

  constructor(private dataService: DataService) { }

  ngOnInit() {
    this.loadData();
  }

  loadData() {
    // Using .pipe method to handle the response
    this.data$ = this.dataService.getData().pipe(
      map(response => response.data), // Extracting data property (modify according to your API response structure)
      catchError(error => {
        console.error('Error loading data:', error);
        return of(null);
      })
    );

    // Applying additional operators (filter in this case)
    this.filteredData$ = this.data$.pipe(
      filter(item => item && item.propertyToFilter > 10) // Adjust the condition based on your use case
    );
  }
}


