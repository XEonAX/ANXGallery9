package com.miui.gallery.editor.photo.screen.home;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.screen.stat.ScreenEditorStatUtils;
import com.miui.gallery.widget.GalleryDialogFragment;

public class ScreenSaveDialogFragment extends GalleryDialogFragment implements OnClickListener {
    private ScreenSaveDialogAdapter mAdapter;
    /* access modifiers changed from: private */
    public Context mContext;
    private AlertDialog mDialog;
    private DialogClickListener mListener;

    public interface DialogClickListener {
        void onDelete();

        void onSave();
    }

    private class ScreenSaveDialogAdapter extends BaseAdapter {
        private String[] mDatas;

        private ScreenSaveDialogAdapter() {
            this.mDatas = new String[]{ScreenSaveDialogFragment.this.mContext.getString(R.string.screen_save_dialog_btn_save), ScreenSaveDialogFragment.this.mContext.getString(R.string.screen_save_dialog_btn_delete), ScreenSaveDialogFragment.this.mContext.getString(R.string.screen_save_dialog_btn_cancel)};
        }

        public int getCount() {
            return this.mDatas.length;
        }

        public String getItem(int i) {
            return this.mDatas[i];
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            View view2;
            ViewHolder viewHolder;
            if (view == null) {
                viewHolder = new ViewHolder();
                view2 = LayoutInflater.from(ScreenSaveDialogFragment.this.mContext).inflate(R.layout.screen_save_dialog_item, null, false);
                viewHolder.mTextView = (TextView) view2.findViewById(R.id.screen_editor_item_text);
                view2.setTag(viewHolder);
            } else {
                view2 = view;
                viewHolder = (ViewHolder) view.getTag();
            }
            viewHolder.mTextView.setText(this.mDatas[i]);
            return view2;
        }
    }

    private class ViewHolder {
        TextView mTextView;

        private ViewHolder() {
        }
    }

    public static /* synthetic */ void lambda$onCreateDialog$74(ScreenSaveDialogFragment screenSaveDialogFragment, DialogInterface dialogInterface, int i) {
        if (screenSaveDialogFragment.mListener != null) {
            switch (i) {
                case 0:
                    screenSaveDialogFragment.mListener.onSave();
                    ScreenEditorStatUtils.statDoneFragmentClick("save");
                    break;
                case 1:
                    screenSaveDialogFragment.mListener.onDelete();
                    ScreenEditorStatUtils.statDoneFragmentClick("delete");
                    break;
                case 2:
                    screenSaveDialogFragment.dismissSafely();
                    ScreenEditorStatUtils.statDoneFragmentClick("cancel");
                    break;
            }
        }
    }

    public void onClick(View view) {
        if (this.mListener != null) {
            int id = view.getId();
            if (id == R.id.cancel) {
                dismissSafely();
            } else if (id == R.id.delete) {
                this.mListener.onDelete();
                dismissSafely();
            } else if (id == R.id.save) {
                this.mListener.onSave();
                dismissSafely();
            }
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mContext = getActivity();
        this.mAdapter = new ScreenSaveDialogAdapter();
        Builder builder = new Builder(this.mContext);
        builder.setAdapter(this.mAdapter, new DialogInterface.OnClickListener() {
            public final void onClick(DialogInterface dialogInterface, int i) {
                ScreenSaveDialogFragment.lambda$onCreateDialog$74(ScreenSaveDialogFragment.this, dialogInterface, i);
            }
        });
        this.mDialog = builder.create();
        this.mDialog.setCanceledOnTouchOutside(true);
        return this.mDialog;
    }

    public void onDestroyView() {
        super.onDestroyView();
        this.mListener = null;
        this.mAdapter = null;
    }

    public void setListener(DialogClickListener dialogClickListener) {
        this.mListener = dialogClickListener;
    }
}
