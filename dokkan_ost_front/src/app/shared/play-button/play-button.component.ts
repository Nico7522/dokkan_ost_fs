import {
  Component,
  ElementRef,
  input,
  output,
  QueryList,
  signal,
  ViewChild,
  ViewChildren,
} from '@angular/core';
import { CardDetails } from 'app/models/card.interface';
import { environment } from 'environments/environment';

@Component({
  selector: 'app-play-button',
  imports: [],
  templateUrl: './play-button.component.html',
  styleUrl: './play-button.component.scss',
})
export class PlayButtonComponent {
  bgmType = input.required<
    'entrance' | 'activeSkill' | 'standbySkill' | 'finishSkill'
  >();
  bgmId = input.required<number>();
  backgroundClass = input.required<string>();
  filename = input.required<string>();
  @ViewChild('ostRef', { static: false })
  ostRef: ElementRef<HTMLAudioElement> | null = null;
  apiUrl = environment.API_URL;
  ostText = signal('Play OST');
  playOst(
    bgmType: 'entrance' | 'activeSkill' | 'standbySkill' | 'finishSkill'
  ) {
    const ref = this.ostRef?.nativeElement;
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

  showAnimationComponent = output<string>();
  onShowAnimationComponent() {
    this.showAnimationComponent.emit(this.filename());
  }
}
