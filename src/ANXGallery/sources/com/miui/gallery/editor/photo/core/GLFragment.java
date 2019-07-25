package com.miui.gallery.editor.photo.core;

import com.miui.gallery.threadpool.ThreadManager;
import java.util.concurrent.atomic.AtomicBoolean;

public interface GLFragment {

    public static abstract class GLContext {
        private AtomicBoolean mCreated = new AtomicBoolean(false);
        /* access modifiers changed from: private */
        public OnCreatedListener mListener;

        public interface OnCreatedListener {
            void onCreated();
        }

        /* access modifiers changed from: protected */
        public abstract void onPause();

        /* access modifiers changed from: protected */
        public abstract void onResume();

        /* access modifiers changed from: protected */
        public final void performCreated() {
            this.mCreated.set(true);
            if (this.mListener != null) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        GLContext.this.mListener.onCreated();
                    }
                });
            }
        }

        /* access modifiers changed from: protected */
        public final void performDestroyed() {
            this.mCreated.set(false);
        }

        public final void performPause() {
            onPause();
        }

        public final void performResume() {
            onResume();
        }

        public final void setOnCreatedListener(OnCreatedListener onCreatedListener) {
            this.mListener = onCreatedListener;
        }
    }

    GLContext getGLContext();
}
