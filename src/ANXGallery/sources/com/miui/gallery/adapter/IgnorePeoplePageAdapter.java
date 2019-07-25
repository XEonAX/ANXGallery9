package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.miui.gallery.R;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.ui.FaceDisplayItemPreferFromThumbnailSource;
import com.miui.gallery.util.face.PeopleCursorHelper;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.display.CircleBitmapDisplayer;

public class IgnorePeoplePageAdapter extends BaseAdapter {
    /* access modifiers changed from: private */
    public OnRecoveryButtonClickListener mRecoveryListener;

    public interface OnRecoveryButtonClickListener {
        void onPeopleRecoveryButtonClick(String str, String str2, String str3, String str4, RectF rectF);
    }

    private class ViewHolder extends FaceDisplayItemPreferFromThumbnailSource {
        /* access modifiers changed from: private */
        public RectF mFacePosition;
        /* access modifiers changed from: private */
        public String mThumbnail;

        public ViewHolder(Context context, AttributeSet attributeSet, View view) {
            super(context, attributeSet);
            this.mCover = (ImageView) view.findViewById(R.id.face);
        }

        public void bindData(Cursor cursor) {
            final String peopleLocalId = PeopleCursorHelper.getPeopleLocalId(cursor);
            final String peopleServerId = PeopleCursorHelper.getPeopleServerId(cursor);
            final String peopleName = PeopleCursorHelper.getPeopleName(cursor);
            this.mCover.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (IgnorePeoplePageAdapter.this.mRecoveryListener != null) {
                        IgnorePeoplePageAdapter.this.mRecoveryListener.onPeopleRecoveryButtonClick(peopleLocalId, peopleServerId, peopleName, ViewHolder.this.mThumbnail, ViewHolder.this.mFacePosition);
                    }
                }
            });
        }

        public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions, RectF rectF, DownloadType downloadType) {
            super.bindImage(str, uri, displayImageOptions, rectF, downloadType);
            this.mThumbnail = str;
            this.mFacePosition = rectF;
        }
    }

    public IgnorePeoplePageAdapter(Context context) {
        super(context);
        this.mContext = context;
    }

    public void bindView(View view, Context context, Cursor cursor) {
        ViewHolder viewHolder = (ViewHolder) view.getTag();
        int position = cursor.getPosition();
        viewHolder.bindData(cursor);
        viewHolder.bindImage(PeopleCursorHelper.getThumbnailPath(cursor), getDownloadUri(position), getDisplayImageOptions(position), PeopleCursorHelper.getFaceRegionRectF(cursor), PeopleCursorHelper.getThumbnailDownloadType(cursor));
    }

    public Uri getDownloadUri(int i) {
        return PeopleCursorHelper.getThumbnailDownloadUri(getCursorByPosition(i));
    }

    public long getFileLength(int i) {
        return PeopleCursorHelper.getCoverSize(getCursorByPosition(i));
    }

    public String getThumbFilePath(int i) {
        return PeopleCursorHelper.getThumbnailPath(getCursorByPosition(i));
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        this.mDisplayImageOptionBuilder = new Builder().cacheThumbnail(true).loadFromMicroCache(true).cacheInMemory(true).considerExifParams(true).showStubImage(R.drawable.default_face_cover).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new CircleBitmapDisplayer()).usingRegionDecoderFace(true);
        this.mDefaultDisplayImageOptions = this.mDisplayImageOptionBuilder.build();
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        View inflate = LayoutInflater.from(context).inflate(R.layout.ignore_people_page_item, viewGroup, false);
        inflate.setTag(new ViewHolder(this.mContext, null, inflate));
        return inflate;
    }

    public void setRecoveryListener(OnRecoveryButtonClickListener onRecoveryButtonClickListener) {
        this.mRecoveryListener = onRecoveryButtonClickListener;
    }
}
