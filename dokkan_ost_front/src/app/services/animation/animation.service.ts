import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AnimationService {
  private lwfCache: Map<string, any> = new Map();
  constructor() {}

  loadLwf(key: string, config: any): Promise<any> {
    return new Promise((resolve, reject) => {
      LWF.ResourceCache.get().loadLWF({
        ...config,
        onload: (lwfInstance: any) => {
          resolve(lwfInstance);
        },
        onerror: (err: any) => reject(err),
      });
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
