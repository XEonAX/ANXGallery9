package com.miui.gallery.editor.photo.app.navigator;

import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.AbstractNaviFragment;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.ui.menu.type.EditNavMenuView;
import com.miui.gallery.ui.SimpleRecyclerView;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.ui.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.ScreenUtils;
import java.util.List;

public class ScreenshotNaviFragment extends AbstractNaviFragment {
    private Adapter mAdapter;
    private SimpleRecyclerView mNavigator;
    private OnItemClickListener mOnItemSelectedListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            ScreenshotNaviFragment.this.notifyNavigate(((NavigatorData) ScreenshotNaviFragment.this.getNaviData().get(i)).effect);
            return true;
        }
    };

    private static final class Adapter extends com.miui.gallery.ui.SimpleRecyclerView.Adapter<NavigatorHolder> {
        private List<NavigatorData> mNavigatorData;

        public Adapter(List<NavigatorData> list) {
            this.mNavigatorData = list;
        }

        public int getItemCount() {
            return this.mNavigatorData.size();
        }

        public void onBindViewHolder(NavigatorHolder navigatorHolder, int i) {
            super.onBindViewHolder(navigatorHolder, i);
            navigatorHolder.bind((NavigatorData) this.mNavigatorData.get(i));
        }

        public NavigatorHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new NavigatorHolder(getInflater().inflate(R.layout.common_editor_navigator_item, viewGroup, false));
        }
    }

    private static final class NavigatorHolder extends ViewHolder {
        private ImageView mImageView;
        private TextView mView;

        public NavigatorHolder(View view) {
            super(view);
            this.mView = (TextView) view.findViewById(R.id.label);
            this.mImageView = (ImageView) view.findViewById(R.id.img_nav);
        }

        /* access modifiers changed from: 0000 */
        public void bind(NavigatorData navigatorData) {
            this.mView.setText(navigatorData.name);
            this.mImageView.setImageResource(navigatorData.icon);
        }
    }

    /* access modifiers changed from: protected */
    public View onCreateNavigator(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new EditNavMenuView(viewGroup.getContext());
    }

    /* access modifiers changed from: protected */
    public void onNavigatorCreated(View view, Bundle bundle) {
        this.mNavigator = (SimpleRecyclerView) view.findViewById(R.id.recycler_view);
        this.mAdapter = new Adapter(getNaviData());
        this.mNavigator.setAdapter(this.mAdapter);
        this.mAdapter.setOnItemClickListener(this.mOnItemSelectedListener);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.photo_editor_screen_nav_item_start);
        int size = getNaviData() == null ? 0 : getNaviData().size();
        int i = 1;
        if (size > 1) {
            i = size - 1;
        }
        int screenWidth = ((ScreenUtils.getScreenWidth() - (dimensionPixelSize * 2)) - (size * getResources().getDimensionPixelSize(R.dimen.video_editor_nav_item_width))) / i;
        SimpleRecyclerView simpleRecyclerView = this.mNavigator;
        BlankDivider blankDivider = new BlankDivider(dimensionPixelSize, dimensionPixelSize, screenWidth, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mNavigator);
    }
}
