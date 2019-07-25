package com.miui.gallery.share;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.common.collect.Lists;
import com.miui.gallery.R;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import java.util.List;

public abstract class ShareUserAdapterBase extends BaseAdapter {
    private static int sIconEffectHeight;
    private static int sIconEffectWidth;
    private static int sIconHeight;
    private static int sIconWidth;
    protected final String mCreatorId;
    protected DisplayImageOptions mDefaultDisplayImageOptions;
    protected final LayoutInflater mInflater;
    private final int mItemLayoutId;
    protected final List<CloudUserCacheEntry> mShareUsers = Lists.newArrayList();

    class ViewHolder {
        public final ImageView mIcon;
        public final ImageView mIconEffect;
        public final ImageView mMark;
        public final TextView mText;

        public ViewHolder(CloudUserCacheEntry cloudUserCacheEntry, View view) {
            this.mIcon = (ImageView) view.findViewById(R.id.icon);
            LayoutParams layoutParams = this.mIcon.getLayoutParams();
            ShareUserAdapterBase.this.setIconSize(cloudUserCacheEntry, layoutParams);
            view.getLayoutParams().width = layoutParams.width;
            this.mMark = (ImageView) view.findViewById(R.id.mark);
            this.mText = (TextView) view.findViewById(R.id.text);
            this.mIconEffect = (ImageView) view.findViewById(R.id.ic_effect);
        }
    }

    public ShareUserAdapterBase(Context context, String str, int i) {
        this.mInflater = LayoutInflater.from(context);
        this.mCreatorId = str;
        this.mItemLayoutId = i;
        if (sIconWidth == 0) {
            Resources resources = context.getResources();
            Drawable drawable = resources.getDrawable(R.drawable.ic_contact_photo_mask);
            sIconWidth = drawable.getIntrinsicWidth();
            sIconHeight = drawable.getIntrinsicHeight();
            Drawable drawable2 = resources.getDrawable(R.drawable.ic_contact_photo_effect);
            sIconEffectWidth = drawable2.getIntrinsicWidth();
            sIconEffectHeight = drawable2.getIntrinsicHeight();
        }
        intialDisplayOptions();
    }

    /* access modifiers changed from: protected */
    public abstract int getAbsentSharerIcon(CloudUserCacheEntry cloudUserCacheEntry);

    /* access modifiers changed from: protected */
    public abstract int getDefaultIcon(CloudUserCacheEntry cloudUserCacheEntry);

    /* access modifiers changed from: protected */
    public String getDisplayName(Resources resources, UserInfo userInfo, CloudUserCacheEntry cloudUserCacheEntry) {
        if (userInfo != null) {
            return TextUtils.equals(userInfo.getUserId(), GalleryCloudUtils.getAccountName()) ? resources.getString(R.string.user_alias_self) : userInfo.getDisplayName();
        }
        return cloudUserCacheEntry == null ? null : cloudUserCacheEntry.mUserId;
    }

    /* access modifiers changed from: protected */
    public abstract int getIconEffect();

    public CloudUserCacheEntry getItem(int i) {
        if (i < this.mShareUsers.size()) {
            return (CloudUserCacheEntry) this.mShareUsers.get(i);
        }
        return null;
    }

    public long getItemId(int i) {
        return 0;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        CloudUserCacheEntry item = getItem(i);
        if (view == null) {
            view = this.mInflater.inflate(this.mItemLayoutId, viewGroup, false);
            view.setTag(new ViewHolder(item, view));
        }
        ViewHolder viewHolder = (ViewHolder) view.getTag();
        if (item == null || TextUtils.isEmpty(item.mUserId)) {
            viewHolder.mText.setText(getDisplayName(view.getResources(), null, item));
            viewHolder.mIcon.setImageResource(i == 0 ? getDefaultIcon(item) : getAbsentSharerIcon(item));
        } else {
            UserInfo userInfo = (UserInfo) UserInfoCache.getInstance().getValue(item.mUserId);
            viewHolder.mText.setText(getDisplayName(view.getResources(), userInfo, item));
            if (userInfo != null) {
                String miliaoIconUrl150 = userInfo.getMiliaoIconUrl150();
                if (TextUtils.isEmpty(miliaoIconUrl150)) {
                    viewHolder.mIcon.setImageResource(getDefaultIcon(item));
                } else {
                    ImageLoader.getInstance().displayImage(miliaoIconUrl150, viewHolder.mIcon, this.mDefaultDisplayImageOptions, (ImageLoadingListener) null);
                }
            } else {
                viewHolder.mIcon.setImageResource(getDefaultIcon(item));
            }
            if (TextUtils.equals(item.mUserId, this.mCreatorId)) {
                viewHolder.mMark.setImageResource(R.drawable.cloud_album_creator_mark);
            }
        }
        viewHolder.mIconEffect.setImageResource(getIconEffect());
        return view;
    }

    /* access modifiers changed from: protected */
    public abstract void intialDisplayOptions();

    /* access modifiers changed from: protected */
    public void setIconSize(CloudUserCacheEntry cloudUserCacheEntry, LayoutParams layoutParams) {
        layoutParams.width = sIconEffectWidth;
        layoutParams.height = sIconEffectHeight;
    }

    public void setShareUsers(List<CloudUserCacheEntry> list) {
        this.mShareUsers.clear();
        this.mShareUsers.addAll(list);
        notifyDataSetChanged();
    }
}
