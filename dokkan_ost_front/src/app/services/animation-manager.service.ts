import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AnimationManagerService {
  private _isAnimationEnabled = signal(false);
  isAnimationEnabled = this._isAnimationEnabled.asReadonly();
  constructor() {}
  onAnimationToggleChange(value: boolean) {
    this._isAnimationEnabled.set(value);
  }
}
