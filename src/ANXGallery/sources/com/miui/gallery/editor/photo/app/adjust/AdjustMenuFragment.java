package com.miui.gallery.editor.photo.app.adjust;

import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.MenuFragment;
import com.miui.gallery.editor.photo.app.menu.AdjustView;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.Metadata;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import com.miui.gallery.editor.photo.core.common.model.AdjustData;
import com.miui.gallery.editor.photo.widgets.recyclerview.Selectable.Selector;
import com.miui.gallery.editor.photo.widgets.seekbar.BasicSeekBar;
import com.miui.gallery.editor.photo.widgets.seekbar.BiDirectionSeekBar;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator.Callback;
import com.miui.gallery.ui.SimpleRecyclerView;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.ui.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;

public class AdjustMenuFragment extends MenuFragment<AbstractEffectFragment, SdkProvider<AdjustData, AbstractEffectFragment>> {
    /* access modifiers changed from: private */
    public AdjustAdapter mAdapter;
    private List<AdjustData> mDataList;
    private BubbleIndicator<TextView> mIndicator;
    private Callback<TextView> mIndicatorCallback = new Callback<TextView>() {
        public void updateProgress(TextView textView, int i) {
            textView.setText(String.format("%d", new Object[]{Integer.valueOf(i)}));
        }
    };
    private OnItemClickListener mOnItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            if (AdjustMenuFragment.this.mAdapter.getSelection() == i) {
                return true;
            }
            AdjustMenuFragment.this.performItemSelect(i, false);
            return true;
        }
    };
    private SimpleRecyclerView mRecyclerView;
    private OnSeekBarChangeListener mSeekBarChangeListener = new OnSeekBarChangeListener() {
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            AdjustMenuFragment.this.doConfig(i);
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
        }
    };
    private TextView mTitle;
    private LinearLayout mTopPanel;

    public AdjustMenuFragment() {
        super(Effect.ADJUST);
    }

    /* access modifiers changed from: private */
    public void doConfig(int i) {
        if (this.mAdapter.getSelection() == -1) {
            Log.w("AdjustMenuFragment", "no effect rendered, skip");
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("AdjustData progress:");
        sb.append(i);
        Log.w("AdjustMenuFragment", sb.toString());
        AdjustData adjustData = (AdjustData) this.mDataList.get(this.mAdapter.getSelection());
        adjustData.progress = i;
        ((AbstractEffectFragment) getRenderFragment()).remove(adjustData);
        ((AbstractEffectFragment) getRenderFragment()).add(adjustData, null);
        ((AbstractEffectFragment) getRenderFragment()).render();
    }

    private void doRender(Metadata metadata) {
        ((AbstractEffectFragment) getRenderFragment()).remove(metadata);
        ((AbstractEffectFragment) getRenderFragment()).add(metadata, null);
        ((AbstractEffectFragment) getRenderFragment()).render();
    }

    /* access modifiers changed from: private */
    public void performItemSelect(int i, boolean z) {
        SeekBar seekBar;
        AdjustData adjustData = (AdjustData) this.mDataList.get(i);
        if (!z) {
            doRender(adjustData);
        }
        this.mAdapter.setSelection(i);
        if (this.mIndicator != null && this.mIndicator.isShowing()) {
            this.mIndicator.dismiss();
        }
        if (((SeekBar) this.mTopPanel.getChildAt(0)) != null) {
            this.mTopPanel.removeAllViews();
        }
        if (!adjustData.isMid()) {
            SeekBar basicSeekBar = new BasicSeekBar(getActivity());
            basicSeekBar.setMax(adjustData.getMax());
            basicSeekBar.setProgress(adjustData.progress);
            seekBar = basicSeekBar;
        } else {
            BiDirectionSeekBar biDirectionSeekBar = new BiDirectionSeekBar(getActivity());
            biDirectionSeekBar.setMaxValue(adjustData.getMax());
            biDirectionSeekBar.setCurrentValue(adjustData.progress);
            seekBar = biDirectionSeekBar;
        }
        this.mTopPanel.addView(seekBar, -1, -2);
        this.mIndicator.onProgressChanged(seekBar, adjustData.progress, true);
        seekBar.setOnSeekBarChangeListener(this.mIndicator);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mDataList = new ArrayList(this.mSdkProvider.list());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new AdjustView(viewGroup.getContext());
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mTopPanel = (LinearLayout) view.findViewById(R.id.top_panel);
        this.mRecyclerView = (SimpleRecyclerView) view.findViewById(R.id.recycler_view);
        this.mAdapter = new AdjustAdapter(getActivity(), this.mDataList, new Selector(getResources().getColor(R.color.photo_editor_highlight_color)));
        this.mRecyclerView.setAdapter(this.mAdapter);
        this.mAdapter.setOnItemClickListener(this.mOnItemClickListener);
        this.mTitle = (TextView) view.findViewById(R.id.title);
        this.mTitle.setText(R.string.photo_editor_adjust);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.editor_menu_adjust_item_start);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.editor_menu_adjust_item_horizontal_interval);
        SimpleRecyclerView simpleRecyclerView = this.mRecyclerView;
        BlankDivider blankDivider = new BlankDivider(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize2, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
        this.mIndicator = new BubbleIndicator<>((TextView) View.inflate(getActivity(), R.layout.seekbar_bubble_indicator_text, null), getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_bubble_indicator_offset), this.mIndicatorCallback, this.mSeekBarChangeListener);
        performItemSelect(0, true);
    }
}
