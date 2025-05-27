import {
  Component,
  computed,
  ElementRef,
  input,
  output,
  signal,
  viewChild,
} from '@angular/core';
import { environment } from 'environments/environment';

@Component({
  selector: 'app-play-button',
  imports: [],
  templateUrl: './play-button.component.html',
  styleUrl: './play-button.component.scss',
})
export class PlayButtonComponent {
  bgmId = input.required<number>();
  bgm = computed(() => {
    return (
      this.apiUrl +
      '/bgm/' +
      'bgm_' +
      (this.bgmId() >= 100 ? this.bgmId() : '0' + this.bgmId()) +
      '.wav'
    );
  });
  backgroundClass = input.required<string>();
  title = input<string>();
  filename = input<string>();
  readonly ostRef = viewChild<ElementRef<HTMLAudioElement> | null>('ostRef');
  apiUrl = environment.API_URL;
  ostText = signal('Play OST');
  playOst() {
    const ref = this.ostRef()?.nativeElement;
    if (ref) {
      if (ref.paused) {
        ref.volume = 0.03;
        ref.loop = true;
        ref.play();
        this.ostText.set('Pause OST');
      } else {
        ref.pause();
        this.ostText.set('Play OST');
      }
    }
  }

  showAnimationComponent = output<{
    filename: string | undefined;
    bgmId: number;
  }>();
  onShowAnimationComponent() {
    if (this.filename) {
      this.showAnimationComponent.emit({
        filename: this.filename(),
        bgmId: this.bgmId(),
      });
    }
  }
}
