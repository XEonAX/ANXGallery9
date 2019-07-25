package com.miui.gallery.movie.ui.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.adapter.CheckableAdapter;
import com.miui.gallery.adapter.PreloadMediaAdapterDeprecated;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.card.ui.detail.StoryAlbumAdapter;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.picker.helper.PickerItemCheckedListener;
import com.miui.gallery.ui.HomePageGridItem;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersBaseAdapter;

public class StoryMoviePickAdapter extends PreloadMediaAdapterDeprecated implements CheckableAdapter, StickyGridHeadersBaseAdapter {
    public static final String[] PROJECTION = StoryAlbumAdapter.PROJECTION;
    private Picker mPicker;
    private PickerItemCheckedListener mPickerItemCheckedListener;

    public StoryMoviePickAdapter(Context context, DisplayScene displayScene) {
        super(context, displayScene);
    }

    public StoryMoviePickAdapter(Context context, Picker picker) {
        this(context, DisplayScene.SCENE_IN_CHECK_MODE);
        this.mPicker = picker;
        this.mPickerItemCheckedListener = new PickerItemCheckedListener(this.mPicker);
    }

    private int getSyncState(Cursor cursor) {
        return getSyncStateInternal(cursor.getInt(16));
    }

    /* access modifiers changed from: protected */
    public void doBindData(View view, Context context, Cursor cursor) {
        HomePageGridItem homePageGridItem = (HomePageGridItem) view;
        homePageGridItem.bindImage(getClearThumbFilePath(cursor.getPosition()), getDownloadUri(cursor.getPosition()), this.mDefaultDisplayImageOptions);
        homePageGridItem.bindFavoriteIndicator(isFavorite(cursor.getPosition()));
        homePageGridItem.bindSyncIndicator(cursor.getLong(0), getSyncState(cursor), this.mShowScene);
    }

    public View getCheckableView(View view) {
        return ((HomePageGridItem) view).getCheckBox();
    }

    public String getClearThumbFilePath(int i) {
        return getMicroPath(getCursorByPosition(i), 17, 15);
    }

    public int getCountForHeader(int i) {
        return 0;
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(getCursorByPosition(i), 16, 0);
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public long getItemKey(int i) {
        return getCursorByPosition(i).getLong(0);
    }

    public String getLocalPath(int i) {
        return getMicroPath(getCursorByPosition(i), 17, 15);
    }

    public String getMimeType(int i) {
        return getCursorByPosition(i).getString(4);
    }

    public int getNumHeaders() {
        return 0;
    }

    public String getOriginFilePath(int i) {
        return getCursorByPosition(i).getString(3);
    }

    public String getSha1(int i) {
        return getCursorByPosition(i).getString(15);
    }

    public String getThumbFilePath(int i) {
        return getCursorByPosition(i).getString(2);
    }

    public boolean isFavorite(int i) {
        return getCursorByPosition(i).getInt(18) > 0;
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return LayoutInflater.from(context).inflate(R.layout.home_page_grid_item, viewGroup, false);
    }

    public boolean shouldDrawDivider() {
        return false;
    }
}
