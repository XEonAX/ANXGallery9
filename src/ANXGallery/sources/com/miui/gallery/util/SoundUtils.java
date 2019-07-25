package com.miui.gallery.util;

import android.content.Context;
import android.media.AudioAttributes.Builder;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build.VERSION;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.text.TextUtils;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import java.io.File;
import java.lang.ref.WeakReference;

public class SoundUtils {

    private static class SoundJob implements Job<Void> {
        private WeakReference<Context> mContextWeakRef;
        private int mOperationType;

        SoundJob(Context context, int i) {
            this.mContextWeakRef = new WeakReference<>(context);
            this.mOperationType = i;
        }

        public Void run(JobContext jobContext) {
            Context context = (Context) this.mContextWeakRef.get();
            if (context != null) {
                SoundUtils.internalPlaySoundForOperation(context.getApplicationContext(), this.mOperationType);
            }
            return null;
        }
    }

    private static Uri getRingtoneUriForOperation(int i) {
        String str = i != 0 ? null : "/system/media/audio/ui/Delete.ogg";
        if (!TextUtils.isEmpty(str)) {
            File file = new File(str);
            if (file.exists()) {
                return Uri.fromFile(file);
            }
            Log.w("SoundUtils", "Sound file %s do not exist", file);
        }
        return null;
    }

    /* access modifiers changed from: private */
    public static void internalPlaySoundForOperation(Context context, int i) {
        if (!shouldPlaySoundForOperation(context, i)) {
            Log.d("SoundUtils", "Shouldn't play sound for operation %s, just return", (Object) Integer.valueOf(i));
            return;
        }
        Uri ringtoneUriForOperation = getRingtoneUriForOperation(i);
        if (ringtoneUriForOperation == null) {
            Log.e("SoundUtils", "No sound resource found for operation %s", (Object) Integer.valueOf(i));
            return;
        }
        Ringtone ringtone = RingtoneManager.getRingtone(context, ringtoneUriForOperation);
        if (ringtone == null) {
            Log.e("SoundUtils", "Get ringtone failed for operation %s, sound source %s", Integer.valueOf(i), ringtoneUriForOperation);
            return;
        }
        setRingtoneStream(ringtone);
        ringtone.play();
    }

    public static void playSoundForOperation(Context context, int i) {
        if (ThreadManager.isMainThread()) {
            ThreadManager.getMiscPool().submit(new SoundJob(context, i));
        } else {
            internalPlaySoundForOperation(context, i);
        }
    }

    private static void setRingtoneStream(Ringtone ringtone) {
        if (VERSION.SDK_INT >= 21) {
            ringtone.setAudioAttributes(new Builder().setLegacyStreamType(1).build());
        } else {
            ringtone.setStreamType(1);
        }
    }

    private static boolean shouldPlaySoundForOperation(Context context, int i) {
        boolean z = true;
        if (i == 0) {
            try {
                int i2 = System.getInt(context.getContentResolver(), "delete_sound_effect");
                Log.d("SoundUtils", "Got sound setting value %d", (Object) Integer.valueOf(i2));
                if (i2 <= 0) {
                    z = false;
                }
                return z;
            } catch (SettingNotFoundException e) {
                Log.w("SoundUtils", (Throwable) e);
            }
        }
        return true;
    }
}
