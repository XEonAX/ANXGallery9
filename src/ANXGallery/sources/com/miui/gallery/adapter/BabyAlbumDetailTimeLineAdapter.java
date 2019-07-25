package com.miui.gallery.adapter;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.deprecated.ThumbnailInfo;
import com.miui.gallery.share.AlbumShareOperations;
import com.miui.gallery.share.AlbumShareOperations.SharerInfo;
import com.miui.gallery.share.AlbumShareUIManager;
import com.miui.gallery.share.AlbumShareUIManager.OnCompletionListener;
import com.miui.gallery.share.Path;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.BabyAlbumDetailFaceHeaderItem;
import com.miui.gallery.ui.BabyAlbumDetailGridHeaderItem;
import com.miui.gallery.util.CropUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.baby.FindFace2CreateBabyAlbum;

public class BabyAlbumDetailTimeLineAdapter extends AlbumDetailTimeLineAdapter {
    /* access modifiers changed from: private */
    public FaceHeaderHelper mFaceHeaderHelper = new FaceHeaderHelper();

    class FaceHeaderHelper {
        /* access modifiers changed from: private */
        public String TAG = "FaceHeaderHelper";
        /* access modifiers changed from: private */
        public long mBabyAlbumLocalId;
        /* access modifiers changed from: private */
        public String mBabyAlbumPeopleServerId;
        /* access modifiers changed from: private */
        public BabyInfo mBabyInfo;
        private int mBirthdayDay;
        private int mBirthdayMonth;
        private int mBirthdayYear;
        BabyAlbumDetailFaceHeaderItem mFaceHeaderItem;
        /* access modifiers changed from: private */
        public String mSharerInfoStr;
        /* access modifiers changed from: private */
        public ThumbnailInfo mThumbnailInfo;

        FaceHeaderHelper() {
        }

        /* access modifiers changed from: private */
        public void bindBackgroundByCursor(Cursor cursor) {
            if (cursor != null && !cursor.isAfterLast()) {
                String string = cursor.getString(1);
                String string2 = cursor.getString(2);
                String string3 = cursor.getString(14);
                if (!TextUtils.isEmpty(string2)) {
                    string = string2;
                } else if (!TextUtils.isEmpty(string3)) {
                    string = string3;
                }
                setBackgroundByPathOrUri(string, BaseAdapter.getDownloadUri(cursor, 12, 0));
            }
        }

        /* access modifiers changed from: private */
        public boolean bindBackgroundByThumbnail() {
            if (this.mThumbnailInfo != null) {
                String bgPath = this.mThumbnailInfo.getBgPath();
                if (!TextUtils.isEmpty(bgPath)) {
                    setBackgroundByPathOrUri(bgPath, null);
                    return true;
                }
            }
            return false;
        }

        /* access modifiers changed from: private */
        public void bindBackgroundPicByPath(String str) {
            setBackgroundByPathOrUri(str, null);
        }

        /* access modifiers changed from: private */
        public void bindFaceImageFromPath(String str, ThumbnailInfo thumbnailInfo) {
            if (thumbnailInfo.getFaceRegion() != null) {
                this.mFaceHeaderItem.bindHeadFacePic(str, thumbnailInfo.getFaceRegion());
            } else {
                this.mFaceHeaderItem.bindHeadFacePicFromNet(str, thumbnailInfo.getFaceRegionFromFaceInfo());
            }
        }

        /* access modifiers changed from: private */
        public String getAge(long j) {
            StringBuilder sb;
            String str;
            String country = GalleryApp.sGetAndroidContext().getResources().getConfiguration().locale.getCountry();
            if ((!"cn".equalsIgnoreCase(country) && !"en".equalsIgnoreCase(country) && !"us".equalsIgnoreCase(country)) || this.mBirthdayDay == 0) {
                return "";
            }
            int[] age = BabyInfo.getAge(j, this.mBirthdayYear, this.mBirthdayMonth, this.mBirthdayDay);
            int i = age[0];
            if (i < 0) {
                return "";
            }
            int i2 = age[1];
            int i3 = age[2];
            String str2 = null;
            if (!"cn".equalsIgnoreCase(country)) {
                Resources resources = GalleryApp.sGetAndroidContext().getResources();
                String quantityString = resources.getQuantityString(R.plurals.age_year, i, new Object[]{Integer.valueOf(i)});
                String quantityString2 = resources.getQuantityString(R.plurals.age_day, i3, new Object[]{Integer.valueOf(i3)});
                String quantityString3 = resources.getQuantityString(R.plurals.age_month, i2, new Object[]{Integer.valueOf(i2)});
                String str3 = " ";
                if (i != 0 && i2 != 0 && i3 != 0) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(quantityString);
                    sb2.append(str3);
                    sb2.append(quantityString3);
                    sb2.append(str3);
                    sb2.append(quantityString2);
                    str2 = sb2.toString();
                } else if (i != 0 && i2 != 0 && i3 == 0) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(quantityString);
                    sb3.append(str3);
                    sb3.append(quantityString3);
                    str2 = sb3.toString();
                } else if (i != 0 && i2 == 0 && i3 == 0) {
                    str2 = quantityString;
                } else if (i == 0 && i2 == 0 && i3 != 0) {
                    if (i3 == 0) {
                        sb = new StringBuilder();
                        sb.append(i3 + 1);
                        str = " day";
                    } else {
                        sb = new StringBuilder();
                        sb.append(i3 + 1);
                        str = " days";
                    }
                    sb.append(str);
                    str2 = sb.toString();
                } else if (i == 0 && i2 != 0 && i3 == 0) {
                    str2 = quantityString3;
                } else if (i != 0 && i2 == 0 && i3 != 0) {
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append(quantityString);
                    sb4.append(str3);
                    sb4.append(quantityString2);
                    str2 = sb4.toString();
                } else if (i == 0 && i2 != 0 && i3 != 0) {
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append(quantityString3);
                    sb5.append(str3);
                    sb5.append(quantityString2);
                    str2 = sb5.toString();
                } else if (i == 0 && i2 == 0 && i3 == 0) {
                    str2 = " first day";
                }
            } else if (i != 0 && i2 != 0 && i3 != 0) {
                StringBuilder sb6 = new StringBuilder();
                sb6.append(i);
                sb6.append("岁");
                sb6.append(i2);
                sb6.append("个月");
                sb6.append(i3);
                sb6.append("天");
                str2 = sb6.toString();
            } else if (i != 0 && i2 != 0 && i3 == 0) {
                StringBuilder sb7 = new StringBuilder();
                sb7.append(i);
                sb7.append("岁");
                sb7.append(i2);
                sb7.append("个月");
                str2 = sb7.toString();
            } else if (i != 0 && i2 == 0 && i3 == 0) {
                StringBuilder sb8 = new StringBuilder();
                sb8.append(i);
                sb8.append("岁生日");
                str2 = sb8.toString();
            } else if (i == 0 && i2 == 0 && i3 != 0) {
                StringBuilder sb9 = new StringBuilder();
                sb9.append("第");
                sb9.append(i3 + 1);
                sb9.append("天");
                str2 = sb9.toString();
            } else if (i == 0 && i2 != 0 && i3 == 0) {
                StringBuilder sb10 = new StringBuilder();
                sb10.append(i2);
                sb10.append("个月");
                str2 = sb10.toString();
            } else if (i != 0 && i2 == 0 && i3 != 0) {
                StringBuilder sb11 = new StringBuilder();
                sb11.append(i);
                sb11.append("岁零");
                sb11.append(i3);
                sb11.append("天");
                str2 = sb11.toString();
            } else if (i == 0 && i2 != 0 && i3 != 0) {
                StringBuilder sb12 = new StringBuilder();
                sb12.append(i2);
                sb12.append("个月");
                sb12.append(i3);
                sb12.append("天");
                str2 = sb12.toString();
            } else if (i == 0 && i2 == 0 && i3 == 0) {
                str2 = "出生第一天";
            }
            return str2;
        }

        /* access modifiers changed from: private */
        public void gotoBabyInfoSettingPage(boolean z) {
            FindFace2CreateBabyAlbum.gotoBabyAlbumInfoPage((Activity) BabyAlbumDetailTimeLineAdapter.this.mContext, this.mThumbnailInfo, this.mBabyInfo, this.mBabyAlbumLocalId, CropUtil.circleBitmap(getFaceImage()), z);
        }

        private void setBackgroundByPathOrUri(String str, Uri uri) {
            BabyAlbumDetailTimeLineAdapter.this.mFaceHeaderHelper.mFaceHeaderItem.bindHeaderBackgroundPic(str, uri, BabyAlbumDetailTimeLineAdapter.this.mDisplayImageOptionBuilder.loadFromMicroCache(false).build());
        }

        /* access modifiers changed from: private */
        public void setBirthday() {
            String age = getAge(System.currentTimeMillis());
            if (!TextUtils.isEmpty(age)) {
                this.mFaceHeaderItem.setAge(age);
            }
        }

        /* access modifiers changed from: private */
        public void setBirthdayYearMonthDay() {
            int[] splitBirthDay = BabyInfo.splitBirthDay(this.mBabyInfo);
            if (splitBirthDay != null) {
                this.mBirthdayYear = splitBirthDay[0];
                this.mBirthdayMonth = splitBirthDay[1];
                this.mBirthdayDay = splitBirthDay[2];
            }
        }

        /* access modifiers changed from: private */
        public void setFaceImageFromByFirstGetSharerInfo() {
            AlbumShareUIManager.updateInvitationAsync(new Path(this.mBabyAlbumLocalId, true, true), new OnCompletionListener<Path, String>() {
                public void onCompletion(Path path, String str, int i, boolean z) {
                    if (z) {
                        Log.i(FaceHeaderHelper.this.TAG, "updateInvitationAsync cancelled");
                    } else if (i == 0) {
                        ThreadManager.getMiscPool().submit(new Job<String>() {
                            public String run(JobContext jobContext) {
                                return FaceManager.querySharerInfoOfBabyAlbum(String.valueOf(FaceHeaderHelper.this.mBabyAlbumLocalId));
                            }
                        }, new FutureListener<String>() {
                            public void onFutureDone(Future<String> future) {
                                final String str = (String) future.get();
                                if (!TextUtils.isEmpty(str)) {
                                    ThreadManager.getMainHandler().post(new Runnable() {
                                        public void run() {
                                            FaceHeaderHelper.this.setFaceImageFromSharerInfo(str);
                                        }
                                    });
                                }
                            }
                        });
                    } else {
                        String access$1600 = FaceHeaderHelper.this.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("updateInvitationAsync error, errorCode=");
                        sb.append(i);
                        Log.i(access$1600, sb.toString());
                    }
                }
            });
        }

        /* access modifiers changed from: private */
        public void setFaceImageFromFaceAlbumCover(String str) {
            RectF[] rectFArr = new RectF[1];
            this.mFaceHeaderItem.bindHeadFacePic(FaceManager.queryCoverImageOfOnePerson(str, rectFArr), rectFArr[0]);
        }

        /* access modifiers changed from: private */
        public void setFaceImageFromSharerInfo(String str) {
            if (!TextUtils.isEmpty(str)) {
                SharerInfo parseSharerInfo = AlbumShareOperations.parseSharerInfo(str);
                if (parseSharerInfo == null || TextUtils.isEmpty(parseSharerInfo.mThumbnailUrl)) {
                    String str2 = this.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("illegal SharerInfo: ");
                    sb.append(str);
                    Log.e(str2, sb.toString());
                } else if (!TextUtils.isEmpty(parseSharerInfo.mThumbnailUrl)) {
                    this.mFaceHeaderItem.bindHeadFacePicFromNet(parseSharerInfo.mThumbnailUrl, parseSharerInfo.mFaceRelativePos);
                }
            }
        }

        /* access modifiers changed from: protected */
        public Bitmap getFaceImage() {
            return this.mFaceHeaderItem.getHeadFacePic();
        }

        /* access modifiers changed from: protected */
        public void setFaceImage() {
            final ThumbnailInfo thumbnailInfo = this.mThumbnailInfo;
            if (!BabyAlbumDetailTimeLineAdapter.this.isOtherShareAlbum()) {
                if (thumbnailInfo != null) {
                    ThreadManager.getMiscPool().submit(new Job<String>() {
                        public String run(JobContext jobContext) {
                            return thumbnailInfo.getFaceInfo(BabyAlbumDetailTimeLineAdapter.this.isOtherShareAlbum());
                        }
                    }, new FutureListener<String>() {
                        public void onFutureDone(Future<String> future) {
                            final String str = (String) future.get();
                            ThreadManager.getMainHandler().post(new Runnable() {
                                public void run() {
                                    if (TextUtils.isEmpty(str)) {
                                        FaceHeaderHelper.this.setFaceImageFromFaceAlbumCover(FaceHeaderHelper.this.mBabyAlbumPeopleServerId);
                                    } else {
                                        FaceHeaderHelper.this.bindFaceImageFromPath(str, thumbnailInfo);
                                    }
                                }
                            });
                        }
                    });
                } else {
                    setFaceImageFromFaceAlbumCover(this.mBabyAlbumPeopleServerId);
                }
            } else if (!TextUtils.isEmpty(this.mBabyAlbumPeopleServerId)) {
                setFaceImageFromFaceAlbumCover(this.mBabyAlbumPeopleServerId);
            } else {
                ThreadManager.getMiscPool().submit(new Job<String>() {
                    public String run(JobContext jobContext) {
                        return thumbnailInfo.getFaceInfo(BabyAlbumDetailTimeLineAdapter.this.isOtherShareAlbum());
                    }
                }, new FutureListener<String>() {
                    public void onFutureDone(Future<String> future) {
                        final String str = (String) future.get();
                        ThreadManager.getMainHandler().post(new Runnable() {
                            public void run() {
                                if (!TextUtils.isEmpty(str)) {
                                    FaceHeaderHelper.this.bindFaceImageFromPath(str, thumbnailInfo);
                                } else if (!TextUtils.isEmpty(FaceHeaderHelper.this.mSharerInfoStr)) {
                                    FaceHeaderHelper.this.setFaceImageFromSharerInfo(FaceHeaderHelper.this.mSharerInfoStr);
                                } else {
                                    FaceHeaderHelper.this.setFaceImageFromByFirstGetSharerInfo();
                                }
                            }
                        });
                    }
                });
            }
        }
    }

    public BabyAlbumDetailTimeLineAdapter(Context context) {
        super(context);
    }

    private void setBabyInfoAndThumbnailInfo(BabyInfo babyInfo, ThumbnailInfo thumbnailInfo, String str) {
        if (babyInfo != null) {
            this.mFaceHeaderHelper.mBabyInfo = babyInfo;
        }
        if (thumbnailInfo != null) {
            this.mFaceHeaderHelper.mThumbnailInfo = thumbnailInfo;
        }
        if (!TextUtils.isEmpty(str)) {
            this.mFaceHeaderHelper.mSharerInfoStr = str;
        }
        this.mFaceHeaderHelper.setBirthdayYearMonthDay();
    }

    public void firstBindHeaderPic(Cursor cursor) {
        if (!this.mFaceHeaderHelper.bindBackgroundByThumbnail()) {
            this.mFaceHeaderHelper.bindBackgroundByCursor(cursor);
        }
    }

    public Bitmap getFaceImageOfFaceHeaderItem() {
        int dimension = (int) this.mContext.getResources().getDimension(R.dimen.baby_timeline_quick_start_icon_size);
        return CropUtil.cropImage(this.mFaceHeaderHelper.getFaceImage(), dimension, dimension, false);
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.baby_album_detail_grid_header_item, viewGroup, false);
        }
        String str = null;
        if (!(this.mGroupStartLocations == null || this.mGroupStartPos == null)) {
            str = (String) this.mGroupStartLocations.get(i);
            i = ((Integer) this.mGroupStartPos.get(i)).intValue();
        }
        long j = ((Cursor) getItem(i)).getLong(5);
        ((BabyAlbumDetailGridHeaderItem) view).bindData(j, str, this.mFaceHeaderHelper.getAge(j));
        return view;
    }

    public void gotoBabyInfoSettingPage(boolean z) {
        this.mFaceHeaderHelper.gotoBabyInfoSettingPage(z);
    }

    public void rebindHeaderPic(String str) {
        this.mFaceHeaderHelper.bindBackgroundPicByPath(str);
    }

    public void resetBabyInfoAndThumbnailInfo(BabyInfo babyInfo, ThumbnailInfo thumbnailInfo) {
        setBabyInfoAndThumbnailInfo(babyInfo, thumbnailInfo, null);
        this.mFaceHeaderHelper.setFaceImage();
        this.mFaceHeaderHelper.setBirthday();
        notifyDataSetChanged();
    }

    public void setAlbumId(long j) {
        this.mFaceHeaderHelper.mBabyAlbumLocalId = j;
    }

    public void setFaceHeader(BabyInfo babyInfo, ThumbnailInfo thumbnailInfo, String str, BabyAlbumDetailFaceHeaderItem babyAlbumDetailFaceHeaderItem, View view, OnClickListener onClickListener, final boolean z) {
        setBabyInfoAndThumbnailInfo(babyInfo, thumbnailInfo, str);
        this.mFaceHeaderHelper.mFaceHeaderItem = babyAlbumDetailFaceHeaderItem;
        this.mFaceHeaderHelper.setFaceImage();
        this.mFaceHeaderHelper.setBirthday();
        this.mFaceHeaderHelper.mFaceHeaderItem.setOnFaceClickListener(new OnClickListener() {
            public void onClick(View view) {
                BabyAlbumDetailTimeLineAdapter.this.gotoBabyInfoSettingPage(z);
                GallerySamplingStatHelper.recordCountEvent("baby", "baby_edit_baby_info");
            }
        });
        this.mFaceHeaderHelper.mFaceHeaderItem.setOnBackgroundClickListener(onClickListener);
    }

    public void setPeopleServerId(String str) {
        this.mFaceHeaderHelper.mBabyAlbumPeopleServerId = str;
    }
}
