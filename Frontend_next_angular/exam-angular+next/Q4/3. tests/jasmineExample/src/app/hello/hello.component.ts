// hello.component.ts

import { Component } from '@angular/core';

@Component({
  selector: 'app-hello',
  template: '<p>{{ greeting }}</p>',
})
export class HelloComponent {
  greeting = 'Hello, World!';
}
