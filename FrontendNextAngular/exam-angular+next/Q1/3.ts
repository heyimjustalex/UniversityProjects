// COMPONENT-TO-COMPONENT COMMUNICATION

// Parent to Child Communication

// parent.component.ts
import { Component } from "@angular/core";

@Component({
  selector: "app-parent",
  template: ` <app-child [dataFromParent]="parentData"></app-child> `,
})
export class ParentComponent {
  parentData = "Data from Parent";
}

// child.component.ts

import { Component, Input } from "@angular/core";

@Component({
  selector: "app-child",
  template: ` <p>{{ dataFromParent }}</p> `,
})
export class ChildComponent {
  @Input() dataFromParent: string;
}

// Child to parent communication

// child.component.ts
import { Component, Output, EventEmitter } from "@angular/core";

@Component({
  selector: "app-child",
  template: '<button (click)="sendMessage()">Send Message</button>',
})
export class ChildComponent {
  @Output() messageEvent = new EventEmitter<string>();

  sendMessage() {
    this.messageEvent.emit("Hello from Child!");
  }
}

// parent.component.ts
import { Component } from "@angular/core";

@Component({
  selector: "app-parent",
  template: ` <app-child (messageEvent)="receiveMessage($event)"></app-child>`,
})
export class ParentComponent {
  receiveMessage(message: string) {
    console.log(message); // Outputs: Hello from Child!
  }
}

// Communication without relationship

// message.service.ts
import { Injectable } from "@angular/core";
import { Subject } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class MessageService {
  messageSource = new Subject<string>();

  sendMessage(message: string) {
    this.messageSource.next(message);
  }
}

// sender.component.ts
import { Component } from "@angular/core";
import { MessageService } from "./message.service";

@Component({
  selector: "app-sender",
  template: `
    <input [(ngModel)]="message" placeholder="Type a message" />
    <button (click)="sendMessage()">Send Message</button>
  `,
})
export class SenderComponent {
  message: string = "";
  constructor(private messageService: MessageService) {}
  sendMessage() {
    this.messageService.sendMessage(this.message);
  }
}

// receiver.component.ts
import { Component, OnDestroy } from "@angular/core";
import { MessageService } from "./message.service";
import { Subscription } from "rxjs";

@Component({
  selector: "app-receiver",
  template: "<p>{{ receivedMessage }}</p>",
})
export class ReceiverComponent implements OnDestroy {
  receivedMessage: string = "";
  private subscription: Subscription;

  constructor(private messageService: MessageService) {
    this.subscription = this.messageService.messageSource.subscribe(
      (message) => {
        this.receivedMessage = message;
      }
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
