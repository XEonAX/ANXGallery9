package com.miui.gallery.ui;

import android.app.Activity;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.common.collect.Lists;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter.AlbumType;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.cloud.syncstate.OnSyncStateChangeObserver;
import com.miui.gallery.cloud.syncstate.SyncStateInfo;
import com.miui.gallery.cloud.syncstate.SyncStateManager;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.sdk.SyncStatus;
import com.miui.gallery.sdk.uploadstatus.ItemType;
import com.miui.gallery.sdk.uploadstatus.SyncProxy;
import com.miui.gallery.sdk.uploadstatus.UploadStatusItem;
import com.miui.gallery.sdk.uploadstatus.UploadStatusProxy.UploadStatusChangedListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.widget.SortByHeader.SortBy;
import com.miui.gallery.widget.TwoStageDrawer;
import java.util.List;
import java.util.Locale;

public class BackupDetailFragment extends PhotoListFragmentBase implements OnSyncStateChangeObserver, UploadStatusChangedListener {
    private BackupTitle mBackUpTitle;
    /* access modifiers changed from: private */
    public BackupDetailAdapter mBackupDetailAdapter;
    protected LoaderCallbacks mLoaderCallback;
    /* access modifiers changed from: private */
    public List<String> mUploadedItems = Lists.newArrayList();

    static class BackupDetailAdapter extends AlbumDetailSimpleAdapter {
        private static final int COLUMN_INDEX_ALBUM_ID = PROJECTION_INTERNAL.length;
        public static String[] PROJECTION = new String[(PROJECTION_INTERNAL.length + 1)];

        class SecretItem {
            private int mCount;
            private ImageView mSyncIndicator;
            private int mSyncState;
            private int mSyncedCount;
            private TextView mText;

            public SecretItem(View view) {
                this.mText = (TextView) view.findViewById(R.id.secret_count);
                this.mSyncIndicator = (ImageView) view.findViewById(R.id.sync_indicator);
            }

            private void bindSyncState(Context context, int i, boolean z) {
                int i2 = R.drawable.photo_status_sync_succ;
                int i3 = 0;
                Animation animation = null;
                if (i != Integer.MAX_VALUE) {
                    switch (i) {
                        case 0:
                        case 1:
                            if (!z) {
                                if (this.mSyncState != 2) {
                                    i2 = 0;
                                } else {
                                    animation = AnimationUtils.loadAnimation(context, R.anim.photo_status_sync_succ_disappear_anim);
                                }
                                i3 = 8;
                                break;
                            }
                            break;
                        case 2:
                            animation = AnimationUtils.loadAnimation(context, R.anim.photo_status_syncing_rotate_anim);
                            break;
                        case 3:
                            break;
                        case 4:
                            i2 = R.drawable.photo_status_unsyncable;
                            break;
                        default:
                            StringBuilder sb = new StringBuilder();
                            sb.append("unknow status: ");
                            sb.append(i);
                            throw new IllegalArgumentException(sb.toString());
                    }
                    i2 = R.drawable.photo_status_syncable;
                } else {
                    i2 = 0;
                }
                this.mSyncState = i;
                this.mSyncIndicator.setImageResource(i2);
                this.mSyncIndicator.setVisibility(i3);
                if (animation != null) {
                    this.mSyncIndicator.startAnimation(animation);
                } else {
                    this.mSyncIndicator.clearAnimation();
                }
            }

            public void bindView(Context context, Cursor cursor) {
                int i = cursor.getInt(11);
                int i2 = cursor.getInt(8);
                if (!(this.mCount == i && i2 == this.mSyncedCount)) {
                    this.mCount = i;
                    this.mSyncedCount = i2;
                    this.mText.setText(String.format(Locale.US, "%d/%d", new Object[]{Integer.valueOf(this.mSyncedCount), Integer.valueOf(this.mCount)}));
                }
                int access$200 = BackupDetailAdapter.this.getSyncState(cursor);
                if (this.mSyncState != access$200) {
                    bindSyncState(context, access$200, false);
                }
            }
        }

        static {
            System.arraycopy(PROJECTION_INTERNAL, 0, PROJECTION, 0, PROJECTION_INTERNAL.length);
            PROJECTION[PROJECTION_INTERNAL.length] = "localGroupId";
        }

        public BackupDetailAdapter(Context context, DisplayScene displayScene, int i) {
            super(context, displayScene, i);
        }

        private boolean isSecretItem(Cursor cursor) {
            return cursor.getLong(COLUMN_INDEX_ALBUM_ID) == -1000;
        }

        private int mergeSyncState(int i, int i2) {
            switch (i2) {
                case 0:
                case 1:
                    if (i < i2 || i == Integer.MAX_VALUE) {
                        i = i2;
                    }
                    return i;
                case 2:
                    return i2;
                case 3:
                    if (i != 2) {
                        i = i2;
                    }
                    return i;
                case 4:
                    if (!(i == 2 || i == 3)) {
                        i = i2;
                    }
                    return i;
                default:
                    return i;
            }
        }

        public Cursor classifyCursor(Cursor cursor) {
            if (cursor == null || !cursor.moveToFirst()) {
                return null;
            }
            String[] strArr = PROJECTION;
            int length = strArr.length;
            Object[] objArr = new Object[length];
            MatrixCursor matrixCursor = new MatrixCursor(strArr);
            int i = Integer.MAX_VALUE;
            int i2 = 0;
            int i3 = 0;
            do {
                if (isSecretItem(cursor)) {
                    int syncState = getSyncState(cursor);
                    i = mergeSyncState(i, syncState);
                    if (syncState == 0) {
                        i2++;
                    }
                    i3++;
                } else {
                    for (int i4 = 0; i4 < length; i4++) {
                        switch (cursor.getType(i4)) {
                            case 0:
                                objArr[i4] = null;
                                break;
                            case 1:
                                objArr[i4] = Long.valueOf(cursor.getLong(i4));
                                break;
                            case 2:
                                objArr[i4] = Double.valueOf(cursor.getDouble(i4));
                                break;
                            case 3:
                                objArr[i4] = cursor.getString(i4);
                                break;
                        }
                    }
                    matrixCursor.addRow(objArr);
                }
            } while (cursor.moveToNext());
            if (i3 > 0) {
                objArr[0] = Long.valueOf(-1000);
                objArr[8] = Integer.valueOf(i2);
                objArr[11] = Integer.valueOf(i3);
                objArr[12] = Integer.valueOf(i);
                matrixCursor.addRow(objArr);
            }
            return matrixCursor;
        }

        public void doBindData(View view, Context context, Cursor cursor) {
            if (getItemId(cursor.getPosition()) == -1000) {
                ((SecretItem) view.getTag()).bindView(context, cursor);
            } else {
                super.doBindData(view, context, cursor);
            }
        }

        public int getItemViewType(int i) {
            return -1000 == getItemId(i) ? 1 : 0;
        }

        public int getSecretCount() {
            if (getCursor() != null) {
                getCursor().moveToLast();
                if (getCursor().getLong(0) == -1000) {
                    return getCursor().getInt(COLUMN_INDEX_ALBUM_ID);
                }
            }
            return 0;
        }

        public int getViewTypeCount() {
            return 2;
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
            if (getItemViewType(cursor.getPosition()) == 0) {
                return super.newView(context, cursor, viewGroup);
            }
            View inflate = LayoutInflater.from(context).inflate(R.layout.backup_secret_item, viewGroup, false);
            inflate.setTag(new SecretItem(inflate));
            return inflate;
        }

        public boolean supportFoldBurstItems() {
            return false;
        }
    }

    class BackupLoaderCallBack implements LoaderCallbacks {
        BackupLoaderCallBack() {
        }

        /* JADX WARNING: type inference failed for: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(BackupDetailFragment.this.mActivity);
            BackupDetailFragment.this.configLoader(cursorLoader);
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            BackupDetailFragment.this.getAdapter().swapCursor(BackupDetailFragment.this.mBackupDetailAdapter.classifyCursor((Cursor) obj));
            if (BackupDetailFragment.this.getAdapter().getCount() == 0) {
                BackupDetailFragment.this.setEmptyViewVisibility(0);
            } else {
                BackupDetailFragment.this.setEmptyViewVisibility(8);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private int getSyncStateDisplayOptions() {
        return 12;
    }

    private void refreshOnUploadStatusChanged(final UploadStatusItem uploadStatusItem) {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                String localId = SyncProxy.getInstance().getUriAdapter().getLocalId(uploadStatusItem.getUserUri());
                if (uploadStatusItem.getItemType() == ItemType.OWNER) {
                    BackupDetailFragment.this.mUploadedItems.add(localId);
                } else {
                    BackupDetailFragment.this.mUploadedItems.add(String.valueOf(Long.parseLong(localId) + 1073741823));
                }
                if (BackupDetailFragment.this.isAdded()) {
                    CursorLoader cursorLoader = (CursorLoader) BackupDetailFragment.this.getLoader();
                    BackupDetailFragment.this.configLoader(cursorLoader);
                    cursorLoader.onContentChanged();
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public AlbumDetailSimpleAdapter getAdapter() {
        return this.mBackupDetailAdapter;
    }

    /* access modifiers changed from: protected */
    public OnItemClickListener getGridViewOnItemClickListener() {
        return new OnItemClickListener() {
            /* JADX WARNING: type inference failed for: r1v21, types: [android.app.Fragment, com.miui.gallery.ui.BackupDetailFragment] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v21, types: [android.app.Fragment, com.miui.gallery.ui.BackupDetailFragment]
  assigns: [com.miui.gallery.ui.BackupDetailFragment]
  uses: [android.app.Fragment]
  mth insns count: 88
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
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                int i2 = i;
                if (BackupDetailFragment.this.mBackupDetailAdapter.getItemViewType(i2) == 1) {
                    AuthenticatePrivacyPasswordFragment.startAuthenticatePrivacyPassword(BackupDetailFragment.this);
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("(");
                sb.append(BackupDetailFragment.this.getSelection());
                sb.append(") AND (");
                sb.append("localGroupId");
                sb.append(" != ");
                sb.append(-1000);
                sb.append(")");
                String sb2 = sb.toString();
                ImageLoadParams imageLoadParams = new ImageLoadParams(BackupDetailFragment.this.mBackupDetailAdapter.getItemKey(i2), BackupDetailFragment.this.mBackupDetailAdapter.getLocalPath(i2), ThumbConfig.get().sMicroTargetSize, BackupDetailFragment.this.mBackupDetailAdapter.getItemDecodeRectF(i2), i, BackupDetailFragment.this.mBackupDetailAdapter.getMimeType(i2), BackupDetailFragment.this.mBackupDetailAdapter.getItemSecretKey(i2), BackupDetailFragment.this.mBackupDetailAdapter.getFileLength(i2));
                BackupDetailFragment backupDetailFragment = BackupDetailFragment.this;
                Uri uri = BackupDetailFragment.this.getUri();
                IntentUtil.gotoPhotoPage(backupDetailFragment, adapterView, uri, i, BackupDetailFragment.this.mBackupDetailAdapter.getCount() - (BackupDetailFragment.this.mBackupDetailAdapter.getSecretCount() > 0 ? 1 : 0), sb2, BackupDetailFragment.this.getSelectionArgs(), BackupDetailFragment.this.getCurrentSortOrder(), imageLoadParams, BackupDetailFragment.this.mAlbumId, BackupDetailFragment.this.mAlbumName, BackupDetailFragment.this.getSupportOperationMask(), !BackupDetailFragment.this.getAdapter().supportFoldBurstItems());
                GallerySamplingStatHelper.recordNumericPropertyEvent(BackupDetailFragment.this.getPageName(), "click_micro_thumb", (long) i2);
            }
        };
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.backup_detail;
    }

    /* access modifiers changed from: protected */
    public LoaderCallbacks getLoaderCallback() {
        if (this.mLoaderCallback == null) {
            this.mLoaderCallback = new BackupLoaderCallBack();
        }
        return this.mLoaderCallback;
    }

    public String getPageName() {
        return "backup_detail";
    }

    /* access modifiers changed from: protected */
    public String[] getProjection() {
        BackupDetailAdapter backupDetailAdapter = this.mBackupDetailAdapter;
        return BackupDetailAdapter.PROJECTION;
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        StringBuilder sb = new StringBuilder();
        sb.append("alias_sync_state = 3 OR alias_sync_state = 2 OR (alias_sync_state = 0 AND _id IN (");
        sb.append(TextUtils.join(",", this.mUploadedItems));
        sb.append("))");
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return null;
    }

    /* access modifiers changed from: protected */
    public int getSupportOperationMask() {
        return 1024;
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return Media.URI_ALL;
    }

    /* access modifiers changed from: protected */
    public void mayDoAdditionalWork(Cursor cursor) {
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1 && i == 36) {
            StringBuilder sb = new StringBuilder();
            sb.append("(");
            sb.append(getSelection());
            sb.append(") AND (");
            sb.append("localGroupId");
            sb.append(" = ");
            sb.append(-1000);
            sb.append(")");
            String sb2 = sb.toString();
            IntentUtil.gotoPhotoPage(this, null, getUri(), 0, this.mBackupDetailAdapter.getSecretCount(), sb2, getSelectionArgs(), getCurrentSortOrder(), null, this.mAlbumId, this.mAlbumName, getSupportOperationMask(), !getAdapter().supportFoldBurstItems());
            GallerySamplingStatHelper.recordNumericPropertyEvent(getPageName(), "click_micro_thumb", 0);
        }
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        SyncProxy.getInstance().getUploadStatusProxy().addUploadStatusChangedListener(this);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public void onDetach() {
        super.onDetach();
        SyncProxy.getInstance().getUploadStatusProxy().removeUploadStatusChangedListener(this);
    }

    /* JADX WARNING: type inference failed for: r5v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r5v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 30
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
    /* JADX WARNING: Unknown variable types count: 2 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        final View onInflateView = super.onInflateView(layoutInflater, viewGroup, bundle);
        ViewGroup viewGroup2 = (ViewGroup) onInflateView.findViewById(R.id.backup_bar);
        this.mBackUpTitle = (BackupTitle) LayoutInflater.from(this.mActivity).inflate(R.layout.backup_title, viewGroup2, false);
        viewGroup2.addView(this.mBackUpTitle);
        this.mBackupDetailAdapter = new BackupDetailAdapter(this.mActivity, DisplayScene.SCENE_ALWAYS, getSyncStateDisplayOptions());
        this.mBackupDetailAdapter.setCurrentSortBy(SortBy.DATE);
        this.mBackupDetailAdapter.setAlbumType(AlbumType.NORMAL);
        this.mAlbumDetailGridView.setAdapter(this.mBackupDetailAdapter);
        this.mAlbumDetailGridView.setOnItemClickListener(getGridViewOnItemClickListener());
        onInflateView.post(new Runnable() {
            public void run() {
                ((TwoStageDrawer) onInflateView).openDrawer();
            }
        });
        return onInflateView;
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 5
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
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onPause() {
        super.onPause();
        SyncStateManager.getInstance().unregisterSyncStateObserver(this.mActivity, this);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 5
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
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onResume() {
        super.onResume();
        SyncStateManager.getInstance().registerSyncStateObserver(this.mActivity, this);
    }

    public void onSyncStateChanged(SyncStateInfo syncStateInfo) {
        this.mBackUpTitle.refreshSyncState(syncStateInfo);
    }

    public void onUploadStatusChanged(UploadStatusItem uploadStatusItem) {
        if (uploadStatusItem != null && uploadStatusItem.mStatus == SyncStatus.STATUS_SUCCESS) {
            if (uploadStatusItem.getItemType() == ItemType.OWNER || uploadStatusItem.getItemType() == ItemType.SHARER) {
                refreshOnUploadStatusChanged(uploadStatusItem);
            }
        }
    }
}
