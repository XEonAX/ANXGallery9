package com.miui.gallery.editor.photo.screen.mosaic;

import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.editor.photo.screen.base.ScreenBaseMenuFragment;
import com.miui.gallery.editor.photo.screen.core.ScreenProviderManager;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicData;
import com.miui.gallery.editor.photo.screen.stat.ScreenEditorStatUtils;
import com.miui.gallery.editor.photo.widgets.PaintSizePopupWindow;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.ScreenUtils;
import java.util.ArrayList;
import java.util.List;

public class ScreenMosaicMenuFragment extends ScreenBaseMenuFragment<IScreenMosaicOperation> {
    /* access modifiers changed from: private */
    public int mMenuHeight;
    private MosaicAdapter mMosaicAdapter;
    private List<MosaicData> mMosaicDataList;
    private OnItemClickListener mOnItemClickListener = new OnItemClickListener() {
        public final boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            return ScreenMosaicMenuFragment.lambda$new$76(ScreenMosaicMenuFragment.this, recyclerView, view, i);
        }
    };
    private OnSeekBarChangeListener mOnSeekBarChangeListener = new OnSeekBarChangeListener() {
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            int round = Math.round(((float) (i * BaiduSceneResult.ID_CARD)) / 100.0f) + 35;
            ScreenMosaicMenuFragment.this.mPaintPopupWindow.setPaintSize(round);
            ((IScreenMosaicOperation) ScreenMosaicMenuFragment.this.mScreenOperation).setMosaicPaintSize(round);
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
            ScreenMosaicMenuFragment.this.mPaintPopupWindow.showAtLocation(ScreenMosaicMenuFragment.this.mRecyclerView, 17, 0, (-ScreenMosaicMenuFragment.this.mMenuHeight) / 2);
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            ScreenMosaicMenuFragment.this.mPaintPopupWindow.dismiss();
            ScreenEditorStatUtils.statMosaicSizeChoose(seekBar.getProgress());
        }
    };
    /* access modifiers changed from: private */
    public PaintSizePopupWindow mPaintPopupWindow;
    /* access modifiers changed from: private */
    public SimpleRecyclerView mRecyclerView;
    private SeekBar mSeekBar;

    public static /* synthetic */ boolean lambda$new$76(ScreenMosaicMenuFragment screenMosaicMenuFragment, RecyclerView recyclerView, View view, int i) {
        ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
        screenMosaicMenuFragment.setSelection(i);
        ScreenEditorStatUtils.statMosaicMenuItemClick(i);
        return true;
    }

    private void setSelection(int i) {
        this.mMosaicAdapter.setSelection(i);
        ((IScreenMosaicOperation) this.mScreenOperation).setMosaicData((MosaicData) this.mMosaicDataList.get(i), i);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.screen_mosaic_menu_fragment, viewGroup, false);
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mPaintPopupWindow = new PaintSizePopupWindow(getActivity());
        this.mSeekBar = (SeekBar) view.findViewById(R.id.seekbar);
        this.mSeekBar.setProgress(this.mSeekBar.getMax() / 2);
        this.mSeekBar.setOnSeekBarChangeListener(this.mOnSeekBarChangeListener);
        this.mMosaicDataList = new ArrayList(((ScreenMosaicProvider) ScreenProviderManager.INSTANCE.getProvider(ScreenMosaicProvider.class)).list());
        this.mRecyclerView = (SimpleRecyclerView) view.findViewById(R.id.preview_list);
        this.mMosaicAdapter = new MosaicAdapter(getActivity(), this.mMosaicDataList, ((IScreenMosaicOperation) this.mScreenOperation).getCurrentMenuItemIndex());
        this.mRecyclerView.setAdapter(this.mMosaicAdapter);
        this.mMosaicAdapter.setOnItemClickListener(this.mOnItemClickListener);
        int screenWidth = (int) (((((float) ScreenUtils.getScreenWidth()) - (getResources().getDimension(R.dimen.screen_editor_mosaic_menu_horizontal_margin) * 2.0f)) - (getResources().getDimension(R.dimen.screen_editor_mosaic_item_size) * ((float) this.mMosaicAdapter.getItemCount()))) / ((float) (this.mMosaicAdapter.getItemCount() - 1)));
        SimpleRecyclerView simpleRecyclerView = this.mRecyclerView;
        BlankDivider blankDivider = new BlankDivider(0, 0, screenWidth, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
        this.mMenuHeight = getResources().getDimensionPixelSize(R.dimen.photo_editor_menu_panel_height);
    }
}
