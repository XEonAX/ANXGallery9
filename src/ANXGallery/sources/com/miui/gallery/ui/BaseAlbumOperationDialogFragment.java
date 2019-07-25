package com.miui.gallery.ui;

import android.app.Activity;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import com.miui.gallery.R;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.ServerReservedAlbumNamesStrategy;
import com.miui.gallery.cloudcontrol.strategies.ServerUnModifyAlbumsStrategy;
import com.miui.gallery.provider.GalleryContract.Common;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.util.ActionURIHandler;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public abstract class BaseAlbumOperationDialogFragment extends GalleryDialogFragment {
    protected Button mConfirmButton;
    /* access modifiers changed from: private */
    public OnClickListener mConfirmListener = new OnClickListener() {
        public void onClick(View view) {
            String obj = BaseAlbumOperationDialogFragment.this.mInputView.getText().toString();
            if (BaseAlbumOperationDialogFragment.this.verify(obj)) {
                new AlbumOperateTask(BaseAlbumOperationDialogFragment.this.getActivity(), BaseAlbumOperationDialogFragment.this.mOnAlbumOperationDoneListener).execute(new String[]{obj});
            }
        }
    };
    protected String mDefaultName;
    protected AlertDialog mDialog;
    protected EditText mInputView;
    protected OnAlbumOperationDoneListener mOnAlbumOperationDoneListener;
    protected ServerReservedAlbumNamesStrategy mServerReservedAlbumNamesStrategy;
    protected ServerUnModifyAlbumsStrategy mServerUnModifyAlbumsStrategy;
    protected TextWatcher mTextWatcher = new TextWatcher() {
        public void afterTextChanged(Editable editable) {
        }

        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            if (BaseAlbumOperationDialogFragment.this.mConfirmButton != null) {
                BaseAlbumOperationDialogFragment.this.mConfirmButton.setEnabled(!TextUtils.isEmpty(charSequence));
            }
        }
    };

    private class AlbumOperateTask extends AsyncTask<String, Void, Bundle> {
        private Activity mActivity;
        private String mAlbumName;
        private OnAlbumOperationDoneListener mOnAlbumOperationDoneListener;

        public AlbumOperateTask(Activity activity, OnAlbumOperationDoneListener onAlbumOperationDoneListener) {
            this.mActivity = activity;
            this.mOnAlbumOperationDoneListener = onAlbumOperationDoneListener;
        }

        /* access modifiers changed from: private */
        public boolean activityAlive() {
            return this.mActivity != null && !this.mActivity.isDestroyed() && !this.mActivity.isFinishing();
        }

        private void showAlbumConflictDialog(final long j, final String str) {
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (AlbumOperateTask.this.activityAlive()) {
                        ConfirmDialog.showConfirmDialog(BaseAlbumOperationDialogFragment.this.getFragmentManager(), null, BaseAlbumOperationDialogFragment.this.getString(R.string.album_already_exists_msg, new Object[]{str}), BaseAlbumOperationDialogFragment.this.getString(R.string.cancel), BaseAlbumOperationDialogFragment.this.getString(R.string.album_already_exists_check), new ConfirmDialogInterface() {
                            public void onCancel(DialogFragment dialogFragment) {
                                dialogFragment.dismiss();
                            }

                            public void onConfirm(DialogFragment dialogFragment) {
                                if (BaseAlbumOperationDialogFragment.this.mDialog != null && BaseAlbumOperationDialogFragment.this.mDialog.isShowing()) {
                                    BaseAlbumOperationDialogFragment.this.mDialog.dismiss();
                                }
                                dialogFragment.dismiss();
                                ActionURIHandler.handleUri(BaseAlbumOperationDialogFragment.this.getActivity(), Common.URI_ALBUM_PAGE.buildUpon().appendQueryParameter("id", String.valueOf(j)).build());
                            }
                        });
                    }
                }
            });
        }

        /* access modifiers changed from: protected */
        public Bundle doInBackground(String... strArr) {
            this.mAlbumName = strArr[0];
            if (activityAlive()) {
                return BaseAlbumOperationDialogFragment.this.execAlbumOperation(this.mActivity, this.mAlbumName);
            }
            this.mActivity = null;
            Log.e("BaseAlbumOperationDialogFragment", "activity dead, abort album task(%d)", (Object) strArr[0]);
            return Bundle.EMPTY;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bundle bundle) {
            long resultId = BaseAlbumOperationDialogFragment.this.getResultId(bundle);
            BaseAlbumOperationDialogFragment.this.mConfirmButton.setEnabled(true);
            if (this.mOnAlbumOperationDoneListener != null) {
                this.mOnAlbumOperationDoneListener.onOperationDone(resultId, this.mAlbumName);
            }
            if (!activityAlive()) {
                this.mActivity = null;
                BaseAlbumOperationDialogFragment.this.mDialog.dismiss();
                Log.w("BaseAlbumOperationDialogFragment", "activity dead, cancel toast");
                return;
            }
            if (resultId == -103 || resultId == -105) {
                long j = bundle.getLong("conflict_album_id");
                if (j >= 0) {
                    showAlbumConflictDialog(j, this.mAlbumName);
                } else {
                    ToastUtils.makeText((Context) this.mActivity, (CharSequence) BaseAlbumOperationDialogFragment.this.getString(R.string.album_already_exists_msg, new Object[]{this.mAlbumName}));
                }
                BaseAlbumOperationDialogFragment.this.selectAll();
            } else if (resultId < 0) {
                ToastUtils.makeText((Context) this.mActivity, BaseAlbumOperationDialogFragment.this.getOperationFailedString());
                BaseAlbumOperationDialogFragment.this.selectAll();
            }
            if (resultId > 0) {
                BaseAlbumOperationDialogFragment.this.mDialog.dismiss();
                if (BaseAlbumOperationDialogFragment.this.getOperationSucceededString() > 0) {
                    ToastUtils.makeText((Context) this.mActivity, BaseAlbumOperationDialogFragment.this.getOperationSucceededString());
                }
            }
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            BaseAlbumOperationDialogFragment.this.mConfirmButton.setEnabled(false);
        }
    }

    public interface OnAlbumOperationDoneListener {
        void onOperationDone(long j, String str);
    }

    /* access modifiers changed from: private */
    public void selectAll() {
        this.mInputView.setText(this.mInputView.getText());
        this.mInputView.selectAll();
    }

    /* access modifiers changed from: private */
    public boolean verify(String str) {
        if (TextUtils.isEmpty(str.trim())) {
            this.mInputView.selectAll();
            return false;
        } else if ("._".indexOf(str.charAt(0)) >= 0) {
            ToastUtils.makeText((Context) getActivity(), (int) R.string.new_album_invalid_prefix);
            return false;
        } else {
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                if ("/\\:@*?<>\r\n\t".indexOf(charAt) >= 0) {
                    if ("\r\n\t".indexOf(charAt) >= 0) {
                        charAt = ' ';
                    }
                    ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.new_album_invalid_char, new Object[]{Character.valueOf(charAt)}));
                    return false;
                }
            }
            if (!this.mServerReservedAlbumNamesStrategy.containsName(str) && !this.mServerUnModifyAlbumsStrategy.containsName(str)) {
                return true;
            }
            ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.new_album_invalid_name, new Object[]{str}));
            selectAll();
            return false;
        }
    }

    /* access modifiers changed from: protected */
    public abstract Bundle execAlbumOperation(Context context, String str);

    /* access modifiers changed from: protected */
    public abstract int getDialogTitle();

    /* access modifiers changed from: protected */
    public abstract int getOperationFailedString();

    /* access modifiers changed from: protected */
    public abstract int getOperationSucceededString();

    /* access modifiers changed from: protected */
    public abstract long getResultId(Bundle bundle);

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        parseArguments();
        this.mInputView = (EditText) LayoutInflater.from(getActivity()).inflate(R.layout.edit_text_dialog, null, false);
        this.mInputView.setHint(R.string.album_name);
        this.mInputView.setText(this.mDefaultName);
        this.mInputView.selectAll();
        this.mInputView.addTextChangedListener(this.mTextWatcher);
        this.mServerReservedAlbumNamesStrategy = CloudControlStrategyHelper.getServerReservedAlbumNamesStrategy();
        this.mServerUnModifyAlbumsStrategy = CloudControlStrategyHelper.getServerUnModifyAlbumsStrategy();
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mDialog = new Builder(getActivity()).setView(this.mInputView).setTitle(getDialogTitle()).setPositiveButton(17039370, null).setNegativeButton(17039360, null).create();
        this.mDialog.getWindow().setSoftInputMode(4);
        this.mDialog.setOnShowListener(new OnShowListener() {
            public void onShow(DialogInterface dialogInterface) {
                BaseAlbumOperationDialogFragment.this.mConfirmButton = BaseAlbumOperationDialogFragment.this.mDialog.getButton(-1);
                BaseAlbumOperationDialogFragment.this.mConfirmButton.setEnabled(!TextUtils.isEmpty(BaseAlbumOperationDialogFragment.this.mInputView.getText()));
                BaseAlbumOperationDialogFragment.this.mConfirmButton.setOnClickListener(BaseAlbumOperationDialogFragment.this.mConfirmListener);
            }
        });
        return this.mDialog;
    }

    /* access modifiers changed from: protected */
    public void parseArguments() {
    }

    public void setOnAlbumOperationDoneListener(OnAlbumOperationDoneListener onAlbumOperationDoneListener) {
        this.mOnAlbumOperationDoneListener = onAlbumOperationDoneListener;
    }
}
