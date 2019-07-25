package com.miui.gallery.card.ui.detail;

import android.animation.ObjectAnimator;
import android.app.ActionBar.LayoutParams;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Loader;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.flexbox.FlexboxItemDecoration;
import com.google.android.flexbox.FlexboxLayoutManager;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.HeaderFooterRecyclerAdapterWrapper;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.model.TinyImageFeature;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.card.core.LayoutParamsHelper.Size;
import com.miui.gallery.card.model.MediaInfo;
import com.miui.gallery.card.model.MediaInfoScoreComparator;
import com.miui.gallery.card.model.MediaInfoTimeComparator;
import com.miui.gallery.card.ui.detail.CardDownloadDialog.CallBack;
import com.miui.gallery.card.ui.detail.StoryAlbumRenameDialog.OnRenameDoneListener;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.picker.uri.DownloadConfirmDialog;
import com.miui.gallery.picker.uri.Downloader;
import com.miui.gallery.picker.uri.Downloader.DownloadListener;
import com.miui.gallery.picker.uri.Downloader.DownloadResult;
import com.miui.gallery.picker.uri.Downloader.DownloadTask;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.BaseMediaFragment;
import com.miui.gallery.ui.ConfirmDialog;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapper;
import com.miui.gallery.widget.editwrapper.MultiChoiceModeListener;
import com.miui.gallery.widget.menu.ImmersionMenu;
import com.miui.gallery.widget.menu.ImmersionMenuItem;
import com.miui.gallery.widget.menu.ImmersionMenuListener;
import com.miui.gallery.widget.menu.PhoneImmersionMenu;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.miui.gallery.widget.recyclerview.ItemClickSupport.OnItemClickListener;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import miui.app.Activity;

public class StoryAlbumFragment extends BaseMediaFragment {
    /* access modifiers changed from: private */
    public ActionBarHelper mActionBarHelper;
    /* access modifiers changed from: private */
    public StoryAlbumAdapter mAdapter;
    /* access modifiers changed from: private */
    public StoryAlbumAdapterWrapper mAdapterWrapper;
    private OnClickListener mCancelDownloadListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            if (StoryAlbumFragment.this.mDownloader != null) {
                StoryAlbumFragment.this.mDownloader.cancel();
            }
        }
    };
    /* access modifiers changed from: private */
    public Card mCard;
    private TextView mCardDescription;
    /* access modifiers changed from: private */
    public CardDownloadDialog mCardDownloadDialog;
    private long mCardId;
    private TextView mCardTitle;
    /* access modifiers changed from: private */
    public Future<Object> mCheckDownloadFilesFuture;
    private MultiChoiceModeListener mChoiceModeListener = new MultiChoiceModeListener() {
        private MenuItem mRemove;
        private MenuItem mShare;

        private void gotoPreviewSelectPage(ArrayList<Integer> arrayList, ArrayList<Long> arrayList2, int i) {
            int i2 = i;
            if (arrayList.size() != 0) {
                int[] iArr = new int[arrayList.size()];
                long[] jArr = new long[arrayList2.size()];
                for (int i3 = 0; i3 < arrayList.size(); i3++) {
                    iArr[i3] = ((Integer) arrayList.get(i3)).intValue();
                    jArr[i3] = ((Long) arrayList2.get(i3)).longValue();
                }
                ImageLoadParams imageLoadParams = new ImageLoadParams(StoryAlbumFragment.this.mAdapter.getItemKey(i2), StoryAlbumFragment.this.mAdapter.getLocalPath(i2), ThumbConfig.get().sMicroTargetSize, StoryAlbumFragment.this.mAdapter.getItemDecodeRectF(i2), i, StoryAlbumFragment.this.mAdapter.getMimeType(i2), StoryAlbumFragment.this.mAdapter.getFileLength(i2));
                IntentUtil.gotoPreviewSelectPage(StoryAlbumFragment.this, StoryAlbumFragment.this.getUri(), i, StoryAlbumFragment.this.mAdapter.getItemCount(), StoryAlbumFragment.this.getSelection(), StoryAlbumFragment.this.getSelectionArgs(), StoryAlbumFragment.this.getOrder(), imageLoadParams, jArr, iArr, null, null);
                StoryAlbumFragment.this.mListViewWrapper.stopActionMode();
                HashMap hashMap = new HashMap();
                hashMap.put("scenarioId", String.valueOf(StoryAlbumFragment.this.mCard.getScenarioId()));
                GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_share_photos", hashMap);
            }
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 12
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
        private void removeItemByIds(final ArrayList<String> arrayList) {
            DialogUtil.showConfirmAlertWithCancel(StoryAlbumFragment.this.mActivity, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    StoryAlbumFragment.this.mListViewWrapper.stopActionMode();
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        StoryAlbumFragment.this.mSelectedPhotoSha1s.remove((String) it.next());
                    }
                    StoryAlbumFragment.this.getLoaderManager().restartLoader(1, null, StoryAlbumFragment.this.mPhotoLoaderCallback);
                    HashMap hashMap = new HashMap();
                    hashMap.put("count", String.valueOf(arrayList.size()));
                    hashMap.put("scenarioId", String.valueOf(StoryAlbumFragment.this.mCard.getScenarioId()));
                    GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_remove_photos", hashMap);
                }
            }, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }
            }, StoryAlbumFragment.this.getString(R.string.story_remove_confirm_title), StoryAlbumFragment.this.getString(R.string.story_remove_confirm_message), StoryAlbumFragment.this.getString(R.string.story_remove_confirm_positive), 17039360);
        }

        private void updateMenuState() {
            if (StoryAlbumFragment.this.mListViewWrapper.getCheckedItemCount() < 1) {
                this.mShare.setEnabled(false);
                this.mRemove.setEnabled(false);
                return;
            }
            this.mShare.setEnabled(true);
            this.mRemove.setEnabled(true);
        }

        public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            SparseBooleanArray checkedItemPositions = StoryAlbumFragment.this.mListViewWrapper.getCheckedItemPositions();
            ArrayList arrayList = new ArrayList(checkedItemPositions.size());
            ArrayList arrayList2 = new ArrayList(checkedItemPositions.size());
            ArrayList arrayList3 = new ArrayList(checkedItemPositions.size());
            int i = Integer.MAX_VALUE;
            for (int i2 = 0; i2 < checkedItemPositions.size(); i2++) {
                int keyAt = checkedItemPositions.keyAt(i2);
                if (checkedItemPositions.get(keyAt)) {
                    int wrappedAdapterPosition = StoryAlbumFragment.this.mAdapterWrapper.getWrappedAdapterPosition(keyAt);
                    arrayList.add(Integer.valueOf(wrappedAdapterPosition));
                    arrayList2.add(StoryAlbumFragment.this.mAdapter.getSha1(wrappedAdapterPosition));
                    arrayList3.add(Long.valueOf(StoryAlbumFragment.this.mAdapter.getItemKey(wrappedAdapterPosition)));
                    if (wrappedAdapterPosition < i) {
                        i = wrappedAdapterPosition;
                    }
                }
            }
            if (i == Integer.MAX_VALUE) {
                i = 0;
            }
            int itemId = menuItem.getItemId();
            if (itemId == R.id.action_remove) {
                removeItemByIds(arrayList2);
            } else if (itemId != R.id.action_share) {
                return false;
            } else {
                gotoPreviewSelectPage(arrayList, arrayList3, i);
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
  mth insns count: 24
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
            actionMode.getMenuInflater().inflate(BuildUtil.isMiuiSdkGte15(StoryAlbumFragment.this.mActivity) ? R.menu.v15_story_album_action_menu : R.menu.story_album_action_menu, menu);
            this.mRemove = menu.findItem(R.id.action_remove);
            this.mShare = menu.findItem(R.id.action_share);
            updateMenuState();
            StoryAlbumFragment.this.mIsInActionMode = true;
            StoryAlbumFragment.this.updateSlideHeaderPlayStatus();
            ThreadManager.getMainHandler().post(new Runnable() {
                /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 14
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
                public void run() {
                    if (StoryAlbumFragment.this.mActivity != null) {
                        StoryAlbumFragment.this.mRecyclerView.setPadding(0, 0, 0, MiscUtil.getDefaultSplitActionBarHeight(StoryAlbumFragment.this.mActivity));
                    }
                }
            });
            StoryAlbumFragment.this.mActionBarHelper.refreshActionBar();
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
            StoryAlbumFragment.this.mIsInActionMode = false;
            StoryAlbumFragment.this.updateSlideHeaderPlayStatus();
            ThreadManager.getMainHandler().post(new Runnable() {
                public void run() {
                    if (StoryAlbumFragment.this.mActivity != null) {
                        StoryAlbumFragment.this.mRecyclerView.setPadding(0, 0, 0, 0);
                    }
                }
            });
            StoryAlbumFragment.this.mActionBarHelper.refreshActionBar();
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            updateMenuState();
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            return false;
        }
    };
    /* access modifiers changed from: private */
    public Future<Object> mDowloadResultFuture;
    private CallBack mDownloadCallback = new CallBack() {
        public void cancel() {
            if (StoryAlbumFragment.this.mDownloader != null) {
                StoryAlbumFragment.this.mDownloader.cancel();
            }
        }
    };
    private OnClickListener mDownloadListener = new OnClickListener() {
        /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 11
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
        public void onClick(DialogInterface dialogInterface, int i) {
            if (!NetworkUtils.isNetworkConnected()) {
                ToastUtils.makeText((Context) StoryAlbumFragment.this.mActivity, (int) R.string.picker_no_network_message);
                StoryAlbumFragment.this.showConfirmDialog(true);
                return;
            }
            StoryAlbumFragment.this.startDownload();
        }
    };
    /* access modifiers changed from: private */
    public ArrayList<DownloadTask> mDownloadPendings = new ArrayList<>();
    /* access modifiers changed from: private */
    public Downloader mDownloader;
    /* access modifiers changed from: private */
    public int mFlexboxLayoutHeight;
    private FlexboxLayoutManager mFlexboxLayoutManager;
    /* access modifiers changed from: private */
    public View mHeaderView;
    private List<MediaInfo> mImageInfos;
    /* access modifiers changed from: private */
    public boolean mIsInActionMode;
    /* access modifiers changed from: private */
    public boolean mIsNightMode;
    /* access modifiers changed from: private */
    public boolean mIsPlayIconScrollStateEnable = true;
    /* access modifiers changed from: private */
    public boolean mIsShowTranslucentStatusBar;
    /* access modifiers changed from: private */
    public EditableListViewWrapper mListViewWrapper;
    private OnGlobalLayoutListener mOnGlobalLayoutListener = new OnGlobalLayoutListener() {
        public void onGlobalLayout() {
            if (StoryAlbumFragment.this.mFlexboxLayoutHeight == 0) {
                StoryAlbumFragment.this.mRecyclerView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                StoryAlbumFragment.this.updateFlexBoxLayoutParamHelper();
            }
        }
    };
    /* access modifiers changed from: private */
    public ArrayList<ParseFileMetaValue> mParseFileMetaValues = new ArrayList<>();
    /* access modifiers changed from: private */
    public PhotoLoaderCallback mPhotoLoaderCallback;
    /* access modifiers changed from: private */
    public GalleryRecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public Uri[] mResults;
    /* access modifiers changed from: private */
    public Set<String> mSelectedPhotoSha1s;
    /* access modifiers changed from: private */
    public SlideShowHeaderView mSlideShowHeaderView;

    private class ActionBarHelper {
        private final int[] ATTRS;
        private final long TITLE_ANIM_DURATION;
        private ImageView mBackView;
        private Drawable mDefaultActionBarBg;
        private final ImmersionMenuListener mImmersionMenuListener;
        private Button mMenuView;
        /* access modifiers changed from: private */
        public PhoneImmersionMenu mPhoneImmersionMenu;
        private ObjectAnimator mTitleAlphaAnim;
        private TextView mTitleView;

        private ActionBarHelper() {
            this.ATTRS = new int[]{miui.R.attr.actionBarBackground};
            this.TITLE_ANIM_DURATION = 150;
            this.mImmersionMenuListener = new ImmersionMenuListener() {
                public void onCreateImmersionMenu(ImmersionMenu immersionMenu) {
                    if (StoryAlbumFragment.this.mActivity != null) {
                        immersionMenu.add(R.id.menu_card_rename, StoryAlbumFragment.this.mActivity.getString(R.string.story_option_menu_rename));
                        if (StoryAlbumFragment.this.mCard.isDeletable()) {
                            immersionMenu.add(R.id.menu_card_delete, StoryAlbumFragment.this.mActivity.getString(R.string.story_option_menu_delete));
                        }
                    }
                }

                public void onImmersionMenuSelected(ImmersionMenu immersionMenu, ImmersionMenuItem immersionMenuItem) {
                    if (StoryAlbumFragment.this.mActivity != null) {
                        switch (immersionMenuItem.getItemId()) {
                            case R.id.menu_card_delete /*2131296705*/:
                                ActionBarHelper.this.showDeleteCardConfirmDialog();
                                break;
                            case R.id.menu_card_rename /*2131296706*/:
                                ActionBarHelper.this.renameCard();
                                break;
                        }
                    }
                }

                public boolean onPrepareImmersionMenu(ImmersionMenu immersionMenu) {
                    return false;
                }
            };
        }

        /* access modifiers changed from: private */
        public void deleteCard() {
            ThreadManager.getMiscPool().submit(new Job<Object>() {
                public Object run(JobContext jobContext) {
                    CardManager.getInstance().delete(StoryAlbumFragment.this.mCard, true);
                    CardManager.getInstance().recordCardDeleteReason("userDelete");
                    return null;
                }
            });
            HashMap hashMap = new HashMap();
            hashMap.put("scenarioId", String.valueOf(StoryAlbumFragment.this.mCard.getScenarioId()));
            GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_deleted", hashMap);
        }

        /* JADX WARNING: type inference failed for: r2v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v5, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 47
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
        public void inflateTitle() {
            TypedArray obtainStyledAttributes = StoryAlbumFragment.this.mActivity.obtainStyledAttributes(this.ATTRS);
            this.mDefaultActionBarBg = obtainStyledAttributes.getDrawable(0);
            obtainStyledAttributes.recycle();
            View inflate = StoryAlbumFragment.this.mActivity.getLayoutInflater().inflate(R.layout.story_album_actionbar_content, null);
            inflate.setLayoutParams(new LayoutParams(-1, -1));
            this.mBackView = (ImageView) inflate.findViewById(R.id.back);
            this.mBackView.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    StoryAlbumFragment.this.mActivity.finish();
                }
            });
            this.mTitleView = (TextView) inflate.findViewById(R.id.title);
            this.mTitleView.setAlpha(0.0f);
            this.mMenuView = (Button) inflate.findViewById(R.id.more);
            this.mPhoneImmersionMenu = new PhoneImmersionMenu(StoryAlbumFragment.this.mActivity, this.mImmersionMenuListener);
            this.mMenuView.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ActionBarHelper.this.mPhoneImmersionMenu.show(view, null);
                }
            });
            StoryAlbumFragment.this.mActivity.getActionBar().setDisplayOptions(16, 16);
            StoryAlbumFragment.this.mActivity.getActionBar().setCustomView(inflate);
            StoryAlbumFragment.this.mIsShowTranslucentStatusBar = true;
            refreshActionBar();
        }

        /* access modifiers changed from: private */
        public void refreshActionBar() {
            if (StoryAlbumFragment.this.mActivity != null) {
                int i = 1;
                if (StoryAlbumFragment.this.mIsShowTranslucentStatusBar || StoryAlbumFragment.this.mIsNightMode) {
                    Activity activity = StoryAlbumFragment.this.getActivity();
                    if (!StoryAlbumFragment.this.mIsInActionMode || StoryAlbumFragment.this.mIsNightMode) {
                        i = 2;
                    }
                    activity.setTranslucentStatus(i);
                    this.mBackView.setImageResource(miui.R.drawable.action_bar_back_dark);
                    this.mTitleView.setTextColor(StoryAlbumFragment.this.mActivity.getResources().getColor(R.color.action_bar_title_text_color_dark));
                    this.mMenuView.setBackgroundResource(miui.R.drawable.action_mode_immersion_more_dark);
                    StoryAlbumFragment.this.mActivity.getActionBar().setBackgroundDrawable(StoryAlbumFragment.this.mIsShowTranslucentStatusBar ? null : this.mDefaultActionBarBg);
                } else {
                    StoryAlbumFragment.this.getActivity().setTranslucentStatus(1);
                    this.mBackView.setImageResource(miui.R.drawable.action_bar_back_light);
                    this.mTitleView.setTextColor(StoryAlbumFragment.this.mActivity.getResources().getColor(R.color.action_bar_title_text_color_light));
                    this.mMenuView.setBackgroundResource(miui.R.drawable.action_mode_immersion_more_light);
                    StoryAlbumFragment.this.mActivity.getActionBar().setBackgroundDrawable(this.mDefaultActionBarBg);
                }
            }
        }

        /* access modifiers changed from: private */
        public void renameCard() {
            StoryAlbumRenameDialog storyAlbumRenameDialog = new StoryAlbumRenameDialog();
            Bundle bundle = new Bundle();
            bundle.putString("card_name", StoryAlbumFragment.this.mCard.getTitle());
            storyAlbumRenameDialog.setArguments(bundle);
            storyAlbumRenameDialog.setOnRenameDoneListener(new OnRenameDoneListener() {
                public void onOperationDone(String str) {
                    StoryAlbumFragment.this.mCard.setTitle(str);
                    if (StoryAlbumFragment.this.mActivity != null) {
                        StoryAlbumFragment.this.setTitle(str);
                    }
                    StoryAlbumFragment.this.saveAndNotify();
                    HashMap hashMap = new HashMap();
                    hashMap.put("scenarioId", String.valueOf(StoryAlbumFragment.this.mCard.getScenarioId()));
                    GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_rename", hashMap);
                }
            });
            storyAlbumRenameDialog.showAllowingStateLoss(StoryAlbumFragment.this.getFragmentManager(), "StoryAlbumRenameDialog");
        }

        /* access modifiers changed from: private */
        public void showDeleteCardConfirmDialog() {
            ConfirmDialog.showConfirmDialog(StoryAlbumFragment.this.mActivity.getFragmentManager(), StoryAlbumFragment.this.mActivity.getString(R.string.card_delete_title), StoryAlbumFragment.this.mActivity.getString(R.string.card_delete_description), StoryAlbumFragment.this.mActivity.getString(R.string.card_delete_negative_text), StoryAlbumFragment.this.mActivity.getString(R.string.card_delete_positive_text), new ConfirmDialogInterface() {
                public void onCancel(DialogFragment dialogFragment) {
                }

                public void onConfirm(DialogFragment dialogFragment) {
                    ActionBarHelper.this.deleteCard();
                    StoryAlbumFragment.this.mActivity.finish();
                }
            });
        }

        public int getActionBarHeight() {
            return StoryAlbumFragment.this.mActivity.getActionBar().getCustomView().getHeight();
        }

        public void setActionBarTitle(String str) {
            this.mTitleView.setText(str);
        }

        public void startActionBarTitleAnim(boolean z) {
            if (this.mTitleAlphaAnim != null && this.mTitleAlphaAnim.isRunning()) {
                this.mTitleAlphaAnim.cancel();
            }
            if (z) {
                this.mTitleAlphaAnim = ObjectAnimator.ofFloat(this.mTitleView, "alpha", new float[]{this.mTitleView.getAlpha(), 1.0f});
            } else {
                this.mTitleAlphaAnim = ObjectAnimator.ofFloat(this.mTitleView, "alpha", new float[]{this.mTitleView.getAlpha(), 0.0f});
            }
            this.mTitleAlphaAnim.setDuration(150);
            this.mTitleAlphaAnim.start();
        }
    }

    private class DownloadProgressListener implements DownloadListener {
        private int total;

        private DownloadProgressListener() {
        }

        private void parseDownloadResult(final List<DownloadResult> list, final List<DownloadResult> list2) {
            StoryAlbumFragment.this.mDowloadResultFuture = ThreadManager.getMiscPool().submit(new Job<Object>() {
                public Object run(JobContext jobContext) {
                    ArrayList arrayList = new ArrayList();
                    arrayList.addAll(list2);
                    for (DownloadResult downloadResult : list) {
                        File file = new File(downloadResult.mPath);
                        if (file.exists()) {
                            StoryAlbumFragment.this.mResults[downloadResult.mTask.mPosition] = Uri.fromFile(file);
                        } else {
                            arrayList.add(downloadResult);
                        }
                    }
                    return null;
                }
            }, new FutureHandler<Object>() {
                public void onPostExecute(Future<Object> future) {
                    StoryAlbumFragment.this.getLoaderManager().restartLoader(1, null, StoryAlbumFragment.this.mPhotoLoaderCallback);
                }
            });
        }

        public void onCancelled(List<DownloadResult> list, List<DownloadResult> list2) {
            Log.d("StoryAlbumFragment", "download cancelled, success: %d, fails: %d", Integer.valueOf(list.size()), Integer.valueOf(list2.size()));
            StoryAlbumFragment.this.mCardDownloadDialog.dismissSafely();
            StoryAlbumFragment.this.mCardDownloadDialog = null;
            parseDownloadResult(list, list2);
            StoryAlbumFragment.this.mDownloader.destroy();
            StoryAlbumFragment.this.mDownloader = null;
        }

        /* JADX WARNING: type inference failed for: r5v16, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v16, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 52
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
        public void onEnd(List<DownloadResult> list, List<DownloadResult> list2) {
            Log.d("StoryAlbumFragment", "download end, success: %d, fails: %d", Integer.valueOf(list.size()), Integer.valueOf(list2.size()));
            StoryAlbumFragment.this.mCardDownloadDialog.dismissSafely();
            StoryAlbumFragment.this.mCardDownloadDialog = null;
            parseDownloadResult(list, list2);
            if (!list2.isEmpty()) {
                StoryAlbumFragment.this.mDownloadPendings.clear();
                for (DownloadResult downloadResult : list2) {
                    downloadResult.mTask.mType = DownloadType.ORIGIN;
                    StoryAlbumFragment.this.mDownloadPendings.add(downloadResult.mTask);
                }
                if (!NetworkUtils.isNetworkConnected()) {
                    ToastUtils.makeText((Context) StoryAlbumFragment.this.mActivity, (int) R.string.story_download_failed_for_notwork);
                } else if (NetworkUtils.isActiveNetworkMetered()) {
                    StoryAlbumFragment.this.showNetworkMeteredDialog();
                } else {
                    StoryAlbumFragment.this.showConfirmDialog(true);
                }
            } else {
                StoryAlbumFragment.this.mParseFileMetaValues.clear();
                StoryAlbumFragment.this.gotoPhotoMovie();
            }
            StoryAlbumFragment.this.mDownloader.destroy();
            StoryAlbumFragment.this.mDownloader = null;
        }

        /* JADX WARNING: type inference failed for: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 16
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
        public void onStart(List<DownloadTask> list) {
            Log.d("StoryAlbumFragment", "download start, %d", (Object) Integer.valueOf(list.size()));
            this.total = list.size();
            StoryAlbumFragment.this.mCardDownloadDialog = new CardDownloadDialog();
            StoryAlbumFragment.this.mCardDownloadDialog.show(StoryAlbumFragment.this.mActivity);
        }

        public void onUpdate(List<DownloadResult> list, List<DownloadResult> list2) {
            StoryAlbumFragment.this.mCardDownloadDialog.updateProgress(((float) list.size()) / ((float) this.total));
        }
    }

    public class MyOnScrollListener extends OnScrollListener {
        private int mActionBarBackgroundChangedPosition;
        private int mActionBarTitleChangedPosition;
        private View mFirstVisisbleItem;
        private int mHeaderViewBottomPrePosition;
        private boolean mIsChangedPositionInited;
        private int mPlayIconChangedPosition;

        public MyOnScrollListener() {
        }

        /* JADX WARNING: type inference failed for: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 42
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
        private void initChangedPosition() {
            if (!this.mIsChangedPositionInited && StoryAlbumFragment.this.mHeaderView.getBottom() != 0) {
                this.mIsChangedPositionInited = true;
                int bottom = StoryAlbumFragment.this.mHeaderView.getBottom() - StoryAlbumFragment.this.mSlideShowHeaderView.getBottom();
                int statusBarHeight = MiscUtil.getStatusBarHeight(StoryAlbumFragment.this.mActivity) + StoryAlbumFragment.this.mActionBarHelper.getActionBarHeight();
                this.mPlayIconChangedPosition = StoryAlbumFragment.this.mSlideShowHeaderView.getPlayIcon().getHeight() + statusBarHeight + StoryAlbumFragment.this.getResources().getDimensionPixelSize(R.dimen.story_slide_header_play_icon_margin) + bottom;
                this.mActionBarBackgroundChangedPosition = bottom + statusBarHeight;
                this.mActionBarTitleChangedPosition = statusBarHeight + StoryAlbumFragment.this.getResources().getDimensionPixelSize(R.dimen.story_header_description_margin_bottom);
            }
        }

        public void onScrollStateChanged(RecyclerView recyclerView, int i) {
        }

        public void onScrolled(RecyclerView recyclerView, int i, int i2) {
            if (this.mFirstVisisbleItem == null) {
                this.mFirstVisisbleItem = recyclerView.getChildAt(0);
            }
            if (this.mFirstVisisbleItem != null) {
                int bottom = this.mFirstVisisbleItem.getBottom();
                if (this.mHeaderViewBottomPrePosition > 0) {
                    initChangedPosition();
                    if (this.mHeaderViewBottomPrePosition >= this.mPlayIconChangedPosition && bottom <= this.mPlayIconChangedPosition) {
                        StoryAlbumFragment.this.mIsPlayIconScrollStateEnable = false;
                        StoryAlbumFragment.this.updateSlideHeaderPlayStatus();
                    } else if (this.mHeaderViewBottomPrePosition <= this.mPlayIconChangedPosition && bottom >= this.mPlayIconChangedPosition) {
                        StoryAlbumFragment.this.mIsPlayIconScrollStateEnable = true;
                        StoryAlbumFragment.this.updateSlideHeaderPlayStatus();
                    }
                    if (this.mHeaderViewBottomPrePosition >= this.mActionBarBackgroundChangedPosition && bottom <= this.mActionBarBackgroundChangedPosition) {
                        StoryAlbumFragment.this.mIsShowTranslucentStatusBar = false;
                    } else if (this.mHeaderViewBottomPrePosition <= this.mActionBarBackgroundChangedPosition && bottom >= this.mActionBarBackgroundChangedPosition) {
                        StoryAlbumFragment.this.mIsShowTranslucentStatusBar = true;
                    }
                    StoryAlbumFragment.this.mActionBarHelper.refreshActionBar();
                    if (this.mHeaderViewBottomPrePosition >= this.mActionBarTitleChangedPosition && bottom <= this.mActionBarTitleChangedPosition) {
                        StoryAlbumFragment.this.mActionBarHelper.startActionBarTitleAnim(true);
                    } else if (this.mHeaderViewBottomPrePosition <= this.mActionBarTitleChangedPosition && bottom >= this.mActionBarTitleChangedPosition) {
                        StoryAlbumFragment.this.mActionBarHelper.startActionBarTitleAnim(false);
                    }
                }
                this.mHeaderViewBottomPrePosition = bottom;
            }
        }
    }

    private class ParseFileMetaValue {
        Uri downloadUri;
        String originFilePath;
        int position;
        String thumnailFilePath;

        public ParseFileMetaValue(Cursor cursor) {
            if (cursor != null) {
                this.position = cursor.getPosition();
                this.thumnailFilePath = cursor.getString(2);
                this.originFilePath = cursor.getString(3);
                this.downloadUri = CloudUriAdapter.getDownloadUri(cursor.getLong(0));
            }
        }
    }

    private class PhotoLoaderCallback implements LoaderCallbacks {
        private PhotoLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 16
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
            CursorLoader cursorLoader = new CursorLoader(StoryAlbumFragment.this.mActivity);
            cursorLoader.setUri(StoryAlbumFragment.this.getUri());
            cursorLoader.setProjection(StoryAlbumFragment.this.getProjection());
            cursorLoader.setSelection(StoryAlbumFragment.this.getSelection());
            cursorLoader.setSortOrder(StoryAlbumFragment.this.getOrder());
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            Cursor cursor = (Cursor) obj;
            if (loader.getId() == 1) {
                if (StoryAlbumFragment.this.updateImages(cursor)) {
                    StoryAlbumFragment.this.mAdapter.swapCursor(cursor);
                }
                StoryAlbumFragment.this.parseCursor(cursor);
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private static class StoryAlbumAdapterWrapper extends HeaderFooterRecyclerAdapterWrapper<StoryAlbumAdapter, BaseViewHolder> {
        public StoryAlbumAdapterWrapper(StoryAlbumAdapter storyAlbumAdapter) {
            super(storyAlbumAdapter);
        }

        /* access modifiers changed from: protected */
        public BaseViewHolder onCreateHeaderFooterViewHolder(View view) {
            BaseViewHolder baseViewHolder = new BaseViewHolder(view);
            baseViewHolder.setIsRecyclable(false);
            return baseViewHolder;
        }
    }

    /* access modifiers changed from: private */
    public void checkDownloadPendingFiles() {
        if (this.mDownloadPendings.size() > 0) {
            this.mDownloadPendings.clear();
        }
        this.mResults = new Uri[this.mParseFileMetaValues.size()];
        Iterator it = this.mParseFileMetaValues.iterator();
        while (it.hasNext()) {
            ParseFileMetaValue parseFileMetaValue = (ParseFileMetaValue) it.next();
            int i = parseFileMetaValue.position;
            String str = parseFileMetaValue.originFilePath;
            if (!TextUtils.isEmpty(str)) {
                File file = new File(str);
                if (file.exists()) {
                    this.mResults[i] = Uri.fromFile(file);
                }
            }
            String str2 = parseFileMetaValue.thumnailFilePath;
            if (!TextUtils.isEmpty(str2)) {
                File file2 = new File(str2);
                if (file2.exists()) {
                    this.mResults[i] = Uri.fromFile(file2);
                }
            }
            this.mDownloadPendings.add(new DownloadTask(parseFileMetaValue.downloadUri, DownloadType.THUMBNAIL, 0, i));
        }
        Log.d("StoryAlbumFragment", "check dowload file end，and need download file count: %d .", (Object) Integer.valueOf(this.mDownloadPendings.size()));
    }

    /* access modifiers changed from: private */
    public String getOrder() {
        return "alias_create_time DESC ";
    }

    /* access modifiers changed from: private */
    public String[] getProjection() {
        return StoryAlbumAdapter.PROJECTION;
    }

    /* access modifiers changed from: private */
    public String getSelection() {
        StringBuilder sb = new StringBuilder();
        sb.append("(localGroupId!=-1000) AND ");
        sb.append(String.format("%s IN ('%s')", new Object[]{"sha1", TextUtils.join("','", this.mSelectedPhotoSha1s)}));
        return sb.toString();
    }

    /* access modifiers changed from: private */
    public String[] getSelectionArgs() {
        return null;
    }

    private List<MediaInfo> getTopNImages(List<MediaInfo> list, int i) {
        if (!MiscUtil.isValid(list) || i <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list);
        Collections.sort(arrayList, new MediaInfoScoreComparator());
        List<MediaInfo> subList = arrayList.subList(0, Math.min(list.size(), i));
        Collections.sort(subList, new MediaInfoTimeComparator());
        return subList;
    }

    /* access modifiers changed from: private */
    public Uri getUri() {
        return Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 13
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
    public void gotoPhotoMovie() {
        IntentUtil.startPhotoMovie(this.mActivity, getTopNImages(this.mImageInfos, 20), this.mCardId, CardUtil.getMovieTemplateFromCard(this.mCard), this.mCard.getTitle(), this.mCard.getDescription());
        recordSlideShowHeaderClick();
    }

    private void initHeaderView() {
        this.mCardTitle = (TextView) this.mHeaderView.findViewById(R.id.title);
        this.mCardDescription = (TextView) this.mHeaderView.findViewById(R.id.description);
        this.mSlideShowHeaderView = (SlideShowHeaderView) this.mHeaderView.findViewById(R.id.header);
        this.mSlideShowHeaderView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (StoryAlbumFragment.this.mActivity != null && StoryAlbumFragment.this.mSlideShowHeaderView.isPlayEnable()) {
                    StoryAlbumFragment.this.mSlideShowHeaderView.setEnabled(false);
                    StoryAlbumFragment.this.mCheckDownloadFilesFuture = ThreadManager.getMiscPool().submit(new Job<Object>() {
                        public Object run(JobContext jobContext) {
                            if (StoryAlbumFragment.this.mParseFileMetaValues.size() > 0) {
                                Log.d("StoryAlbumFragment", "start check download file.");
                                StoryAlbumFragment.this.checkDownloadPendingFiles();
                            }
                            return null;
                        }
                    }, new FutureHandler<Object>() {
                        /* JADX WARNING: type inference failed for: r2v23, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v23, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 42
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
                        public void onPostExecute(Future<Object> future) {
                            try {
                                StoryAlbumFragment.this.mSlideShowHeaderView.setEnabled(true);
                                if (!MiscUtil.isValid(StoryAlbumFragment.this.mDownloadPendings)) {
                                    StoryAlbumFragment.this.mParseFileMetaValues.clear();
                                    StoryAlbumFragment.this.gotoPhotoMovie();
                                } else if (!NetworkUtils.isNetworkConnected()) {
                                    ToastUtils.makeText((Context) StoryAlbumFragment.this.mActivity, (int) R.string.story_download_failed_for_notwork);
                                } else if (NetworkUtils.isActiveNetworkMetered()) {
                                    StoryAlbumFragment.this.showNetworkMeteredDialog();
                                } else {
                                    StoryAlbumFragment.this.startDownload();
                                }
                            } catch (Exception e) {
                                Log.e("StoryAlbumFragment", e.toString());
                            }
                        }
                    });
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void parseCursor(Cursor cursor) {
        if (cursor != null && cursor.moveToFirst()) {
            if (this.mParseFileMetaValues.size() > 0) {
                this.mParseFileMetaValues.clear();
            }
            do {
                this.mParseFileMetaValues.add(new ParseFileMetaValue(cursor));
            } while (cursor.moveToNext());
        }
    }

    private void recordSlideShowHeaderClick() {
        HashMap hashMap = new HashMap();
        hashMap.put("scenarioId", String.valueOf(this.mCard.getScenarioId()));
        GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_detail_header_click", hashMap);
    }

    /* access modifiers changed from: private */
    public void saveAndNotify() {
        CardManager.getInstance().updateCard(this.mCard);
    }

    /* access modifiers changed from: private */
    public void setTitle(String str) {
        this.mActionBarHelper.setActionBarTitle(str);
        this.mCardTitle.setText(str);
    }

    /* access modifiers changed from: private */
    public void showConfirmDialog(boolean z) {
        Bundle bundle = new Bundle();
        bundle.putInt("download_file_count", this.mDownloadPendings.size());
        bundle.putInt("local_file_count", this.mResults.length);
        Iterator it = this.mDownloadPendings.iterator();
        int i = 0;
        while (it.hasNext()) {
            i += ((DownloadTask) it.next()).mSize;
        }
        bundle.putInt("download_file_size", i);
        bundle.putBoolean("retry_mode", z);
        DownloadConfirmDialog downloadConfirmDialog = new DownloadConfirmDialog();
        downloadConfirmDialog.setArguments(bundle);
        downloadConfirmDialog.showAllowingStateLoss(getFragmentManager(), "confirm_dialog");
    }

    /* access modifiers changed from: private */
    public void showNetworkMeteredDialog() {
        ConfirmDialog.showConfirmDialog(this.mActivity.getFragmentManager(), this.mActivity.getResources().getString(R.string.download_with_metered_network_title), this.mActivity.getResources().getString(R.string.download_with_metered_network_msg), this.mActivity.getResources().getString(R.string.story_cancel_download), this.mActivity.getResources().getString(R.string.story_download), new ConfirmDialogInterface() {
            public void onCancel(DialogFragment dialogFragment) {
                StoryAlbumFragment.this.finish();
            }

            public void onConfirm(DialogFragment dialogFragment) {
                StoryAlbumFragment.this.startDownload();
            }
        });
    }

    /* access modifiers changed from: private */
    public void startDownload() {
        if (this.mDownloader != null) {
            this.mDownloader.cancel();
            this.mDownloader.destroy();
        }
        this.mDownloader = new Downloader(this.mDownloadPendings, new DownloadProgressListener());
        this.mDownloader.start();
    }

    private void updateCardIds() {
        List allMediaSha1s = this.mCard.getAllMediaSha1s();
        List selectedMediaSha1s = this.mCard.getSelectedMediaSha1s();
        if (selectedMediaSha1s.size() != this.mSelectedPhotoSha1s.size()) {
            if (allMediaSha1s == null) {
                allMediaSha1s = new ArrayList(selectedMediaSha1s.size());
            }
            if (allMediaSha1s.isEmpty()) {
                allMediaSha1s.addAll(selectedMediaSha1s);
            }
            Iterator it = selectedMediaSha1s.iterator();
            while (it.hasNext()) {
                String str = (String) it.next();
                if (!this.mSelectedPhotoSha1s.contains(str)) {
                    it.remove();
                    allMediaSha1s.remove(str);
                }
            }
            this.mCard.setSelectedMediaSha1s(selectedMediaSha1s, "removeByUser");
            this.mCard.setAllMediaSha1s(allMediaSha1s);
            saveAndNotify();
        }
    }

    /* access modifiers changed from: private */
    public void updateFlexBoxLayoutParamHelper() {
        int i;
        int i2;
        this.mFlexboxLayoutHeight = this.mRecyclerView.getWidth();
        ArrayList arrayList = new ArrayList(this.mImageInfos.size());
        for (MediaInfo mediaInfo : this.mImageInfos) {
            if (ExifUtil.isWidthHeightRotated(mediaInfo.getOrientation())) {
                i = mediaInfo.getHeight();
                i2 = mediaInfo.getWidth();
            } else {
                i = mediaInfo.getWidth();
                i2 = mediaInfo.getHeight();
            }
            arrayList.add(new Size(i, i2));
        }
        this.mAdapter.updateLayoutSizes(arrayList, this.mFlexboxLayoutHeight, this.mRecyclerView.getResources().getDimensionPixelSize(R.dimen.micro_thumb_horizontal_spacing));
        if (this.mFlexboxLayoutHeight == 0) {
            this.mRecyclerView.getViewTreeObserver().addOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:11:0x0050  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x007f  */
    public boolean updateImages(Cursor cursor) {
        int size = this.mImageInfos.size();
        this.mImageInfos.clear();
        this.mSelectedPhotoSha1s.clear();
        if (cursor == null || !cursor.moveToFirst()) {
            if (this.mSelectedPhotoSha1s.isEmpty()) {
                Log.d("StoryAlbumFragment", "empty selected ids after data updated");
                this.mActivity.finish();
                updateCardIds();
            }
            if (size != this.mImageInfos.size()) {
                return false;
            }
            updateFlexBoxLayoutParamHelper();
            this.mSlideShowHeaderView.updateMedias(getTopNImages(this.mImageInfos, 20));
            updateSlideHeaderPlayStatus();
            updateCardIds();
            return true;
        }
        do {
            MediaInfo mediaInfo = new MediaInfo(cursor);
            TinyImageFeature imageFeature = ImageFeatureCacheManager.getInstance().getImageFeature(mediaInfo.getId());
            if (imageFeature != null) {
                mediaInfo.setScore(imageFeature.getScore());
            }
            this.mImageInfos.add(mediaInfo);
            this.mSelectedPhotoSha1s.add(cursor.getString(15));
        } while (cursor.moveToNext());
        if (this.mSelectedPhotoSha1s.isEmpty()) {
        }
        if (size != this.mImageInfos.size()) {
        }
    }

    /* access modifiers changed from: private */
    public void updateSlideHeaderPlayStatus() {
        if (this.mImageInfos.size() < 3 || this.mIsInActionMode || !this.mIsPlayIconScrollStateEnable) {
            this.mSlideShowHeaderView.setPlayEnable(false);
        } else {
            this.mSlideShowHeaderView.setPlayEnable(true);
        }
    }

    /* access modifiers changed from: protected */
    public Loader getLoader() {
        return getLoaderManager().getLoader(1);
    }

    public String getPageName() {
        return "story_album";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        if (bundle != null) {
            this.mCardId = bundle.getLong("card_id");
        }
        Bundle arguments = getArguments();
        if (arguments != null && arguments.containsKey("card_id")) {
            this.mCardId = arguments.getLong("card_id");
        }
        this.mCard = CardManager.getInstance().getCardByCardId(this.mCardId);
        if (this.mCard == null || !MiscUtil.isValid(this.mCard.getSelectedMediaSha1s())) {
            Log.e("StoryAlbumFragment", "Card and LocalIds should not be null %s", (Object) getArguments());
            StringBuilder sb = new StringBuilder();
            sb.append("Card and LocalIds should not be null,Card id:");
            sb.append(this.mCardId);
            throw new IllegalArgumentException(sb.toString());
        }
        List selectedMediaSha1s = this.mCard.getSelectedMediaSha1s();
        this.mImageInfos = new ArrayList(selectedMediaSha1s.size());
        this.mSelectedPhotoSha1s = new HashSet(selectedMediaSha1s.size());
        this.mSelectedPhotoSha1s.addAll(selectedMediaSha1s);
        this.mIsNightMode = MiscUtil.isNightMode(getActivity());
        this.mActionBarHelper = new ActionBarHelper();
        this.mActionBarHelper.inflateTitle();
        setTitle(this.mCard.getTitle());
        this.mCardDescription.setText(this.mCard.getDescription());
        this.mPhotoLoaderCallback = new PhotoLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mPhotoLoaderCallback);
    }

    public void onAttachDialogFragment(Fragment fragment) {
        if (fragment instanceof DownloadConfirmDialog) {
            DownloadConfirmDialog downloadConfirmDialog = (DownloadConfirmDialog) fragment;
            downloadConfirmDialog.setPositiveListener(this.mDownloadListener);
            downloadConfirmDialog.setNegativeListener(this.mCancelDownloadListener);
        } else if (fragment instanceof CardDownloadDialog) {
            ((CardDownloadDialog) fragment).setCallBack(this.mDownloadCallback);
        }
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mDownloadPendings != null) {
            this.mDownloadPendings.clear();
        }
        if (this.mParseFileMetaValues != null) {
            this.mParseFileMetaValues.clear();
        }
        if (this.mCheckDownloadFilesFuture != null) {
            this.mCheckDownloadFilesFuture.cancel();
            this.mCheckDownloadFilesFuture = null;
        }
        if (this.mDowloadResultFuture != null) {
            this.mDowloadResultFuture.cancel();
            this.mDowloadResultFuture = null;
        }
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r5v11, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r6v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 61
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
    /* JADX WARNING: Unknown variable types count: 4 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.story_album_layout, viewGroup, false);
        this.mRecyclerView = (GalleryRecyclerView) inflate.findViewById(R.id.recycler_view);
        this.mFlexboxLayoutManager = new FlexboxLayoutManager(this.mActivity);
        this.mFlexboxLayoutManager.setFlexWrap(1);
        this.mFlexboxLayoutManager.setFlexDirection(0);
        this.mFlexboxLayoutManager.setAlignItems(4);
        this.mFlexboxLayoutManager.setRecycleChildrenOnDetach(true);
        this.mRecyclerView.setLayoutManager(this.mFlexboxLayoutManager);
        FlexboxItemDecoration flexboxItemDecoration = new FlexboxItemDecoration(this.mActivity);
        flexboxItemDecoration.setDrawable(getActivity().getResources().getDrawable(R.drawable.card_item_divider));
        this.mRecyclerView.addItemDecoration(flexboxItemDecoration);
        this.mHeaderView = LayoutInflater.from(this.mActivity).inflate(R.layout.story_album_header, this.mRecyclerView, false);
        initHeaderView();
        this.mAdapter = new StoryAlbumAdapter(this.mActivity);
        this.mAdapter.setHasStableIds(true);
        this.mAdapterWrapper = new StoryAlbumAdapterWrapper(this.mAdapter);
        this.mAdapterWrapper.addHeaderView(this.mHeaderView);
        this.mListViewWrapper = new EditableListViewWrapper(this.mRecyclerView);
        this.mListViewWrapper.setOnItemClickListener(new OnItemClickListener() {
            public boolean onItemClick(RecyclerView recyclerView, View view, int i, long j, float f, float f2) {
                int i2 = i;
                if (StoryAlbumFragment.this.mAdapterWrapper.isHeaderPosition(i2)) {
                    return false;
                }
                int wrappedAdapterPosition = StoryAlbumFragment.this.mAdapterWrapper.getWrappedAdapterPosition(i2);
                Uri build = Media.URI.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
                ImageLoadParams imageLoadParams = new ImageLoadParams(StoryAlbumFragment.this.mAdapter.getItemKey(wrappedAdapterPosition), StoryAlbumFragment.this.mAdapter.getLocalPath(wrappedAdapterPosition), ThumbConfig.get().sMicroTargetSize, StoryAlbumFragment.this.mAdapter.getItemDecodeRectF(wrappedAdapterPosition), wrappedAdapterPosition, StoryAlbumFragment.this.mAdapter.getMimeType(wrappedAdapterPosition), StoryAlbumFragment.this.mAdapter.getFileLength(wrappedAdapterPosition));
                IntentUtil.gotoPhotoPage((BaseMediaFragment) StoryAlbumFragment.this, (ViewGroup) StoryAlbumFragment.this.mRecyclerView, build, wrappedAdapterPosition, StoryAlbumFragment.this.mAdapter.getItemCount(), StoryAlbumFragment.this.getSelection(), StoryAlbumFragment.this.getSelectionArgs(), StoryAlbumFragment.this.getOrder(), imageLoadParams, 2147483640, true);
                return true;
            }
        });
        this.mListViewWrapper.enableChoiceMode(true);
        this.mListViewWrapper.setMultiChoiceModeListener(this.mChoiceModeListener);
        this.mListViewWrapper.setAdapter(this.mAdapterWrapper);
        this.mListViewWrapper.setOnScrollListener(new MyOnScrollListener());
        return inflate;
    }

    public void onPause() {
        super.onPause();
        if (this.mDownloader != null) {
            this.mDownloader.pause();
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mDownloader != null) {
            this.mDownloader.resume();
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putLong("card_id", this.mCardId);
    }

    public void onStart() {
        super.onStart();
        this.mSlideShowHeaderView.resume();
    }

    public void onStop() {
        super.onStop();
        this.mSlideShowHeaderView.pause();
    }
}
