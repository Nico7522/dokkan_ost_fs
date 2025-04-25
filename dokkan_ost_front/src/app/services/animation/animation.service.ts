import { isPlatformBrowser } from '@angular/common';
import { ElementRef, inject, Injectable, PLATFORM_ID } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AnimationService {
  private lwfCache: Map<string, any> = new Map();
  constructor() {}
  lwfInstance: any;
  attachedMovie: any;

  loadLwf(key: string, config: any): Promise<any> {
    return new Promise((resolve, reject) => {
      const cachedInstance = this.lwfCache.get(key);

      if (cachedInstance && cachedInstance.rootMovie) {
        resolve(cachedInstance);
      } else {
        LWF.ResourceCache.get().loadLWF({
          ...config,
          onload: (lwfInstance: any) => {
            this.lwfCache.set(key, lwfInstance);
            resolve(lwfInstance);
          },
          onerror: (err: any) => reject(err),
        });
      }
    });
  }

  reattachLWF(instance: any, canvas: HTMLCanvasElement): void {
    if (instance) {
      instance.destroy();
      instance.stage = canvas;
      instance.init();
    }
  }
}
