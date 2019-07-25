package com.miui.gallery.editor.photo.screen.home;

import android.app.Fragment;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.screen.entity.ScreenNavigatorData;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.sdk.editor.Constants;
import java.util.List;

public class ScreenNavFragment extends Fragment {
    /* access modifiers changed from: private */
    public Callback mCallback;
    private boolean mIsLongCropMode;
    /* access modifiers changed from: private */
    public ScreenNavAdapter mNavAdapter;
    private SimpleRecyclerView mNavRecyclerView;
    /* access modifiers changed from: private */
    public List<ScreenNavigatorData> mNavigatorData;
    private OnItemClickListener mNavigatorSelectedListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            if (ScreenNavFragment.this.mCallback == null) {
                return false;
            }
            return ScreenNavFragment.this.mCallback.OnItemClick(recyclerView, view, i, ScreenNavFragment.this.mNavAdapter.getSelection(), (ScreenNavigatorData) ScreenNavFragment.this.mNavigatorData.get(i));
        }
    };

    public interface Callback {
        boolean OnItemClick(RecyclerView recyclerView, View view, int i, int i2, ScreenNavigatorData screenNavigatorData);
    }

    public static ScreenNavFragment newInstance(boolean z) {
        Bundle bundle = new Bundle();
        bundle.putBoolean(Constants.EXTRA_IS_LONG_SCREENSHOT, z);
        ScreenNavFragment screenNavFragment = new ScreenNavFragment();
        screenNavFragment.setArguments(bundle);
        return screenNavFragment;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.screen_editor_bottom_fragment, viewGroup, false);
    }

    public void onDestroy() {
        super.onDestroy();
        this.mCallback = null;
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.mIsLongCropMode = arguments.getBoolean(Constants.EXTRA_IS_LONG_SCREENSHOT);
        }
        this.mNavigatorData = ScreenNavigatorData.getNavData(this.mIsLongCropMode);
        this.mNavAdapter = new ScreenNavAdapter(view.getContext(), this.mNavigatorData);
        this.mNavRecyclerView = (SimpleRecyclerView) view.findViewById(R.id.screen_navigation);
        this.mNavRecyclerView.setAdapter(this.mNavAdapter);
        this.mNavAdapter.setOnItemClickListener(this.mNavigatorSelectedListener);
        SimpleRecyclerView simpleRecyclerView = this.mNavRecyclerView;
        BlankDivider blankDivider = new BlankDivider(this.mNavAdapter.getStartMargin(), 0, 0, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
        this.mNavAdapter.setSelection(1);
    }

    public void setCallback(Callback callback) {
        this.mCallback = callback;
    }
}
