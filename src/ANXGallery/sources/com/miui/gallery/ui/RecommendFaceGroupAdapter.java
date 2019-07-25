package com.miui.gallery.ui;

import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.net.Uri;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.provider.deprecated.PeopleRecommendMediaSet;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.BindImageHelper.OnImageLoadingCompleteListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.face.FaceRegionRectF;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.util.uil.CloudImageLoadingListener;
import com.miui.gallery.util.uil.CloudImageLoadingProgressListener;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.miui.gallery.widget.PagerGridLayout.BaseAdapter;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.util.ArrayList;
import java.util.HashMap;

public abstract class RecommendFaceGroupAdapter extends BaseAdapter {
    public static final String[] PROJECTION = {"_id", "sha1", "microthumbfile", "thumbnailFile", "localFile", "faceXScale", "faceYScale", "faceWScale", "faceHScale", "exifOrientation", "serverId", "photo_id", "size"};
    /* access modifiers changed from: private */
    public CloudImageLoadingListener mCloudLoadingListener;
    private ArrayList<String> mConfirmToRight = new ArrayList<>();
    private ArrayList<String> mConfirmToWrong = new ArrayList<>();
    protected Cursor mCursor;
    private Builder mDisplayImageOptionsBuilder;
    private BaseMediaFragment mFragment;
    /* access modifiers changed from: private */
    public OnImageLoadingCompleteListener mLoadingCompleteListener;
    private Long mLocalIdOfAlbum;
    private String mServerIdOfAlbum;
    public int mVisibleItemCount = 0;

    private class RecommendFaceItem implements OnClickListener, OnTouchListener {
        private CheckBox mCheckbox;
        private ImageView mCoverImage;
        private ImageViewAware mCoverImageAware = new ImageViewAware(this.mCoverImage);
        private String mFacePath;
        /* access modifiers changed from: private */
        public long mFileLength;
        private long mPhotoCloudId;
        private String mServerId;

        public RecommendFaceItem(View view) {
            this.mCoverImage = (ImageView) view.findViewById(R.id.recommend_face_cover);
            this.mCheckbox = (CheckBox) view.findViewById(R.id.face_check);
            this.mCoverImage.setOnTouchListener(this);
            this.mCoverImage.setClickable(true);
            this.mCheckbox.setOnClickListener(this);
            this.mCheckbox.setChecked(true);
        }

        public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions, RectF rectF, DownloadType downloadType) {
            BindImageHelper.bindImage(str, uri, NetworkUtils.isActiveNetworkMetered() ? DownloadType.MICRO : DownloadType.THUMBNAIL, this.mCoverImage, displayImageOptions, ThumbConfig.get().sMicroTargetSize, rectF, true, true, RecommendFaceGroupAdapter.this.mLoadingCompleteListener);
            if (DownloadType.MICRO == downloadType && !TextUtils.isEmpty(str) && !NetworkUtils.isActiveNetworkMetered()) {
                CloudImageLoader.getInstance().displayImage(uri, DownloadType.THUMBNAIL, this.mCoverImage, displayImageOptions, ThumbConfig.get().sMicroTargetSize, RecommendFaceGroupAdapter.this.mCloudLoadingListener, (CloudImageLoadingProgressListener) null, rectF, true, false);
            }
        }

        public void needToFresh(DisplayImageOptions displayImageOptions) {
            if (TextUtils.isEmpty(this.mFacePath) && !TextUtils.isEmpty(this.mServerId)) {
                RectF[] rectFArr = new RectF[1];
                String queryCoverImageOfOneFace = FaceManager.queryCoverImageOfOneFace(this.mServerId, rectFArr);
                this.mFacePath = queryCoverImageOfOneFace;
                if (!TextUtils.isEmpty(this.mFacePath)) {
                    ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(queryCoverImageOfOneFace), this.mCoverImageAware, displayImageOptions, null, null, null, rectFArr[0]);
                }
            }
        }

        public void onClick(View view) {
            if (view.getId() == R.id.face_check) {
                RecommendFaceGroupAdapter.this.recommendCheckStatusChanged(this.mServerId, this.mCheckbox.isChecked());
            }
        }

        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (view.getId() != R.id.recommend_face_cover) {
                return false;
            }
            int action = motionEvent.getAction();
            if (action != 3) {
                switch (action) {
                    case 0:
                        view.setPressed(true);
                        break;
                    case 1:
                        RecommendFaceGroupAdapter.this.gotoRecommendCoverPage(this.mFacePath, ItemViewInfo.getImageInfo((int) (motionEvent.getRawX() - motionEvent.getX()), (int) (motionEvent.getRawY() - motionEvent.getY()), view, 0), this.mServerId, this.mPhotoCloudId, this.mFileLength);
                        break;
                }
            }
            view.setPressed(false);
            return true;
        }

        public void setChecked(boolean z) {
            this.mCheckbox.setChecked(z);
        }

        public void setCloudId(long j) {
            this.mPhotoCloudId = j;
        }

        public void setFacePath(String str) {
            this.mFacePath = str;
        }

        public void setFileLength(long j) {
            this.mFileLength = j;
        }

        public void setServerId(String str) {
            this.mServerId = str;
        }
    }

    public RecommendFaceGroupAdapter(BaseMediaFragment baseMediaFragment, String str, Long l) {
        this.mFragment = baseMediaFragment;
        this.mServerIdOfAlbum = str;
        this.mLocalIdOfAlbum = l;
        initDisplayOptions();
    }

    /* access modifiers changed from: private */
    public void confirmFace(ArrayList<String> arrayList, boolean z) {
        if (arrayList != null && arrayList.size() != 0) {
            NormalPeopleFaceMediaSet normalPeopleFaceMediaSet = new NormalPeopleFaceMediaSet(this.mLocalIdOfAlbum.longValue(), this.mServerIdOfAlbum, "");
            PeopleRecommendMediaSet.refreshRecommendHistoryToTrue(arrayList, normalPeopleFaceMediaSet);
            if (z) {
                PeopleRecommendMediaSet.addSelectItemsToRecommendedMediaSet(arrayList, normalPeopleFaceMediaSet);
                HashMap hashMap = new HashMap(1);
                hashMap.put("count", String.valueOf(arrayList.size()));
                GallerySamplingStatHelper.recordCountEvent("face", "face_confirm_recommend_face", hashMap);
            } else {
                PeopleRecommendMediaSet.feedbackIgnoredPeople2Server(arrayList, normalPeopleFaceMediaSet);
            }
        }
    }

    private Uri getDownloadUri(Cursor cursor, int i) {
        return CloudUriAdapter.getDownloadUri(cursor.getLong(i));
    }

    /* access modifiers changed from: private */
    public void gotoRecommendCoverPage(String str, ItemViewInfo itemViewInfo, String str2, long j, long j2) {
        ImageLoadParams imageLoadParams = new ImageLoadParams(j, str, ThumbConfig.get().sMicroTargetSize, (RectF) null, 0, (String) null, true, j2);
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(itemViewInfo);
        BaseMediaFragment baseMediaFragment = this.mFragment;
        Uri uri = PeopleFace.RECOMMEND_FACES_OF_ONE_PERSON_URI;
        StringBuilder sb = new StringBuilder();
        sb.append("'");
        sb.append(str2);
        sb.append("'");
        String[] strArr = {sb.toString()};
        IntentUtil.gotoPhotoPage(baseMediaFragment, null, uri, 0, 1, null, strArr, "dateTaken DESC ", imageLoadParams, null, true, str2, arrayList, true);
        GallerySamplingStatHelper.recordCountEvent("face", "face_click_recommend_face");
    }

    private void initDisplayOptions() {
        this.mDisplayImageOptionsBuilder = new Builder().cacheThumbnail(true).loadFromMicroCache(true).cacheInMemory(true).considerExifParams(true).showStubImage(R.drawable.default_face_cover).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(true)).usingRegionDecoderFace(true);
    }

    /* access modifiers changed from: private */
    public void recommendCheckStatusChanged(String str, boolean z) {
        if (z) {
            this.mConfirmToWrong.remove(str);
            this.mConfirmToRight.add(str);
        } else {
            this.mConfirmToWrong.add(str);
            this.mConfirmToRight.remove(str);
        }
        if (this.mConfirmToWrong.size() != this.mVisibleItemCount) {
            return;
        }
        if (this.mFragment instanceof FacePageFragment) {
            ((FacePageFragment) this.mFragment).changeToNextPage();
        } else {
            ((RecommendFacePageFragment) this.mFragment).changeToNextPage();
        }
    }

    public void bindData(int i, View view) {
        Cursor cursorByPosition = getCursorByPosition(i);
        String string = cursorByPosition.getString(10);
        long j = cursorByPosition.getLong(11);
        long j2 = cursorByPosition.getLong(12);
        this.mConfirmToRight.add(string);
        RecommendFaceItem recommendFaceItem = (RecommendFaceItem) view.getTag();
        recommendFaceItem.setChecked(true);
        recommendFaceItem.setServerId(string);
        recommendFaceItem.setCloudId(j);
        recommendFaceItem.setFileLength(j2);
        DownloadType downloadType = DownloadType.THUMBNAIL;
        String string2 = cursorByPosition.getString(3);
        if (TextUtils.isEmpty(string2)) {
            string2 = cursorByPosition.getString(4);
        }
        if (TextUtils.isEmpty(string2)) {
            downloadType = DownloadType.MICRO;
            string2 = cursorByPosition.getString(2);
        }
        recommendFaceItem.setFacePath(string2);
        if (TextUtils.isEmpty(string2)) {
            downloadType = DownloadType.MICRO;
            string2 = StorageUtils.getPriorMicroThumbnailPath(cursorByPosition.getString(1));
        }
        DownloadType downloadType2 = downloadType;
        String str = string2;
        DisplayImageOptions build = j2 > 0 ? this.mDisplayImageOptionsBuilder.considerFileLength(true).fileLength(j2).build() : this.mDisplayImageOptionsBuilder.considerFileLength(false).build();
        Uri downloadUri = getDownloadUri(cursorByPosition, 11);
        FaceRegionRectF faceRegionRectF = new FaceRegionRectF(cursorByPosition.getFloat(5), cursorByPosition.getFloat(6), cursorByPosition.getFloat(7) + cursorByPosition.getFloat(5), cursorByPosition.getFloat(6) + cursorByPosition.getFloat(8), cursorByPosition.getInt(9));
        recommendFaceItem.bindImage(str, downloadUri, build, faceRegionRectF, downloadType2);
        this.mVisibleItemCount++;
    }

    public void confirmRecommends(final ArrayList<String> arrayList, final ArrayList<String> arrayList2) {
        ThreadManager.getMiscPool().submit(new Job<Object>() {
            public Object run(JobContext jobContext) {
                RecommendFaceGroupAdapter.this.confirmFace(arrayList, true);
                RecommendFaceGroupAdapter.this.confirmFace(arrayList2, false);
                return null;
            }
        });
    }

    public void freshView(View view) {
        RecommendFaceItem recommendFaceItem = (RecommendFaceItem) view.getTag();
        recommendFaceItem.needToFresh(recommendFaceItem.mFileLength > 0 ? this.mDisplayImageOptionsBuilder.considerFileLength(true).fileLength(recommendFaceItem.mFileLength).build() : this.mDisplayImageOptionsBuilder.considerFileLength(false).build());
    }

    public int getCount() {
        if (this.mCursor == null) {
            return 0;
        }
        return this.mCursor.getCount();
    }

    /* access modifiers changed from: protected */
    public Cursor getCursorByPosition(int i) {
        this.mCursor.moveToPosition(i);
        return this.mCursor;
    }

    /* access modifiers changed from: protected */
    public abstract int getLayoutId();

    public int getMergeFaceCount() {
        if (this.mConfirmToRight == null) {
            return 0;
        }
        return this.mConfirmToRight.size();
    }

    public View getView(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        View inflate = layoutInflater.inflate(getLayoutId(), viewGroup, false);
        inflate.setTag(new RecommendFaceItem(inflate));
        return inflate;
    }

    public void onPageChanged() {
        confirmRecommends(new ArrayList(this.mConfirmToRight), new ArrayList(this.mConfirmToWrong));
        this.mConfirmToWrong.clear();
        this.mConfirmToRight.clear();
        this.mVisibleItemCount = 0;
    }

    public void setOnLoadingCompleteListener(OnImageLoadingCompleteListener onImageLoadingCompleteListener) {
        this.mLoadingCompleteListener = onImageLoadingCompleteListener;
        if (onImageLoadingCompleteListener != null) {
            this.mCloudLoadingListener = new CloudImageLoadingListener() {
                public void onDownloadComplete(Uri uri, DownloadType downloadType, View view, String str) {
                }

                public void onLoadingCancelled(Uri uri, DownloadType downloadType, View view) {
                }

                public void onLoadingComplete(Uri uri, DownloadType downloadType, View view, Bitmap bitmap) {
                    if (RecommendFaceGroupAdapter.this.mLoadingCompleteListener != null) {
                        RecommendFaceGroupAdapter.this.mLoadingCompleteListener.onLoadingComplete();
                    }
                }

                public void onLoadingFailed(Uri uri, DownloadType downloadType, View view, ErrorCode errorCode) {
                    if (RecommendFaceGroupAdapter.this.mLoadingCompleteListener != null) {
                        RecommendFaceGroupAdapter.this.mLoadingCompleteListener.onLoadingFailed();
                    }
                }

                public void onLoadingStarted(Uri uri, DownloadType downloadType, View view) {
                }
            };
        } else {
            this.mCloudLoadingListener = null;
        }
    }

    public Cursor swapCursor(Cursor cursor) {
        if (cursor == this.mCursor) {
            return null;
        }
        Cursor cursor2 = this.mCursor;
        this.mCursor = cursor;
        return cursor2;
    }
}
