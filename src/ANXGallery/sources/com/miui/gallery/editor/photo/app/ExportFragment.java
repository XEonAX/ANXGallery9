package com.miui.gallery.editor.photo.app;

import android.app.Dialog;
import android.app.DialogFragment;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import java.lang.ref.WeakReference;
import miui.app.ProgressDialog;

public class ExportFragment extends DialogFragment {
    /* access modifiers changed from: private */
    public Callbacks mCallbacks;
    private Boolean mExportResult;

    public interface Callbacks {
        boolean doExport();

        void onCancelled(boolean z);

        void onExported(boolean z);
    }

    private static class ExportTask extends AsyncTask<Void, Void, Boolean> {
        private final WeakReference<ExportFragment> mFragmentWeakReference;

        ExportTask(ExportFragment exportFragment) {
            this.mFragmentWeakReference = new WeakReference<>(exportFragment);
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Void[] voidArr) {
            ExportFragment exportFragment = (ExportFragment) this.mFragmentWeakReference.get();
            if (exportFragment != null) {
                Callbacks access$000 = exportFragment.mCallbacks;
                if (access$000 != null) {
                    return Boolean.valueOf(access$000.doExport());
                }
            }
            return Boolean.valueOf(false);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean bool) {
            super.onPostExecute(bool);
            ExportFragment exportFragment = (ExportFragment) this.mFragmentWeakReference.get();
            if (exportFragment != null) {
                exportFragment.publishResult(bool);
            }
        }
    }

    /* access modifiers changed from: private */
    public void publishResult(Boolean bool) {
        if (!isAdded() || isRemoving()) {
            if (this.mCallbacks != null) {
                this.mCallbacks.onCancelled(bool.booleanValue());
            }
        } else if (!isResumed()) {
            this.mExportResult = bool;
        } else if (this.mCallbacks != null) {
            this.mCallbacks.onExported(bool.booleanValue());
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        ProgressDialog progressDialog = new ProgressDialog(getActivity());
        progressDialog.setMessage(getActivity().getString(R.string.photo_editor_saving));
        progressDialog.setCanceledOnTouchOutside(false);
        progressDialog.setIndeterminate(true);
        return progressDialog;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        new ExportTask(this).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        return super.onCreateView(layoutInflater, viewGroup, bundle);
    }

    public void onDetach() {
        super.onDetach();
        this.mCallbacks = null;
    }

    public void onResume() {
        super.onResume();
        if (this.mExportResult != null) {
            publishResult(this.mExportResult);
        }
    }

    public void setCallbacks(Callbacks callbacks) {
        this.mCallbacks = callbacks;
    }
}
