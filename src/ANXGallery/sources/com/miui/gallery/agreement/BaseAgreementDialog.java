package com.miui.gallery.agreement;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.agreement.core.OnAgreementInvokedListener;
import com.miui.gallery.permission.R;

public abstract class BaseAgreementDialog extends Dialog implements OnClickListener {
    private TextView mActionBtn;
    private OnAgreementInvokedListener mAgreementListener;
    private boolean mAllowQuit = true;
    private RecyclerView mListView;

    protected static class BaseDividerDecoration extends ItemDecoration {
        protected Drawable mDividerDrawable;
        protected int mDividerHeight;
        protected int mPaddingStart = -1;

        private void init(Context context) {
            if (this.mDividerDrawable == null) {
                this.mDividerDrawable = context.getResources().getDrawable(R.drawable.item_divider_bg);
                this.mDividerHeight = context.getResources().getDimensionPixelSize(R.dimen.divider_line_height);
                this.mPaddingStart = context.getResources().getDimensionPixelSize(R.dimen.agreement_item_padding_start);
            }
        }

        /* access modifiers changed from: protected */
        public void drawBottom(Canvas canvas, View view, int i, int i2) {
            int bottom = (int) (((float) (view.getBottom() + ((LayoutParams) view.getLayoutParams()).bottomMargin)) + view.getTranslationY());
            this.mDividerDrawable.setBounds(i, bottom, i2, this.mDividerHeight + bottom);
            this.mDividerDrawable.draw(canvas);
        }

        /* access modifiers changed from: protected */
        public void drawTop(Canvas canvas, View view, int i, int i2) {
            int top = (int) ((((float) (view.getTop() - ((LayoutParams) view.getLayoutParams()).topMargin)) + view.getTranslationY()) - ((float) this.mDividerHeight));
            this.mDividerDrawable.setBounds(i, top, i2, this.mDividerHeight + top);
            this.mDividerDrawable.draw(canvas);
        }

        public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
            Adapter adapter = recyclerView.getAdapter();
            if (adapter != null) {
                int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
                if (childAdapterPosition != -1) {
                    init(view.getContext());
                    rect.set(0, this.mDividerHeight, 0, childAdapterPosition == adapter.getItemCount() + -1 ? this.mDividerHeight : 0);
                }
            }
        }

        public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
            int childCount = recyclerView.getChildCount();
            int paddingStart = recyclerView.getPaddingStart();
            int right = recyclerView.getRight() - recyclerView.getPaddingEnd();
            for (int i = 0; i < childCount; i++) {
                View childAt = recyclerView.getChildAt(i);
                int childAdapterPosition = recyclerView.getChildAdapterPosition(childAt);
                if (childAdapterPosition != -1) {
                    drawTop(canvas, childAt, childAdapterPosition == 0 ? paddingStart : this.mPaddingStart + paddingStart, right);
                    if (childAdapterPosition == recyclerView.getAdapter().getItemCount() - 1) {
                        drawBottom(canvas, childAt, paddingStart, right);
                    }
                }
            }
        }
    }

    public BaseAgreementDialog(Context context, boolean z) {
        super(context);
        this.mAllowQuit = z;
        setCancelable(false);
    }

    private void initView() {
        View findViewById = findViewById(R.id.quit);
        if (this.mAllowQuit) {
            findViewById.setVisibility(0);
            findViewById.setOnClickListener(this);
        } else {
            findViewById.setVisibility(8);
        }
        ((TextView) findViewById(R.id.summary)).setText(getSummary());
        this.mListView = (RecyclerView) findViewById(R.id.list);
        this.mActionBtn = (TextView) findViewById(R.id.action);
        this.mActionBtn.setText(getButtonText());
        this.mActionBtn.setOnClickListener(this);
        this.mListView.addItemDecoration(getDividerDecoration());
        this.mListView.setLayoutManager(new LinearLayoutManager(getContext()));
        this.mListView.setAdapter(getAdapter());
        loadAppInfo();
    }

    private void loadAppInfo() {
        ((ImageView) findViewById(R.id.app_icon)).setImageDrawable(getContext().getApplicationInfo().loadIcon(getContext().getPackageManager()));
    }

    /* access modifiers changed from: protected */
    public abstract Adapter getAdapter();

    /* access modifiers changed from: protected */
    public CharSequence getButtonText() {
        return getContext().getText(R.string.agreement_agree);
    }

    /* access modifiers changed from: protected */
    public ItemDecoration getDividerDecoration() {
        return new BaseDividerDecoration();
    }

    /* access modifiers changed from: protected */
    public abstract CharSequence getSummary();

    public void onClick(View view) {
        if (view.getId() == R.id.quit) {
            dismiss();
            if (this.mAgreementListener != null) {
                this.mAgreementListener.onAgreementInvoked(false);
            }
        }
        if (view.getId() == R.id.action && view.isEnabled()) {
            dismiss();
            if (this.mAgreementListener != null) {
                this.mAgreementListener.onAgreementInvoked(true);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.user_agreement);
        initView();
        Window window = getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.gravity = 80;
        attributes.width = -1;
        attributes.height = -2;
        window.setAttributes(attributes);
    }

    /* access modifiers changed from: protected */
    public void setActionButtonEnabled(boolean z) {
        this.mActionBtn.setEnabled(z);
    }

    public void setOnAgreementListener(OnAgreementInvokedListener onAgreementInvokedListener) {
        this.mAgreementListener = onAgreementInvokedListener;
    }
}
