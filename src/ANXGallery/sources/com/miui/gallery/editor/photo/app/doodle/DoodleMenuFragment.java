package com.miui.gallery.editor.photo.app.doodle;

import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.MenuFragment;
import com.miui.gallery.editor.photo.app.OperationUpdateListener;
import com.miui.gallery.editor.photo.app.menu.DoodleView;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractDoodleFragment;
import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator.Callback;
import com.miui.gallery.editor.photo.widgets.seekbar.ColorGradientDrawable;
import com.miui.gallery.editor.photo.widgets.seekbar.ColorPicker;
import com.miui.gallery.ui.SimpleRecyclerView;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.ui.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.List;

public class DoodleMenuFragment extends MenuFragment<AbstractDoodleFragment, SdkProvider<DoodleData, AbstractDoodleFragment>> {
    /* access modifiers changed from: private */
    public ColorPicker mColorPicker;
    /* access modifiers changed from: private */
    public List<DoodleData> mDoodleDataList;
    /* access modifiers changed from: private */
    public DoodlePaintView mDoodlePaintView;
    /* access modifiers changed from: private */
    public DoodleAdapter mDooodleAdapter;
    private BubbleIndicator<View> mIndicator;
    private Callback<View> mIndicatorCallback = new Callback<View>() {
        public void updateProgress(View view, int i) {
            ((GradientDrawable) view.getBackground()).setColor(DoodleMenuFragment.this.mColorPicker.getColor());
        }
    };
    private LinearLayout mMenuItemParent;
    private OnItemClickListener mOnItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
            ((AbstractDoodleFragment) DoodleMenuFragment.this.getRenderFragment()).setDoodleData((DoodleData) DoodleMenuFragment.this.mDoodleDataList.get(i));
            if (i == DoodleMenuFragment.this.mDooodleAdapter.getSelection()) {
                return false;
            }
            DoodleMenuFragment.this.mDooodleAdapter.setSelection(i);
            DoodleMenuFragment.this.mDooodleAdapter.notifyDataSetChanged();
            return true;
        }
    };
    private OnSeekBarChangeListener mOnSeekBarChangeListener = new OnSeekBarChangeListener() {
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            int color = DoodleMenuFragment.this.mColorPicker.getColor();
            DoodleMenuFragment.this.mColorPicker.setThumbColor(color);
            ((AbstractDoodleFragment) DoodleMenuFragment.this.getRenderFragment()).setColor(color);
            DoodleMenuFragment.this.mDoodlePaintView.setColor(color);
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
        }
    };
    private OnClickListener mOperationClickListener = new OnClickListener() {
        public final void onClick(View view) {
            DoodleMenuFragment.lambda$new$89(DoodleMenuFragment.this, view);
        }
    };
    private View mOperationPanel;
    private OperationUpdateListener mOperationUpdateListener = new OperationUpdateListener() {
        public final void onOperationUpdate() {
            DoodleMenuFragment.this.refreshOperationPanel();
        }
    };
    private OnClickListener mPaintViewSelectClickListener = new OnClickListener() {
        public final void onClick(View view) {
            DoodleMenuFragment.lambda$new$90(DoodleMenuFragment.this, view);
        }
    };
    private SimpleRecyclerView mRecyclerView;
    private View mRevert;
    private View mRevoke;
    private TextView mTitleView;

    public DoodleMenuFragment() {
        super(Effect.DOODLE);
    }

    private void initRecyclerView() {
        ScrollControlLinearLayoutManager scrollControlLinearLayoutManager = new ScrollControlLinearLayoutManager(getActivity());
        scrollControlLinearLayoutManager.setOrientation(0);
        this.mRecyclerView.setLayoutManager(scrollControlLinearLayoutManager);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.editor_menu_mosaic_item_decoration);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.editor_menu_mosaic_item_decoration);
        SimpleRecyclerView simpleRecyclerView = this.mRecyclerView;
        BlankDivider blankDivider = new BlankDivider(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize2, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
        this.mDoodleDataList = new ArrayList(this.mSdkProvider.list());
        this.mDooodleAdapter = new DoodleAdapter(getActivity(), this.mDoodleDataList);
        this.mRecyclerView.setAdapter(this.mDooodleAdapter);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mRecyclerView);
        this.mDooodleAdapter.setOnItemClickListener(this.mOnItemClickListener);
        this.mDooodleAdapter.setSelection(0);
        this.mDooodleAdapter.notifyDataSetChanged();
    }

    public static /* synthetic */ void lambda$new$89(DoodleMenuFragment doodleMenuFragment, View view) {
        switch (view.getId()) {
            case R.id.operation_revert /*2131296766*/:
                ((AbstractDoodleFragment) doodleMenuFragment.getRenderFragment()).doRevert();
                return;
            case R.id.operation_revoke /*2131296767*/:
                ((AbstractDoodleFragment) doodleMenuFragment.getRenderFragment()).doRevoke();
                return;
            default:
                return;
        }
    }

    public static /* synthetic */ void lambda$new$90(DoodleMenuFragment doodleMenuFragment, View view) {
        DoodlePaintView doodlePaintView = (DoodlePaintView) view;
        doodlePaintView.updateInnerRadiusPercent();
        ((AbstractDoodleFragment) doodleMenuFragment.getRenderFragment()).setPaintSize(doodlePaintView.getPaintType().paintSize * doodleMenuFragment.getResources().getDisplayMetrics().density);
    }

    /* access modifiers changed from: private */
    public void refreshOperationPanel() {
        this.mTitleView.setVisibility(8);
        this.mOperationPanel.setVisibility(0);
        this.mRevoke.setEnabled(((AbstractDoodleFragment) getRenderFragment()).canRevoke());
        this.mRevert.setEnabled(((AbstractDoodleFragment) getRenderFragment()).canRevert());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new DoodleView(viewGroup.getContext());
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mTitleView = (TextView) view.findViewById(R.id.title);
        this.mTitleView.setText(R.string.photo_editor_doodle);
        this.mDoodlePaintView = (DoodlePaintView) view.findViewById(R.id.doodle_paint_select);
        this.mDoodlePaintView.setOnClickListener(this.mPaintViewSelectClickListener);
        this.mOperationPanel = view.findViewById(R.id.operation_panel);
        this.mRevoke = view.findViewById(R.id.operation_revoke);
        this.mRevert = view.findViewById(R.id.operation_revert);
        this.mRecyclerView = (SimpleRecyclerView) view.findViewById(R.id.recycler_view);
        this.mRevoke.setOnClickListener(this.mOperationClickListener);
        this.mRevert.setOnClickListener(this.mOperationClickListener);
        MiscUtil.enlargeTouchArea(this.mOperationPanel, this.mRevoke, 1.8f);
        MiscUtil.enlargeTouchArea(this.mOperationPanel, this.mRevert, 1.8f);
        this.mColorPicker = (ColorPicker) view.findViewById(R.id.color_picker);
        this.mColorPicker.setProgressDrawable(new ColorGradientDrawable(ColorPicker.COLORS));
        this.mMenuItemParent = (LinearLayout) view.findViewById(R.id.menu_parent);
        initRecyclerView();
        View inflate = View.inflate(getActivity(), R.layout.doodle_color_indicator, null);
        this.mIndicator = new BubbleIndicator<>(inflate, getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_bubble_indicator_offset), this.mIndicatorCallback, this.mOnSeekBarChangeListener);
        this.mColorPicker.setOnSeekBarChangeListener(this.mIndicator);
        this.mColorPicker.setProgress(this.mColorPicker.getMax() / 2);
        this.mColorPicker.setThumbColor(this.mColorPicker.getColor());
        ((GradientDrawable) inflate.getBackground()).setColor(this.mColorPicker.getColor());
        ((AbstractDoodleFragment) getRenderFragment()).setOperationUpdateListener(this.mOperationUpdateListener);
    }
}
