package com.miui.gallery.ui;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.syncstate.SyncStateInfo;
import com.miui.gallery.cloud.syncstate.SyncStateManager;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.cloud.syncstate.SyncStatus;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.FileSizeFormatter;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.GalleryIntent.CloudGuideSource;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.widget.ColorRingProgress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class BackupTitle extends LinearLayout {
    private SyncStatus mCurSyncStatus;
    private SyncType mCurSyncType;
    private View mDirtyContainer;
    private TextView mDirtyCountText;
    private ViewGroup mItemsContainer;
    private OnMenuItemClickListener mMenuItemClickListener;
    private List<PauseMenuItem> mMenuItems;
    private Animation mSyncingIconAnim;

    private abstract class BaseClickListener implements OnClickListener {
        private BaseClickListener() {
        }

        public final void onClick(View view) {
            onCustomClick(view);
            BackupTitle.this.tryStatSyncStateCorrect(getClass().getSimpleName());
        }

        /* access modifiers changed from: protected */
        public abstract void onCustomClick(View view);
    }

    private class ExpanseCloudSpaceListener extends BaseClickListener {
        private ExpanseCloudSpaceListener() {
            super();
        }

        public void onCustomClick(View view) {
            IntentUtil.gotoMiCloudVipPage(BackupTitle.this.getContext());
        }
    }

    private class LoginAccountListener extends BaseClickListener {
        private LoginAccountListener() {
            super();
        }

        public void onCustomClick(View view) {
            IntentUtil.guideToLoginXiaomiAccount(BackupTitle.this.getContext(), CloudGuideSource.TOPBAR);
        }
    }

    private class OpenSyncSwitchListener extends BaseClickListener {
        private OpenSyncSwitchListener() {
            super();
        }

        public void onCustomClick(View view) {
            IntentUtil.gotoTurnOnSyncSwitch(BackupTitle.this.getContext());
        }
    }

    private class PauseMenuItem {
        /* access modifiers changed from: private */
        public final int hour;
        /* access modifiers changed from: private */
        public final int itemId;
        /* access modifiers changed from: private */
        public final String title;

        public PauseMenuItem(String str, int i) {
            this.itemId = Math.abs(str.hashCode());
            this.title = str;
            this.hour = i;
        }
    }

    private class PauseSyncListener extends BaseClickListener {
        private PauseSyncListener() {
            super();
        }

        public void onCustomClick(View view) {
            BackupTitle.this.showContextMenu();
        }
    }

    private class ResumeSyncListener extends SyncImmediateListener {
        public ResumeSyncListener(SyncType syncType) {
            super(syncType);
        }

        public void onCustomClick(View view) {
            SyncUtil.resumeSync(BackupTitle.this.getContext());
            super.onCustomClick(view);
        }
    }

    private class SetCTAListener extends BaseClickListener {
        private SetCTAListener() {
            super();
        }

        public void onCustomClick(View view) {
            AgreementsUtils.showNetworkingAgreement((Activity) BackupTitle.this.getContext(), null);
        }
    }

    private class SetNetworkListener extends BaseClickListener {
        private SetNetworkListener() {
            super();
        }

        public void onCustomClick(View view) {
            BackupTitle.this.getContext().startActivity(new Intent("android.settings.SETTINGS"));
        }
    }

    private class SlimDeviceSpaceListener extends BaseClickListener {
        private SlimDeviceSpaceListener() {
            super();
        }

        public void onCustomClick(View view) {
            IntentUtil.gotoDeepClean(BackupTitle.this.getContext());
        }
    }

    private class StopSyncListener extends BaseClickListener {
        private StopSyncListener() {
            super();
        }

        public void onCustomClick(View view) {
            SyncUtil.stopSync(BackupTitle.this.getContext());
        }
    }

    private class SyncImmediateListener extends BaseClickListener {
        /* access modifiers changed from: private */
        public SyncType mSyncType;

        public SyncImmediateListener(SyncType syncType) {
            super();
            this.mSyncType = syncType;
        }

        public void onCustomClick(View view) {
            if (this.mSyncType == SyncType.GPRS_FORCE) {
                Resources resources = BackupTitle.this.getContext().getResources();
                DialogUtil.showInfoDialog(BackupTitle.this.getContext(), resources.getString(R.string.backup_with_gprs_dialog_message, new Object[]{FormatUtil.formatFileSize(BackupTitle.this.getContext(), SyncStateManager.getInstance().getSyncState().getDirtySize())}), resources.getString(R.string.backup_with_gprs_dialog_title), (int) R.string.backup_with_gprs_dialog_btn, (int) R.string.cancel, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        BackupTitle.this.requestSync(SyncImmediateListener.this.mSyncType);
                    }
                }, (DialogInterface.OnClickListener) null);
                return;
            }
            BackupTitle.this.requestSync(this.mSyncType);
        }
    }

    private class TitleData {
        public int mDirtyPhoto;
        public int mDirtyVideo;
        public List<TitleItemData> mItems;
        public boolean mShowDirty;

        private TitleData() {
            this.mItems = new LinkedList();
        }
    }

    private class TitleItemData {
        public int mBtnBgRes;
        public OnClickListener mBtnClickListener;
        public CharSequence mBtnTxt;
        public CharSequence mDesc;
        public Animation mIconAnim;
        public int mIconRes;
        public float mProgress;
        public CharSequence mTitle;
        public OnClickListener mTitleClickListener;

        private TitleItemData() {
            this.mProgress = 0.0f;
        }

        public TitleItemData setBtnBgRes(int i) {
            this.mBtnBgRes = i;
            return this;
        }

        public TitleItemData setBtnClickListener(OnClickListener onClickListener) {
            this.mBtnClickListener = onClickListener;
            return this;
        }

        public TitleItemData setBtnTxt(CharSequence charSequence) {
            this.mBtnTxt = charSequence;
            return this;
        }

        public TitleItemData setDesc(CharSequence charSequence) {
            this.mDesc = charSequence;
            return this;
        }

        public TitleItemData setIconAnim(Animation animation) {
            this.mIconAnim = animation;
            return this;
        }

        public TitleItemData setIconRes(int i) {
            this.mIconRes = i;
            return this;
        }

        public TitleItemData setProgress(float f) {
            this.mProgress = f;
            return this;
        }

        public TitleItemData setTitle(CharSequence charSequence) {
            this.mTitle = charSequence;
            return this;
        }
    }

    private class TitleItemViewHolder {
        public TextView mBtn;
        public TextView mDesc;
        public ImageView mIcon;
        public ColorRingProgress mProgress;
        public View mTextContainer;
        public TextView mTitle;

        private TitleItemViewHolder() {
        }
    }

    public BackupTitle(Context context) {
        this(context, null);
    }

    public BackupTitle(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public BackupTitle(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mMenuItemClickListener = new OnMenuItemClickListener() {
            public boolean onMenuItemClick(MenuItem menuItem) {
                PauseMenuItem access$100 = BackupTitle.this.findPauseItem(menuItem.getItemId());
                if (access$100 == null) {
                    return false;
                }
                if (access$100.hour == Integer.MAX_VALUE) {
                    SyncUtil.setSyncAutomatically(BackupTitle.this.getContext(), false);
                } else {
                    long access$200 = (long) (access$100.hour * 60 * 60 * 1000);
                    Log.i("BackupTitle", "pause %d hours", (Object) Integer.valueOf(access$100.hour));
                    SyncUtil.pauseSync(BackupTitle.this.getContext(), access$200);
                }
                return true;
            }
        };
        this.mCurSyncType = SyncType.UNKNOW;
        this.mCurSyncStatus = SyncStatus.UNAVAILABLE;
    }

    private void addDirtyItem(TitleData titleData, SyncStateInfo syncStateInfo) {
        switch (syncStateInfo.getSyncStatus()) {
            case SYNC_PENDING:
            case SYNCING:
            case SYNCING_METADATA:
            case SYNC_META_PENDING:
            case SYNCED:
                titleData.mShowDirty = false;
                return;
            default:
                int[] dirtyCount = syncStateInfo.getDirtyCount();
                titleData.mDirtyPhoto = dirtyCount[0];
                boolean z = true;
                titleData.mDirtyVideo = dirtyCount[1];
                if (dirtyCount[0] + dirtyCount[1] <= 0) {
                    z = false;
                }
                titleData.mShowDirty = z;
                return;
        }
    }

    private void addOperationItem(TitleData titleData, SyncStateInfo syncStateInfo) {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0301, code lost:
        if (r4 != 0) goto L_0x030d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0303, code lost:
        r0.setTitle(r1.getString(com.miui.gallery.R.string.syncing_metadata_title));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x030d, code lost:
        r0.setIconRes(com.miui.gallery.R.drawable.backup_icon_syncing).setBtnClickListener(genClickListener(r15));
        r6 = r15.getSyncType();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x031e, code lost:
        if (r6 != com.miui.gallery.cloud.base.SyncType.GPRS_FORCE) goto L_0x0351;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0322, code lost:
        if (r0.mTitle != null) goto L_0x032e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0324, code lost:
        r0.setTitle(r1.getString(com.miui.gallery.R.string.backuping_title_gprs));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x032e, code lost:
        if (r4 <= 0) goto L_0x0373;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0330, code lost:
        r0.setDesc(r1.getQuantityString(com.miui.gallery.R.plurals.backuping_desc_gprs, r4, new java.lang.Object[]{java.lang.Integer.valueOf(r4), com.miui.gallery.util.FormatUtil.formatFileSize(getContext(), r15.getDirtySize())}));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0353, code lost:
        if (r0.mTitle != null) goto L_0x035f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0355, code lost:
        r0.setTitle(r1.getString(com.miui.gallery.R.string.backuping_title_normal));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x035f, code lost:
        if (r4 <= 0) goto L_0x0373;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0361, code lost:
        r0.setDesc(r1.getQuantityString(com.miui.gallery.R.plurals.backuping_desc_normal, r4, new java.lang.Object[]{java.lang.Integer.valueOf(r4)}));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x0375, code lost:
        if (r0.mBtnTxt != null) goto L_0x0392;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x037b, code lost:
        if (r6.isForce() == false) goto L_0x0388;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x037d, code lost:
        r0.setBtnTxt(r1.getString(com.miui.gallery.R.string.backup_stop));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x0388, code lost:
        r0.setBtnTxt(r1.getString(com.miui.gallery.R.string.backup_pause));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0392, code lost:
        r0.setBtnBgRes(com.miui.gallery.R.drawable.list_item_btn_bg_light);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x0397, code lost:
        if (r2 == com.miui.gallery.cloud.syncstate.SyncStatus.SYNC_PENDING) goto L_0x03a0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x0399, code lost:
        r0.setIconAnim(getSyncingAnim());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x03a2, code lost:
        if (r2 == com.miui.gallery.cloud.syncstate.SyncStatus.UNAVAILABLE) goto L_0x03a9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x03a4, code lost:
        r14.mItems.add(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x03a9, code lost:
        tryStatSyncStateError(r15);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x03ac, code lost:
        return;
     */
    private void addSyncItem(TitleData titleData, SyncStateInfo syncStateInfo) {
        TitleItemData titleItemData = new TitleItemData();
        Resources resources = getContext().getResources();
        int[] dirtyCount = syncStateInfo.getDirtyCount();
        int i = dirtyCount[0] + dirtyCount[1];
        Log.i("BackupTitle", "refresh status: %s", (Object) syncStateInfo.getSyncStatus());
        SyncStatus syncStatus = syncStateInfo.getSyncStatus();
        switch (syncStatus) {
            case SYNC_PENDING:
                titleItemData.setTitle(resources.getString(R.string.backup_pending));
                titleItemData.setBtnTxt(resources.getString(R.string.backup_immediately));
                break;
            case SYNCING:
                break;
            case SYNCING_METADATA:
            case SYNC_META_PENDING:
                break;
            case SYNCED:
                titleItemData.setIconRes(R.drawable.backup_icon_synced).setTitle(resources.getString(R.string.backuped_title)).setDesc(resources.getString(R.string.backuped_desc));
                break;
            case SYNC_PAUSE:
                titleItemData.setIconRes(R.drawable.backup_icon_syncing).setDesc(resources.getQuantityString(R.plurals.backup_pause_desc, i, new Object[]{Integer.valueOf(i)})).setBtnTxt(resources.getString(R.string.backup_immediately)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                titleItemData.setTitle(resources.getString(R.string.backup_pause_title, new Object[]{FormatUtil.formatHourMinutes(syncStateInfo.getResumeInterval(getContext()))}));
                break;
            case SYNC_ERROR:
                titleItemData.setIconRes(R.drawable.backup_icon_sync_error).setTitle(resources.getString(R.string.backup_sync_error_title)).setDesc(resources.getString(R.string.backup_sync_error_desc)).setBtnTxt(resources.getString(R.string.backup_sync_error_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case UNKNOWN_ERROR:
                titleItemData.setIconRes(R.drawable.backup_icon_sync_error).setTitle(resources.getString(R.string.backup_need_sync_title)).setDesc(resources.getString(R.string.backup_need_sync_desc)).setBtnTxt(resources.getString(R.string.backup_immediately)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case NO_ACCOUNT:
            case MASTER_SYNC_OFF:
            case SYNC_OFF:
                titleItemData.setIconRes(R.drawable.backup_icon_sync_setting_off).setTitle(resources.getString(R.string.backup_sync_off_title)).setDesc(resources.getString(R.string.backup_sync_off_desc)).setBtnTxt(resources.getString(R.string.backup_sync_off_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case CTA_NOT_ALLOW:
                titleItemData.setIconRes(R.drawable.backup_icon_cta_not_allow).setTitle(resources.getString(R.string.backup_cta_not_allow_title)).setDesc(resources.getString(R.string.backup_cta_not_allow_desc)).setBtnTxt(resources.getString(R.string.backup_cta_not_allow_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case DISCONNECTED:
                titleItemData.setIconRes(R.drawable.backup_icon_net_error).setTitle(resources.getString(R.string.backup_no_network_title)).setDesc(resources.getString(R.string.backup_no_network_desc)).setBtnTxt(resources.getString(R.string.backup_no_network_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case NO_WIFI:
                titleItemData.setIconRes(R.drawable.backup_icon_net_error).setTitle(resources.getString(R.string.backup_no_wifi_title)).setDesc(resources.getString(R.string.backup_no_wifi_desc)).setBtnTxt(resources.getString(R.string.backup_no_wifi_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case BATTERY_LOW:
                titleItemData.setIconRes(R.drawable.backup_icon_battery_low).setTitle(resources.getString(R.string.backup_battery_low_title)).setDesc(resources.getString(R.string.backup_battery_low_desc)).setBtnTxt(resources.getString(R.string.backup_immediately)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case SYSTEM_SPACE_LOW:
                titleItemData.setIconRes(R.drawable.backup_icon_device_storage_low).setTitle(resources.getString(R.string.backup_device_space_low_title)).setDesc(resources.getString(R.string.backup_device_space_low_desc)).setBtnTxt(resources.getString(R.string.backup_device_space_low_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                break;
            case CLOUD_SPACE_FULL:
                titleItemData.setIconRes(R.drawable.backup_icon_cloud_storage_low).setTitle(resources.getString(R.string.backup_cloud_space_low_title)).setDesc(resources.getString(R.string.backup_cloud_space_low_desc, new Object[]{SyncStateUtil.getQuantityStringWithUnit(getContext(), syncStateInfo.getCloudSpaceTotalSize()), SyncStateUtil.getQuantityStringWithUnit(getContext(), syncStateInfo.getCloudSpaceRemainingSize())})).setBtnTxt(resources.getString(R.string.backup_cloud_space_low_btn_text)).setBtnBgRes(R.drawable.list_item_btn_bg_light).setBtnClickListener(genClickListener(syncStateInfo));
                if (syncStateInfo.getCloudSpaceTotalSize() > 0) {
                    titleItemData.setProgress(1.0f - ((((float) syncStateInfo.getCloudSpaceRemainingSize()) * 1.0f) / ((float) syncStateInfo.getCloudSpaceTotalSize())));
                    break;
                }
                break;
            case SYNCED_WITH_OVERSIZED_FILE:
                titleItemData.setIconRes(R.drawable.backup_icon_sync_error).setTitle(resources.getQuantityString(R.plurals.backup_file_over_size_title, i, new Object[]{Integer.valueOf(i)})).setDesc(resources.getString(R.string.backup_file_over_size_desc, new Object[]{FileSizeFormatter.formatShortFileSize(getContext(), CloudUtils.getMaxImageSizeLimit()), FileSizeFormatter.formatShortFileSize(getContext(), CloudUtils.getMaxVideoSizeLimit())}));
                break;
        }
    }

    /* access modifiers changed from: private */
    public PauseMenuItem findPauseItem(int i) {
        for (PauseMenuItem pauseMenuItem : this.mMenuItems) {
            if (pauseMenuItem.itemId == i) {
                return pauseMenuItem;
            }
        }
        return null;
    }

    private OnClickListener genClickListener(SyncStateInfo syncStateInfo) {
        switch (syncStateInfo.getSyncStatus()) {
            case SYNC_PENDING:
            case SYNC_META_PENDING:
            case SYNC_ERROR:
            case UNKNOWN_ERROR:
            case NO_WIFI:
            case BATTERY_LOW:
                return new SyncImmediateListener(getImmediateSyncType(syncStateInfo));
            case SYNCING:
            case SYNCING_METADATA:
                return syncStateInfo.getSyncType().isForce() ? new StopSyncListener() : new PauseSyncListener();
            case SYNC_PAUSE:
                return new ResumeSyncListener(getImmediateSyncType(syncStateInfo));
            case NO_ACCOUNT:
                return new LoginAccountListener();
            case MASTER_SYNC_OFF:
            case SYNC_OFF:
                return new OpenSyncSwitchListener();
            case CTA_NOT_ALLOW:
                return new SetCTAListener();
            case DISCONNECTED:
                return new SetNetworkListener();
            case SYSTEM_SPACE_LOW:
                return new SlimDeviceSpaceListener();
            case CLOUD_SPACE_FULL:
                return new ExpanseCloudSpaceListener();
            default:
                return null;
        }
    }

    private TitleData genTitleData(SyncStateInfo syncStateInfo) {
        TitleData titleData = new TitleData();
        addSyncItem(titleData, syncStateInfo);
        addOperationItem(titleData, syncStateInfo);
        addDirtyItem(titleData, syncStateInfo);
        return titleData;
    }

    private SyncType getImmediateSyncType(SyncStateInfo syncStateInfo) {
        return syncStateInfo.getSyncStatus() == SyncStatus.NO_WIFI ? SyncType.GPRS_FORCE : SyncType.POWER_FORCE;
    }

    private List<PauseMenuItem> getPauseMenuItems() {
        int[] intArray;
        if (this.mMenuItems == null) {
            this.mMenuItems = new ArrayList();
            for (int i : getContext().getResources().getIntArray(R.array.backup_pause_hours)) {
                this.mMenuItems.add(new PauseMenuItem(getContext().getResources().getQuantityString(R.plurals.backup_after_hours, i, new Object[]{Integer.valueOf(i)}), i));
            }
        }
        return this.mMenuItems;
    }

    private Animation getSyncingAnim() {
        if (this.mSyncingIconAnim == null) {
            this.mSyncingIconAnim = AnimationUtils.loadAnimation(getContext(), R.anim.photo_status_syncing_rotate_anim);
        }
        return this.mSyncingIconAnim;
    }

    private View getView(TitleItemData titleItemData, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = LayoutInflater.from(getContext()).inflate(R.layout.backup_title_item, viewGroup, false);
            TitleItemViewHolder titleItemViewHolder = new TitleItemViewHolder();
            titleItemViewHolder.mIcon = (ImageView) view.findViewById(R.id.icon);
            titleItemViewHolder.mProgress = (ColorRingProgress) view.findViewById(R.id.progress);
            titleItemViewHolder.mTitle = (TextView) view.findViewById(R.id.title);
            titleItemViewHolder.mDesc = (TextView) view.findViewById(R.id.summary);
            titleItemViewHolder.mTextContainer = view.findViewById(R.id.text_container);
            titleItemViewHolder.mBtn = (TextView) view.findViewById(R.id.btn);
            view.setTag(titleItemViewHolder);
        }
        TitleItemViewHolder titleItemViewHolder2 = (TitleItemViewHolder) view.getTag();
        titleItemViewHolder2.mIcon.setImageResource(titleItemData.mIconRes);
        titleItemViewHolder2.mTitle.setText(titleItemData.mTitle);
        titleItemViewHolder2.mTextContainer.setOnClickListener(titleItemData.mTitleClickListener);
        if (titleItemData.mTitleClickListener != null) {
            titleItemViewHolder2.mTitle.setCompoundDrawablesWithIntrinsicBounds(0, 0, R.drawable.backup_title_arrow, 0);
        } else {
            titleItemViewHolder2.mTitle.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
        }
        if (TextUtils.isEmpty(titleItemData.mDesc)) {
            titleItemViewHolder2.mDesc.setVisibility(8);
        } else {
            titleItemViewHolder2.mDesc.setVisibility(0);
            titleItemViewHolder2.mDesc.setText(titleItemData.mDesc);
        }
        if (TextUtils.isEmpty(titleItemData.mBtnTxt)) {
            titleItemViewHolder2.mBtn.setVisibility(8);
        } else {
            titleItemViewHolder2.mBtn.setVisibility(0);
            titleItemViewHolder2.mBtn.setText(titleItemData.mBtnTxt);
            titleItemViewHolder2.mBtn.setBackgroundResource(titleItemData.mBtnBgRes);
            titleItemViewHolder2.mBtn.setOnClickListener(titleItemData.mBtnClickListener);
        }
        if (titleItemData.mProgress > 0.0f) {
            titleItemViewHolder2.mProgress.setVisibility(0);
            titleItemViewHolder2.mProgress.setProgress(titleItemData.mProgress);
        } else {
            titleItemViewHolder2.mProgress.setVisibility(4);
        }
        if (titleItemData.mIconAnim != null) {
            Animation animation = titleItemViewHolder2.mIcon.getAnimation();
            if (animation == null || !animation.hasStarted() || animation.hasEnded()) {
                Log.i("BackupTitle", "startAnimation");
                titleItemViewHolder2.mIcon.startAnimation(titleItemData.mIconAnim);
            }
        } else {
            titleItemViewHolder2.mIcon.clearAnimation();
            Log.i("BackupTitle", "clearAnimation");
        }
        return view;
    }

    private boolean isNormalSyncStatus(SyncStatus syncStatus) {
        return syncStatus == SyncStatus.SYNC_PENDING || syncStatus == SyncStatus.SYNCING || syncStatus == SyncStatus.SYNCING_METADATA || syncStatus == SyncStatus.SYNC_META_PENDING || syncStatus == SyncStatus.SYNCED;
    }

    /* access modifiers changed from: private */
    public void requestSync(SyncType syncType) {
        SyncUtil.requestSync(getContext(), new Builder().setSyncType(syncType).setSyncReason(Long.MAX_VALUE).setDelayUpload(false).setManual(true).build());
    }

    /* access modifiers changed from: private */
    public void tryStatSyncStateCorrect(String str) {
        if (this.mCurSyncStatus != null && this.mCurSyncType != null && !isNormalSyncStatus(this.mCurSyncStatus)) {
            HashMap hashMap = new HashMap();
            StringBuilder sb = new StringBuilder();
            sb.append(this.mCurSyncType.name());
            sb.append("_");
            sb.append(this.mCurSyncStatus.name());
            sb.append("_");
            sb.append(str);
            hashMap.put("error_correct", sb.toString());
            GallerySamplingStatHelper.recordCountEvent("Sync", "sync_state_error_correct", hashMap);
        }
    }

    private void tryStatSyncStateError(SyncStateInfo syncStateInfo) {
        SyncStatus syncStatus = syncStateInfo.getSyncStatus();
        if (!isNormalSyncStatus(syncStatus) && !(this.mCurSyncType == syncStateInfo.getSyncType() && this.mCurSyncStatus == syncStatus)) {
            HashMap hashMap = new HashMap();
            StringBuilder sb = new StringBuilder();
            sb.append(syncStateInfo.getSyncType().name());
            sb.append("_");
            sb.append(syncStatus.name());
            hashMap.put("error_state", sb.toString());
            GallerySamplingStatHelper.recordCountEvent("Sync", "sync_state_error", hashMap);
        }
        this.mCurSyncType = syncStateInfo.getSyncType();
        this.mCurSyncStatus = syncStatus;
    }

    /* access modifiers changed from: protected */
    public void onCreateContextMenu(ContextMenu contextMenu) {
        super.onCreateContextMenu(contextMenu);
        List pauseMenuItems = getPauseMenuItems();
        for (int i = 0; i < pauseMenuItems.size(); i++) {
            PauseMenuItem pauseMenuItem = (PauseMenuItem) pauseMenuItems.get(i);
            contextMenu.add(0, pauseMenuItem.itemId, i, pauseMenuItem.title).setOnMenuItemClickListener(this.mMenuItemClickListener);
        }
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mItemsContainer = (ViewGroup) findViewById(R.id.item_container);
        this.mDirtyContainer = findViewById(R.id.dirty_container);
        this.mDirtyCountText = (TextView) findViewById(R.id.dirty_count_num);
    }

    public void refreshSyncState(SyncStateInfo syncStateInfo) {
        TitleData genTitleData = genTitleData(syncStateInfo);
        int size = genTitleData.mItems.size();
        int childCount = this.mItemsContainer.getChildCount();
        for (int i = size; i < childCount; i++) {
            this.mItemsContainer.removeViewAt(i);
        }
        for (int i2 = 0; i2 < size; i2++) {
            View childAt = this.mItemsContainer.getChildAt(i2);
            View view = getView((TitleItemData) genTitleData.mItems.get(i2), childAt, this.mItemsContainer);
            if (view != childAt) {
                this.mItemsContainer.addView(view);
            }
        }
        if (genTitleData.mShowDirty) {
            this.mDirtyContainer.setVisibility(0);
            this.mDirtyCountText.setText(getContext().getResources().getString(R.string.backup_dirty_num, new Object[]{String.format("%d", new Object[]{Integer.valueOf(genTitleData.mDirtyPhoto + genTitleData.mDirtyVideo)})}));
            return;
        }
        this.mDirtyContainer.setVisibility(8);
    }
}
