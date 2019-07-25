package com.miui.gallery.video.editor.manager;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Message;
import android.text.TextUtils;
import com.miui.gallery.preference.GalleryPreferences.SmartVideoGuide;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.video.editor.util.ToolsUtil;

public class SmartVideoGuideHelper {
    private static volatile boolean sHasGuided = true;
    private SmartVideoGuideHandleThread mGuideHandleThread;
    /* access modifiers changed from: private */
    public SmartVideoGuideListener mGuideListener;

    class SmartVideoGuideHandleThread extends HandlerThread implements Callback {
        Handler mWorkHandler;

        private SmartVideoGuideHandleThread() {
            super("SmartEffectAttentionThread");
            start();
        }

        private boolean isSupportSmartVideo(int i) {
            return i >= 100 && i <= 120;
        }

        public void destroyThread() {
            this.mWorkHandler.removeCallbacksAndMessages(null);
            quit();
        }

        public void handleHighFrameRate(String str) {
            if (this.mWorkHandler == null) {
                this.mWorkHandler = new Handler(getLooper(), this);
            }
            Message obtain = Message.obtain(this.mWorkHandler);
            obtain.obj = str;
            obtain.what = 0;
            this.mWorkHandler.removeCallbacksAndMessages(null);
            this.mWorkHandler.sendMessage(obtain);
        }

        public boolean handleMessage(Message message) {
            if (message.what == 0) {
                String str = (String) message.obj;
                int videoFrameRate = ToolsUtil.getVideoFrameRate(str);
                if (!TextUtils.isEmpty(str) && isSupportSmartVideo(videoFrameRate)) {
                    SmartVideoGuideHelper.this.tryShowGuideView(str);
                }
            }
            return false;
        }
    }

    public interface SmartVideoGuideListener {
        void showGuideView(String str);
    }

    public static boolean hasGuided() {
        return sHasGuided;
    }

    public static void init() {
        if (SmartVideoJudgeManager.isAvailable()) {
            sHasGuided = SmartVideoGuide.hasGuided();
        }
    }

    public static void setHasGuided(boolean z) {
        sHasGuided = z;
        SmartVideoGuide.setSmartVideoGuided(z);
    }

    /* access modifiers changed from: private */
    public void tryShowGuideView(final String str) {
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                if (SmartVideoGuideHelper.this.mGuideListener != null) {
                    SmartVideoGuideHelper.this.mGuideListener.showGuideView(str);
                }
            }
        });
    }

    public void handleHighFrameRate(String str) {
        if (!TextUtils.isEmpty(str)) {
            if (this.mGuideHandleThread == null) {
                this.mGuideHandleThread = new SmartVideoGuideHandleThread();
            }
            this.mGuideHandleThread.handleHighFrameRate(str);
        }
    }

    public void release() {
        if (this.mGuideListener != null) {
            this.mGuideListener = null;
        }
        if (this.mGuideHandleThread != null) {
            this.mGuideHandleThread.destroyThread();
        }
    }

    public void setSmartVideoGuideListener(SmartVideoGuideListener smartVideoGuideListener) {
        this.mGuideListener = smartVideoGuideListener;
    }
}
