import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  constructor(private route: ActivatedRoute, private router: Router) {}

  navigateToRouteParameter(id: any) {
    this.router.navigate([`route-parameter/${id}`]);
  }
}
