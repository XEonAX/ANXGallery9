package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.CheckableAdapter.CheckedItem;
import com.miui.gallery.adapter.RecentDiscoveryAdapter;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.RecentDiscoveredMedia;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.util.AlbumsCursorHelper;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MediaAndAlbumOperations.OnAddAlbumListener;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.ShareAlbumsCursorHelper;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.MultiChoiceModeListener;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class RecentDiscoveryFragment extends BaseMediaFragment {
    protected long mAlbumId;
    protected String mAlbumName;
    private MultiChoiceModeListener mChoiceModeListener = new MultiChoiceModeListener() {
        private MenuItem mAddToAlbum;
        private MenuItem mCreativity;
        private MenuItem mDelete;
        private ActionMode mMode;
        private MenuItem mSend;

        private boolean isMenuItemVisible(MenuItem menuItem) {
            return menuItem != null && menuItem.isVisible();
        }

        private void updateMenuState() {
            if (RecentDiscoveryFragment.this.mGridViewWrapper.getCheckedItemCount() < 1) {
                if (isMenuItemVisible(this.mDelete)) {
                    this.mDelete.setEnabled(false);
                }
                if (isMenuItemVisible(this.mAddToAlbum)) {
                    this.mAddToAlbum.setEnabled(false);
                }
                if (isMenuItemVisible(this.mCreativity)) {
                    this.mCreativity.setEnabled(false);
                }
                if (isMenuItemVisible(this.mSend)) {
                    this.mSend.setEnabled(false);
                    return;
                }
                return;
            }
            if (isMenuItemVisible(this.mDelete)) {
                this.mDelete.setEnabled(true);
            }
            if (isMenuItemVisible(this.mAddToAlbum)) {
                this.mAddToAlbum.setEnabled(true);
            }
            if (isMenuItemVisible(this.mCreativity)) {
                this.mCreativity.setEnabled(true);
            }
            if (isMenuItemVisible(this.mSend)) {
                this.mSend.setEnabled(true);
            }
        }

        /* JADX WARNING: type inference failed for: r2v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r5v25, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 153
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
        /* JADX WARNING: Unknown variable types count: 2 */
        public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            final ActionMode actionMode2 = actionMode;
            int itemId = menuItem.getItemId();
            if (itemId == R.id.action_produce) {
                MediaAndAlbumOperations.doProduceCreation(RecentDiscoveryFragment.this.mActivity, new OnCompleteListener() {
                    public void onComplete(long[] jArr) {
                        List checkedItems = RecentDiscoveryFragment.this.mGridViewWrapper.getCheckedItems();
                        int i = 0;
                        for (int i2 = 0; i2 < checkedItems.size(); i2++) {
                            if (ImageFeatureCacheManager.getInstance().isBestImage(((CheckedItem) checkedItems.get(i2)).getId(), false, false, null)) {
                                i++;
                            }
                        }
                        HashMap hashMap = new HashMap();
                        hashMap.put("count", Integer.valueOf(checkedItems.size()));
                        hashMap.put("best_image_count", Integer.valueOf(i));
                        GallerySamplingStatHelper.recordCountEvent("recent_album", "produce", hashMap);
                        actionMode2.finish();
                    }
                }, RecentDiscoveryFragment.this.mGridViewWrapper.getCheckedItems());
            } else if (itemId == R.id.action_send) {
                SparseBooleanArray checkedItemPositions = RecentDiscoveryFragment.this.mGridViewWrapper.getCheckedItemPositions();
                ArrayList arrayList = new ArrayList(checkedItemPositions.size());
                ArrayList arrayList2 = new ArrayList(checkedItemPositions.size());
                int i = Integer.MAX_VALUE;
                for (int i2 = 0; i2 < checkedItemPositions.size(); i2++) {
                    int keyAt = checkedItemPositions.keyAt(i2);
                    if (checkedItemPositions.get(keyAt)) {
                        arrayList.add(Integer.valueOf(keyAt));
                        arrayList2.add(Long.valueOf(RecentDiscoveryFragment.this.getAdapter().getItemKey(keyAt)));
                        if (keyAt < i) {
                            i = keyAt;
                        }
                    }
                }
                int[] iArr = new int[arrayList.size()];
                long[] jArr = new long[arrayList2.size()];
                for (int i3 = 0; i3 < arrayList.size(); i3++) {
                    iArr[i3] = ((Integer) arrayList.get(i3)).intValue();
                    jArr[i3] = ((Long) arrayList2.get(i3)).longValue();
                }
                if (i == Integer.MAX_VALUE) {
                    i = 0;
                }
                if (iArr.length > 0 && RecentDiscoveryFragment.this.getAdapter().getCount() > 0) {
                    ImageLoadParams imageLoadParams = new ImageLoadParams(RecentDiscoveryFragment.this.getAdapter().getItemKey(i), RecentDiscoveryFragment.this.getAdapter().getLocalPath(i), ThumbConfig.get().sMicroRecentTargetSize, RecentDiscoveryFragment.this.getAdapter().getItemDecodeRectF(i), i, RecentDiscoveryFragment.this.getAdapter().getMimeType(i), RecentDiscoveryFragment.this.getAdapter().getItemSecretKey(i), RecentDiscoveryFragment.this.getAdapter().getFileLength(i));
                    IntentUtil.gotoPreviewSelectPage(RecentDiscoveryFragment.this, RecentDiscoveryFragment.this.getUri(), i, RecentDiscoveryFragment.this.getAdapter().getCount(), RecentDiscoveryFragment.this.getSelection(), RecentDiscoveryFragment.this.getSelectionArgs(), RecentDiscoveryFragment.this.getSortOrder(), imageLoadParams, jArr, iArr);
                }
                actionMode.finish();
                GallerySamplingStatHelper.recordCountEvent("recent_album", "send");
            } else if (itemId == R.id.add_to_album) {
                MediaAndAlbumOperations.addToAlbum(RecentDiscoveryFragment.this.mActivity, new OnAddAlbumListener() {
                    public final void onComplete(long[] jArr, boolean z) {
                        AnonymousClass2.this.mMode.finish();
                    }
                }, 0, true, true, RecentDiscoveryFragment.this.mGridViewWrapper.isCheckedItemContainVideo(), RecentDiscoveryFragment.this.mGridViewWrapper.getCheckedItemIds());
                GallerySamplingStatHelper.recordCountEvent("recent_album", "add_to_album");
            } else if (itemId != R.id.delete) {
                return false;
            } else {
                RecentDiscoveryFragment.this.doDelete(actionMode2);
                GallerySamplingStatHelper.recordCountEvent("recent_album", "delete_photo");
            }
            SparseBooleanArray checkedItemPositions2 = RecentDiscoveryFragment.this.mGridViewWrapper.getCheckedItemPositions();
            ArrayList arrayList3 = new ArrayList();
            for (int i4 = 0; i4 < checkedItemPositions2.size(); i4++) {
                int keyAt2 = checkedItemPositions2.keyAt(i4);
                if (checkedItemPositions2.get(keyAt2)) {
                    arrayList3.add(Integer.valueOf(keyAt2));
                }
            }
            RecentDiscoveryAdapter adapter = RecentDiscoveryFragment.this.getAdapter();
            Iterator it = arrayList3.iterator();
            while (it.hasNext()) {
                long dateModified = adapter.getDateModified(((Integer) it.next()).intValue());
                if (dateModified < RecentDiscoveryFragment.this.mOldestDateModified) {
                    RecentDiscoveryFragment.this.mOldestDateModified = dateModified;
                }
            }
            return true;
        }

        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            updateMenuState();
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 35
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
        public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
            this.mMode = actionMode;
            actionMode.getMenuInflater().inflate(BuildUtil.isMiuiSdkGte15(RecentDiscoveryFragment.this.mActivity) ? R.menu.v15_home_page_menu : R.menu.home_page_menu, menu);
            this.mAddToAlbum = menu.findItem(R.id.add_to_album);
            this.mCreativity = menu.findItem(R.id.action_produce);
            this.mDelete = menu.findItem(R.id.delete);
            if (this.mCreativity != null) {
                this.mCreativity.setVisible(true);
            }
            if (this.mDelete != null) {
                this.mDelete.setVisible(true);
            }
            this.mSend = menu.findItem(R.id.action_send);
            GallerySamplingStatHelper.recordCountEvent("recent_album", "action_mode_create");
            GallerySamplingStatHelper.recordNumericPropertyEvent("best_image", "best_image_count", (long) ImageFeatureCacheManager.getInstance().getBestImageCount(false));
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            updateMenuState();
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            return false;
        }
    };
    protected View mEmptyView;
    protected StickyGridHeadersGridView mGridView;
    protected EditableListViewWrapperDeprecated mGridViewWrapper;
    protected LoaderCallbacks mLoaderCallbacks;
    /* access modifiers changed from: private */
    public long mOldestDateModified = Long.MAX_VALUE;
    /* access modifiers changed from: private */
    public RecentDiscoveryAdapter mRecentDiscoveryAdapter;

    private class RecentDiscoveryLoaderCallback implements LoaderCallbacks {
        private RecentDiscoveryLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 28
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
            CursorLoader cursorLoader = new CursorLoader(RecentDiscoveryFragment.this.mActivity);
            switch (i) {
                case 1:
                    cursorLoader.setUri(RecentDiscoveryFragment.this.getUri());
                    cursorLoader.setProjection(RecentDiscoveryAdapter.PROJECTION);
                    cursorLoader.setSortOrder(RecentDiscoveryFragment.this.getSortOrder());
                    break;
                case 2:
                    cursorLoader.setUri(Album.URI_SHARE_ALL);
                    cursorLoader.setProjection(ShareAlbumsCursorHelper.SHARED_ALBUM_PROJECTION);
                    cursorLoader.setSelection("count > 0");
                    break;
                case 3:
                    cursorLoader.setUri(Album.URI_NO_COVERS.buildUpon().appendQueryParameter("join_share", "true").build());
                    cursorLoader.setProjection(AlbumsCursorHelper.ALL_ALBUMS_PROJECTION);
                    break;
            }
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            switch (loader.getId()) {
                case 1:
                    RecentDiscoveryFragment.this.getAdapter().swapCursor((Cursor) obj);
                    if (RecentDiscoveryFragment.this.getAdapter().getCount() == 0) {
                        RecentDiscoveryFragment.this.setEmptyViewVisibility(0);
                        return;
                    } else {
                        RecentDiscoveryFragment.this.setEmptyViewVisibility(8);
                        return;
                    }
                case 2:
                    RecentDiscoveryFragment.this.getAdapter().setShareAlbums((Cursor) obj);
                    return;
                case 3:
                    RecentDiscoveryFragment.this.getAdapter().setAllAlbums((Cursor) obj);
                    return;
                default:
                    return;
            }
        }

        public void onLoaderReset(Loader loader) {
            switch (loader.getId()) {
                case 1:
                    RecentDiscoveryFragment.this.getAdapter().changeCursor(null);
                    RecentDiscoveryFragment.this.setEmptyViewVisibility(0);
                    return;
                case 2:
                    RecentDiscoveryFragment.this.getAdapter().resetShareAlbums();
                    return;
                case 3:
                    RecentDiscoveryFragment.this.getAdapter().setAllAlbums(null);
                    return;
                default:
                    return;
            }
        }
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 18
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
    public void doDelete(final ActionMode actionMode) {
        long[] checkedItemIds = this.mGridViewWrapper.getCheckedItemIds();
        if (checkedItemIds == null || checkedItemIds.length <= 0) {
            ToastUtils.makeText((Context) this.mActivity, (CharSequence) getString(R.string.delete_other_shared_images));
            actionMode.finish();
            return;
        }
        MediaAndAlbumOperations.delete(this.mActivity, "RecentDiscoveryFragmentDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
            /* JADX WARNING: type inference failed for: r7v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: type inference failed for: r6v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 19
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
            /* JADX WARNING: Unknown variable types count: 2 */
            public void onDeleted(int i, long[] jArr) {
                if (RecentDiscoveryFragment.this.mActivity != null) {
                    ToastUtils.makeText((Context) RecentDiscoveryFragment.this.mActivity, (CharSequence) RecentDiscoveryFragment.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                    if (i > 0) {
                        SoundUtils.playSoundForOperation(RecentDiscoveryFragment.this.mActivity, 0);
                    }
                    actionMode.finish();
                }
            }
        }, this.mAlbumId, this.mAlbumName, getDupType(), 29, checkedItemIds);
    }

    private void recordOldestOperatedPicture() {
        if (this.mOldestDateModified < Long.MAX_VALUE) {
            HashMap hashMap = new HashMap();
            hashMap.put("days_ago", String.valueOf((System.currentTimeMillis() - this.mOldestDateModified) / 86400000));
            GallerySamplingStatHelper.recordCountEvent("recent_album", "recent_album_oldest_operated_picture", hashMap);
        }
    }

    private void recordPageEnterSource() {
        Uri data = this.mActivity.getIntent().getData();
        if (data != null) {
            String queryParameter = data.getQueryParameter("source");
            HashMap hashMap = new HashMap();
            String str = "source";
            if (queryParameter == null) {
                queryParameter = "unknown";
            }
            hashMap.put(str, queryParameter);
            GallerySamplingStatHelper.recordCountEvent("recent_album", "recent_album_enter_source", hashMap);
        }
    }

    private void updateConfiguration(Configuration configuration) {
        this.mGridView.setNumColumns(configuration.orientation == 2 ? ThumbConfig.get().sMicroThumbRecentColumnsLand : ThumbConfig.get().sMicroThumbRecentColumnsPortrait);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 7
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
    /* JADX WARNING: Unknown variable types count: 1 */
    public RecentDiscoveryAdapter getAdapter() {
        if (this.mRecentDiscoveryAdapter == null) {
            this.mRecentDiscoveryAdapter = new RecentDiscoveryAdapter(this.mActivity);
        }
        return this.mRecentDiscoveryAdapter;
    }

    /* access modifiers changed from: protected */
    public int getDupType() {
        return getUri().getBooleanQueryParameter("remove_duplicate_items", false) ? 2 : 0;
    }

    /* access modifiers changed from: protected */
    public OnItemClickListener getGridViewOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                int i2 = i;
                RecentDiscoveryAdapter adapter = RecentDiscoveryFragment.this.getAdapter();
                ImageLoadParams imageLoadParams = new ImageLoadParams(adapter.getItemKey(i2), adapter.getLocalPath(i2), ThumbConfig.get().sMicroRecentTargetSize, adapter.getItemDecodeRectF(i2), i, adapter.getMimeType(i2), adapter.getItemSecretKey(i2), adapter.getFileLength(i2));
                RecentDiscoveryFragment recentDiscoveryFragment = RecentDiscoveryFragment.this;
                Uri uri = RecentDiscoveryFragment.this.getUri();
                int count = adapter.getCount();
                String selection = RecentDiscoveryFragment.this.getSelection();
                String[] selectionArgs = RecentDiscoveryFragment.this.getSelectionArgs();
                String sortOrder = RecentDiscoveryFragment.this.getSortOrder();
                long j2 = RecentDiscoveryFragment.this.mAlbumId;
                String str = RecentDiscoveryFragment.this.mAlbumName;
                int supportOperationMask = RecentDiscoveryFragment.this.getSupportOperationMask();
                boolean z = !RecentDiscoveryFragment.this.mRecentDiscoveryAdapter.supportFoldBurstItems();
                RecentDiscoveryAdapter recentDiscoveryAdapter = adapter;
                IntentUtil.gotoPhotoPage(recentDiscoveryFragment, adapterView, uri, i, count, selection, selectionArgs, sortOrder, imageLoadParams, j2, str, supportOperationMask, z);
                long dateModified = recentDiscoveryAdapter.getDateModified(i2);
                if (dateModified < RecentDiscoveryFragment.this.mOldestDateModified) {
                    RecentDiscoveryFragment.this.mOldestDateModified = dateModified;
                }
                GallerySamplingStatHelper.recordNumericPropertyEvent(RecentDiscoveryFragment.this.getPageName(), "click_micro_thumb", (long) i2);
            }
        };
    }

    /* access modifiers changed from: protected */
    public Loader getLoader() {
        return null;
    }

    /* access modifiers changed from: protected */
    public LoaderCallbacks getLoaderCallback() {
        if (this.mLoaderCallbacks == null) {
            this.mLoaderCallbacks = new RecentDiscoveryLoaderCallback();
        }
        return this.mLoaderCallbacks;
    }

    /* access modifiers changed from: protected */
    public List<Loader> getLoaders() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(getLoaderManager().getLoader(1));
        arrayList.add(getLoaderManager().getLoader(3));
        arrayList.add(getLoaderManager().getLoader(2));
        return arrayList;
    }

    public String getPageName() {
        return "album_recent";
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getSortOrder() {
        return "dateModified DESC";
    }

    /* access modifiers changed from: protected */
    public int getSupportOperationMask() {
        return -1;
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return RecentDiscoveredMedia.URI.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).build();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        getLoaderManager().initLoader(1, null, getLoaderCallback());
        getLoaderManager().initLoader(2, null, getLoaderCallback());
        getLoaderManager().initLoader(3, null, getLoaderCallback());
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration(configuration);
        this.mGridView.setSelection(this.mGridView.getFirstVisiblePosition());
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        recordPageEnterSource();
    }

    public void onDestroy() {
        recordOldestOperatedPicture();
        if (this.mRecentDiscoveryAdapter != null) {
            this.mRecentDiscoveryAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.album_recent, viewGroup, false);
        this.mAlbumName = getResources().getString(R.string.album_name_recent_discovery);
        this.mAlbumId = 2147483644;
        this.mGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid);
        this.mEmptyView = inflate.findViewById(16908292);
        this.mGridViewWrapper = new EditableListViewWrapperDeprecated(this.mGridView);
        this.mGridViewWrapper.setEmptyView(this.mEmptyView);
        this.mGridViewWrapper.setAdapter(getAdapter());
        this.mGridViewWrapper.setOnItemClickListener(getGridViewOnItemClickListener());
        this.mGridViewWrapper.setChoiceMode(3);
        this.mGridViewWrapper.setMultiChoiceModeListener(this.mChoiceModeListener);
        this.mGridView.setHeadersIgnorePadding(true);
        setEmptyViewVisibility(8);
        updateConfiguration(getResources().getConfiguration());
        return inflate;
    }

    /* access modifiers changed from: protected */
    public void setEmptyViewVisibility(int i) {
        if (this.mEmptyView != null) {
            this.mEmptyView.setVisibility(i);
        }
    }
}
