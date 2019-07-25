package com.miui.gallery.cleaner;

import android.content.Context;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.cleaner.ScanResult.ResultImage;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.util.Iterator;
import java.util.List;
import miui.util.ArraySet;

public class ScanResultAdapter extends Adapter<ViewHolder> {
    /* access modifiers changed from: private */
    public final int mContentLayoutMinHeight;
    /* access modifiers changed from: private */
    public Context mContext;
    private List<ScanResult> mDataList = null;
    /* access modifiers changed from: private */
    public DisplayImageOptions mDisplayImageOptions;
    /* access modifiers changed from: private */
    public View mHeaderView;
    /* access modifiers changed from: private */
    public final ImageSize mImageSize;
    private ArraySet<NotifyObserver> mNotifyObservers = new ArraySet<>();
    /* access modifiers changed from: private */
    public final int mTitleMarginTop;

    class HeaderHolder extends ViewHolder {
        public HeaderHolder(View view) {
            super(view);
        }
    }

    private class NotifyObserver extends AdapterDataObserver {
        private AdapterDataObserver mDataObserver;

        public NotifyObserver(AdapterDataObserver adapterDataObserver) {
            this.mDataObserver = adapterDataObserver;
        }

        public AdapterDataObserver getDataObserver() {
            return this.mDataObserver;
        }

        public int getHeaderSize() {
            return ScanResultAdapter.this.mHeaderView == null ? 0 : 1;
        }

        public void onChanged() {
            this.mDataObserver.onChanged();
        }

        public void onItemRangeChanged(int i, int i2) {
            this.mDataObserver.onItemRangeChanged(i + getHeaderSize(), i2);
        }

        public void onItemRangeChanged(int i, int i2, Object obj) {
            this.mDataObserver.onItemRangeChanged(i + getHeaderSize(), i2, obj);
        }

        public void onItemRangeInserted(int i, int i2) {
            this.mDataObserver.onItemRangeInserted(i + getHeaderSize(), i2);
        }

        public void onItemRangeMoved(int i, int i2, int i3) {
            this.mDataObserver.onItemRangeMoved(i, i2, i3);
        }

        public void onItemRangeRemoved(int i, int i2) {
            this.mDataObserver.onItemRangeRemoved(i + getHeaderSize(), i2);
        }
    }

    class ScanResultHolder extends ViewHolder implements OnClickListener {
        private TextView mAction;
        private View mContentLayout;
        private LayoutParams mContentLayoutParams;
        private TextView mDescription;
        private View mDivider;
        private ImageViewAware[] mImages;
        private ScanResult mScanResult;
        private TextView mSize;
        private TextView mTitle;
        private RelativeLayout.LayoutParams mTitleLayoutParams = ((RelativeLayout.LayoutParams) this.mTitle.getLayoutParams());

        public ScanResultHolder(View view) {
            super(view);
            this.mTitle = (TextView) view.findViewById(R.id.title);
            this.mSize = (TextView) view.findViewById(R.id.size);
            this.mDescription = (TextView) view.findViewById(R.id.description);
            this.mAction = (TextView) view.findViewById(R.id.action);
            this.mAction.setOnClickListener(this);
            view.setOnClickListener(this);
            this.mDivider = view.findViewById(R.id.divider);
            this.mImages = new ImageViewAware[4];
            this.mImages[0] = new ImageViewAware((ImageView) view.findViewById(R.id.image0));
            this.mImages[1] = new ImageViewAware((ImageView) view.findViewById(R.id.image1));
            this.mImages[2] = new ImageViewAware((ImageView) view.findViewById(R.id.image2));
            this.mImages[3] = new ImageViewAware((ImageView) view.findViewById(R.id.image3));
            this.mContentLayout = view.findViewById(R.id.content_layout);
            this.mContentLayoutParams = this.mContentLayout.getLayoutParams();
        }

        public void bindData(ScanResult scanResult, boolean z) {
            this.mScanResult = scanResult;
            this.mTitle.setText(scanResult.getMergedTitle(ScanResultAdapter.this.mContext));
            this.mSize.setText(FormatUtil.formatFileSize(ScanResultAdapter.this.mContext, scanResult.getSize()));
            this.mAction.setText(scanResult.getAction());
            this.mDivider.setVisibility(z ? 0 : 8);
            if (TextUtils.isEmpty(ScanResultAdapter.this.mContext.getString(scanResult.getDescription()))) {
                this.mDescription.setVisibility(8);
                this.mTitleLayoutParams.topMargin = 0;
                this.mTitleLayoutParams.addRule(15);
                this.mContentLayoutParams.height = ScanResultAdapter.this.mContentLayoutMinHeight;
            } else {
                this.mDescription.setVisibility(0);
                this.mDescription.setText(scanResult.getDescription());
                this.mTitleLayoutParams.topMargin = ScanResultAdapter.this.mTitleMarginTop;
                this.mTitleLayoutParams.removeRule(15);
                this.mContentLayoutParams.height = -2;
            }
            this.mTitle.setLayoutParams(this.mTitleLayoutParams);
            this.mContentLayout.setLayoutParams(this.mContentLayoutParams);
            ResultImage[] images = scanResult.getImages();
            for (int i = 0; i < this.mImages.length; i++) {
                if (images.length > i) {
                    ResultImage resultImage = images[i];
                    if (resultImage != null) {
                        this.mImages[i].getWrappedView().setVisibility(0);
                        BindImageHelper.bindImage(resultImage.mPath, CloudUriAdapter.getDownloadUri(resultImage.mId), DownloadType.MICRO, (ImageAware) this.mImages[i], ScanResultAdapter.this.mDisplayImageOptions, ScanResultAdapter.this.mImageSize);
                    }
                }
                this.mImages[i].getWrappedView().setVisibility(4);
            }
        }

        public void onClick(View view) {
            this.mScanResult.onClick(ScanResultAdapter.this.mContext);
        }
    }

    public ScanResultAdapter(Context context) {
        this.mContext = context;
        this.mTitleMarginTop = context.getResources().getDimensionPixelSize(R.dimen.cleaner_item_title_margin_top);
        this.mContentLayoutMinHeight = context.getResources().getDimensionPixelSize(R.dimen.cleaner_item_content_layout_min_height);
        this.mImageSize = ThumbConfig.get().sMicroTargetSize;
        this.mDisplayImageOptions = ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT;
    }

    public int getDataItemSize() {
        if (this.mDataList == null) {
            return 0;
        }
        return this.mDataList.size();
    }

    public List<ScanResult> getDataList() {
        return this.mDataList;
    }

    public int getItemCount() {
        return getDataItemSize() + (this.mHeaderView == null ? 0 : 1);
    }

    public int getItemViewType(int i) {
        return (this.mHeaderView == null || i != 0) ? 0 : 1;
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        if (getItemViewType(i) == 0) {
            if (this.mHeaderView != null) {
                i--;
            }
            ScanResultHolder scanResultHolder = (ScanResultHolder) viewHolder;
            ScanResult scanResult = (ScanResult) this.mDataList.get(i);
            boolean z = true;
            if (i != getDataItemSize() - 1) {
                z = false;
            }
            scanResultHolder.bindData(scanResult, z);
        }
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return i == 1 ? new HeaderHolder(this.mHeaderView) : new ScanResultHolder(LayoutInflater.from(this.mContext).inflate(R.layout.cleaner_scan_result_item, viewGroup, false));
    }

    public void registerAdapterDataObserver(AdapterDataObserver adapterDataObserver) {
        if (adapterDataObserver != null) {
            synchronized (this.mNotifyObservers) {
                Iterator it = this.mNotifyObservers.iterator();
                while (it.hasNext()) {
                    if (((NotifyObserver) it.next()).getDataObserver() == adapterDataObserver) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Observer ");
                        sb.append(adapterDataObserver);
                        sb.append(" is already registered.");
                        throw new IllegalStateException(sb.toString());
                    }
                }
                NotifyObserver notifyObserver = new NotifyObserver(adapterDataObserver);
                this.mNotifyObservers.add(notifyObserver);
                super.registerAdapterDataObserver(notifyObserver);
            }
            return;
        }
        throw new IllegalArgumentException("The observer is null.");
    }

    public void setHeader(View view) {
        this.mHeaderView = view;
    }

    public void unregisterAdapterDataObserver(AdapterDataObserver adapterDataObserver) {
        if (adapterDataObserver != null) {
            synchronized (this.mNotifyObservers) {
                Iterator it = this.mNotifyObservers.iterator();
                while (it.hasNext()) {
                    NotifyObserver notifyObserver = (NotifyObserver) it.next();
                    if (notifyObserver.getDataObserver() == adapterDataObserver) {
                        super.unregisterAdapterDataObserver(notifyObserver);
                        it.remove();
                    }
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Observer ");
                sb.append(adapterDataObserver);
                sb.append(" was not registered.");
                throw new IllegalStateException(sb.toString());
            }
            return;
        }
        throw new IllegalArgumentException("The observer is null.");
    }

    public void updateDataList(List<ScanResult> list) {
        this.mDataList = list;
    }
}
