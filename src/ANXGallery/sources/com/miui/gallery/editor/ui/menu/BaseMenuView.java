package com.miui.gallery.editor.ui.menu;

import android.content.Context;
import android.support.constraint.Guideline;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.miui.gallery.editor.R;

public abstract class BaseMenuView extends FrameLayout {
    protected Guideline mBottomLine;
    protected FrameLayout mConfirmLayout;
    private View mConfirmView;
    protected Guideline mContentLine;
    protected Context mContext;
    protected FrameLayout mMenuLayout;
    private View mMenuView;
    protected FrameLayout mTopLayout;
    protected Guideline mTopLine;
    private View mTopView;

    public BaseMenuView(Context context) {
        super(context);
        init(context);
    }

    private void addChildViewToParent(ViewGroup viewGroup, View view) {
        if (viewGroup != null && view != null) {
            viewGroup.addView(view);
        }
    }

    private void inflateView() {
        inflate(this.mContext, R.layout.common_editor_bottom_layout, this);
        this.mConfirmLayout = (FrameLayout) findViewById(R.id.layout_bottom_area);
        this.mMenuLayout = (FrameLayout) findViewById(R.id.layout_content_area);
        this.mTopLayout = (FrameLayout) findViewById(R.id.layout_top_area);
        this.mTopLine = (Guideline) findViewById(R.id.top_guide_line);
        this.mContentLine = (Guideline) findViewById(R.id.content_guide_line);
        this.mBottomLine = (Guideline) findViewById(R.id.bottom_guide_line);
        this.mTopView = initTopView();
        this.mMenuView = initContentView();
        this.mConfirmView = initBottomView();
        addChildViewToParent(this.mTopLayout, this.mTopView);
        addChildViewToParent(this.mMenuLayout, this.mMenuView);
        addChildViewToParent(this.mConfirmLayout, this.mConfirmView);
    }

    private void init(Context context) {
        this.mContext = context;
        inflateView();
        modifyGuideLinePos();
    }

    private void modifyGuideLinePos() {
        modifyTopGuideline((Guideline) findViewById(R.id.top_guide_line));
        modifyContentGuideline((Guideline) findViewById(R.id.content_guide_line));
        modifyBottomGuideline((Guideline) findViewById(R.id.bottom_guide_line));
    }

    public View getConfirmView() {
        return this.mConfirmView;
    }

    /* access modifiers changed from: protected */
    public abstract View initBottomView();

    /* access modifiers changed from: protected */
    public abstract View initContentView();

    /* access modifiers changed from: protected */
    public abstract View initTopView();

    /* access modifiers changed from: protected */
    public abstract void modifyBottomGuideline(Guideline guideline);

    /* access modifiers changed from: protected */
    public abstract void modifyContentGuideline(Guideline guideline);

    /* access modifiers changed from: protected */
    public abstract void modifyTopGuideline(Guideline guideline);
}
