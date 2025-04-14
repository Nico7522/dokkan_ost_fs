import { Component, inject } from '@angular/core';
import { AnimationManagerService } from '../../services/animation-manager.service';

@Component({
  selector: 'app-toggle-button',
  imports: [],
  templateUrl: './toggle-button.component.html',
  styleUrl: './toggle-button.component.scss',
})
export class ToggleButtonComponent {
  private readonly animationManagerService = inject(AnimationManagerService);
  onCheckboxChange(event: any) {
    if (event.target.checked) {
      this.animationManagerService.onAnimationToggleChange(true);
    } else {
      this.animationManagerService.onAnimationToggleChange(false);
    }
  }
}
