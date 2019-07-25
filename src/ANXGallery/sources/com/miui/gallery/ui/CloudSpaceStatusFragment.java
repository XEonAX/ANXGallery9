package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.AsyncTaskLoader;
import android.content.Context;
import android.content.Loader;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.cloud.syncstate.SyncStateUtil.CloudSpaceInfo;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.ColorRingProgress;
import java.util.ArrayList;
import java.util.List;

public class CloudSpaceStatusFragment extends BaseFragment {
    private BaseAdapter mApdater;
    private List<DataItem> mDataList = new ArrayList();
    private ListView mListView;
    private ColorRingProgress mProgress;
    private TextView mStorageDetail;
    private View mStorageFrame;
    private TextView mUsedPercent;

    private static class CloudStatusData {
        boolean mIsSpaceLow;
        long mLeftCloudSpace;
        int mSyncedPhotoCount;
        long mSyncedPhotoSize;
        int mSyncedVideoCount;
        long mSyncedVideoSize;
        long mTotalCloudSpace;

        private CloudStatusData() {
        }
    }

    private static class DataItem {
        String mAppendSummary;
        String mAppendTitle;
        OnClickListener mClickListener;
        boolean mIsShowArrow;
        String mSummary;
        String mTitle;
        String mValue;

        private DataItem() {
        }
    }

    private static class SpaceStatusLoader extends AsyncTaskLoader<CloudStatusData> {
        private CloudStatusData mData;

        public SpaceStatusLoader(Context context) {
            super(context);
        }

        public final void deliverResult(CloudStatusData cloudStatusData) {
            if (!isReset()) {
                this.mData = cloudStatusData;
                if (isStarted()) {
                    super.deliverResult(cloudStatusData);
                }
            }
        }

        public CloudStatusData loadInBackground() {
            CloudStatusData cloudStatusData = new CloudStatusData();
            int[] syncedCount = SyncStateUtil.getSyncedCount(getContext());
            long[] syncedSize = SyncStateUtil.getSyncedSize(getContext());
            cloudStatusData.mSyncedPhotoCount = syncedCount[0];
            cloudStatusData.mSyncedPhotoSize = syncedSize[0];
            cloudStatusData.mSyncedVideoCount = syncedCount[1];
            cloudStatusData.mSyncedVideoSize = syncedSize[1];
            CloudSpaceInfo cloudSpaceInfo = SyncStateUtil.getCloudSpaceInfo(getContext());
            cloudStatusData.mTotalCloudSpace = cloudSpaceInfo.getTotal();
            cloudStatusData.mLeftCloudSpace = cloudStatusData.mTotalCloudSpace - cloudSpaceInfo.getUsed();
            cloudStatusData.mIsSpaceLow = cloudSpaceInfo.isSpaceLow();
            return cloudStatusData;
        }

        public void onCanceled(CloudStatusData cloudStatusData) {
        }

        /* access modifiers changed from: protected */
        public void onReset() {
            super.onReset();
            onStopLoading();
            this.mData = null;
        }

        /* access modifiers changed from: protected */
        public void onStartLoading() {
            if (this.mData != null) {
                deliverResult(this.mData);
            }
            if (takeContentChanged() || this.mData == null) {
                forceLoad();
            }
        }

        /* access modifiers changed from: protected */
        public void onStopLoading() {
            cancelLoad();
        }
    }

    private class SpaceStatusLoaderCallBack implements LoaderCallbacks<CloudStatusData> {
        private SpaceStatusLoaderCallBack() {
        }

        public Loader<CloudStatusData> onCreateLoader(int i, Bundle bundle) {
            return new SpaceStatusLoader(CloudSpaceStatusFragment.this.getActivity());
        }

        public void onLoadFinished(Loader<CloudStatusData> loader, CloudStatusData cloudStatusData) {
            CloudSpaceStatusFragment.this.refresh(cloudStatusData);
        }

        public void onLoaderReset(Loader<CloudStatusData> loader) {
        }
    }

    private class StatusAdapter extends BaseAdapter {
        private List<DataItem> mList;

        private class ViewHolder {
            TextView mAppendSummary;
            TextView mAppendTitle;
            View mRightArrow;
            TextView mSummary;
            View mSummayDivider;
            TextView mTitle;
            View mTitleDivider;
            TextView mValue;

            private ViewHolder() {
            }
        }

        StatusAdapter(List<DataItem> list) {
            this.mList = list;
        }

        public int getCount() {
            if (this.mList == null) {
                return 0;
            }
            return this.mList.size();
        }

        public DataItem getItem(int i) {
            if (this.mList == null || i <= -1 || i >= this.mList.size()) {
                return null;
            }
            return (DataItem) this.mList.get(i);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            int i2 = 0;
            if (view == null) {
                view = LayoutInflater.from(CloudSpaceStatusFragment.this.getActivity()).inflate(R.layout.cloud_space_status_item, viewGroup, false);
                ViewHolder viewHolder = new ViewHolder();
                viewHolder.mTitle = (TextView) view.findViewById(R.id.title);
                viewHolder.mTitleDivider = view.findViewById(R.id.title_divider);
                viewHolder.mAppendTitle = (TextView) view.findViewById(R.id.append_title);
                viewHolder.mSummary = (TextView) view.findViewById(R.id.summary);
                viewHolder.mSummayDivider = view.findViewById(R.id.summary_divider);
                viewHolder.mAppendSummary = (TextView) view.findViewById(R.id.append_summary);
                viewHolder.mValue = (TextView) view.findViewById(R.id.value);
                viewHolder.mRightArrow = view.findViewById(R.id.arrow_right);
                view.setTag(viewHolder);
            }
            ViewHolder viewHolder2 = (ViewHolder) view.getTag();
            DataItem item = getItem(i);
            if (item != null) {
                viewHolder2.mTitle.setText(item.mTitle);
                if (!TextUtils.isEmpty(item.mAppendTitle)) {
                    viewHolder2.mAppendTitle.setText(item.mAppendTitle);
                    viewHolder2.mTitleDivider.setVisibility(0);
                    viewHolder2.mAppendTitle.setVisibility(0);
                } else {
                    viewHolder2.mTitleDivider.setVisibility(8);
                    viewHolder2.mAppendTitle.setVisibility(8);
                }
                if (!TextUtils.isEmpty(item.mSummary)) {
                    viewHolder2.mSummary.setText(item.mSummary);
                    viewHolder2.mSummary.setVisibility(0);
                    if (!TextUtils.isEmpty(item.mAppendSummary)) {
                        viewHolder2.mAppendSummary.setText(item.mAppendSummary);
                        viewHolder2.mSummayDivider.setVisibility(0);
                        viewHolder2.mAppendSummary.setVisibility(0);
                    } else {
                        viewHolder2.mSummayDivider.setVisibility(8);
                        viewHolder2.mAppendSummary.setVisibility(8);
                    }
                } else {
                    viewHolder2.mSummary.setVisibility(8);
                    viewHolder2.mSummayDivider.setVisibility(8);
                    viewHolder2.mAppendSummary.setVisibility(8);
                }
                if (!TextUtils.isEmpty(item.mValue)) {
                    viewHolder2.mValue.setText(item.mValue);
                    viewHolder2.mValue.setVisibility(0);
                } else {
                    viewHolder2.mValue.setVisibility(8);
                }
                View view2 = viewHolder2.mRightArrow;
                if (!item.mIsShowArrow) {
                    i2 = 8;
                }
                view2.setVisibility(i2);
                view.setOnClickListener(item.mClickListener);
                if (item.mClickListener == null) {
                    view.setOnTouchListener(new OnTouchListener() {
                        public boolean onTouch(View view, MotionEvent motionEvent) {
                            return true;
                        }
                    });
                } else {
                    view.setOnTouchListener(null);
                }
            }
            return view;
        }
    }

    /* JADX WARNING: type inference failed for: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r5v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r6v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 103
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 4 */
    public void refresh(CloudStatusData cloudStatusData) {
        Log.i("CloudSpaceStatusFragment", "refresh %s", (Object) cloudStatusData);
        if (cloudStatusData != null) {
            if (cloudStatusData.mTotalCloudSpace != 0 && cloudStatusData.mLeftCloudSpace <= cloudStatusData.mTotalCloudSpace) {
                float min = Math.min(1.0f, 1.0f - ((((float) cloudStatusData.mLeftCloudSpace) * 1.0f) / ((float) cloudStatusData.mTotalCloudSpace)));
                this.mProgress.setProgress(min);
                this.mUsedPercent.setText(String.format("%d", new Object[]{Integer.valueOf((int) (min * 100.0f))}));
            }
            String quantityStringWithUnit = SyncStateUtil.getQuantityStringWithUnit(this.mActivity, cloudStatusData.mLeftCloudSpace);
            String quantityStringWithUnit2 = SyncStateUtil.getQuantityStringWithUnit(this.mActivity, cloudStatusData.mTotalCloudSpace);
            TextView textView = this.mStorageDetail;
            StringBuilder sb = new StringBuilder();
            sb.append(quantityStringWithUnit);
            sb.append(" | ");
            sb.append(quantityStringWithUnit2);
            textView.setText(sb.toString());
            Resources resources = getResources();
            this.mDataList.clear();
            DataItem dataItem = new DataItem();
            dataItem.mTitle = resources.getString(R.string.cloud_storage_photo_title);
            dataItem.mAppendTitle = SyncStateUtil.getQuantityStringWithUnit(this.mActivity, cloudStatusData.mSyncedPhotoSize);
            dataItem.mValue = resources.getQuantityString(R.plurals.cloud_storage_photo_num, cloudStatusData.mSyncedPhotoCount, new Object[]{Integer.valueOf(cloudStatusData.mSyncedPhotoCount)});
            DataItem dataItem2 = new DataItem();
            dataItem2.mTitle = resources.getString(R.string.cloud_storage_video_title);
            dataItem2.mAppendTitle = SyncStateUtil.getQuantityStringWithUnit(this.mActivity, cloudStatusData.mSyncedVideoSize);
            dataItem2.mValue = resources.getQuantityString(R.plurals.cloud_storage_video_num, cloudStatusData.mSyncedVideoCount, new Object[]{Integer.valueOf(cloudStatusData.mSyncedVideoCount)});
            DataItem dataItem3 = new DataItem();
            dataItem3.mTitle = resources.getString(R.string.cloud_storage_extend);
            if (cloudStatusData.mIsSpaceLow) {
                this.mProgress.setBackgroundColor(resources.getColor(R.color.space_progress_back_warn));
                this.mStorageFrame.setBackgroundResource(R.color.status_warning_color);
            } else {
                this.mProgress.setBackgroundColor(resources.getColor(R.color.space_progress_back));
                this.mStorageFrame.setBackgroundResource(R.color.status_ok_color);
            }
            dataItem3.mClickListener = new OnClickListener() {
                public void onClick(View view) {
                    IntentUtil.gotoMiCloudVipPage(CloudSpaceStatusFragment.this.getActivity());
                    GallerySamplingStatHelper.recordCountEvent("Sync", "sync_cloud_space_enlarge");
                }
            };
            dataItem3.mIsShowArrow = true;
            this.mDataList.add(dataItem);
            this.mDataList.add(dataItem2);
            this.mDataList.add(dataItem3);
            this.mApdater.notifyDataSetChanged();
        }
    }

    public String getPageName() {
        return "cloud_space_status";
    }

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return 2131820704;
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        getLoaderManager().initLoader(1, null, new SpaceStatusLoaderCallBack());
        GallerySamplingStatHelper.recordCountEvent("Sync", "sync_cloud_space_status");
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(false);
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.cloud_space_status, viewGroup, false);
        this.mStorageFrame = inflate.findViewById(R.id.storage_frame);
        this.mProgress = (ColorRingProgress) inflate.findViewById(R.id.used_progress);
        this.mUsedPercent = (TextView) inflate.findViewById(R.id.used_percent);
        this.mStorageDetail = (TextView) inflate.findViewById(R.id.storage_detail);
        this.mListView = (ListView) inflate.findViewById(R.id.list);
        this.mApdater = new StatusAdapter(this.mDataList);
        this.mListView.setAdapter(this.mApdater);
        return inflate;
    }
}
