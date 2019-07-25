package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.ui.AlbumDetailGridHeaderItem;
import com.miui.gallery.ui.FacePageGridItem;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.TalkBackUtil;
import com.miui.gallery.util.face.FaceRegionRectF;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersBaseAdapter;
import java.util.ArrayList;
import java.util.Collection;

public class FacePageAdapter extends BaseMediaAdapterDeprecated implements CheckableAdapter, StickyGridHeadersBaseAdapter {
    public static final String[] PROJECTION = {"_id", "microthumbfile", "thumbnailFile", "mixedDateTime", "mimeType", "duration", "faceXScale", "faceYScale", "faceWScale", "faceHScale", "exifOrientation", "photo_id", "sha1", "localFile", "serverId", "isFavorite", "location", "specialTypeFlags", "size"};
    private boolean isPhotoModeNotFaceMode = true;
    private boolean mCheckable;
    protected DisplayImageOptions mFaceModeDisplayOptions;
    private Builder mFaceModeDisplayOptionsBuilder;
    protected ArrayList<Integer> mGroupItemCount;
    protected ArrayList<String> mGroupStartLocations;
    protected ArrayList<Integer> mGroupStartPos;

    public FacePageAdapter(Context context) {
        super(context);
    }

    private String getItemPathInternal(Cursor cursor, boolean z) {
        String str;
        if (z) {
            str = cursor.getString(2);
            if (TextUtils.isEmpty(str)) {
                str = cursor.getString(13);
            }
            if (TextUtils.isEmpty(str)) {
                str = cursor.getString(1);
            }
        } else {
            String string = cursor.getString(1);
            if (TextUtils.isEmpty(string)) {
                string = cursor.getString(2);
            }
            if (TextUtils.isEmpty(str)) {
                str = cursor.getString(13);
            }
        }
        return TextUtils.isEmpty(str) ? StorageUtils.getPriorMicroThumbnailPath(cursor.getString(12)) : str;
    }

    public void changeDisplayMode() {
        this.isPhotoModeNotFaceMode = !this.isPhotoModeNotFaceMode;
        notifyDataSetChanged();
    }

    public void doBindView(View view, Context context, Cursor cursor) {
        Cursor cursor2 = cursor;
        FacePageGridItem facePageGridItem = (FacePageGridItem) view;
        int position = cursor.getPosition();
        if (this.isPhotoModeNotFaceMode) {
            facePageGridItem.bindImage(getLocalPath(position), getDownloadUri(position), getDisplayImageOptions(position));
        } else {
            String itemBigPicPath = getItemBigPicPath(position);
            Uri downloadUri = getDownloadUri(position);
            DisplayImageOptions faceModeDisplayOptions = getFaceModeDisplayOptions(position);
            FaceRegionRectF faceRegionRectF = new FaceRegionRectF(cursor2.getFloat(6), cursor2.getFloat(7), cursor2.getFloat(6) + cursor2.getFloat(8), cursor2.getFloat(7) + cursor2.getFloat(9), cursor2.getInt(10));
            facePageGridItem.bindImage(itemBigPicPath, downloadUri, faceModeDisplayOptions, faceRegionRectF);
        }
        String string = cursor2.getString(4);
        facePageGridItem.bindIndicator(string, cursor2.getLong(5), cursor2.getLong(17));
        facePageGridItem.bindFavoriteIndicator(isFavorite(position));
        facePageGridItem.setCheckable(this.mCheckable);
        facePageGridItem.setContentDescription(TalkBackUtil.getContentDescriptionForImage(context, cursor2.getLong(3), cursor2.getString(16), string));
    }

    public View getCheckableView(View view) {
        return ((FacePageGridItem) view).getCheckBox();
    }

    public int getCountForHeader(int i) {
        if (MiscUtil.isValid(this.mGroupItemCount)) {
            return ((Integer) this.mGroupItemCount.get(i)).intValue();
        }
        return 0;
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(getCursorByPosition(i), 11);
    }

    public DisplayImageOptions getFaceModeDisplayOptions(int i) {
        long fileLength = getFileLength(i);
        return fileLength > 0 ? this.mFaceModeDisplayOptionsBuilder.considerFileLength(true).fileLength(fileLength).build() : this.mFaceModeDisplayOptions;
    }

    public long getFileLength(int i) {
        return getCursorByPosition(i).getLong(18);
    }

    public String getFirstFaceServerId() {
        if (getCount() > 0) {
            return getCursorByPosition(0).getString(14);
        }
        return null;
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.album_detail_grid_header_item, viewGroup, false);
        }
        String str = null;
        if (MiscUtil.isValid(this.mGroupStartLocations) && MiscUtil.isValid(this.mGroupStartPos)) {
            str = (String) this.mGroupStartLocations.get(i);
            i = ((Integer) this.mGroupStartPos.get(i)).intValue();
        }
        ((AlbumDetailGridHeaderItem) view).bindData(GalleryDateUtils.formatRelativeDate(((Cursor) getItem(i)).getLong(3)), str);
        return view;
    }

    public String getItemBigPicPath(int i) {
        return getItemPathInternal(getCursorByPosition(i), true);
    }

    public long getItemKey(int i) {
        return getItemPhotoId(i);
    }

    public String getItemPath(Cursor cursor) {
        return getItemPathInternal(cursor, false);
    }

    public long getItemPhotoId(int i) {
        return getCursorByPosition(i).getLong(11);
    }

    public String getLocalPath(int i) {
        return getItemPathInternal(getCursorByPosition(i), false);
    }

    public String getMimeType(int i) {
        return getCursorByPosition(i).getString(4);
    }

    public int getNumHeaders() {
        if (MiscUtil.isValid(this.mGroupItemCount)) {
            return this.mGroupItemCount.size();
        }
        return 0;
    }

    public String getOriginFilePath(int i) {
        return getCursorByPosition(i).getString(13);
    }

    public String getSha1(int i) {
        return getCursorByPosition(i).getString(12);
    }

    public String getThumbFilePath(int i) {
        return getCursorByPosition(i).getString(2);
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        super.initDisplayImageOptions();
        this.mFaceModeDisplayOptionsBuilder = new Builder().cloneFrom(this.mDefaultDisplayImageOptions).usingRegionDecoderFace(true);
        this.mFaceModeDisplayOptions = this.mFaceModeDisplayOptionsBuilder.build();
    }

    public boolean isFaceDisplayMode() {
        return !this.isPhotoModeNotFaceMode;
    }

    public boolean isFavorite(int i) {
        return getCursorByPosition(i).getInt(15) > 0;
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return LayoutInflater.from(context).inflate(R.layout.face_page_grid_item, viewGroup, false);
    }

    public boolean shouldDrawDivider() {
        return false;
    }

    public Cursor swapCursor(Cursor cursor) {
        Collection collection;
        Collection collection2;
        Collection collection3 = null;
        if (cursor != null) {
            Bundle extras = cursor.getExtras();
            ArrayList integerArrayList = extras.getIntegerArrayList("extra_timeline_item_count_in_group");
            collection = extras.getIntegerArrayList("extra_timeline_group_start_pos");
            Collection collection4 = integerArrayList;
            collection2 = extras.getStringArrayList("extra_timeline_group_start_locations");
            collection3 = collection4;
        } else {
            collection2 = null;
            collection = null;
        }
        if (collection3 == null || collection == null || collection2 == null) {
            if (this.mGroupItemCount != null) {
                this.mGroupItemCount.clear();
            }
            if (this.mGroupStartPos != null) {
                this.mGroupStartPos.clear();
            }
            if (this.mGroupStartLocations != null) {
                this.mGroupStartLocations.clear();
            }
        } else {
            this.mGroupItemCount = new ArrayList<>(collection3);
            this.mGroupStartPos = new ArrayList<>(collection);
            this.mGroupStartLocations = new ArrayList<>(collection2);
        }
        return super.swapCursor(cursor);
    }
}
