package com.miui.gallery.util.baby;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.os.AsyncTask;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

/* compiled from: CopyFaceAlbumItemsToBabyAlbumTask */
abstract class ProgressDialogTask extends AsyncTask<Void, Integer, Void> {
    private boolean mCancelable;
    protected Context mContext;
    private ProgressDialog mDialog;
    private int mMessageId;
    private int mProgressMax;
    private boolean mShowProgress;
    private int mTitleId;

    public ProgressDialogTask(Context context, int i, int i2, int i3, boolean z, boolean z2) {
        this.mContext = context;
        this.mProgressMax = i;
        this.mTitleId = i2;
        this.mMessageId = i3;
        this.mCancelable = z;
        this.mShowProgress = z2;
    }

    public static ProgressDialog showProgressDialog(Context context, int i, int i2, int i3, boolean z) {
        ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setTitle(i == 0 ? null : context.getResources().getString(i));
        progressDialog.setMessage(i2 == 0 ? null : context.getResources().getString(i2));
        progressDialog.setCancelable(z);
        progressDialog.setCanceledOnTouchOutside(false);
        if (z) {
            progressDialog.setButton(-2, context.getString(17039360), null);
        }
        if (i3 > 1) {
            progressDialog.setMax(i3);
            progressDialog.setProgressStyle(1);
        }
        progressDialog.show();
        return progressDialog;
    }

    public void dismissDialog() {
        try {
            if (this.mDialog != null && this.mDialog.isShowing()) {
                this.mDialog.dismiss();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: protected */
    public boolean isDialogShowing() {
        try {
            if (this.mDialog != null) {
                return this.mDialog.isShowing();
            }
        } catch (Exception unused) {
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public void onCancelled() {
        dismissDialog();
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(Void voidR) {
        dismissDialog();
    }

    /* access modifiers changed from: protected */
    public void onPreExecute() {
        if (this.mShowProgress) {
            this.mDialog = showProgressDialog(this.mContext, this.mTitleId, this.mMessageId, this.mProgressMax, this.mCancelable);
            if (this.mCancelable) {
                Button button = this.mDialog.getButton(-2);
                if (button != null) {
                    button.setOnClickListener(new OnClickListener() {
                        public void onClick(View view) {
                            ProgressDialogTask.this.cancel(true);
                        }
                    });
                }
                this.mDialog.setOnCancelListener(new OnCancelListener() {
                    public void onCancel(DialogInterface dialogInterface) {
                        ProgressDialogTask.this.cancel(true);
                    }
                });
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onProgressUpdate(Integer... numArr) {
        try {
            if (this.mDialog != null && this.mDialog.isShowing()) {
                this.mDialog.setProgress(numArr[0].intValue());
            }
        } catch (Exception unused) {
        }
    }
}
