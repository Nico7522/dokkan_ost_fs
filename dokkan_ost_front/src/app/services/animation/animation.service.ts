import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AnimationService {
  constructor() {}
  loadLwf(config: any): Promise<any> {
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
}
