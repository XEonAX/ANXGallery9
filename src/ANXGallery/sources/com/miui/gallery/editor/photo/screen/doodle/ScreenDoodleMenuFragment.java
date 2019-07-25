package com.miui.gallery.editor.photo.screen.doodle;

import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.core.imports.doodle.DoodleManager;
import com.miui.gallery.editor.photo.screen.base.ScreenBaseMenuFragment;
import com.miui.gallery.editor.photo.screen.stat.ScreenEditorStatUtils;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator.Callback;
import com.miui.gallery.editor.photo.widgets.seekbar.ColorGradientDrawable;
import com.miui.gallery.editor.photo.widgets.seekbar.ColorPicker;
import com.miui.gallery.util.ScreenUtils;
import java.util.List;

public class ScreenDoodleMenuFragment extends ScreenBaseMenuFragment<IScreenDoodleOperation> {
    /* access modifiers changed from: private */
    public ColorPicker mColorPicker;
    private List<DoodleData> mDoodleData;
    private BubbleIndicator<View> mIndicator;
    private Callback<View> mIndicatorCallback = new Callback<View>() {
        public void updateProgress(View view, int i) {
            ((GradientDrawable) view.getBackground()).setColor(ScreenDoodleMenuFragment.this.mColorPicker.getColor());
        }
    };
    private OnSeekBarChangeListener mOnSeekBarChangeListener = new OnSeekBarChangeListener() {
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            int color = ScreenDoodleMenuFragment.this.mColorPicker.getColor();
            ScreenDoodleMenuFragment.this.mColorPicker.setThumbColor(color);
            ScreenDoodleMenuFragment.this.setColor(color);
            ScreenEditorStatUtils.statDoodleColorChoose(i);
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
        }
    };
    private ScreenDoodlePaintView mPaintView;

    public static /* synthetic */ boolean lambda$onViewCreated$55(ScreenDoodleMenuFragment screenDoodleMenuFragment, ScreenDoodleAdapter screenDoodleAdapter, RecyclerView recyclerView, View view, int i) {
        ((IScreenDoodleOperation) screenDoodleMenuFragment.mScreenOperation).setDoodleData((DoodleData) screenDoodleMenuFragment.mDoodleData.get(i), i);
        screenDoodleAdapter.setSelection(i);
        ScreenEditorStatUtils.statDoodleMenuItemClick(i);
        return false;
    }

    public static /* synthetic */ void lambda$onViewCreated$56(ScreenDoodleMenuFragment screenDoodleMenuFragment, View view) {
        screenDoodleMenuFragment.mPaintView.transSize();
        ((IScreenDoodleOperation) screenDoodleMenuFragment.mScreenOperation).setPaintType(screenDoodleMenuFragment.mPaintView.getPaintType());
        ScreenEditorStatUtils.statDoodleSizeClick(screenDoodleMenuFragment.mPaintView.getPaintType().name());
    }

    /* access modifiers changed from: private */
    public void setColor(int i) {
        ((IScreenDoodleOperation) this.mScreenOperation).setColor(i);
        this.mPaintView.setPaintColor(i);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.screen_doodle_menu_fragment, viewGroup, false);
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mDoodleData = DoodleManager.getScreenDoodleData();
        ScreenDoodleAdapter screenDoodleAdapter = new ScreenDoodleAdapter(this.mDoodleData, ((IScreenDoodleOperation) this.mScreenOperation).getCurrentMenuItemIndex());
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.recycler_view);
        screenDoodleAdapter.setOnItemClickListener(new OnItemClickListener(screenDoodleAdapter) {
            private final /* synthetic */ ScreenDoodleAdapter f$1;

            {
                this.f$1 = r2;
            }

            public final boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
                return ScreenDoodleMenuFragment.lambda$onViewCreated$55(ScreenDoodleMenuFragment.this, this.f$1, recyclerView, view, i);
            }
        });
        this.mPaintView = (ScreenDoodlePaintView) view.findViewById(R.id.doodle_paint_view);
        this.mPaintView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                ScreenDoodleMenuFragment.lambda$onViewCreated$56(ScreenDoodleMenuFragment.this, view);
            }
        });
        this.mPaintView.setPaintType(((IScreenDoodleOperation) this.mScreenOperation).getPaintType());
        BlankDivider blankDivider = new BlankDivider(0, 0, (int) (((((float) ScreenUtils.getScreenWidth()) - (getResources().getDimension(R.dimen.screen_editor_doodle_menu_horizontal_margin) * 2.0f)) - (((float) this.mDoodleData.size()) * getResources().getDimension(R.dimen.screen_editor_doodle_item_size))) / ((float) (this.mDoodleData.size() - 1))), 0, 0, 0);
        recyclerView.addItemDecoration(blankDivider);
        recyclerView.setAdapter(screenDoodleAdapter);
        View inflate = View.inflate(getActivity(), R.layout.doodle_color_indicator, null);
        this.mIndicator = new BubbleIndicator<>(inflate, getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_bubble_indicator_offset), this.mIndicatorCallback, this.mOnSeekBarChangeListener);
        this.mColorPicker = (ColorPicker) view.findViewById(R.id.color_picker);
        this.mColorPicker.setProgressDrawable(new ColorGradientDrawable(ColorPicker.COLORS));
        this.mColorPicker.setProgress(this.mColorPicker.getMax() / 2);
        this.mColorPicker.setThumbColor(this.mColorPicker.getColor());
        setColor(this.mColorPicker.getColor());
        ((GradientDrawable) inflate.getBackground()).setColor(this.mColorPicker.getColor());
        this.mColorPicker.setOnSeekBarChangeListener(this.mIndicator);
    }
}
