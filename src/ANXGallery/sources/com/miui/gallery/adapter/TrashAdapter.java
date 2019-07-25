package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.ui.TrashGridItem;
import com.miui.gallery.util.TalkBackUtil;

public class TrashAdapter extends BaseMediaAdapterDeprecated {
    public static final String[] PROJECTION = {"_id", "alias_micro_thumbnail", "sha1", "localFile", "mimeType", "duration", "alias_sync_state", "alias_clear_thumbnail", "alias_is_favorite", "alias_create_time", "location", "specialTypeFlags", "size"};

    public TrashAdapter(Context context) {
        super(context);
    }

    public void doBindView(View view, Context context, Cursor cursor) {
        TrashGridItem trashGridItem = (TrashGridItem) view;
        int position = cursor.getPosition();
        trashGridItem.bindImage(getClearThumbFilePath(position), getDownloadUri(position), getDisplayImageOptions(position));
        String string = cursor.getString(3);
        trashGridItem.bindIndicator(string, cursor.getLong(4), cursor.getLong(10));
        trashGridItem.bindFavoriteIndicator(isFavorite(position));
        trashGridItem.setContentDescription(TalkBackUtil.getContentDescriptionForImage(context, cursor.getLong(8), cursor.getString(9), string));
    }

    public String getClearThumbFilePath(int i) {
        return getMicroPath(getCursorByPosition(i), 6, 2);
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(getCursorByPosition(i), 5, 0);
    }

    public long getFileLength(int i) {
        return getCursorByPosition(i).getLong(11);
    }

    public long getItemKey(int i) {
        return getCursorByPosition(i).getLong(0);
    }

    public String getLocalPath(int i) {
        return getMicroPath(getCursorByPosition(i), 1, 2);
    }

    public String getMimeType(int i) {
        return getCursorByPosition(i).getString(3);
    }

    public String getSha1(int i) {
        return getCursorByPosition(i).getString(2);
    }

    public boolean isFavorite(int i) {
        return getCursorByPosition(i).getInt(7) > 0;
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return LayoutInflater.from(context).inflate(R.layout.trash_grid_item, viewGroup, false);
    }
}
