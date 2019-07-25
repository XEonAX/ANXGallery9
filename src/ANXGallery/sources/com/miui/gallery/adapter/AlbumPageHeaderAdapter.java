package com.miui.gallery.adapter;

import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.model.BaseAlbumCover;
import com.miui.gallery.model.FaceAlbumCover;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Common;
import com.miui.gallery.provider.GalleryContract.Search;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.search.core.display.icon.IconImageLoader;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AlbumPageHeaderAdapter extends Adapter<BaseViewHolder> {
    private Album[] mAlbums;
    private Context mContext;
    private Builder mDisplayImageOptionsBuilder;
    private Builder mFaceDisplayImageOptionsBuilder;
    private LayoutInflater mLayoutInflater = LayoutInflater.from(this.mContext);
    private int mMaxCoverNum;

    private static class Album {
        Uri mActionUri;
        int mAlbumNameRes;
        int mDefaultCoverRes;
        int mIndex;
        boolean mIsCoverDataValid;

        public Album(int i, int i2, int i3, Uri uri) {
            this.mIndex = i;
            this.mAlbumNameRes = i2;
            this.mDefaultCoverRes = i3;
            this.mActionUri = uri;
        }
    }

    static abstract class BaseViewHolder extends ViewHolder {
        static List<Integer> sAlbumCovers = new ArrayList();
        protected TextView mAlbumName;
        protected View mCover1;
        protected View mCover2;
        protected View mCover3;
        protected ImageView mDefaultAlbumCover;
        protected View mItemView;

        static {
            sAlbumCovers.add(Integer.valueOf(R.id.album_cover_1));
            sAlbumCovers.add(Integer.valueOf(R.id.album_cover_2));
            sAlbumCovers.add(Integer.valueOf(R.id.album_cover_3));
        }

        public BaseViewHolder(View view) {
            super(view);
            this.mItemView = view;
            this.mAlbumName = (TextView) view.findViewById(R.id.album_name);
            this.mCover1 = view.findViewById(R.id.album_cover_1);
            this.mCover2 = view.findViewById(R.id.album_cover_2);
            this.mCover3 = view.findViewById(R.id.album_cover_3);
            this.mDefaultAlbumCover = (ImageView) view.findViewById(R.id.default_album_cover);
        }

        private void bindCover(Context context, Album album, Builder builder) {
            if (album.mIsCoverDataValid) {
                doBindCover(context, album, builder);
            }
        }

        protected static DisplayImageOptions buildDisplayImageOptions(Builder builder, long j) {
            return j > 0 ? builder.considerFileLength(true).fileLength(j).build() : builder.considerFileLength(false).build();
        }

        protected static Uri getDownloadUri(long j, int i) {
            if (i == 0) {
                return ContentUris.withAppendedId(Cloud.CLOUD_URI, j);
            }
            return null;
        }

        public void bindClickListener(final Context context, final Album album) {
            this.mItemView.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    Intent intent = new Intent("android.intent.action.VIEW");
                    intent.setPackage(GalleryApp.sGetAndroidContext().getPackageName());
                    intent.setData(album.mActionUri);
                    context.startActivity(intent);
                }
            });
        }

        /* access modifiers changed from: protected */
        public void bindDefaultCover(int i) {
            this.mDefaultAlbumCover.setVisibility(0);
            setCoversVisibility(4);
            this.mDefaultAlbumCover.setImageResource(i);
        }

        public void bindView(Context context, Album album, Builder builder) {
            this.mAlbumName.setText(context.getText(album.mAlbumNameRes));
            bindCover(context, album, builder);
        }

        /* access modifiers changed from: protected */
        public abstract void doBindCover(Context context, Album album, Builder builder);

        /* access modifiers changed from: protected */
        public ImageView getAlbumCoverByIdx(int i) {
            return (ImageView) this.mItemView.findViewById(((Integer) sAlbumCovers.get(i)).intValue());
        }

        /* access modifiers changed from: protected */
        public void setCoversVisibility(int i) {
            this.mCover1.setVisibility(i);
            this.mCover2.setVisibility(i);
            this.mCover3.setVisibility(i);
        }
    }

    private static class LocalAlbum extends Album {
        ArrayList<BaseAlbumCover> mAlbumCovers;

        public LocalAlbum(int i, int i2, int i3, Uri uri) {
            super(i, i2, i3, uri);
        }
    }

    private static class LocalAlbumViewHolder extends BaseViewHolder {
        public LocalAlbumViewHolder(View view) {
            super(view);
        }

        /* access modifiers changed from: protected */
        public void doBindCover(Context context, Album album, Builder builder) {
            ArrayList<BaseAlbumCover> arrayList = ((LocalAlbum) album).mAlbumCovers;
            if (MiscUtil.isValid(arrayList)) {
                this.mDefaultAlbumCover.setVisibility(4);
                int i = 0;
                setCoversVisibility(0);
                while (i < arrayList.size() && i < 3) {
                    BaseAlbumCover baseAlbumCover = (BaseAlbumCover) arrayList.get(i);
                    BindImageHelper.bindImage(baseAlbumCover.coverPath, getDownloadUri(baseAlbumCover.coverId, baseAlbumCover.coverSyncState), DownloadType.MICRO, getAlbumCoverByIdx(i), buildDisplayImageOptions(builder, baseAlbumCover.coverSize), ThumbConfig.get().sMicroTargetSize);
                    i++;
                }
                if (i < sAlbumCovers.size()) {
                    while (i < sAlbumCovers.size()) {
                        getAlbumCoverByIdx(i).setImageResource(R.drawable.image_default_cover_dark_gray);
                        i++;
                    }
                    return;
                }
                return;
            }
            bindDefaultCover(album.mDefaultCoverRes);
        }
    }

    private static class PeopleAlbumViewHolder extends BaseViewHolder {
        public PeopleAlbumViewHolder(View view) {
            super(view);
        }

        private void bindFaceCover(String str, ImageView imageView, Uri uri, DisplayImageOptions displayImageOptions, RectF rectF) {
            BindImageHelper.bindFaceImage(str, uri, imageView, displayImageOptions, ThumbConfig.get().sMicroTargetSize, rectF, false);
        }

        /* access modifiers changed from: protected */
        public void doBindCover(Context context, Album album, Builder builder) {
            ArrayList<BaseAlbumCover> arrayList = ((LocalAlbum) album).mAlbumCovers;
            if (MiscUtil.isValid(arrayList)) {
                this.mDefaultAlbumCover.setVisibility(4);
                int i = 0;
                setCoversVisibility(0);
                while (i < arrayList.size() && i < 3) {
                    BaseAlbumCover baseAlbumCover = (BaseAlbumCover) arrayList.get(i);
                    bindFaceCover(baseAlbumCover.coverPath, getAlbumCoverByIdx(i), getDownloadUri(baseAlbumCover.coverId, baseAlbumCover.coverSyncState), buildDisplayImageOptions(builder, baseAlbumCover.coverSize), ((FaceAlbumCover) baseAlbumCover).faceRectF);
                    i++;
                }
                if (i < sAlbumCovers.size()) {
                    while (i < sAlbumCovers.size()) {
                        getAlbumCoverByIdx(i).setImageResource(R.drawable.image_default_cover_dark_gray);
                        i++;
                    }
                    return;
                }
                return;
            }
            bindDefaultCover(album.mDefaultCoverRes);
        }
    }

    private static class SearchAlbum extends Album {
        ArrayList<String> mCoverUris;

        public SearchAlbum(int i, int i2, int i3, Uri uri) {
            super(i, i2, i3, uri);
        }
    }

    private static class SearchAlbumViewHolder extends BaseViewHolder {
        public SearchAlbumViewHolder(View view) {
            super(view);
        }

        private void bindServerCover(Context context, String str, ImageView imageView, DisplayImageOptions displayImageOptions) {
            IconImageLoader.getInstance().displayImageEager(context, Uri.parse(str), DownloadType.MICRO, imageView, displayImageOptions, ThumbConfig.get().sMicroTargetSize);
        }

        /* access modifiers changed from: protected */
        public void doBindCover(Context context, Album album, Builder builder) {
            ArrayList<String> arrayList = ((SearchAlbum) album).mCoverUris;
            if (MiscUtil.isValid(arrayList)) {
                this.mDefaultAlbumCover.setVisibility(4);
                int i = 0;
                setCoversVisibility(0);
                while (i < arrayList.size() && i < 3) {
                    bindServerCover(context, (String) arrayList.get(i), getAlbumCoverByIdx(i), builder.build());
                    i++;
                }
                if (i < sAlbumCovers.size()) {
                    while (i < sAlbumCovers.size()) {
                        getAlbumCoverByIdx(i).setImageResource(R.drawable.image_default_cover_dark_gray);
                        i++;
                    }
                    return;
                }
                return;
            }
            bindDefaultCover(album.mDefaultCoverRes);
        }
    }

    public AlbumPageHeaderAdapter(Context context) {
        this.mContext = context;
        Resources resources = context.getResources();
        this.mMaxCoverNum = resources.getInteger(R.integer.album_page_header_cover_num);
        initDisplayImageOptions();
        this.mAlbums = new Album[3];
        this.mAlbums[0] = new LocalAlbum(0, R.string.album_name_people, R.drawable.album_cover_people, Common.URI_PEOPLE_LIST_PAGE);
        this.mAlbums[1] = new SearchAlbum(1, R.string.album_name_locations, R.drawable.album_cover_locations, Search.URI_LOCATION_LIST_PAGE.buildUpon().appendQueryParameter("title", resources.getString(R.string.album_name_locations)).build());
        this.mAlbums[2] = new SearchAlbum(2, R.string.album_name_tags, R.drawable.album_cover_objects, Search.URI_TAG_LIST_PAGE.buildUpon().appendQueryParameter("title", resources.getString(R.string.album_name_tags)).build());
    }

    private void initDisplayImageOptions() {
        this.mDisplayImageOptionsBuilder = new Builder().cloneFrom(ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT).showImageForEmptyUri(R.drawable.image_default_cover_dark_gray).showImageOnFail(R.drawable.image_default_cover_dark_gray).resetViewBeforeLoading(false).showImageOnLoading((Drawable) null).showImageOnLoading(0);
        this.mFaceDisplayImageOptionsBuilder = new Builder().cloneFrom(ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT).showImageForEmptyUri(R.drawable.image_default_cover_dark_gray).showImageOnFail(R.drawable.image_default_cover_dark_gray).resetViewBeforeLoading(false).showImageOnLoading((Drawable) null).showImageOnLoading(0).usingRegionDecoderFace(true);
    }

    public Album getItem(int i) {
        if (this.mAlbums == null || i < 0 || i >= this.mAlbums.length) {
            return null;
        }
        return this.mAlbums[i];
    }

    public int getItemCount() {
        if (this.mAlbums != null) {
            return this.mAlbums.length;
        }
        return 0;
    }

    public long getItemId(int i) {
        Album item = getItem(i);
        if (item != null) {
            return (long) item.mIndex;
        }
        return -1;
    }

    public int getItemViewType(int i) {
        switch (i) {
            case 0:
                return 1;
            case 1:
            case 2:
                return 2;
            default:
                return 0;
        }
    }

    public void onBindViewHolder(BaseViewHolder baseViewHolder, int i) {
        Album item = getItem(i);
        baseViewHolder.bindView(this.mContext, item, getItemId(i) == 0 ? this.mFaceDisplayImageOptionsBuilder : this.mDisplayImageOptionsBuilder);
        baseViewHolder.bindClickListener(this.mContext, item);
    }

    public BaseViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = this.mLayoutInflater.inflate(R.layout.album_page_grid_item, viewGroup, false);
        switch (i) {
            case 0:
                return new LocalAlbumViewHolder(inflate);
            case 1:
                return new PeopleAlbumViewHolder(inflate);
            case 2:
                return new SearchAlbumViewHolder(inflate);
            default:
                return new LocalAlbumViewHolder(inflate);
        }
    }

    public void setAlbumCover(int i, ArrayList<?> arrayList) {
        if (i >= 0 && i < getItemCount()) {
            Album album = this.mAlbums[i];
            try {
                ArrayList<String> arrayList2 = null;
                if (album instanceof SearchAlbum) {
                    if (MiscUtil.isValid(arrayList)) {
                        arrayList2 = new ArrayList<>();
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            Object next = it.next();
                            if (next instanceof String) {
                                arrayList2.add((String) next);
                                if (arrayList2.size() >= this.mMaxCoverNum) {
                                    break;
                                }
                            }
                        }
                    }
                    if (!album.mIsCoverDataValid || MiscUtil.isValid(arrayList2) || MiscUtil.isValid(((SearchAlbum) album).mCoverUris)) {
                        ((SearchAlbum) album).mCoverUris = arrayList2;
                    } else {
                        return;
                    }
                } else if (album instanceof LocalAlbum) {
                    if (MiscUtil.isValid(arrayList)) {
                        arrayList2 = new ArrayList<>();
                        Iterator it2 = arrayList.iterator();
                        while (it2.hasNext()) {
                            Object next2 = it2.next();
                            if (next2 instanceof BaseAlbumCover) {
                                arrayList2.add((BaseAlbumCover) next2);
                                if (arrayList2.size() >= this.mMaxCoverNum) {
                                    break;
                                }
                            }
                        }
                    }
                    if (arrayList2 != null) {
                        if (arrayList2.equals(((LocalAlbum) album).mAlbumCovers)) {
                            album.mIsCoverDataValid = true;
                            return;
                        }
                    } else if (album.mIsCoverDataValid && !MiscUtil.isValid(((LocalAlbum) album).mAlbumCovers)) {
                        album.mIsCoverDataValid = true;
                        return;
                    }
                    ((LocalAlbum) album).mAlbumCovers = arrayList2;
                }
                album.mIsCoverDataValid = true;
                notifyItemChanged(i);
                Log.d("AlbumPageHeaderAdapter", "notifyItemChanged: %d, %s", Integer.valueOf(i), arrayList);
            } finally {
                album.mIsCoverDataValid = true;
            }
        }
    }
}
