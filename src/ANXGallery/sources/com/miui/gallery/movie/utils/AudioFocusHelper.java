package com.miui.gallery.movie.utils;

import android.content.Context;
import android.media.AudioFocusRequest;
import android.media.AudioFocusRequest.Builder;
import android.media.AudioManager;
import android.os.Build.VERSION;
import com.miui.gallery.util.Log;

public class AudioFocusHelper {
    private AudioFocusRequest mAudioFocusRequest;
    private AudioManager mAudioManager;

    public AudioFocusHelper(Context context) {
        this.mAudioManager = (AudioManager) context.getSystemService("audio");
    }

    public void abandonAudioFocus() {
        if (VERSION.SDK_INT >= 26) {
            this.mAudioManager.abandonAudioFocusRequest(this.mAudioFocusRequest);
            return;
        }
        int abandonAudioFocus = this.mAudioManager.abandonAudioFocus(null);
        if (abandonAudioFocus != 1) {
            Log.w("AudioFocusHelper", "abandonAudioFocus failed:%d", Integer.valueOf(abandonAudioFocus));
        }
    }

    public void requestAudioFocus() {
        if (VERSION.SDK_INT >= 26) {
            this.mAudioFocusRequest = new Builder(1).build();
            this.mAudioFocusRequest.acceptsDelayedFocusGain();
            this.mAudioManager.requestAudioFocus(this.mAudioFocusRequest);
            return;
        }
        int requestAudioFocus = this.mAudioManager.requestAudioFocus(null, 3, 1);
        if (requestAudioFocus != 1) {
            Log.w("AudioFocusHelper", "requestAudioFocus failed:%d", Integer.valueOf(requestAudioFocus));
        }
    }
}
