package com.miui.gallery.editor.photo.app;

import android.app.Activity;
import android.os.AsyncTask;
import android.widget.Toast;
import com.miui.gallery.R;

public class InitializeController {
    private Activity mActivity;
    private AsyncTask<Void, Void, Integer> mBackgroundTask = new AsyncTask<Void, Void, Integer>() {
        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            return Integer.valueOf(InitializeController.this.mCallbacks.doInitialize());
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            super.onPostExecute(num);
            InitializeController.this.postResult(num.intValue());
        }
    };
    /* access modifiers changed from: private */
    public Callbacks mCallbacks;

    public interface Callbacks {
        int doInitialize();

        void onDone();
    }

    public InitializeController(Activity activity, Callbacks callbacks) {
        this.mActivity = activity;
        this.mCallbacks = callbacks;
    }

    /* access modifiers changed from: private */
    public void postResult(int i) {
        if (this.mActivity.isFinishing()) {
            return;
        }
        if (i == 3) {
            this.mCallbacks.onDone();
            return;
        }
        if (i == 2) {
            Toast.makeText(this.mActivity, R.string.image_decode_failed, 0).show();
        } else if (i == 1) {
            Toast.makeText(this.mActivity, R.string.image_not_found, 0).show();
        }
        this.mActivity.finish();
    }

    public void doInitialize() {
        this.mBackgroundTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }
}
