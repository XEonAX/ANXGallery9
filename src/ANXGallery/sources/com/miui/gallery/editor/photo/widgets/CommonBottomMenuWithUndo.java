package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.RenderRecord;

public class CommonBottomMenuWithUndo extends LinearLayout implements MenuUpdateListener {
    private ImageView mCancel;
    private ImageView mOk;
    private ImageView mRedo;
    /* access modifiers changed from: private */
    public RenderRecord mRenderRecordListener;
    private boolean mShowTitle = true;
    private TextView mTitle;
    private ImageView mUndo;

    public CommonBottomMenuWithUndo(Context context) {
        super(context);
    }

    public CommonBottomMenuWithUndo(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void init() {
        this.mUndo.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                if (CommonBottomMenuWithUndo.this.mRenderRecordListener != null) {
                    CommonBottomMenuWithUndo.this.mRenderRecordListener.previousRecord();
                }
            }
        });
        this.mRedo.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                if (CommonBottomMenuWithUndo.this.mRenderRecordListener != null) {
                    CommonBottomMenuWithUndo.this.mRenderRecordListener.nextRecord();
                }
            }
        });
    }

    public TextView getTitle() {
        return this.mTitle;
    }

    public boolean isShowTitle() {
        return this.mShowTitle;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mUndo = (ImageView) findViewById(R.id.undo);
        this.mRedo = (ImageView) findViewById(R.id.redo);
        this.mTitle = (TextView) findViewById(R.id.title);
        this.mCancel = (ImageView) findViewById(R.id.cancel);
        this.mOk = (ImageView) findViewById(R.id.ok);
        init();
    }

    public void onMenuEnabled(boolean z) {
        this.mUndo.setClickable(z);
        this.mRedo.setClickable(z);
        this.mCancel.setClickable(z);
        this.mOk.setClickable(z);
    }

    public void onMenuUpdated(boolean z, boolean z2) {
        if (this.mShowTitle) {
            updateBottomBar(false);
            this.mShowTitle = false;
        }
        this.mUndo.setEnabled(z);
        this.mRedo.setEnabled(z2);
    }

    public void setRenderRecordListener(RenderRecord renderRecord) {
        this.mRenderRecordListener = renderRecord;
    }

    public void setTitle(int i) {
        this.mTitle.setText(i);
    }

    public void updateBottomBar(boolean z) {
        if (z) {
            this.mTitle.setVisibility(0);
            this.mUndo.setVisibility(8);
            this.mRedo.setVisibility(8);
            return;
        }
        this.mTitle.setVisibility(8);
        this.mUndo.setVisibility(0);
        this.mRedo.setVisibility(0);
    }
}
