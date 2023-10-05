// HTTP CLIENT OBSERVABLE <ANY>

// app.module.ts
import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { HttpClientModule } from "@angular/common/http";
import { DataComponent } from "./data/data.component";
import { DataService } from "./data/data.service";

@NgModule({
  declarations: [DataComponent],
  imports: [BrowserModule, HttpClientModule],
  providers: [DataService],
  bootstrap: [DataComponent],
})
export class AppModule {}

// data.service.ts
import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class DataService {
  private apiUrl = "https://your-api-url/api"; // Replace with your API endpoint

  constructor(private http: HttpClient) {}

  fetchData(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/data`);
  }
}

// data.component.ts
import { Component, OnInit } from "@angular/core";
import { DataService } from "./data.service";

@Component({
  selector: "app-data",
  template: `
    <div *ngIf="data">
      {{ data | json }}
    </div>
    <button (click)="fetchData()">Fetch Data</button>
  `,
})
export class DataComponent implements OnInit {
  data: any;

  constructor(private dataService: DataService) {}

  ngOnInit() {
    // Initial data fetch
    this.fetchData();
  }

  fetchData() {
    this.dataService.fetchData().subscribe(
      (response) => {
        this.data = response;
      },
      (error) => {
        console.error("Error fetching data:", error);
      }
    );
  }
}

// USING ENTITY WITH OBSERVABLE

// user.model.ts
export interface User {
  id: number;
  name: string;
}

// data.service.ts
import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { User } from "./user.model"; // Import the User model

@Injectable({
  providedIn: "root",
})
export class DataService {
  private apiUrl = "https://your-api-url/api"; // Replace with your API endpoint

  constructor(private http: HttpClient) {}

  fetchUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.apiUrl}/users`);
  }
}

// data.component.ts
import { Component, OnInit } from "@angular/core";
import { DataService } from "./data.service";
import { User } from "./user.model"; // Import the User model

@Component({
  selector: "app-data",
  template: `
    <div *ngIf="users">
      <div *ngFor="let user of users">{{ user.id }} - {{ user.name }}</div>
    </div>
    <button (click)="fetchUsers()">Fetch Users</button>
  `,
})
export class DataComponent implements OnInit {
  users: User[] | undefined;

  constructor(private dataService: DataService) {}

  ngOnInit() {
    // Initial data fetch
    this.fetchUsers();
  }

  fetchUsers() {
    this.dataService.fetchUsers().subscribe(
      (users) => {
        this.users = users;
      },
      (error) => {
        console.error("Error fetching users:", error);
      }
    );
  }
}


// HANDLING ERRORS AND LOADING

ngOnInit() {
  this.isLoading = true;
  this.dataService.getSomeData().subscribe(
    // handle emitted data
    (data) => {    this.responseData = data;    },
    // onError
    (error) => {
      console.error('Error fetching data:', error);
    },
    // OnComplete
    () => {    this.isLoading = false;    }
  );}
