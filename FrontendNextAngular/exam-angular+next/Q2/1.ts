// OBSERVABLE SIMPLE 1

// number.service.ts
import { Injectable } from "@angular/core";
import { Observable, interval } from "rxjs";
import { take } from "rxjs/operators";

@Injectable({
  providedIn: "root",
})
export class NumberService {
  private numberObservable: Observable<number>;

  constructor() {
    // Create an observable that emits numbers every second
    this.numberObservable = interval(1000).pipe(take(10));
  }

  getNumbers(): Observable<number> {
    return this.numberObservable;
  }
}

// number-list.component.ts
import { Component, OnInit } from "@angular/core";
import { Observable } from "rxjs";
import { NumberService } from "./number.service";

@Component({
  selector: "app-number-list",
  template: ` {{ number$ | async }} `,
})
export class NumberListComponent implements OnInit {
  numbers$: number[] | undefined;
  number$: Observable<number> | undefined;

  constructor(private numberService: NumberService) {}

  ngOnInit() {
    this.subscribeToNumbers();
  }

  private subscribeToNumbers() {
    this.number$ = this.numberService.getNumbers();
    this.number$.subscribe(
      (number) => {
        console.log("Received number:", number);
        this.numbers$?.push(number);
      },
      (error) => {
        console.error("Error loading number:", error);
      }
    );
  }
}

// app.module.ts with correct imports and providers

@NgModule({
  declarations: [AppComponent, NumberListComponent],
  imports: [BrowserModule],
  providers: [NumberService],
  bootstrap: [AppComponent],
})
export class AppModule {}

// SUBJECT SIMPLE 2

// number.service.ts
import { Injectable } from "@angular/core";
import { Subject, Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class NumberService {
  private numbersSubject = new Subject<number>();

  constructor() {
    // Start emitting data immediately upon service initialization
    this.fetchData();
  }

  fetchData(): void {
    // Simulate fetching data asynchronously
    setInterval(() => {
      this.numbersSubject.next(Math.random());
    }, 1000);
  }

  getNumbers(): Observable<number> {
    return this.numbersSubject.asObservable();
  }
}

// number-list.component.ts
import { Component, OnInit } from "@angular/core";
import { Observable } from "rxjs";
import { NumberService } from "./number.service";

@Component({
  selector: "app-number-list",
  template: ` {{ number$ | async }} `,
})
export class NumberListComponent implements OnInit {
  numbers$: number[] | undefined;
  number$: Observable<number> | undefined;

  constructor(private numberService: NumberService) {}

  ngOnInit() {
    console.log("init");
    this.subscribeToNumbers();
  }

  private subscribeToNumbers() {
    // get observable
    this.number$ = this.numberService.getNumbers();
    // subscribe to topic
    this.number$.subscribe(
      (number) => {
        console.log("Received number:", number);
        this.numbers$?.push(number);
      },
      (error) => {
        console.error("Error loading number:", error);
      }
    );
  }
}

// BEHAVIOR SUBJECT - can supply initial state

// number.service.ts
import { Injectable } from "@angular/core";
import { BehaviorSubject, Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class NumberService {
  // HERE INITIAL STATE WHEN THE SERVICE IS INITALIZED
  private numbersSubject = new BehaviorSubject<number>(Math.random());

  constructor() {
    // Start emitting data immediately upon service initialization
    this.fetchData();
  }

  fetchData(): void {
    // Simulate fetching data asynchronously
    setInterval(() => {
      this.numbersSubject.next(Math.random());
    }, 1000);
  }

  getNumbers(): Observable<number> {
    return this.numbersSubject.asObservable();
  }
}
