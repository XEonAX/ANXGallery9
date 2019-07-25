package com.miui.gallery.video.editor.widget;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.editor.photo.widgets.seekbar.BasicSeekBar;
import com.miui.gallery.editor.photo.widgets.seekbar.BiDirectionSeekBar;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator.Callback;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.video.editor.adapter.AdjustAdapter;
import com.miui.gallery.video.editor.manager.FilterAdjustManager;
import com.miui.gallery.video.editor.model.AdjustData;
import com.miui.gallery.video.editor.model.FilterAdjustData;
import com.miui.gallery.video.editor.ui.SimpleRecyclerView;
import com.miui.gallery.video.editor.ui.SimpleRecyclerView.OnItemClickListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class AdjustView extends LinearLayout {
    /* access modifiers changed from: private */
    public AdjustAdapter mAdapter;
    private HashMap<Integer, String> mAdjustCurrentEffects;
    /* access modifiers changed from: private */
    public List<AdjustData> mDataList;
    private IAdjustEffectChangeListener mIAdjustEffectChangeListener;
    private IFilterAdjustHeadViewListener mIFilterAdjustHeadViewListener;
    private BubbleIndicator<TextView> mIndicator;
    private Callback<TextView> mIndicatorCallback = new Callback<TextView>() {
        public void updateProgress(TextView textView, int i) {
            textView.setText(String.valueOf(i));
        }
    };
    private boolean mIsAdjustView;
    /* access modifiers changed from: private */
    public boolean mIsTracking;
    private SimpleRecyclerView mRecyclerView;
    private SeekBar mSeekBar;
    private OnSeekBarChangeListener mSeekBarChangeListener = new OnSeekBarChangeListener() {
        int value = 0;

        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            this.value = i;
            AdjustView.this.mIsTracking = true;
            AdjustView.this.setEffect(this.value, (AdjustData) AdjustView.this.mDataList.get(AdjustView.this.mAdapter.getSelection()));
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
            AdjustView.this.mIsTracking = true;
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            AdjustView.this.mIsTracking = false;
            AdjustView.this.setEffect(this.value, (AdjustData) AdjustView.this.mDataList.get(AdjustView.this.mAdapter.getSelection()));
        }
    };
    OnItemClickListener onAdjustItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            if (AdjustView.this.mAdapter.getSelection() == i) {
                AdjustView.this.updateHeadBar();
                return true;
            }
            AdjustView.this.mAdapter.setSelection(i);
            AdjustData adjustData = (AdjustData) AdjustView.this.mDataList.get(i);
            if (adjustData != null && (adjustData instanceof FilterAdjustData)) {
                AdjustView.this.performItemSelect(adjustData);
            }
            return true;
        }
    };

    public interface IAdjustEffectChangeListener {
        void adjustBrightness(int i);

        void adjustContrast(int i);

        void adjustSaturation(int i);

        void adjustSharpness(int i);

        void adjustVignetteRange(int i);
    }

    public interface IFilterAdjustHeadViewListener {
        void addFilterViewToHeadBar(View view);

        void addSeekBarToHeadBar(View view);

        void removeAllViewFromHeadBar();
    }

    public AdjustView(Context context) {
        super(context);
        init(context);
    }

    private void addNewSeekBar(AdjustData adjustData) {
        if (!adjustData.isMid()) {
            this.mSeekBar = new BasicSeekBar(getContext());
            this.mSeekBar.setMax(adjustData.getMax());
            this.mSeekBar.setProgress(adjustData.progress);
        } else {
            BiDirectionSeekBar biDirectionSeekBar = new BiDirectionSeekBar(getContext());
            biDirectionSeekBar.setMaxValue(adjustData.getMax());
            biDirectionSeekBar.setCurrentValue(adjustData.progress);
            this.mSeekBar = biDirectionSeekBar;
        }
        if (this.mIFilterAdjustHeadViewListener != null) {
            this.mIsAdjustView = true;
            this.mIFilterAdjustHeadViewListener.addSeekBarToHeadBar(this.mSeekBar);
        }
        this.mSeekBar.setOnSeekBarChangeListener(this.mIndicator);
    }

    private void init(Context context) {
        ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(R.layout.video_editor_adjustview, this);
        initData(context);
        initRecyclerView(context);
    }

    private void initData(Context context) {
        this.mDataList = new ArrayList();
        List<FilterAdjustData> adjustData = FilterAdjustManager.getAdjustData();
        if (adjustData != null && adjustData.size() > 0) {
            for (FilterAdjustData filterAdjustData : adjustData) {
                if (filterAdjustData != null) {
                    this.mDataList.add(filterAdjustData);
                }
            }
        }
        this.mIndicator = new BubbleIndicator<>((TextView) View.inflate(context, R.layout.seekbar_bubble_indicator_text, null), context.getResources().getDimensionPixelSize(R.dimen.photo_editor_bubble_indicator_offset), this.mIndicatorCallback, this.mSeekBarChangeListener);
    }

    private void initRecyclerView(Context context) {
        this.mRecyclerView = (SimpleRecyclerView) findViewById(R.id.recycler_view);
        this.mAdapter = new AdjustAdapter(context, this.mDataList, new Selector(getResources().getColor(R.color.photo_editor_highlight_color)));
        this.mRecyclerView.setAdapter(this.mAdapter);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mRecyclerView);
        this.mAdapter.setOnItemClickListener(this.onAdjustItemClickListener);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.editor_menu_filter_item_start);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.editor_menu_filter_item_horizontal_interval);
        SimpleRecyclerView simpleRecyclerView = this.mRecyclerView;
        BlankDivider blankDivider = new BlankDivider(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize2, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
    }

    /* access modifiers changed from: private */
    public void performItemSelect(AdjustData adjustData) {
        removePreviousSeekBar();
        addNewSeekBar(adjustData);
    }

    private void removePreviousSeekBar() {
        if (this.mIndicator != null && this.mIndicator.isShowing()) {
            this.mIndicator.dismiss();
        }
        if (this.mIFilterAdjustHeadViewListener != null) {
            this.mIFilterAdjustHeadViewListener.removeAllViewFromHeadBar();
        }
    }

    /* access modifiers changed from: private */
    public void setEffect(int i, AdjustData adjustData) {
        if (this.mAdapter.getSelection() != -1 && this.mIAdjustEffectChangeListener != null) {
            if (this.mAdjustCurrentEffects == null) {
                this.mAdjustCurrentEffects = new HashMap<>();
            }
            adjustData.setProgress(i);
            if (adjustData instanceof FilterAdjustData) {
                FilterAdjustData filterAdjustData = (FilterAdjustData) adjustData;
                int id = filterAdjustData.getId();
                if (!this.mAdjustCurrentEffects.containsKey(Integer.valueOf(id))) {
                    this.mAdjustCurrentEffects.put(Integer.valueOf(id), filterAdjustData.getLable());
                }
                switch (id) {
                    case 0:
                        this.mIAdjustEffectChangeListener.adjustBrightness(i);
                        break;
                    case 1:
                        this.mIAdjustEffectChangeListener.adjustContrast(i);
                        break;
                    case 2:
                        this.mIAdjustEffectChangeListener.adjustSaturation(i);
                        break;
                    case 3:
                        this.mIAdjustEffectChangeListener.adjustSharpness(i);
                        break;
                    case 4:
                        this.mIAdjustEffectChangeListener.adjustVignetteRange(i);
                        break;
                    default:
                        StringBuilder sb = new StringBuilder();
                        sb.append("not support adjust id: ");
                        sb.append(id);
                        throw new IllegalArgumentException(sb.toString());
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void updateHeadBar() {
        if (this.mIFilterAdjustHeadViewListener != null) {
            if (this.mIsAdjustView) {
                this.mIFilterAdjustHeadViewListener.addFilterViewToHeadBar(null);
            } else {
                removePreviousSeekBar();
                this.mIFilterAdjustHeadViewListener.addSeekBarToHeadBar(this.mSeekBar);
            }
            this.mIsAdjustView = !this.mIsAdjustView;
        }
    }

    public void clearCurrentEffects() {
        if (this.mAdjustCurrentEffects != null) {
            this.mAdjustCurrentEffects.clear();
        }
    }

    public boolean doCancel() {
        if (this.mDataList == null) {
            this.mDataList = new ArrayList();
        }
        this.mDataList.clear();
        List<FilterAdjustData> adjustData = FilterAdjustManager.getAdjustData();
        if (adjustData != null && adjustData.size() > 0) {
            for (FilterAdjustData filterAdjustData : adjustData) {
                if (filterAdjustData != null) {
                    this.mDataList.add(filterAdjustData);
                    setEffect(filterAdjustData.getProgress(), filterAdjustData);
                }
            }
        }
        return true;
    }

    public List<String> getAdjustCurrentEffect() {
        if (this.mAdjustCurrentEffects == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : this.mAdjustCurrentEffects.values()) {
            if (str != null) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    public boolean isTracking() {
        return this.mIsTracking;
    }

    public void refreshData() {
        if (this.mAdapter != null) {
            this.mAdapter.setSelection(-1);
        }
    }

    public void setIAdjustEffectChangeListener(IAdjustEffectChangeListener iAdjustEffectChangeListener) {
        this.mIAdjustEffectChangeListener = iAdjustEffectChangeListener;
    }

    public void setIFilterAdjustHeadViewListener(IFilterAdjustHeadViewListener iFilterAdjustHeadViewListener) {
        this.mIFilterAdjustHeadViewListener = iFilterAdjustHeadViewListener;
    }
}
