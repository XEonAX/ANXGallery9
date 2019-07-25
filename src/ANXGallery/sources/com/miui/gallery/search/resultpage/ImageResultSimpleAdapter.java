package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.BaseMediaSyncStateAdapter;
import com.miui.gallery.adapter.CheckableAdapter;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.display.RequestLoadMoreListener;
import com.miui.gallery.search.core.suggestion.RankInfo;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.ui.HomePageGridItem;
import com.miui.gallery.ui.MicroThumbGridItem;
import com.miui.gallery.util.TalkBackUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;

public class ImageResultSimpleAdapter extends BaseMediaSyncStateAdapter implements CheckableAdapter {
    private int INDEX_CLOUD_ID;
    private int INDEX_CREATE_TIME;
    private int INDEX_DURATION;
    private int INDEX_IS_FAVORITE;
    private int INDEX_LOCATION;
    private int INDEX_MICRO_THUMBNAIL_PATH;
    private int INDEX_MIME_TYPE;
    private int INDEX_ORIGINAL_PATH;
    private int INDEX_SERVER_ID;
    private int INDEX_SHA1;
    private int INDEX_SIZE;
    private int INDEX_SPECIAL_TYPE_FLAGS;
    private int INDEX_SYNC_STATE;
    private int INDEX_THUMBNAIL_PATH;
    private boolean mCheckable;
    private boolean mLoadMoreRequested = false;
    private boolean mNextLoadEnable = false;
    protected QueryInfo mQueryInfo;
    protected RankInfo mRankInfo;
    private RequestLoadMoreListener mRequestLoadMoreListener;

    public ImageResultSimpleAdapter(Context context) {
        super(context);
    }

    private SuggestionCursor getSuggestionCursorByPosition(int i) {
        return (SuggestionCursor) getCursorByPosition(i);
    }

    private void requestLoadMoreIfNeeded() {
        if (this.mNextLoadEnable && this.mRequestLoadMoreListener != null && !this.mLoadMoreRequested) {
            this.mLoadMoreRequested = true;
            this.mRequestLoadMoreListener.onLoadMoreRequested();
        }
    }

    public void changeSuggestions(QueryInfo queryInfo, RankInfo rankInfo, SuggestionCursor suggestionCursor) {
        this.mQueryInfo = queryInfo;
        this.mRankInfo = rankInfo;
        swapCursor(suggestionCursor);
    }

    public void closeLoadMore() {
        if (this.mNextLoadEnable) {
            this.mNextLoadEnable = false;
        }
        this.mLoadMoreRequested = false;
    }

    public void doBindView(View view, Context context, Cursor cursor) {
        MicroThumbGridItem microThumbGridItem = (MicroThumbGridItem) view;
        int position = cursor.getPosition();
        microThumbGridItem.bindImage(getLocalPath(position), getDownloadUri(position), getDisplayImageOptions(position));
        String string = cursor.getString(this.INDEX_MIME_TYPE);
        microThumbGridItem.bindIndicator(string, cursor.getLong(this.INDEX_DURATION), cursor.getLong(this.INDEX_SPECIAL_TYPE_FLAGS));
        microThumbGridItem.bindFavoriteIndicator(isFavorite(position));
        microThumbGridItem.setCheckable(this.mCheckable);
        microThumbGridItem.setContentDescription(TalkBackUtil.getContentDescriptionForImage(context, cursor.getLong(this.INDEX_CREATE_TIME), cursor.getString(this.INDEX_LOCATION), string));
        if (position == getCount() - 1) {
            requestLoadMoreIfNeeded();
        }
    }

    public View getCheckableView(View view) {
        return ((HomePageGridItem) view).getCheckBox();
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptions(int i) {
        if (!SearchConstants.isHorizontalDocumentStyle(this.mRankInfo)) {
            return super.getDisplayImageOptions(i);
        }
        this.mDisplayImageOptionBuilder.cacheThumbnail(false);
        this.mDisplayImageOptionBuilder.loadFromMicroCache(false);
        this.mDisplayImageOptionBuilder.cacheInMemory(true);
        return this.mDisplayImageOptionBuilder.build();
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(getSuggestionCursorByPosition(i).getInt(this.INDEX_SYNC_STATE), getItemKey(i));
    }

    public long getFileLength(int i) {
        return getSuggestionCursorByPosition(i).getLong(this.INDEX_SIZE);
    }

    public String getImageIds() {
        return getResultCursor().getImageIds();
    }

    public long getItemKey(int i) {
        return getSuggestionCursorByPosition(i).getLong(this.INDEX_CLOUD_ID);
    }

    public String getLocalPath(int i) {
        return getSuggestionCursorByPosition(i).getString(this.INDEX_MICRO_THUMBNAIL_PATH);
    }

    public String getMicroThumbFilePath(int i) {
        return getSuggestionCursorByPosition(i).getString(this.INDEX_MICRO_THUMBNAIL_PATH);
    }

    public ImageSize getMicroThumbnailSize() {
        return SearchConstants.isHorizontalDocumentStyle(this.mRankInfo) ? ThumbConfig.get().sMicroHorizontalDocumentTargetSize : ThumbConfig.get().sMicroTargetSize;
    }

    public String getMimeType(int i) {
        return getSuggestionCursorByPosition(i).getString(this.INDEX_MIME_TYPE);
    }

    public String getOriginFilePath(int i) {
        return getSuggestionCursorByPosition(i).getString(this.INDEX_ORIGINAL_PATH);
    }

    public ImageResultSuggestionCursor getResultCursor() {
        if (getCursor() == null) {
            return null;
        }
        return (ImageResultSuggestionCursor) getCursor();
    }

    public String getServerId(int i) {
        return getSuggestionCursorByPosition(i).getString(this.INDEX_SERVER_ID);
    }

    public String getSha1(int i) {
        return getCursorByPosition(i).getString(this.INDEX_SHA1);
    }

    public String getThumbFilePath(int i) {
        return getSuggestionCursorByPosition(i).getString(this.INDEX_THUMBNAIL_PATH);
    }

    public boolean isFavorite(int i) {
        return getSuggestionCursorByPosition(i).getInt(this.INDEX_IS_FAVORITE) > 0;
    }

    public boolean isLoading() {
        return this.mNextLoadEnable;
    }

    public void loadComplete() {
        if (this.mNextLoadEnable) {
            this.mNextLoadEnable = false;
        }
        this.mLoadMoreRequested = false;
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        MicroThumbGridItem microThumbGridItem = SearchConstants.isHorizontalDocumentStyle(this.mRankInfo) ? (SearchDocumentGridItem) LayoutInflater.from(context).inflate(R.layout.search_document_grid_item, viewGroup, false) : (MicroThumbGridItem) LayoutInflater.from(context).inflate(R.layout.home_page_grid_item, viewGroup, false);
        microThumbGridItem.setImageSize(getMicroThumbnailSize());
        microThumbGridItem.setImageForeground(R.drawable.rect_item_fg_with_stroke);
        return microThumbGridItem;
    }

    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
    }

    public void openLoadMore() {
        this.mNextLoadEnable = true;
        this.mLoadMoreRequested = false;
    }

    public void setRequestLoadMoreListener(RequestLoadMoreListener requestLoadMoreListener) {
        this.mRequestLoadMoreListener = requestLoadMoreListener;
    }

    public Cursor swapCursor(Cursor cursor) {
        if (cursor != null) {
            this.INDEX_SERVER_ID = cursor.getColumnIndex("serverId");
            this.INDEX_MICRO_THUMBNAIL_PATH = cursor.getColumnIndex("alias_micro_thumbnail");
            this.INDEX_THUMBNAIL_PATH = cursor.getColumnIndex("thumbnailFile");
            this.INDEX_ORIGINAL_PATH = cursor.getColumnIndex("localFile");
            this.INDEX_SHA1 = cursor.getColumnIndex("sha1");
            this.INDEX_MIME_TYPE = cursor.getColumnIndex("mimeType");
            this.INDEX_SYNC_STATE = cursor.getColumnIndex("alias_sync_state");
            this.INDEX_CLOUD_ID = cursor.getColumnIndex("_id");
            this.INDEX_DURATION = cursor.getColumnIndex("duration");
            this.INDEX_IS_FAVORITE = cursor.getColumnIndex("alias_is_favorite");
            this.INDEX_LOCATION = cursor.getColumnIndex("location");
            this.INDEX_CREATE_TIME = cursor.getColumnIndex("alias_create_time");
            this.INDEX_SPECIAL_TYPE_FLAGS = cursor.getColumnIndex("specialTypeFlags");
            this.INDEX_SIZE = cursor.getColumnIndex("size");
        }
        return super.swapCursor(cursor);
    }
}
