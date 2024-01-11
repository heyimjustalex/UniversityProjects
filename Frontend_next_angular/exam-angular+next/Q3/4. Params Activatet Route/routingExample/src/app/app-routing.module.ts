import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { SecondaryComponent } from './secondary/secondary.component';
import { RouteParameterComponent } from './route-parameter/route-parameter.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'about', component: AboutComponent },
  { path: 'secondary', component: SecondaryComponent, outlet: 'secondary' },
  {
    path: 'lazy',
    loadChildren: () => import('./lazy/lazy.module').then((m) => m.LazyModule),
  },

  { path: 'route-parameter/:id', component: RouteParameterComponent },
];

//forRoot() - if that’s the root module
//forChild() - if that’s the child module (routes will be relative to the component)

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
