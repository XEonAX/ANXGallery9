package com.miui.gallery.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.CursorLoader;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.Loader;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.text.Html;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.activity.facebaby.FacePageActivity;
import com.miui.gallery.activity.facebaby.RecommendFacePageActivity;
import com.miui.gallery.adapter.FacePageAdapter;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.preference.GalleryPreferences.Face;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.provider.deprecated.PeopleRecommendMediaSet;
import com.miui.gallery.share.Path;
import com.miui.gallery.share.UIHelper;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.DeletionTask.OnDeletionCompleteListener;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceAlbumHandlerListener;
import com.miui.gallery.ui.renameface.FaceAlbumHandlerBase.FaceFolderItem;
import com.miui.gallery.ui.renameface.FaceAlbumRenameHandler;
import com.miui.gallery.ui.renameface.FaceAlbumRenameHandler.ConfirmListener;
import com.miui.gallery.ui.renameface.InputFaceNameFragment;
import com.miui.gallery.ui.renameface.RemoveFromFaceAlbumHandler;
import com.miui.gallery.util.BindImageHelper.OnImageLoadingCompleteListener;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.MediaAndAlbumOperations;
import com.miui.gallery.util.MediaAndAlbumOperations.OnCompleteListener;
import com.miui.gallery.util.SoundUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.baby.FindFace2CreateBabyAlbum;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.miui.gallery.util.face.CheckoutRecommendPeople;
import com.miui.gallery.util.face.CheckoutRecommendPeople.CheckoutStatusListener;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.miui.gallery.widget.ActionMenuItemView;
import com.miui.gallery.widget.PagerGridLayout;
import com.miui.gallery.widget.PagerGridLayout.OnPageChangedListener;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.MultiChoiceModeListener;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;
import java.util.HashMap;

public class FacePageFragment extends BaseMediaFragment implements CheckoutStatusListener, OnPageChangedListener {
    /* access modifiers changed from: private */
    public FacePageAdapter mAdapter;
    /* access modifiers changed from: private */
    public boolean mAddFooterView = false;
    /* access modifiers changed from: private */
    public String mAlbumName;
    /* access modifiers changed from: private */
    public CheckoutRecommendPeople mCheckoutRecommendPeopleTask;
    private Future mCoverRefreshTask;
    private FaceAlbumRenameHandler mFaceAlbumMergeHandler;
    private FaceAlbumRenameHandler mFaceAlbumRenameHandler;
    private DisplayImageOptions mFaceCoverDisplayOptions;
    /* access modifiers changed from: private */
    public View mFaceCoverHeader;
    /* access modifiers changed from: private */
    public String mFaceCoverPath;
    /* access modifiers changed from: private */
    public RectF mFaceCoverRectF;
    private ImageViewAware mFaceCoverViewAware;
    /* access modifiers changed from: private */
    public StickyGridHeadersGridView mFaceGridView;
    /* access modifiers changed from: private */
    public EditableListViewWrapperDeprecated mFaceGridViewWrapper;
    private NormalPeopleFaceMediaSet mFaceMediaSet;
    private ArrayList<NormalPeopleFaceMediaSet> mFaceMediasetsList;
    private FacePagePhotoLoaderCallback mFacePagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public View mFooterView;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler();
    /* access modifiers changed from: private */
    public boolean mHasRequestRecommendFace;
    private ChoiceModeListener mListener;
    /* access modifiers changed from: private */
    public long mLocalIdOfAlbum;
    private Future mNameRefreshTask;
    /* access modifiers changed from: private */
    public PeopleRecommendMediaSet mPeopleRecommendMediaSet;
    /* access modifiers changed from: private */
    public RecommendFaceGroupAdapter mRecommendFaceAdapter;
    private View mRecommendFaceButtonContainer;
    /* access modifiers changed from: private */
    public PagerGridLayout mRecommendFaceGroup;
    /* access modifiers changed from: private */
    public View mRecommendFaceGroupHeader;
    /* access modifiers changed from: private */
    public String mRecommendFaceIds;
    private int mRelationType;
    private RemoveFromFaceAlbumHandler mRemoveFromFaceAlbumHandler;
    /* access modifiers changed from: private */
    public String mServerIdOfAlbum;
    private View mShareButtonContainer;

    private class ChoiceModeListener implements MultiChoiceModeListener {
        /* access modifiers changed from: private */
        public ActionMode mMode;
        private FaceAlbumHandlerListener mRemoveFromFaceAlbumListener;

        private ChoiceModeListener() {
            this.mRemoveFromFaceAlbumListener = new FaceAlbumHandlerListener() {
                /* access modifiers changed from: private */
                public void doRemove(FaceFolderItem faceFolderItem) {
                    NormalPeopleFaceMediaSet.doMoveFacesToAnother(faceFolderItem, FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemIds());
                    ChoiceModeListener.this.mMode.finish();
                    GallerySamplingStatHelper.recordCountEvent("face", "face_remove");
                }

                /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 48
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
                public void onGetFolderItem(final FaceFolderItem faceFolderItem) {
                    String str;
                    CharSequence charSequence;
                    String str2;
                    if (FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemIds().length > 0) {
                        AnonymousClass1 r2 = new OnClickListener() {
                            public void onClick(DialogInterface dialogInterface, int i) {
                                AnonymousClass2.this.doRemove(faceFolderItem);
                            }
                        };
                        AnonymousClass2 r3 = new OnClickListener() {
                            public void onClick(DialogInterface dialogInterface, int i) {
                                dialogInterface.cancel();
                            }
                        };
                        String str3 = "";
                        if (faceFolderItem == null) {
                            String string = FacePageFragment.this.mActivity.getString(R.string.remove_from_album_title);
                            str2 = string;
                            str = FacePageFragment.this.mActivity.getString(R.string.operation_remove_face);
                            charSequence = Html.fromHtml(FacePageFragment.this.mActivity.getResources().getString(R.string.remove_from_album_message));
                        } else {
                            String string2 = FacePageFragment.this.mActivity.getString(17039370);
                            charSequence = Html.fromHtml(FacePageFragment.this.mActivity.getString(R.string.confirm_merge_many_face_albums, new Object[]{faceFolderItem.getName()}));
                            str2 = str3;
                            str = string2;
                        }
                        DialogUtil.showConfirmAlertWithCancel(FacePageFragment.this.mActivity, r2, r3, str2, charSequence, str, 17039360);
                    }
                }
            };
        }

        private void enableOrDisableMenuItem(boolean z) {
            Menu menu = this.mMode.getMenu();
            menu.findItem(R.id.action_remove_from_face_album).setEnabled(z);
            menu.findItem(R.id.action_delete).setEnabled(z);
            menu.findItem(R.id.action_produce).setEnabled(z);
            menu.findItem(R.id.action_send).setEnabled(z);
        }

        private long[] getSelectedPhotoIds() {
            SparseBooleanArray checkedItemPositions = FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemPositions();
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < checkedItemPositions.size(); i++) {
                int keyAt = checkedItemPositions.keyAt(i);
                if (checkedItemPositions.get(keyAt)) {
                    arrayList.add(Long.valueOf(FacePageFragment.this.mAdapter.getItemPhotoId(keyAt)));
                }
            }
            long[] jArr = new long[arrayList.size()];
            for (int i2 = 0; i2 < arrayList.size(); i2++) {
                jArr[i2] = ((Long) arrayList.get(i2)).longValue();
            }
            return jArr;
        }

        /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 106
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
        public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            int itemId = menuItem.getItemId();
            if (itemId == R.id.action_delete) {
                FacePageFragment.this.doDelete(this.mMode, getSelectedPhotoIds());
            } else if (itemId == R.id.action_produce) {
                final ActionMode actionMode2 = actionMode;
                MediaAndAlbumOperations.doProduceCreation(FacePageFragment.this.mActivity, new OnCompleteListener() {
                    public void onComplete(long[] jArr) {
                        actionMode2.finish();
                    }
                }, FacePageFragment.this.mFaceGridViewWrapper.getCheckedItems());
                GallerySamplingStatHelper.recordCountEvent("face", "produce");
            } else if (itemId != R.id.action_remove_from_face_album) {
                int i = 0;
                if (itemId != R.id.action_send) {
                    return false;
                }
                SparseBooleanArray checkedItemPositions = FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemPositions();
                ArrayList arrayList = new ArrayList(checkedItemPositions.size());
                ArrayList arrayList2 = new ArrayList(checkedItemPositions.size());
                int i2 = Integer.MAX_VALUE;
                for (int i3 = 0; i3 < checkedItemPositions.size(); i3++) {
                    int keyAt = checkedItemPositions.keyAt(i3);
                    if (checkedItemPositions.get(keyAt)) {
                        arrayList.add(Integer.valueOf(keyAt));
                        arrayList2.add(Long.valueOf(FacePageFragment.this.mAdapter.getItemKey(keyAt)));
                        if (keyAt < i2) {
                            i2 = keyAt;
                        }
                    }
                }
                int[] iArr = new int[arrayList.size()];
                long[] jArr = new long[arrayList2.size()];
                for (int i4 = 0; i4 < arrayList.size(); i4++) {
                    iArr[i4] = ((Integer) arrayList.get(i4)).intValue();
                    jArr[i4] = ((Long) arrayList2.get(i4)).longValue();
                }
                if (i2 != Integer.MAX_VALUE) {
                    i = i2;
                }
                ImageLoadParams imageLoadParams = new ImageLoadParams(FacePageFragment.this.mAdapter.getItemKey(i), FacePageFragment.this.mAdapter.getLocalPath(i), ThumbConfig.get().sMicroTargetSize, FacePageFragment.this.mAdapter.getItemDecodeRectF(i), i, FacePageFragment.this.mAdapter.getMimeType(i), FacePageFragment.this.mAdapter.getFileLength(i));
                IntentUtil.gotoPreviewSelectPage(FacePageFragment.this, PeopleFace.ONE_PERSON_URI, i, FacePageFragment.this.mAdapter.getCount(), null, FacePageFragment.this.getSelectioinArgs(), FacePageFragment.this.getOrderBy(), imageLoadParams, jArr, iArr);
                actionMode.finish();
                GallerySamplingStatHelper.recordCountEvent("face", "face_send");
            } else {
                FacePageFragment.this.startRemoveFromFaceAlbum(this.mRemoveFromFaceAlbumListener);
            }
            return true;
        }

        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            enableOrDisableMenuItem(FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemCount() > 0);
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
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
            actionMode.getMenuInflater().inflate(BuildUtil.isMiuiSdkGte15(FacePageFragment.this.mActivity) ? R.menu.v15_face_page_action_menu : R.menu.face_page_action_menu, menu);
            enableOrDisableMenuItem(false);
            FacePageFragment.this.changeVisibilityOfShareContainer(8);
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
            this.mMode = null;
            FacePageFragment.this.changeVisibilityOfShareContainer(0);
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            enableOrDisableMenuItem(FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemCount() > 0);
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            FacePageFragment.this.changeVisibilityOfShareContainer(8);
            return false;
        }
    }

    private class FacePagePhotoLoaderCallback implements LoaderCallbacks {
        private FacePagePhotoLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(FacePageFragment.this.mActivity);
            cursorLoader.setUri(PeopleFace.ONE_PERSON_URI.buildUpon().appendQueryParameter("generate_headers", String.valueOf(true)).build());
            cursorLoader.setProjection(FacePageAdapter.PROJECTION);
            cursorLoader.setSelectionArgs(FacePageFragment.this.getSelectioinArgs());
            cursorLoader.setSortOrder(FacePageFragment.this.getOrderBy());
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            FacePageFragment.this.mAdapter.swapCursor((Cursor) obj);
            FacePageFragment.this.freshFacePhotoCount();
            FacePageFragment.this.refreshFaceCover();
            if (FacePageFragment.this.mAddFooterView) {
                FacePageFragment.this.mFaceGridView.addFooterView(FacePageFragment.this.mFooterView);
                FacePageFragment.this.mAddFooterView = false;
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class FaceRecommendPhotoLoaderCallback implements LoaderCallbacks {
        private FaceRecommendPhotoLoaderCallback() {
        }

        private String getOrderBy() {
            return "dateTaken DESC ";
        }

        private Uri getUri() {
            return PeopleFace.RECOMMEND_FACES_OF_ONE_PERSON_URI;
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(FacePageFragment.this.getActivity());
            cursorLoader.setUri(getUri());
            cursorLoader.setProjection(RecommendFaceGroupAdapter.PROJECTION);
            cursorLoader.setSelectionArgs(new String[]{FacePageFragment.this.mRecommendFaceIds});
            cursorLoader.setSortOrder(getOrderBy());
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            FacePageFragment.this.mRecommendFaceAdapter.swapCursor((Cursor) obj);
            FacePageFragment.this.mRecommendFaceGroup.setAdapter(FacePageFragment.this.mRecommendFaceAdapter);
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    private void addFaceCoverHeader() {
        this.mFaceCoverHeader = LayoutInflater.from(this.mActivity).inflate(R.layout.face_page_face_cover_header, this.mFaceGridView, false);
        this.mFaceCoverViewAware = new ImageViewAware((ImageView) this.mFaceCoverHeader.findViewById(R.id.face_cover));
        initFaceCoverDisplayOptions();
        displayFaceCover();
        TextView textView = (TextView) this.mFaceCoverHeader.findViewById(R.id.face_name_edit);
        if (TextUtils.isEmpty(getAlbumName())) {
            textView.setText(getString(R.string.face_name_input));
        } else {
            textView.setText(getString(R.string.face_name_edit));
        }
        textView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                FacePageFragment.this.showRenameHandler();
            }
        });
        this.mFaceGridView.addHeaderView(this.mFaceCoverHeader);
    }

    private void addHeaderView() {
        addFaceCoverHeader();
        addRecommendGroupHeader();
    }

    /* JADX WARNING: type inference failed for: r0v9, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v9, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 57
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
    private void addRecommendGroupHeader() {
        this.mPeopleRecommendMediaSet = new PeopleRecommendMediaSet(new NormalPeopleFaceMediaSet(this.mLocalIdOfAlbum, getServerIdOfAlbum(), getAlbumName()));
        this.mPeopleRecommendMediaSet.refreshRecommendInfo();
        if (this.mPeopleRecommendMediaSet.getActualNeedRecommendPeopleFacePhotoNumber() <= 0) {
            return;
        }
        if (!Face.isFaceRecommendGroupHidden(getServerIdOfAlbum())) {
            this.mRecommendFaceIds = this.mPeopleRecommendMediaSet.getServerIdsIn();
            this.mRecommendFaceGroupHeader = LayoutInflater.from(this.mActivity).inflate(R.layout.face_page_recommend_group_header, this.mFaceGridView, false);
            this.mFaceGridView.addHeaderView(this.mRecommendFaceGroupHeader);
            GallerySamplingStatHelper.recordCountEvent("face", "face_show_recommend_panel");
            this.mRecommendFaceGroup = (PagerGridLayout) this.mRecommendFaceGroupHeader.findViewById(R.id.face_recommend_group);
            this.mRecommendFaceGroup.setOnPageChangedListener(this);
            this.mRecommendFaceAdapter = new RecommendFaceGroupAdapter(this, this.mServerIdOfAlbum, Long.valueOf(this.mLocalIdOfAlbum)) {
                public int getColumnsCount() {
                    return 4;
                }

                /* access modifiers changed from: protected */
                public int getLayoutId() {
                    return R.layout.recommend_face_cover_item_small;
                }

                public int getRowsCount() {
                    return 1;
                }
            };
            this.mRecommendFaceAdapter.setOnLoadingCompleteListener(new OnImageLoadingCompleteListener() {
                public void onLoadingComplete() {
                    FacePageFragment.this.invalidateFaceGridView();
                }

                public void onLoadingFailed() {
                }
            });
            getLoaderManager().initLoader(2, null, new FaceRecommendPhotoLoaderCallback());
            this.mRecommendFaceGroupHeader.findViewById(R.id.confirm_recommend).setOnClickListener(new View.OnClickListener() {
                /* JADX WARNING: type inference failed for: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 29
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
                public void onClick(View view) {
                    if (Face.isShowRecommendConfirmDialog()) {
                        int mergeFaceCount = FacePageFragment.this.mRecommendFaceAdapter.getMergeFaceCount();
                        Face.setShowRecommendConfirmDialog(false);
                        new Builder(FacePageFragment.this.mActivity).setPositiveButton(R.string.confirm_hidden_recommend_group, new OnClickListener() {
                            public void onClick(DialogInterface dialogInterface, int i) {
                                FacePageFragment.this.changeToNextPage();
                            }
                        }).setNegativeButton(17039360, null).setTitle(FacePageFragment.this.getString(R.string.remind_face_recommend_confirm)).setMessage(FacePageFragment.this.mActivity.getResources().getQuantityString(R.plurals.remind_face_recommend_confirm_text, mergeFaceCount, new Object[]{Integer.valueOf(mergeFaceCount)})).create().show();
                        return;
                    }
                    FacePageFragment.this.changeToNextPage();
                }
            });
            this.mRecommendFaceGroupHeader.findViewById(R.id.face_recommend_hidden).setOnClickListener(new View.OnClickListener() {
                /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 20
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
                public void onClick(View view) {
                    AlertDialog create = new Builder(FacePageFragment.this.mActivity).setPositiveButton(R.string.confirm_hidden_recommend_group, new OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            Face.setFaceRecommendGroupHidden(FacePageFragment.this.getServerIdOfAlbum(), true);
                            FacePageFragment.this.mFaceGridView.removeHeaderView(FacePageFragment.this.mRecommendFaceGroupHeader);
                            FacePageFragment.this.mFaceGridView.addFooterView(FacePageFragment.this.mFooterView);
                            GallerySamplingStatHelper.recordCountEvent("face", "face_close_recommend_panel");
                        }
                    }).setNegativeButton(17039360, null).setTitle(FacePageFragment.this.getString(R.string.confirm_hidden_recommend_group_title)).setMessage(FacePageFragment.this.getString(R.string.confirm_hidden_recommend_group_message)).create();
                    create.show();
                    create.getButton(-1).setTextColor(FacePageFragment.this.getResources().getColor(R.color.remove_recommend_header_dialog_button));
                }
            });
            return;
        }
        this.mAddFooterView = true;
    }

    private void cancelTask(Future future) {
        if (future != null && !future.isCancelled()) {
            future.cancel();
        }
    }

    /* access modifiers changed from: private */
    public void changeVisibilityOfShareContainer(int i) {
        if (this.mShareButtonContainer != null) {
            this.mShareButtonContainer.setVisibility(i);
        }
    }

    private ConfirmListener confirmListener() {
        return new ConfirmListener() {
            public void onConfirm(final String str, boolean z) {
                if (!z) {
                    FacePageFragment.this.mHandler.post(new Runnable() {
                        public void run() {
                            if (FacePageFragment.this.getActivity() != null) {
                                if (TextUtils.isEmpty(FacePageFragment.this.getAlbumName())) {
                                    ((TextView) FacePageFragment.this.mFaceCoverHeader.findViewById(R.id.face_name_edit)).setText(FacePageFragment.this.getString(R.string.face_name_edit));
                                }
                                FacePageFragment.this.mAlbumName = str;
                                FacePageFragment.this.setTitle();
                            }
                        }
                    });
                } else {
                    ThreadManager.getMiscPool().submit(new Job<Void>() {
                        /* JADX WARNING: type inference failed for: r5v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                        /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
                        /* JADX WARNING: Unknown variable types count: 2 */
                        public Void run(JobContext jobContext) {
                            com.miui.gallery.cloud.peopleface.PeopleFace groupByPeopleName = FaceDataManager.getGroupByPeopleName(FacePageFragment.this.mActivity, str);
                            if (groupByPeopleName != null) {
                                Intent intent = new Intent(FacePageFragment.this.mActivity, FacePageActivity.class);
                                Bundle bundle = new Bundle();
                                bundle.putString("server_id_of_album", groupByPeopleName.serverId);
                                bundle.putString("local_id_of_album", groupByPeopleName.getId());
                                bundle.putString("album_name", str);
                                bundle.putInt("relationType", groupByPeopleName.relationType);
                                RectF[] rectFArr = new RectF[1];
                                bundle.putString("face_album_cover", FaceManager.queryCoverImageOfOnePerson(groupByPeopleName.serverId, rectFArr));
                                bundle.putParcelable("face_position_rect", rectFArr[0]);
                                intent.putExtras(bundle);
                                FacePageFragment.this.mActivity.startActivity(intent);
                                FacePageFragment.this.mActivity.finish();
                            }
                            return null;
                        }
                    });
                }
                GallerySamplingStatHelper.recordCountEvent("face", "face_album_rename");
            }
        };
    }

    /* access modifiers changed from: private */
    public void displayFaceCover() {
        if (this.mFaceCoverPath != null) {
            ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(this.mFaceCoverPath), this.mFaceCoverViewAware, this.mFaceCoverDisplayOptions, null, new SimpleImageLoadingListener() {
                public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                    FacePageFragment.this.invalidateFaceGridView();
                }
            }, null, this.mFaceCoverRectF);
        }
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 8
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
    public void doDelete(final ActionMode actionMode, long[] jArr) {
        MediaAndAlbumOperations.delete(this.mActivity, "FacePageFragmentDeleteMediaDialogFragment", new OnDeletionCompleteListener() {
            /* JADX WARNING: type inference failed for: r7v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: type inference failed for: r6v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r7v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 26
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
                if (FacePageFragment.this.mActivity != null) {
                    NormalPeopleFaceMediaSet.ignoreFaces(FacePageFragment.this.mFaceGridViewWrapper.getCheckedItemIds());
                    ToastUtils.makeText((Context) FacePageFragment.this.mActivity, (CharSequence) FacePageFragment.this.getString(R.string.delete_finish_format, new Object[]{Integer.valueOf(i)}));
                    if (i > 0) {
                        SoundUtils.playSoundForOperation(FacePageFragment.this.mActivity, 0);
                    }
                    actionMode.finish();
                    GallerySamplingStatHelper.recordCountEvent("face", "face_delete");
                }
            }
        }, this.mLocalIdOfAlbum, this.mAlbumName, 0, 28, jArr);
    }

    /* access modifiers changed from: private */
    public void freshFacePhotoCount() {
        TextView textView = (TextView) this.mFaceCoverHeader.findViewById(R.id.photo_count);
        int count = this.mAdapter.getCount();
        textView.setText(this.mActivity.getResources().getQuantityString(R.plurals.face_count, count, new Object[]{Integer.valueOf(count)}));
    }

    /* access modifiers changed from: private */
    public String getAlbumName() {
        return this.mActivity == null ? "" : (TextUtils.isEmpty(this.mAlbumName) || this.mActivity.getString(R.string.people_page_unname).equalsIgnoreCase(this.mAlbumName)) ? "" : this.mAlbumName;
    }

    /* access modifiers changed from: private */
    public String getOrderBy() {
        return "dateTaken DESC ";
    }

    /* access modifiers changed from: private */
    public String[] getSelectioinArgs() {
        return new String[]{this.mServerIdOfAlbum, String.valueOf(this.mLocalIdOfAlbum)};
    }

    private void initFaceCoverDisplayOptions() {
        this.mFaceCoverDisplayOptions = new DisplayImageOptions.Builder().cacheThumbnail(true).loadFromMicroCache(true).cacheInMemory(true).considerExifParams(true).showImageOnFail(R.drawable.default_face_cover).showImageForEmptyUri(R.drawable.default_face_cover).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(false)).usingRegionDecoderFace(true).build();
    }

    /* access modifiers changed from: private */
    public void invalidateFaceGridView() {
        if (this.mFaceGridView != null) {
            this.mFaceGridView.postInvalidate();
        }
    }

    private void recordDisplayModeCountEvent(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("mode", str);
        GallerySamplingStatHelper.recordCountEvent("face", "face_change_display_mode", hashMap);
    }

    /* access modifiers changed from: private */
    public void refreshFaceCover() {
        if (this.mServerIdOfAlbum != null) {
            cancelTask(this.mCoverRefreshTask);
            this.mCoverRefreshTask = ThreadManager.getMiscPool().submit(new Job<Boolean>() {
                public Boolean run(JobContext jobContext) {
                    Boolean valueOf = Boolean.valueOf(false);
                    RectF[] rectFArr = new RectF[1];
                    String queryCoverImageOfOnePerson = FaceManager.queryCoverImageOfOnePerson(FacePageFragment.this.mServerIdOfAlbum, rectFArr);
                    if (TextUtils.isEmpty(queryCoverImageOfOnePerson) || queryCoverImageOfOnePerson.equals(FacePageFragment.this.mFaceCoverPath)) {
                        return valueOf;
                    }
                    FacePageFragment.this.mFaceCoverPath = queryCoverImageOfOnePerson;
                    FacePageFragment.this.mFaceCoverRectF = rectFArr[0];
                    return Boolean.valueOf(true);
                }
            }, new FutureHandler<Boolean>() {
                public void onPostExecute(Future<Boolean> future) {
                    Boolean bool = future == null ? null : (Boolean) future.get();
                    if (bool != null && bool.booleanValue()) {
                        FacePageFragment.this.displayFaceCover();
                    }
                }
            });
        }
    }

    private void refreshFaceNameIfNeeded() {
        cancelTask(this.mNameRefreshTask);
        this.mNameRefreshTask = ThreadManager.getMiscPool().submit(new Job<String>() {
            public String run(JobContext jobContext) {
                return FaceManager.queryPersonName(FacePageFragment.this.mLocalIdOfAlbum);
            }
        }, new FutureHandler<String>() {
            public void onPostExecute(Future<String> future) {
                FacePageFragment facePageFragment;
                int i;
                if (FacePageFragment.this.isAdded() && future != null) {
                    String str = (String) future.get();
                    if (str != null && !str.equals(FacePageFragment.this.mAlbumName)) {
                        FacePageFragment.this.mAlbumName = str;
                    }
                    TextView textView = (TextView) FacePageFragment.this.mFaceCoverHeader.findViewById(R.id.face_name_edit);
                    if (TextUtils.isEmpty(str)) {
                        facePageFragment = FacePageFragment.this;
                        i = R.string.face_name_input;
                    } else {
                        facePageFragment = FacePageFragment.this;
                        i = R.string.face_name_edit;
                    }
                    textView.setText(facePageFragment.getString(i));
                    FacePageFragment.this.setTitle();
                    FacePageFragment.this.invalidateFaceGridView();
                }
            }
        });
    }

    private void seeIfHasRecommendFace() {
        if (!TextUtils.isEmpty(this.mServerIdOfAlbum)) {
            ThreadManager.getMiscPool().submit(new Job<Void>() {
                public Void run(JobContext jobContext) {
                    if (!FacePageFragment.this.mHasRequestRecommendFace) {
                        FacePageFragment.this.mCheckoutRecommendPeopleTask = new CheckoutRecommendPeople(null, FacePageFragment.this);
                        FacePageFragment.this.mCheckoutRecommendPeopleTask.getRecommendPeopleFromNet(FacePageFragment.this.getServerIdOfAlbum());
                        FacePageFragment.this.mHasRequestRecommendFace = true;
                    }
                    return null;
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void setTitle() {
        if (this.mActivity != null) {
            this.mActivity.getActionBar().setTitle(getString(R.string.face_album_title, new Object[]{this.mAlbumName}));
        }
        ((TextView) this.mFaceCoverHeader.findViewById(R.id.face_name)).setText(this.mAlbumName);
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 10
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
    private boolean shoeIgnoreAlert() {
        DialogUtil.showConfirmAlertWithCancel(this.mActivity, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                final ArrayList arrayList = new ArrayList();
                arrayList.add(Long.valueOf(FacePageFragment.this.mLocalIdOfAlbum));
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        FaceDataManager.safeIgnorePeopleByIds(arrayList);
                        FacePageFragment.this.mActivity.finish();
                        return null;
                    }
                });
            }
        }, null, "", Html.fromHtml(this.mActivity.getString(R.string.ignore_alert_title)), this.mActivity.getString(17039370), 17039360);
        return true;
    }

    /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    /* JADX WARNING: Unknown variable types count: 1 */
    private void showMergeHandler() {
        if (this.mFaceAlbumMergeHandler == null) {
            NormalPeopleFaceMediaSet normalPeopleFaceMediaSet = new NormalPeopleFaceMediaSet(this.mLocalIdOfAlbum, this.mServerIdOfAlbum, this.mAlbumName);
            this.mFaceMediasetsList = new ArrayList<>();
            this.mFaceMediasetsList.add(normalPeopleFaceMediaSet);
            this.mFaceAlbumMergeHandler = new FaceAlbumRenameHandler((Activity) this.mActivity, this.mFaceMediasetsList, confirmListener());
        }
        this.mFaceAlbumMergeHandler.show();
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    /* JADX WARNING: Unknown variable types count: 1 */
    public void showRenameHandler() {
        if (this.mFaceAlbumRenameHandler == null) {
            this.mFaceMediaSet = new NormalPeopleFaceMediaSet(this.mLocalIdOfAlbum, getServerIdOfAlbum(), getAlbumName());
            this.mFaceAlbumRenameHandler = new FaceAlbumRenameHandler(this.mActivity, this.mFaceMediaSet, confirmListener(), !PeopleContactInfo.isUnKnownRelation(this.mRelationType));
        }
        this.mFaceAlbumRenameHandler.show();
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    public void startRemoveFromFaceAlbum(FaceAlbumHandlerListener faceAlbumHandlerListener) {
        if (this.mRemoveFromFaceAlbumHandler == null) {
            this.mRemoveFromFaceAlbumHandler = new RemoveFromFaceAlbumHandler(this.mActivity, new NormalPeopleFaceMediaSet(this.mLocalIdOfAlbum, getServerIdOfAlbum(), getAlbumName()), faceAlbumHandlerListener);
        }
        this.mRemoveFromFaceAlbumHandler.show();
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    /* JADX WARNING: Unknown variable types count: 1 */
    public void toast2CreateBabyAlbumBeforeShare() {
        AnonymousClass4 r0 = new OnClickListener() {
            /* JADX WARNING: type inference failed for: r5v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 17
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
                FindFace2CreateBabyAlbum.gotoFillBabyAlbumInfo(FacePageFragment.this.mActivity, new NormalPeopleFaceMediaSet(FacePageFragment.this.mLocalIdOfAlbum, FacePageFragment.this.getServerIdOfAlbum(), FacePageFragment.this.getAlbumName()), FacePageFragment.this.mAdapter.getFirstFaceServerId());
                GallerySamplingStatHelper.recordCountEvent("face", "face_create_baby_album");
            }
        };
        try {
            new Builder(this.mActivity).setCancelable(true).setIconAttribute(16843605).setMessage(R.string.begin_share_toast).setPositiveButton(this.mActivity.getString(17039370), r0).setNegativeButton(this.mActivity.getString(17039360), null).setOnCancelListener(new OnCancelListener() {
                public void onCancel(DialogInterface dialogInterface) {
                }
            }).create().show();
        } catch (Exception unused) {
        }
    }

    public void changeDisplayMode() {
        this.mAdapter.changeDisplayMode();
    }

    public void changeToNextPage() {
        if (this.mRecommendFaceGroup != null) {
            this.mRecommendFaceGroup.changeToNextPage();
        }
    }

    public long getIsHasEverNotCreateBabyAlbumFromThis() {
        return FaceManager.queryBabyAlbumByPeopleId(this.mServerIdOfAlbum);
    }

    /* access modifiers changed from: protected */
    public Loader getLoader() {
        return getLoaderManager().getLoader(1);
    }

    public String getPageName() {
        return "face";
    }

    public String getServerIdOfAlbum() {
        return this.mServerIdOfAlbum;
    }

    public boolean isFaceDisplayMode() {
        return this.mAdapter.isFaceDisplayMode();
    }

    /* JADX WARNING: type inference failed for: r0v11, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: type inference failed for: r1v13, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v11, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 56
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
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Bundle extras = this.mActivity.getIntent().getExtras();
        this.mServerIdOfAlbum = extras.getString("server_id_of_album");
        this.mLocalIdOfAlbum = Long.parseLong(extras.getString("local_id_of_album"));
        this.mFaceCoverPath = extras.getString("face_album_cover");
        this.mFaceCoverRectF = (RectF) extras.getParcelable("face_position_rect");
        this.mAlbumName = extras.getString("album_name");
        this.mFacePagePhotoLoaderCallback = new FacePagePhotoLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mFacePagePhotoLoaderCallback);
        addHeaderView();
        setTitle();
        if (bundle != null) {
            this.mFaceMediaSet = (NormalPeopleFaceMediaSet) bundle.getParcelable("NormalPeopleFaceMediaset");
            if (this.mFaceMediaSet != null) {
                this.mFaceAlbumRenameHandler = new FaceAlbumRenameHandler(this.mActivity, this.mFaceMediaSet, confirmListener(), true ^ PeopleContactInfo.isUnKnownRelation(this.mRelationType));
            }
            this.mFaceMediasetsList = bundle.getParcelableArrayList("NormalPeopleFaceMediasetList");
            if (this.mFaceMediasetsList != null) {
                this.mFaceAlbumMergeHandler = new FaceAlbumRenameHandler((Activity) this.mActivity, this.mFaceMediasetsList, confirmListener());
            }
        }
    }

    /* JADX WARNING: type inference failed for: r3v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r3v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r3v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 48
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
    /* JADX WARNING: Unknown variable types count: 3 */
    public void onActivityResult(int i, int i2, Intent intent) {
        PeopleContactInfo peopleContactInfo = null;
        switch (i) {
            case 16:
                PeopleContactInfo contactInfo = (intent == null || i2 != -1) ? null : InputFaceNameFragment.getContactInfo(this.mActivity, intent);
                if (this.mFaceAlbumRenameHandler != null) {
                    this.mFaceAlbumRenameHandler.finishWhenGetContact(contactInfo);
                }
                this.mFaceMediaSet = null;
                return;
            case 17:
                if (intent != null && i2 == -1) {
                    peopleContactInfo = InputFaceNameFragment.getContactInfo(this.mActivity, intent);
                }
                if (this.mRemoveFromFaceAlbumHandler != null) {
                    this.mRemoveFromFaceAlbumHandler.finishWhenGetContact(peopleContactInfo);
                    return;
                }
                return;
            case 19:
                PeopleContactInfo contactInfo2 = (intent == null || i2 != -1) ? null : InputFaceNameFragment.getContactInfo(this.mActivity, intent);
                if (this.mFaceAlbumMergeHandler != null) {
                    this.mFaceAlbumMergeHandler.finishWhenGetContact(contactInfo2);
                }
                this.mFaceMediasetsList = null;
                return;
            case 21:
                if (intent != null && i2 == -1 && intent.getBooleanExtra("all_faces_confirmed", false)) {
                    this.mFaceGridView.removeFooterView(this.mFooterView);
                    return;
                }
                return;
            default:
                super.onActivityResult(i, i2, intent);
                return;
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mRecommendFaceAdapter != null) {
            this.mRecommendFaceAdapter.setOnLoadingCompleteListener(null);
        }
        cancelTask(this.mNameRefreshTask);
        cancelTask(this.mCoverRefreshTask);
        if (this.mAdapter != null) {
            this.mAdapter.swapCursor(null);
        }
    }

    public void onFinishCheckoutPeopleFace(int i) {
        this.mPeopleRecommendMediaSet.refreshRecommendInfo();
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r4v9, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 65
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
    /* JADX WARNING: Unknown variable types count: 3 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.face_page, viewGroup, false);
        this.mAdapter = new FacePageAdapter(this.mActivity);
        this.mFaceGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid);
        this.mFaceGridViewWrapper = new EditableListViewWrapperDeprecated(this.mFaceGridView);
        this.mFaceGridViewWrapper.setAdapter(this.mAdapter);
        this.mFaceGridViewWrapper.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                int i2 = i;
                FacePageAdapter access$000 = FacePageFragment.this.mAdapter;
                ImageLoadParams imageLoadParams = new ImageLoadParams(access$000.getItemKey(i2), access$000.getLocalPath(i2), ThumbConfig.get().sMicroTargetSize, access$000.getItemDecodeRectF(i2), i, access$000.getMimeType(i2), true, access$000.getFileLength(i2));
                IntentUtil.gotoPhotoPage((BaseMediaFragment) FacePageFragment.this, (ViewGroup) adapterView, PeopleFace.ONE_PERSON_URI, i, access$000.getCount(), (String) null, FacePageFragment.this.getSelectioinArgs(), FacePageFragment.this.getOrderBy(), imageLoadParams, FacePageFragment.this.mAlbumName, true);
                GallerySamplingStatHelper.recordNumericPropertyEvent(FacePageFragment.this.getPageName(), "click_micro_thumb", (long) i2);
            }
        });
        this.mFaceGridView.setAreHeadersSticky(false);
        this.mFooterView = LayoutInflater.from(this.mActivity).inflate(R.layout.see_more_recommend_face_view, this.mFaceGridView, false);
        this.mRecommendFaceButtonContainer = this.mFooterView.findViewById(R.id.see_more_recommend_face_container);
        this.mRecommendFaceButtonContainer.findViewById(R.id.see_more_recommend_face).setOnClickListener(new View.OnClickListener() {
            /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
            public void onClick(View view) {
                FacePageFragment.this.mPeopleRecommendMediaSet.refreshRecommendInfo();
                Intent intent = new Intent(FacePageFragment.this.mActivity, RecommendFacePageActivity.class);
                intent.putExtra("server_id_of_album", FacePageFragment.this.getServerIdOfAlbum());
                intent.putExtra("local_id_of_album", FacePageFragment.this.mLocalIdOfAlbum);
                intent.putExtra("album_name", FacePageFragment.this.getAlbumName());
                intent.putExtra("server_ids_of_faces", FacePageFragment.this.mPeopleRecommendMediaSet.getServerIdsIn());
                FacePageFragment.this.startActivityForResult(intent, 21);
                GallerySamplingStatHelper.recordCountEvent("face", "face_enter_recommend");
            }
        });
        this.mRelationType = this.mActivity.getIntent().getIntExtra("relationType", -1);
        if (PeopleContactInfo.isBabyRelation(this.mRelationType) && ApplicationHelper.supportShare()) {
            this.mShareButtonContainer = inflate.findViewById(R.id.share_container);
            this.mShareButtonContainer.setVisibility(0);
            ActionMenuItemView actionMenuItemView = (ActionMenuItemView) this.mShareButtonContainer.findViewById(R.id.share_button);
            if (BuildUtil.isMiuiSdkGte15(this.mActivity)) {
                actionMenuItemView.setIcon(this.mActivity.getResources().getDrawable(R.drawable.v15_action_button_album_share_light));
            }
            actionMenuItemView.findViewById(R.id.share_button).setOnClickListener(new View.OnClickListener() {
                /* JADX WARNING: type inference failed for: r6v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r6v4, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 15
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
                public void onClick(View view) {
                    long isHasEverNotCreateBabyAlbumFromThis = FacePageFragment.this.getIsHasEverNotCreateBabyAlbumFromThis();
                    if (isHasEverNotCreateBabyAlbumFromThis == -1) {
                        FacePageFragment.this.toast2CreateBabyAlbumBeforeShare();
                        return;
                    }
                    UIHelper.showAlbumShareInfo(FacePageFragment.this.mActivity, new Path(isHasEverNotCreateBabyAlbumFromThis, false, true), 0);
                    GallerySamplingStatHelper.recordCountEvent("face", "face_enter_album_share");
                }
            });
        }
        this.mFaceGridViewWrapper.setChoiceMode(3);
        this.mListener = new ChoiceModeListener();
        this.mFaceGridViewWrapper.setMultiChoiceModeListener(this.mListener);
        return inflate;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.action_change_mode_to_face /*2131296262*/:
                changeDisplayMode();
                recordDisplayModeCountEvent("face");
                return true;
            case R.id.action_change_mode_to_photo /*2131296263*/:
                changeDisplayMode();
                recordDisplayModeCountEvent("photo");
                return true;
            case R.id.action_ignore /*2131296271*/:
                shoeIgnoreAlert();
                return true;
            case R.id.action_merge_to /*2131296277*/:
                showMergeHandler();
                return true;
            default:
                return false;
        }
    }

    public void onPageChanged(int i, int i2, boolean z) {
        if (z) {
            this.mFaceGridView.removeHeaderView(this.mRecommendFaceGroupHeader);
            return;
        }
        TextView textView = (TextView) this.mRecommendFaceGroupHeader.findViewById(R.id.face_recommend_group_number);
        if (i2 == 1) {
            this.mRecommendFaceGroupHeader.findViewById(R.id.group_divider).setVisibility(8);
        } else {
            textView.setText(getString(R.string.face_recommend_group_number, new Object[]{Integer.valueOf(i + 1), Integer.valueOf(i2)}));
        }
    }

    public void onResume() {
        super.onResume();
        refreshFaceNameIfNeeded();
        seeIfHasRecommendFace();
        if (this.mRecommendFaceGroup != null) {
            this.mRecommendFaceGroup.freshCurrentPage();
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mFaceMediaSet != null) {
            bundle.putParcelable("NormalPeopleFaceMediaset", this.mFaceMediaSet);
        }
        if (this.mFaceMediasetsList != null) {
            bundle.putParcelableArrayList("NormalPeopleFaceMediasetList", this.mFaceMediasetsList);
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mCheckoutRecommendPeopleTask != null) {
            this.mCheckoutRecommendPeopleTask.clearListener();
        }
    }
}
