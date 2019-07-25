package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.miui.gallery.R;
import com.miui.gallery.ui.AutoBackupChooserItem;

public class AutoBackupChooserAdapter extends AlbumListAdapterBase {
    private static final int COLUMN_INDEX_ALBUM_SIZE = PROJECTION.length;
    private static final String[] PROJECTION_WITH_SIZE = new String[(PROJECTION.length + 1)];
    /* access modifiers changed from: private */
    public final OnAutoBackupStateChangedListener mListener;

    public interface OnAutoBackupStateChangedListener {
        void onAutoBackupStateChanged(int i, boolean z);
    }

    static {
        for (int i = 0; i < PROJECTION.length; i++) {
            PROJECTION_WITH_SIZE[i] = PROJECTION[i];
        }
        PROJECTION_WITH_SIZE[COLUMN_INDEX_ALBUM_SIZE] = "size";
    }

    public AutoBackupChooserAdapter(Context context, OnAutoBackupStateChangedListener onAutoBackupStateChangedListener) {
        super(context);
        this.mListener = onAutoBackupStateChangedListener;
    }

    private long getAlbumSize(Cursor cursor) {
        return cursor.getLong(COLUMN_INDEX_ALBUM_SIZE);
    }

    public void bindView(View view, Context context, Cursor cursor) {
        final int position = cursor.getPosition();
        AutoBackupChooserItem autoBackupChooserItem = (AutoBackupChooserItem) view;
        autoBackupChooserItem.bindCommonInfo(getAlbumName(position), getAlbumCount(cursor), getAlbumSize(cursor));
        autoBackupChooserItem.bindImage(getLocalPath(position), getDownloadUri(position), this.mDisplayImageOption);
        boolean isBabyAlbum = isBabyAlbum(cursor);
        boolean isOwnerShareAlbum = isOwnerShareAlbum(cursor);
        boolean isCameraAlbum = isCameraAlbum(cursor);
        boolean isAutoUploadedAlbum = isAutoUploadedAlbum(cursor);
        autoBackupChooserItem.bindCheckBox(new OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                AutoBackupChooserAdapter.this.mListener.onAutoBackupStateChanged(position, z);
            }
        }, (!isBabyAlbum && !isOwnerShareAlbum && !isCameraAlbum) || !isAutoUploadedAlbum, isAutoUploadedAlbum);
    }

    public boolean getAutoBackupUiState(View view) {
        return ((AutoBackupChooserItem) view).getCheckBoxCheckedState();
    }

    public String[] getProjection() {
        return PROJECTION_WITH_SIZE;
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return LayoutInflater.from(context).inflate(R.layout.auto_backup_chooser_item, viewGroup, false);
    }

    public void reverseAutoBackupUiState(View view, int i) {
        ((AutoBackupChooserItem) view).reverseCheckBoxCheckedState();
    }
}
