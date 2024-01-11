import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-route-parameter',
  template: `
    <p>Route Parameter Component</p>
    <p>Route Parameter: {{ routeParameter }}</p>
  `,
  styleUrl: './route-parameter.component.css',
})
export class RouteParameterComponent {
  routeParameter: string | null = null;

  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    this.route.params.subscribe((params) => {
      this.routeParameter = params['id'];
    });
  }
}
