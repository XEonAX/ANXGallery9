package com.miui.gallery.ui;

import android.app.Fragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.AsyncTaskLoader;
import android.content.Context;
import android.content.Intent;
import android.content.Loader;
import android.location.Address;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.data.LocationUtil;
import com.miui.gallery.data.ReverseGeocoder;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.PhotoDetailInfo;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.privacy.LockSettingsHelper;
import java.util.Locale;
import miui.date.DateUtils;

public class PhotoDetailFragment extends BaseFragment {
    private Future<Address> mAddressFuture;
    private OnClickListener mClickListener = new OnClickListener() {
        /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r7v9, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r0v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 38
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 3 */
        public void onClick(View view) {
            if (PhotoDetailFragment.this.mDetailInfo != null) {
                int id = view.getId();
                if (id == R.id.location_title) {
                    Object detail = PhotoDetailFragment.this.mDetailInfo.getDetail(6);
                    if (detail != null) {
                        double[] dArr = (double[]) detail;
                        if (LocationUtil.isValidateCoordinate(dArr[0], dArr[1]) && !IntentUtil.showOnMap(PhotoDetailFragment.this.mActivity, dArr[0], dArr[1])) {
                            ToastUtils.makeText((Context) PhotoDetailFragment.this.mActivity, (int) R.string.no_map_app);
                        }
                        GallerySamplingStatHelper.recordCountEvent("photo_detail", "show_on_map");
                    }
                } else if (id == R.id.path_title) {
                    Object detail2 = PhotoDetailFragment.this.mDetailInfo.getDetail(200);
                    if (detail2 != null) {
                        IntentUtil.jumpToExplore(PhotoDetailFragment.this.mActivity, FileUtils.getParentFolderPath((String) detail2));
                    }
                }
            }
        }
    };
    private View mContentContainer;
    /* access modifiers changed from: private */
    public PhotoDetailInfo mDetailInfo;
    private View mFileInfoItem;
    private TextView mFileInfoSub;
    private TextView mFileInfoTitle;
    /* access modifiers changed from: private */
    public BaseDataItem mItem;
    private DetailLoaderCallBack mLoaderCallBack;
    /* access modifiers changed from: private */
    public TextView mLocation;
    private View mLocationItem;
    private boolean mNeedConfirmPassword;
    private View mParamsItem;
    private TextView mPath;
    private View mPathItem;
    private ProgressBar mProgress;
    private TextView mScreenshotPackageInfo;
    private View mScreenshotPackageItem;
    private TextView mTakenParamsSub;
    private TextView mTakenParamsThird;
    private TextView mTakenParamsTitle;
    private View mTimeItem;
    private TextView mTimeSub;
    private TextView mTimeTitle;
    private TextView mTipNoDownload;

    private static class DetailLoader extends AsyncTaskLoader<PhotoDetailInfo> {
        private BaseDataItem mDataItem;
        private PhotoDetailInfo mDetailInfo;

        public DetailLoader(Context context, BaseDataItem baseDataItem) {
            super(context);
            this.mDataItem = baseDataItem;
        }

        public PhotoDetailInfo loadInBackground() {
            if (this.mDataItem != null) {
                this.mDetailInfo = this.mDataItem.getDetailInfo(getContext());
                Object detail = this.mDetailInfo.getDetail(200);
                if (detail != null) {
                    String str = (String) detail;
                    this.mDetailInfo.addDetail(201, StorageUtils.getPathForDisplay(getContext(), str));
                    this.mDetailInfo.addDetail(BaiduSceneResult.CHURCH, Boolean.valueOf(StorageUtils.isInExternalStorage(getContext(), str)));
                }
            }
            return this.mDetailInfo;
        }

        /* access modifiers changed from: protected */
        public final void onReset() {
            super.onReset();
            onStopLoading();
            if (this.mDetailInfo != null) {
                this.mDetailInfo = null;
            }
        }

        /* access modifiers changed from: protected */
        public final void onStartLoading() {
            if (this.mDetailInfo != null) {
                deliverResult(this.mDetailInfo);
            }
            if (takeContentChanged() || this.mDetailInfo == null) {
                forceLoad();
            }
        }

        /* access modifiers changed from: protected */
        public final void onStopLoading() {
            cancelLoad();
        }
    }

    private class DetailLoaderCallBack implements LoaderCallbacks {
        private DetailLoaderCallBack() {
        }

        /* JADX WARNING: type inference failed for: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 6
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            return new DetailLoader(PhotoDetailFragment.this.mActivity, PhotoDetailFragment.this.mItem);
        }

        public void onLoadFinished(Loader loader, Object obj) {
            if (obj != null) {
                PhotoDetailFragment.this.mDetailInfo = (PhotoDetailInfo) obj;
                PhotoDetailFragment.this.bindDetail(PhotoDetailFragment.this.mDetailInfo);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    public static class FlashState {
        private static int FLASH_FIRED_MASK = 1;
        private static int FLASH_FUNCTION_MASK = 32;
        private static int FLASH_MODE_MASK = 24;
        private static int FLASH_RED_EYE_MASK = 64;
        private static int FLASH_RETURN_MASK = 6;
        private int mState;

        public FlashState(int i) {
            this.mState = i;
        }

        public boolean isFlashFired() {
            return (this.mState & FLASH_FIRED_MASK) != 0;
        }
    }

    /* access modifiers changed from: private */
    public void bindDetail(PhotoDetailInfo photoDetailInfo) {
        try {
            bindTime(photoDetailInfo);
            bindFileInfo(photoDetailInfo);
            bindNotDownloadTip(photoDetailInfo);
            bindTakenParams(photoDetailInfo);
            bindPath(photoDetailInfo);
            bindLocation(photoDetailInfo);
            bindScreenshotPackageInfo(photoDetailInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.mContentContainer.setVisibility(0);
        this.mProgress.setVisibility(8);
    }

    /* JADX WARNING: type inference failed for: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r5v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 46
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 2 */
    private void bindFileInfo(PhotoDetailInfo photoDetailInfo) {
        boolean z;
        Object detail = photoDetailInfo.getDetail(2);
        if (detail != null) {
            this.mFileInfoTitle.setText((String) detail);
            z = true;
        } else {
            z = false;
        }
        StringBuilder sb = new StringBuilder();
        Object detail2 = photoDetailInfo.getDetail(3);
        if (detail2 != null) {
            sb.append(FormatUtil.formatFileSize(this.mActivity, ((Long) detail2).longValue()));
            sb.append("    ");
        }
        Object detail3 = photoDetailInfo.getDetail(4);
        Object detail4 = photoDetailInfo.getDetail(5);
        Object detail5 = photoDetailInfo.getDetail(10);
        if (!(detail3 == null || detail4 == null)) {
            sb.append(genPixels(detail3, detail4, detail5));
            sb.append("    ");
        }
        Object detail6 = photoDetailInfo.getDetail(7);
        if (detail6 != null) {
            sb.append(FormatUtil.formatDuration(this.mActivity, ((Integer) detail6).intValue()));
        }
        if (sb.length() > 0) {
            this.mFileInfoSub.setText(sb.toString());
            setItemVisible(this.mFileInfoSub, true);
            z = true;
        } else {
            setItemVisible(this.mFileInfoSub, false);
        }
        setItemVisible(this.mFileInfoItem, z);
    }

    private void bindLocation(PhotoDetailInfo photoDetailInfo) {
        Object detail = photoDetailInfo.getDetail(6);
        if (detail != null) {
            double[] dArr = (double[]) detail;
            String genLocation = genLocation(dArr);
            if (!TextUtils.isEmpty(genLocation)) {
                this.mLocation.setText(genLocation);
                setItemVisible(this.mLocationItem, true);
                requestAddress(dArr[0], dArr[1]);
                return;
            }
            setItemVisible(this.mLocationItem, false);
            return;
        }
        setItemVisible(this.mLocationItem, false);
    }

    private void bindNotDownloadTip(PhotoDetailInfo photoDetailInfo) {
        Object detail = photoDetailInfo.getDetail(8);
        if (detail != null) {
            this.mTipNoDownload.setText((String) detail);
            setItemVisible(this.mTipNoDownload, true);
            return;
        }
        setItemVisible(this.mTipNoDownload, false);
    }

    private void bindPath(PhotoDetailInfo photoDetailInfo) {
        OnClickListener onClickListener;
        int i;
        Object detail = photoDetailInfo.getDetail(201);
        if (detail != null) {
            this.mPath.setText((String) detail);
            setItemVisible(this.mPathItem, true);
            Object detail2 = photoDetailInfo.getDetail(BaiduSceneResult.CHURCH);
            if (detail2 != null && ((Boolean) detail2).booleanValue()) {
                onClickListener = this.mClickListener;
                i = R.color.info_highlight_color;
                this.mPath.setOnClickListener(onClickListener);
                this.mPath.setTextColor(getResources().getColor(i));
            }
        } else {
            setItemVisible(this.mPathItem, false);
        }
        onClickListener = null;
        i = R.color.info_title_color;
        this.mPath.setOnClickListener(onClickListener);
        this.mPath.setTextColor(getResources().getColor(i));
    }

    private void bindScreenshotPackageInfo(PhotoDetailInfo photoDetailInfo) {
        String str = (String) photoDetailInfo.getDetail(9);
        if (TextUtils.isEmpty(str) || this.mItem == null) {
            setItemVisible(this.mScreenshotPackageItem, false);
            return;
        }
        Object detail = photoDetailInfo.getDetail(2);
        if (this.mItem.getLocalGroupId() != 2 || detail == null || !((String) detail).startsWith("Screenshot")) {
            setItemVisible(this.mScreenshotPackageItem, false);
            return;
        }
        this.mScreenshotPackageInfo.setText(str);
        setItemVisible(this.mScreenshotPackageItem, true);
    }

    private void bindTakenParams(PhotoDetailInfo photoDetailInfo) {
        StringBuilder sb = new StringBuilder();
        Object detail = photoDetailInfo.getDetail(BaiduSceneResult.SHOOTING);
        if (detail != null) {
            sb.append(detail);
        }
        Object detail2 = photoDetailInfo.getDetail(100);
        if (detail2 != null) {
            sb.append(", ");
            sb.append(detail2);
        }
        if (sb.length() > 0) {
            this.mTakenParamsTitle.setText(sb.toString());
            sb.setLength(0);
            Object detail3 = photoDetailInfo.getDetail(BaiduSceneResult.TEMPLE);
            if (detail3 != null) {
                sb.append(genAperture((String) detail3));
                sb.append("    ");
            }
            Object detail4 = photoDetailInfo.getDetail(BaiduSceneResult.GARDEN);
            if (detail4 != null) {
                sb.append(genExposureTime((String) detail4));
                sb.append("    ");
            }
            Object detail5 = photoDetailInfo.getDetail(BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE);
            if (detail5 != null) {
                sb.append(genISO(detail5));
            }
            if (sb.length() > 0) {
                this.mTakenParamsSub.setText(sb.toString());
                setItemVisible(this.mTakenParamsSub, true);
            } else {
                setItemVisible(this.mTakenParamsSub, false);
            }
            sb.setLength(0);
            Object detail6 = photoDetailInfo.getDetail(BaiduSceneResult.MOUNTAINEERING);
            if (detail6 != null) {
                sb.append(genFocalLength(detail6));
                sb.append("    ");
            }
            Object detail7 = photoDetailInfo.getDetail(BaiduSceneResult.TAEKWONDO);
            if (detail7 != null) {
                sb.append(genFlashFired(Integer.parseInt((String) detail7)));
            }
            if (sb.length() > 0) {
                this.mTakenParamsThird.setText(sb.toString());
                setItemVisible(this.mTakenParamsThird, true);
            } else {
                setItemVisible(this.mTakenParamsThird, false);
            }
            setItemVisible(this.mParamsItem, true);
            return;
        }
        setItemVisible(this.mParamsItem, false);
    }

    private void bindTime(PhotoDetailInfo photoDetailInfo) {
        Object detail = photoDetailInfo.getDetail(1);
        if (detail != null) {
            long longValue = ((Long) detail).longValue();
            this.mTimeTitle.setText(DateUtils.formatDateTime(longValue, 896));
            StringBuilder sb = new StringBuilder();
            sb.append(DateUtils.formatDateTime(longValue, 1024));
            sb.append("    ");
            sb.append(DateUtils.formatDateTime(longValue, 44));
            this.mTimeSub.setText(sb.toString());
            setItemVisible(this.mTimeItem, true);
            return;
        }
        setItemVisible(this.mTimeItem, false);
    }

    private void cancelAddressRequest() {
        if (this.mAddressFuture != null) {
            this.mAddressFuture.cancel();
            this.mAddressFuture = null;
        }
    }

    private void finishActivity(int i) {
        getActivity().setResult(i);
        getActivity().finish();
    }

    private String genAperture(String str) {
        String replaceAll = str.replaceAll("0+?$", "");
        if (replaceAll.endsWith(".")) {
            StringBuilder sb = new StringBuilder();
            sb.append(replaceAll);
            sb.append(MovieStatUtils.DOWNLOAD_SUCCESS);
            replaceAll = sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("f/");
        sb2.append(replaceAll);
        return sb2.toString();
    }

    private String genExposureTime(String str) {
        String str2;
        try {
            double doubleValue = Double.valueOf(str).doubleValue();
            if (doubleValue < 1.0d) {
                str2 = String.format(Locale.US, "1/%d", new Object[]{Long.valueOf(Math.round(1.0d / doubleValue))});
            } else {
                int i = (int) doubleValue;
                double d = (double) i;
                Double.isNaN(d);
                double d2 = doubleValue - d;
                StringBuilder sb = new StringBuilder();
                sb.append(String.valueOf(i));
                sb.append("''");
                String sb2 = sb.toString();
                if (d2 > 1.0E-4d) {
                    try {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(sb2);
                        sb3.append(String.format(Locale.US, " 1/%d", new Object[]{Long.valueOf(Math.round(1.0d / d2))}));
                        str2 = sb3.toString();
                    } catch (NumberFormatException e) {
                        e = e;
                        str = sb2;
                        e.printStackTrace();
                        return str;
                    }
                } else {
                    str2 = sb2;
                }
            }
            return str2;
        } catch (NumberFormatException e2) {
            e = e2;
            e.printStackTrace();
            return str;
        }
    }

    private String genFlashFired(int i) {
        return this.mActivity.getResources().getString(new FlashState(i).isFlashFired() ? R.string.flash_on : R.string.flash_off);
    }

    private String genFocalLength(Object obj) {
        StringBuilder sb = new StringBuilder();
        sb.append(obj);
        sb.append("mm");
        return sb.toString();
    }

    private String genISO(Object obj) {
        StringBuilder sb = new StringBuilder();
        sb.append("ISO");
        sb.append(obj);
        return sb.toString();
    }

    private String genLocation(double[] dArr) {
        if (!LocationUtil.isValidateCoordinate(dArr[0], dArr[1])) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(dArr[0]);
        sb.append(", ");
        sb.append(dArr[1]);
        return sb.toString();
    }

    private String genPixels(Object obj, Object obj2, Object obj3) {
        if (obj3 != null) {
            try {
                int exifOrientationToDegrees = ExifUtil.exifOrientationToDegrees(Integer.parseInt((String) obj3));
                if (exifOrientationToDegrees == 90 || exifOrientationToDegrees == 270) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(obj2);
                    sb.append("x");
                    sb.append(obj);
                    sb.append("px");
                    return sb.toString();
                }
            } catch (Exception e) {
                Log.w("PhotoDetailFragment", (Throwable) e);
            }
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(obj);
        sb2.append("x");
        sb2.append(obj2);
        sb2.append("px");
        return sb2.toString();
    }

    private boolean isNeedConfirmPassword() {
        return this.mItem.isSecret() && this.mNeedConfirmPassword;
    }

    private void requestAddress(double d, double d2) {
        cancelAddressRequest();
        if (!CTA.canConnectNetwork()) {
            Log.d("PhotoDetailFragment", "Abort request address task due to lack of CTA network connection permission");
            return;
        }
        ThreadPool networkPool = ThreadManager.getNetworkPool();
        final double d3 = d;
        final double d4 = d2;
        AnonymousClass2 r1 = new Job<Address>() {
            public Address run(JobContext jobContext) {
                return new ReverseGeocoder(PhotoDetailFragment.this.mActivity.getApplicationContext()).lookupAddress(d3, d4, true, jobContext);
            }
        };
        this.mAddressFuture = networkPool.submit(r1, new FutureListener<Address>() {
            public void onFutureDone(Future<Address> future) {
                if (!future.isCancelled()) {
                    Address address = (Address) future.get();
                    if (address != null) {
                        final StringBuilder sb = new StringBuilder();
                        String addressLine = address.getAddressLine(0);
                        if (TextUtils.isEmpty(addressLine)) {
                            String[] strArr = {address.getAdminArea(), address.getSubAdminArea(), address.getLocality(), address.getSubLocality(), address.getThoroughfare(), address.getSubThoroughfare(), address.getPremises(), address.getPostalCode(), address.getCountryName()};
                            for (int i = 0; i < strArr.length; i++) {
                                if (!TextUtils.isEmpty(strArr[i])) {
                                    if (sb.length() > 0) {
                                        sb.append(", ");
                                    }
                                    sb.append(strArr[i]);
                                }
                            }
                        } else {
                            sb.append(addressLine);
                        }
                        if (sb.length() > 0) {
                            PhotoDetailFragment.this.mActivity.runOnUiThread(new Runnable() {
                                public void run() {
                                    PhotoDetailFragment.this.mLocation.setText(sb.toString());
                                }
                            });
                        }
                    }
                }
            }
        });
    }

    private void setItemVisible(View view, boolean z) {
        if (z) {
            view.setVisibility(0);
        } else {
            view.setVisibility(8);
        }
    }

    private void setRootViewClickable(View view) {
        if (view != null) {
            ViewParent parent = view.getParent();
            if (parent == null || !(parent instanceof View)) {
                view.setClickable(true);
            } else {
                ((View) parent).setClickable(true);
            }
        }
    }

    public String getPageName() {
        return "photo_info";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mLoaderCallBack = new DetailLoaderCallBack();
        getLoaderManager().initLoader("PhotoDetailFragment".hashCode(), getArguments(), this.mLoaderCallBack);
        if (this.mItem.isSecret()) {
            this.mActivity.getWindow().addFlags(8192);
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 27) {
            if (i2 != -1) {
                finishActivity(i2);
            } else {
                this.mNeedConfirmPassword = false;
            }
        }
        super.onActivityResult(i, i2, intent);
    }

    public boolean onBackPressed() {
        finishActivity(-1);
        return false;
    }

    public void onDestroy() {
        super.onDestroy();
        cancelAddressRequest();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:3:0x0016, code lost:
        if (r4 == null) goto L_0x0018;
     */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle extras = this.mActivity.getIntent().getExtras();
        if (extras != null) {
            BaseDataItem baseDataItem = (BaseDataItem) extras.getSerializable("photo_detail_target");
            this.mItem = baseDataItem;
        }
        finish();
        setRootViewClickable(viewGroup);
        View inflate = layoutInflater.inflate(R.layout.photo_detail, viewGroup, false);
        this.mTimeItem = inflate.findViewById(R.id.time_item);
        this.mTimeTitle = (TextView) inflate.findViewById(R.id.time_title);
        this.mTimeSub = (TextView) inflate.findViewById(R.id.time_subtitle);
        this.mFileInfoItem = inflate.findViewById(R.id.file_info_item);
        this.mFileInfoTitle = (TextView) inflate.findViewById(R.id.file_info_title);
        this.mTipNoDownload = (TextView) inflate.findViewById(R.id.tip_no_download);
        this.mFileInfoSub = (TextView) inflate.findViewById(R.id.file_info_subtitle);
        this.mParamsItem = inflate.findViewById(R.id.params_item);
        this.mTakenParamsTitle = (TextView) inflate.findViewById(R.id.params_title);
        this.mTakenParamsSub = (TextView) inflate.findViewById(R.id.params_subtitle);
        this.mTakenParamsThird = (TextView) inflate.findViewById(R.id.params_thirdtitle);
        this.mPathItem = inflate.findViewById(R.id.path_item);
        this.mPath = (TextView) inflate.findViewById(R.id.path_title);
        this.mLocationItem = inflate.findViewById(R.id.location_item);
        this.mLocation = (TextView) inflate.findViewById(R.id.location_title);
        this.mContentContainer = inflate.findViewById(R.id.content_container);
        this.mProgress = (ProgressBar) inflate.findViewById(R.id.progress);
        this.mScreenshotPackageItem = inflate.findViewById(R.id.screenshot_package_info);
        this.mScreenshotPackageInfo = (TextView) inflate.findViewById(R.id.screenshot_package_name);
        this.mLocation.setOnClickListener(this.mClickListener);
        return inflate;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        finish();
        return true;
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [android.app.Fragment, com.miui.gallery.ui.PhotoDetailFragment, com.miui.gallery.ui.BaseFragment] */
    public void onResume() {
        super.onResume();
        if (isNeedConfirmPassword()) {
            this.mNeedConfirmPassword = false;
            LockSettingsHelper.startAuthenticatePasswordActivity((Fragment) this, 27);
        }
    }

    public void onStop() {
        this.mNeedConfirmPassword = true;
        super.onStop();
    }

    /* access modifiers changed from: protected */
    public boolean useImageLoader() {
        return false;
    }
}
