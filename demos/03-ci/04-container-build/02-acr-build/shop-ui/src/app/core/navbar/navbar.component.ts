import { Component, OnInit } from '@angular/core';
import { MenuFacade } from '../../state/menu/menu.facade';
import { NavItem } from './nav-item.model';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit {
  constructor(private mf: MenuFacade) {}

  menuItems: NavItem[] = [
    { title: 'Home', url: '/' },
    { title: 'Food', url: '/food' },
    { title: 'About', url: '/about' },
  ];

  ngOnInit() {}

  toggleMenu() {
    this.mf.toggleMenuVisibility();
  }
}
