import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OrderEventResponse } from '../order/order-event-response';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-checkout-response',
  standalone: true,
  imports: [CommonModule, MatCardModule],
  templateUrl: './checkout-response.component.html',
  styleUrls: ['./checkout-response.component.scss']
})
export class CheckoutResponseComponent {
  @Input() response: OrderEventResponse | null = null;

}
