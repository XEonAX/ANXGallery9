package com.miui.gallery.ui;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.ContentValues;
import android.content.CursorLoader;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.text.Html;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.util.SparseLongArray;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.facebaby.FacePageActivity;
import com.miui.gallery.activity.facebaby.IgnorePeoplePageActivity;
import com.miui.gallery.adapter.PeoplePageAdapter;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.base.SyncRequest;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.model.PeopleContactInfo.Relation;
import com.miui.gallery.model.PeopleContactInfo.UserDefineRelation;
import com.miui.gallery.people.mark.MarkMyselfViewHelper;
import com.miui.gallery.preference.GalleryPreferences.Face;
import com.miui.gallery.preference.GalleryPreferences.PrefKeys;
import com.miui.gallery.preference.PreferenceHelper;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.FaceManager.BasicPeopleInfo;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.PeopleFaceSnapshotHelper;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.GallerySchedulers;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.PeopleRelationSetDialogFragment.RelationSelectedListener;
import com.miui.gallery.ui.ProcessTask.OnCompleteListener;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.ui.renameface.FaceAlbumRenameHandler;
import com.miui.gallery.ui.renameface.FaceAlbumRenameHandler.ConfirmListener;
import com.miui.gallery.ui.renameface.InputFaceNameFragment;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.DialogUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.deprecated.Preference;
import com.miui.gallery.util.face.PeopleCursorHelper;
import com.miui.gallery.util.face.PeopleItem;
import com.miui.gallery.widget.AntiDoubleItemClickListener;
import com.miui.gallery.widget.EmptyPage;
import com.miui.gallery.widget.editwrapper.EditableListViewWrapperDeprecated;
import com.miui.gallery.widget.editwrapper.MultiChoiceModeListener;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.subjects.PublishSubject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class PeoplePageFragment extends BaseFragment {
    private MultiChoiceModeListener mChoiceModeListener = new MultiChoiceModeListener() {
        private ActionMode mMode;

        private void enableOrDisableMenuItem(boolean z) {
            Menu menu = this.mMode.getMenu();
            MenuItem findItem = menu.findItem(R.id.action_merge_face_album);
            if (findItem != null) {
                findItem.setEnabled(z);
            }
            MenuItem findItem2 = menu.findItem(R.id.action_ignore_face_album);
            if (findItem2 != null) {
                findItem2.setEnabled(z);
            }
            MenuItem findItem3 = menu.findItem(R.id.action_set_group);
            if (findItem3 != null) {
                findItem3.setEnabled(z);
            }
        }

        public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            int itemId = menuItem.getItemId();
            if (itemId == R.id.action_ignore_face_album) {
                PeoplePageFragment.this.showIgnoreFaceAlbumAlert(PeoplePageFragment.this.mPeopleGridViewWrapper.getCheckedItemIds(), this.mMode);
            } else if (itemId == R.id.action_merge_face_album) {
                PeoplePageFragment.this.mergePeople(PeoplePageFragment.this.mPeopleGridViewWrapper.getCheckedItemIds(), this.mMode);
            } else if (itemId != R.id.action_set_group) {
                return false;
            } else {
                PeoplePageFragment.this.showAndSetRelationDialog(PeoplePageFragment.this.mPeopleGridViewWrapper.getCheckedItemIds(), this.mMode);
            }
            return true;
        }

        public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
            enableOrDisableMenuItem(PeoplePageFragment.this.mPeopleGridViewWrapper.getCheckedItemCount() > 0);
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
            actionMode.getMenuInflater().inflate(BuildUtil.isMiuiSdkGte15(PeoplePageFragment.this.mActivity) ? R.menu.v15_people_page_menu : R.menu.people_page_menu, menu);
            enableOrDisableMenuItem(false);
            PeoplePageFragment.this.mPeoplePageAdapter.enterChoiceMode();
            return true;
        }

        public void onDestroyActionMode(ActionMode actionMode) {
            this.mMode = null;
            PeoplePageFragment.this.mPeoplePageAdapter.exitChoiceMode();
        }

        public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
            enableOrDisableMenuItem(PeoplePageFragment.this.mPeopleGridViewWrapper.getCheckedItemCount() > 0);
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            return false;
        }
    };
    private CompositeDisposable mCompositeDisposable = new CompositeDisposable();
    /* access modifiers changed from: private */
    public DisplayPeopleMode mDisplayPeopleMode = DisplayPeopleMode.DISPLAY_PARTIAL_PEOPLE;
    /* access modifiers changed from: private */
    public ViewStub mEmptyViewStub;
    /* access modifiers changed from: private */
    public FaceAlbumRenameHandler mFaceAlbumRenameHandler;
    boolean mFirstLoadFinish = true;
    /* access modifiers changed from: private */
    public View mFooterView;
    Handler mHandler = new Handler();
    boolean mHaveShownSetGroupToastDialog = false;
    /* access modifiers changed from: private */
    public boolean mInMarkMode = false;
    private OnItemClickListener mItemClickListener = new AntiDoubleItemClickListener() {
        /* JADX WARNING: type inference failed for: r4v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r4v15, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v10, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 84
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
        public void onAntiDoubleItemClick(AdapterView<?> adapterView, View view, int i, long j) {
            final String peopleIdOfItem = PeoplePageFragment.this.mPeoplePageAdapter.getPeopleIdOfItem(i);
            final String peopleLocalIdOfItem = PeoplePageFragment.this.mPeoplePageAdapter.getPeopleLocalIdOfItem(i);
            final String name = ((PeoplePageGridItem) view).getName();
            if (!PeoplePageFragment.this.mInMarkMode) {
                Intent intent = new Intent();
                Bundle bundle = new Bundle();
                bundle.putString("server_id_of_album", peopleIdOfItem);
                bundle.putString("local_id_of_album", peopleLocalIdOfItem);
                bundle.putString("album_name", name);
                bundle.putInt("relationType", PeoplePageFragment.this.mPeoplePageAdapter.getRelationTypeOfItem(i));
                bundle.putString("face_album_cover", PeoplePageFragment.this.mPeoplePageAdapter.getThumbFilePath(i));
                bundle.putParcelable("face_position_rect", PeoplePageFragment.this.mPeoplePageAdapter.getFaceRegionRectF(i));
                intent.putExtras(bundle);
                intent.setClass(PeoplePageFragment.this.mActivity, FacePageActivity.class);
                PeoplePageFragment.this.startActivity(intent);
            } else if (PeoplePageFragment.this.mMarkRelation != null) {
                ProcessTask processTask = new ProcessTask(new ProcessCallback<Void, Boolean>() {
                    public Boolean doProcess(Void[] voidArr) {
                        String relationValue = PeopleContactInfo.getRelationValue(PeoplePageFragment.this.mMarkRelation);
                        return Boolean.valueOf(NormalPeopleFaceMediaSet.moveFaceToRelationGroup(new long[]{Long.valueOf(peopleLocalIdOfItem).longValue()}, relationValue, relationValue));
                    }
                });
                processTask.setCompleteListener(new OnCompleteListener<Boolean>() {
                    public void onCompleteProcess(Boolean bool) {
                        if (bool == null || !bool.booleanValue()) {
                            ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.mark_operation_failed);
                            return;
                        }
                        PeoplePageFragment.this.finishWithMarkSuccessResult(peopleLocalIdOfItem, peopleIdOfItem, name, PeoplePageFragment.this.mMarkName, PeoplePageFragment.this.mMarkRelation.getRelationType());
                        HashMap hashMap = new HashMap();
                        hashMap.put("relationType", String.valueOf(PeoplePageFragment.this.mMarkRelation.getRelationType()));
                        GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_relation_in_people_page", hashMap);
                    }
                });
                processTask.showProgress(PeoplePageFragment.this.mActivity, PeoplePageFragment.this.getString(R.string.mark_operation_processing));
                processTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
            } else if (!TextUtils.isEmpty(PeoplePageFragment.this.mMarkName)) {
                PeoplePageFragment.this.mFaceAlbumRenameHandler = new FaceAlbumRenameHandler((Activity) PeoplePageFragment.this.mActivity, new NormalPeopleFaceMediaSet(Long.valueOf(peopleLocalIdOfItem).longValue(), peopleIdOfItem, TextUtils.isEmpty(PeoplePageFragment.this.mMarkName) ? name : PeoplePageFragment.this.mMarkName), (ConfirmListener) new ConfirmListener() {
                    public void onConfirm(String str, boolean z) {
                        PeoplePageFragment.this.finishWithMarkSuccessResult(peopleLocalIdOfItem, peopleIdOfItem, str, name, PeoplePageFragment.this.mMarkName);
                    }
                });
                PeoplePageFragment.this.mFaceAlbumRenameHandler.show();
            }
        }
    };
    /* access modifiers changed from: private */
    public MarkMyselfViewHelper mMarkMyselfHelper = null;
    /* access modifiers changed from: private */
    public String mMarkName = null;
    /* access modifiers changed from: private */
    public Relation mMarkRelation = null;
    /* access modifiers changed from: private */
    public int mPartialPeopleCount;
    /* access modifiers changed from: private */
    public StickyGridHeadersGridView mPeopleGridView;
    /* access modifiers changed from: private */
    public EditableListViewWrapperDeprecated mPeopleGridViewWrapper;
    /* access modifiers changed from: private */
    public PublishSubject<List<PeopleItem>> mPeopleItemPublishSubject = PublishSubject.create();
    /* access modifiers changed from: private */
    public PeoplePageAdapter mPeoplePageAdapter;
    /* access modifiers changed from: private */
    public PeoplePagePhotoLoaderCallback mPeoplePagePhotoLoaderCallback;
    /* access modifiers changed from: private */
    public ShowEmptyViewHelper mShowEmptyViewHelper = new ShowEmptyViewHelper();

    enum DisplayPeopleMode {
        NOT_DISTINGUISH,
        DISPLAY_ALL_PEOPLE,
        DISPLAY_PARTIAL_PEOPLE
    }

    private class PeoplePagePhotoLoaderCallback implements LoaderCallbacks {
        private Future mChangeToVisibleFuture;
        SparseBooleanArray mIsManualLoad;
        /* access modifiers changed from: private */
        public ArrayList<String> mLastLoadVisibilityUndefinedIds;
        SparseLongArray mLoaderCreateTime;

        private PeoplePagePhotoLoaderCallback() {
            this.mLastLoadVisibilityUndefinedIds = new ArrayList<>();
            this.mLoaderCreateTime = new SparseLongArray();
            this.mIsManualLoad = new SparseBooleanArray();
        }

        private void changeUndefinedToVisible(final ArrayList<String> arrayList) {
            if (this.mChangeToVisibleFuture != null) {
                this.mChangeToVisibleFuture.cancel();
                this.mChangeToVisibleFuture = null;
            }
            this.mChangeToVisibleFuture = ThreadManager.getMiscPool().submit(new Job<Void>() {
                public Void run(JobContext jobContext) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("visibilityType", Integer.valueOf(1));
                    FaceManager.safeUpdatePeopleFaceByIds(contentValues, arrayList);
                    synchronized (PeoplePagePhotoLoaderCallback.this.mLastLoadVisibilityUndefinedIds) {
                        PeoplePagePhotoLoaderCallback.this.mLastLoadVisibilityUndefinedIds.clear();
                        PeoplePagePhotoLoaderCallback.this.mLastLoadVisibilityUndefinedIds.addAll(arrayList);
                    }
                    return null;
                }
            });
        }

        private void doResetFooterAfterReload(boolean z) {
            if (PeoplePageFragment.this.mDisplayPeopleMode == DisplayPeopleMode.NOT_DISTINGUISH) {
                PeoplePageFragment.this.mPeopleGridView.removeFooterView(PeoplePageFragment.this.mFooterView);
            } else if (!z) {
                PeoplePageFragment.this.mPeopleGridView.addFooterView(PeoplePageFragment.this.mFooterView);
                ((TextView) PeoplePageFragment.this.mFooterView.findViewById(R.id.see_more_people_text)).setText(PeoplePageFragment.this.mDisplayPeopleMode == DisplayPeopleMode.DISPLAY_PARTIAL_PEOPLE ? PeoplePageFragment.this.mActivity.getString(R.string.expand_people) : PeoplePageFragment.this.mActivity.getString(R.string.collaps_people));
            }
        }

        private ArrayList<String> getVisibilityTypeUndefinedIds(Cursor cursor) {
            ArrayList<String> arrayList = new ArrayList<>();
            if (cursor != null && cursor.getCount() > 0) {
                while (cursor.moveToNext()) {
                    if (PeopleCursorHelper.getVisibilityType(cursor) == 0) {
                        arrayList.add(PeopleCursorHelper.getPeopleLocalId(cursor));
                    }
                }
            }
            return arrayList;
        }

        /* JADX WARNING: type inference failed for: r2v0, types: [android.app.Fragment, com.miui.gallery.ui.PeoplePageFragment] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [android.app.Fragment, com.miui.gallery.ui.PeoplePageFragment]
  assigns: [com.miui.gallery.ui.PeoplePageFragment]
  uses: [android.app.Fragment]
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
        private boolean initMarkMyselfHelper() {
            if (PeoplePageFragment.this.mInMarkMode) {
                return false;
            }
            if (PeoplePageFragment.this.mMarkMyselfHelper == null) {
                PeoplePageFragment.this.mMarkMyselfHelper = new MarkMyselfViewHelper(PeoplePageFragment.this);
            }
            return PeoplePageFragment.this.mMarkMyselfHelper.onStart();
        }

        /* JADX WARNING: type inference failed for: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 33
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
        private void initialSetGroupToastDialog(Cursor cursor) {
            String str;
            String str2;
            if (cursor != null && cursor.getCount() != 0) {
                if (seeIfHasNamedPeople(cursor)) {
                    str = PeoplePageFragment.this.mActivity.getString(R.string.set_face_group_toast_title_old_user);
                    str2 = PeoplePageFragment.this.mActivity.getString(R.string.set_face_group_toast_msg_old_user);
                } else {
                    str = PeoplePageFragment.this.mActivity.getString(R.string.set_face_group_toast_title_new_user);
                    str2 = PeoplePageFragment.this.mActivity.getString(R.string.set_face_group_toast_msg_new_user);
                }
                AnonymousClass1 r1 = new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        PreferenceHelper.putBoolean(PrefKeys.FACE_HAS_TOAST_SET_GROUP, true);
                    }
                };
                if (!PeoplePageFragment.this.mHaveShownSetGroupToastDialog) {
                    new Builder(PeoplePageFragment.this.mActivity).setMessage(str2).setTitle(str).setCancelable(true).setPositiveButton(R.string.have_known, r1).show();
                    PeoplePageFragment.this.mHaveShownSetGroupToastDialog = true;
                }
            }
        }

        private String loaderId2Name(int i) {
            switch (i) {
                case 1:
                    return "people_page_snapshot";
                case 2:
                    return "people_page_photos";
                default:
                    return String.valueOf(i);
            }
        }

        private boolean seeIfHasNamedPeople(Cursor cursor) {
            if (cursor == null) {
                return false;
            }
            cursor.moveToFirst();
            while (cursor.moveToNext()) {
                if (!TextUtils.isEmpty(PeopleCursorHelper.getPeopleName(cursor))) {
                    return true;
                }
            }
            return false;
        }

        private boolean shouldShowSetGroupToastDialog() {
            if (!PeoplePageFragment.this.mInMarkMode) {
                return (PeoplePageFragment.this.mMarkMyselfHelper == null || !PeoplePageFragment.this.mMarkMyselfHelper.isSuggestionDialogVisible()) && !PeoplePageFragment.this.mHaveShownSetGroupToastDialog && !PreferenceHelper.getBoolean(PrefKeys.FACE_HAS_TOAST_SET_GROUP, false);
            }
            return false;
        }

        private void statLoadTime(String str, long j, int i) {
            HashMap hashMap = new HashMap();
            hashMap.put("loader", str);
            hashMap.put("costs", String.valueOf(j));
            hashMap.put("count", String.valueOf(i));
            GallerySamplingStatHelper.recordCountEvent("people", "people_load_time", hashMap);
        }

        private Cursor wrapCursorByDisplayMode(Cursor cursor, ArrayList<String> arrayList, HashMap hashMap) {
            if (cursor == null || cursor.getCount() == 0) {
                return cursor;
            }
            cursor.moveToFirst();
            int i = 0;
            int i2 = 0;
            int i3 = 0;
            int i4 = 0;
            while (!cursor.isAfterLast() && i2 <= 18) {
                int relationType = PeopleCursorHelper.getRelationType(cursor);
                if (PeopleContactInfo.isUserDefineRelation(relationType)) {
                    String relationText = PeopleCursorHelper.getRelationText(cursor);
                    if (relationText != null && !hashMap.containsKey(relationText)) {
                        hashMap.put(relationText, Integer.valueOf(arrayList.size()));
                        arrayList.add(relationText);
                    }
                } else if (PeopleContactInfo.isUnKnownRelation(relationType)) {
                    i3++;
                    if (TextUtils.isEmpty(PeopleCursorHelper.getPeopleName(cursor))) {
                        i2++;
                    }
                }
                i4++;
                if (i4 >= 18 && i2 > 0 && i3 % 3 == 0) {
                    break;
                }
                cursor.moveToNext();
            }
            PeoplePageFragment.this.mPartialPeopleCount = i4;
            if (i4 == cursor.getCount()) {
                PeoplePageFragment.this.mDisplayPeopleMode = DisplayPeopleMode.NOT_DISTINGUISH;
                return cursor;
            } else if (PeoplePageFragment.this.mDisplayPeopleMode != DisplayPeopleMode.DISPLAY_PARTIAL_PEOPLE) {
                return cursor;
            } else {
                MatrixCursor matrixCursor = new MatrixCursor(PeopleCursorHelper.PROJECTION);
                cursor.moveToFirst();
                while (!cursor.isAfterLast() && i < i4) {
                    PeopleCursorHelper.add2MatrixCursor(matrixCursor, cursor);
                    i++;
                    cursor.moveToNext();
                }
                return matrixCursor;
            }
        }

        /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
            this.mIsManualLoad.put(i, true);
            this.mLoaderCreateTime.put(i, System.currentTimeMillis());
            CursorLoader cursorLoader = new CursorLoader(PeoplePageFragment.this.mActivity);
            if (i == 1) {
                cursorLoader.setUri(PeopleFace.PEOPLE_SNAPSHOT_URI);
                cursorLoader.setProjection(PeopleItem.COMPAT_PROJECTION);
            } else {
                cursorLoader.setUri(PeopleFace.PERSONS_URI);
                cursorLoader.setProjection(PeopleCursorHelper.PROJECTION);
            }
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            if (obj == null) {
                Log.d("PeoplePageFragment", "empty load result");
                return;
            }
            long currentTimeMillis = System.currentTimeMillis();
            if (!initMarkMyselfHelper() && PeoplePageFragment.this.mFirstLoadFinish && shouldShowSetGroupToastDialog()) {
                initialSetGroupToastDialog((Cursor) obj);
            }
            PeoplePageFragment.this.mFirstLoadFinish = false;
            ArrayList arrayList = new ArrayList();
            HashMap hashMap = new HashMap();
            Cursor cursor = (Cursor) obj;
            Cursor wrapCursorByDisplayMode = wrapCursorByDisplayMode(cursor, arrayList, hashMap);
            UserDefineRelation.setUserDefineRelations(arrayList);
            PeoplePageFragment.this.mPeoplePageAdapter.setUserDefineRelationMap(hashMap);
            PeoplePageFragment.this.mPeoplePageAdapter.changeCursor(wrapCursorByDisplayMode);
            int id = loader.getId();
            if (id == 2) {
                boolean z = true;
                if (PeoplePageFragment.this.getLoaderManager().getLoader(1) != null) {
                    PeoplePageFragment.this.destroySnapshotLoader();
                }
                PeoplePageFragment.this.mPeopleItemPublishSubject.onNext(PeopleFaceSnapshotHelper.cursor2Entities(wrapCursorByDisplayMode));
                boolean z2 = obj == null || cursor.getCount() == 0;
                PeoplePageFragment.this.mPeopleGridView.setEmptyView(PeoplePageFragment.this.mShowEmptyViewHelper.initializeEmptyView(PeoplePageFragment.this.mEmptyViewStub, z2));
                doResetFooterAfterReload(z2);
                ArrayList visibilityTypeUndefinedIds = getVisibilityTypeUndefinedIds(cursor);
                synchronized (this.mLastLoadVisibilityUndefinedIds) {
                    if (this.mLastLoadVisibilityUndefinedIds.containsAll(visibilityTypeUndefinedIds)) {
                        if (visibilityTypeUndefinedIds.containsAll(this.mLastLoadVisibilityUndefinedIds)) {
                            z = false;
                        }
                    }
                }
                if (z) {
                    changeUndefinedToVisible(visibilityTypeUndefinedIds);
                }
            } else {
                PeoplePageFragment.this.loadPeoplePage();
            }
            if (this.mIsManualLoad.get(id)) {
                this.mIsManualLoad.put(id, false);
                long j = currentTimeMillis - this.mLoaderCreateTime.get(id);
                Log.d("PeoplePageFragment", "loader : %s, people count : %d, costs %d", loaderId2Name(id), Integer.valueOf(cursor.getCount()), Long.valueOf(j));
                statLoadTime(loaderId2Name(id), j, cursor.getCount());
            }
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private class ShowEmptyViewHelper {
        EmptyPage mEmptyView;

        private ShowEmptyViewHelper() {
            this.mEmptyView = null;
        }

        /* access modifiers changed from: private */
        public View initializeEmptyView(ViewStub viewStub, boolean z) {
            if (z) {
                if (this.mEmptyView == null) {
                    this.mEmptyView = (EmptyPage) viewStub.inflate();
                    setupEmptyView();
                }
                updateEmptyView();
            }
            return this.mEmptyView;
        }

        private void setupEmptyView() {
            this.mEmptyView.setActionButtonVisible(false);
        }

        /* access modifiers changed from: private */
        public void setupNetworkConnection() {
            if (PeoplePageFragment.this.getActivity() != null) {
                PeoplePageFragment.this.getActivity().startActivity(new Intent("android.settings.SETTINGS"));
            }
        }

        private void showFaceEmptyTips() {
            this.mEmptyView.setTitle((int) R.string.face_album_empty);
            this.mEmptyView.setActionButtonVisible(false);
        }

        private void showNoWifiTips() {
            this.mEmptyView.setTitle((int) R.string.face_album_empty_syncing_when_connect_wifi);
            this.mEmptyView.setActionButtonText((int) R.string.setup_network_connection);
            this.mEmptyView.setActionButtonVisible(true);
            this.mEmptyView.setOnActionButtonClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ShowEmptyViewHelper.this.setupNetworkConnection();
                }
            });
        }

        private void showSwitchClosedTips() {
            this.mEmptyView.setTitle((int) R.string.face_album_use_tip);
            this.mEmptyView.setActionButtonText((int) R.string.start_to_use_face_albumset);
            this.mEmptyView.setActionButtonVisible(true);
            this.mEmptyView.setOnActionButtonClickListener(new View.OnClickListener() {
                /* JADX WARNING: type inference failed for: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: type inference failed for: r0v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 31
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
                public void onClick(View view) {
                    AIAlbumStatusHelper.setFaceAlbumStatus(PeoplePageFragment.this.mActivity, true);
                    ShowEmptyViewHelper.this.updateEmptyView();
                    if (PeoplePageFragment.this.getLoaderManager().getLoader(2) == null) {
                        PeoplePageFragment.this.getLoaderManager().initLoader(2, null, PeoplePageFragment.this.mPeoplePagePhotoLoaderCallback);
                    }
                    SyncUtil.requestSync(PeoplePageFragment.this.mActivity, new SyncRequest.Builder().setSyncType(SyncType.NORMAL).setSyncReason(8).build());
                    GallerySamplingStatHelper.recordCountEvent("people", "people_open_switch");
                }
            });
        }

        private void showSyncOffTips() {
            this.mEmptyView.setTitle((int) R.string.face_album_use_tip);
            this.mEmptyView.setActionButtonText((int) R.string.search_backup_now);
            this.mEmptyView.setActionButtonVisible(true);
            this.mEmptyView.setOnActionButtonClickListener(new View.OnClickListener() {
                /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
                /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
                public void onClick(View view) {
                    IntentUtil.gotoTurnOnSyncSwitch(PeoplePageFragment.this.mActivity);
                }
            });
        }

        private void showSyncingTips() {
            this.mEmptyView.setTitle((int) R.string.face_album_empty_syncing);
            this.mEmptyView.setActionButtonVisible(false);
        }

        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 23
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
        public void updateEmptyView() {
            if (this.mEmptyView != null) {
                if (Preference.sIsFirstSynced()) {
                    if (!AIAlbumStatusHelper.isFaceAlbumEnabled()) {
                        showSwitchClosedTips();
                        return;
                    } else if (Face.isFirstSyncCompleted()) {
                        showFaceEmptyTips();
                        return;
                    }
                }
                if (!NetworkUtils.isNetworkConnected()) {
                    showNoWifiTips();
                } else if (!SyncUtil.isGalleryCloudSyncable(PeoplePageFragment.this.mActivity)) {
                    showSyncOffTips();
                } else {
                    showSyncingTips();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void destroySnapshotLoader() {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                if (PeoplePageFragment.this.getLoaderManager().getLoader(1) != null) {
                    PeoplePageFragment.this.getLoaderManager().destroyLoader(1);
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void finishWithMarkSuccessResult(String str, String str2, String str3, String str4, int i) {
        ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.mark_operation_succeeded);
        Intent intent = new Intent();
        intent.putExtra("server_id_of_album", str2);
        intent.putExtra("local_id_of_album", str);
        intent.putExtra("mark_relation", i);
        intent.putExtra("origin_album_name", str3);
        intent.putExtra("mark_album_name", str4);
        this.mActivity.setResult(-1, intent);
        this.mActivity.finish();
    }

    /* access modifiers changed from: private */
    public void finishWithMarkSuccessResult(String str, String str2, String str3, String str4, String str5) {
        ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.mark_operation_succeeded);
        Intent intent = new Intent();
        intent.putExtra("server_id_of_album", str2);
        intent.putExtra("local_id_of_album", str);
        intent.putExtra("album_name", str3);
        intent.putExtra("origin_album_name", str4);
        intent.putExtra("mark_album_name", str5);
        this.mActivity.setResult(-1, intent);
        this.mActivity.finish();
        this.mActivity.overridePendingTransition(0, 0);
    }

    /* access modifiers changed from: private */
    public void ignoreFaceAlbum(long[] jArr, ActionMode actionMode) {
        ArrayList arrayList = new ArrayList();
        for (long valueOf : jArr) {
            arrayList.add(Long.valueOf(valueOf));
        }
        FaceDataManager.safeIgnorePeopleByIds(arrayList);
        actionMode.finish();
    }

    /* access modifiers changed from: private */
    public void loadPeoplePage() {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                PeoplePageFragment.this.mDisplayPeopleMode = DisplayPeopleMode.DISPLAY_PARTIAL_PEOPLE;
                PeoplePageFragment.this.getLoaderManager().initLoader(2, null, PeoplePageFragment.this.mPeoplePagePhotoLoaderCallback);
            }
        });
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    public void mergePeople(long[] jArr, final ActionMode actionMode) {
        ArrayList peopleBasicInfoByIds = FaceManager.getPeopleBasicInfoByIds(jArr);
        if (peopleBasicInfoByIds != null && !peopleBasicInfoByIds.isEmpty()) {
            ArrayList arrayList = new ArrayList();
            Iterator it = peopleBasicInfoByIds.iterator();
            while (it.hasNext()) {
                BasicPeopleInfo basicPeopleInfo = (BasicPeopleInfo) it.next();
                arrayList.add(new NormalPeopleFaceMediaSet((long) basicPeopleInfo.id, basicPeopleInfo.serverId, basicPeopleInfo.name));
            }
            this.mFaceAlbumRenameHandler = new FaceAlbumRenameHandler((Activity) this.mActivity, arrayList, (ConfirmListener) new ConfirmListener() {
                public void onConfirm(String str, boolean z) {
                    PeoplePageFragment.this.mHandler.post(new Runnable() {
                        public void run() {
                            actionMode.finish();
                        }
                    });
                    GallerySamplingStatHelper.recordCountEvent("people", "people_merge_album");
                }
            });
            this.mFaceAlbumRenameHandler.show();
        }
    }

    /* JADX WARNING: type inference failed for: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    public void showAndSetRelationDialog(final long[] jArr, final ActionMode actionMode) {
        String str;
        if (jArr.length == 1) {
            PeopleContactInfo queryContactInfoOfOnePerson = FaceManager.queryContactInfoOfOnePerson(jArr[0]);
            if (queryContactInfoOfOnePerson != null) {
                str = queryContactInfoOfOnePerson.relationWithMeText;
                PeopleRelationSetDialogFragment.createRelationSetDialog(this.mActivity, this.mActivity.getString(R.string.set_group), str, jArr.length, new RelationSelectedListener() {
                    public void onRelationSelected(final String str, final String str2) {
                        actionMode.finish();
                        ThreadManager.getMiscPool().submit(new Job<Void>() {
                            public Void run(JobContext jobContext) {
                                NormalPeopleFaceMediaSet.moveFaceToRelationGroup(jArr, str, str2);
                                return null;
                            }
                        });
                    }
                });
            }
        }
        str = null;
        PeopleRelationSetDialogFragment.createRelationSetDialog(this.mActivity, this.mActivity.getString(R.string.set_group), str, jArr.length, new RelationSelectedListener() {
            public void onRelationSelected(final String str, final String str2) {
                actionMode.finish();
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        NormalPeopleFaceMediaSet.moveFaceToRelationGroup(jArr, str, str2);
                        return null;
                    }
                });
            }
        });
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    public boolean showIgnoreFaceAlbumAlert(final long[] jArr, final ActionMode actionMode) {
        DialogUtil.showConfirmAlertWithCancel(this.mActivity, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                PeoplePageFragment.this.ignoreFaceAlbum(jArr, actionMode);
                GallerySamplingStatHelper.recordCountEvent("people", "people_ignore_album");
            }
        }, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                actionMode.finish();
            }
        }, "", Html.fromHtml(this.mActivity.getString(R.string.ignore_alert_title)), this.mActivity.getString(17039370), 17039360);
        return true;
    }

    public String getPageName() {
        return "people";
    }

    public void onActivityCreated(Bundle bundle) {
        String str;
        super.onActivityCreated(bundle);
        this.mPeoplePagePhotoLoaderCallback = new PeoplePagePhotoLoaderCallback();
        if (!AIAlbumStatusHelper.isFaceAlbumEnabled()) {
            this.mShowEmptyViewHelper.initializeEmptyView(this.mEmptyViewStub, true).setVisibility(0);
            this.mPeopleGridView.setVisibility(8);
        } else {
            getLoaderManager().initLoader(1, null, this.mPeoplePagePhotoLoaderCallback);
        }
        Intent intent = this.mActivity.getIntent();
        if (intent.getData() != null) {
            Uri data = intent.getData();
            this.mInMarkMode = data.getBooleanQueryParameter("markMode", false);
            if (this.mInMarkMode) {
                this.mMarkName = data.getQueryParameter("markName");
                String queryParameter = data.getQueryParameter("markRelation");
                if (!TextUtils.isEmpty(queryParameter)) {
                    this.mMarkRelation = PeopleContactInfo.getRelation(PeopleContactInfo.getRelationType(queryParameter));
                    if (this.mMarkRelation == Relation.unknown) {
                        Log.w("PeoplePageFragment", "Do not support mark unknown group type");
                        this.mMarkRelation = null;
                    }
                }
                if (TextUtils.isEmpty(this.mMarkName) && this.mMarkRelation == null) {
                    Log.e("PeoplePageFragment", "Couldn't find valid mark arguments!");
                    finish();
                }
                if (!TextUtils.isEmpty(this.mMarkName)) {
                    str = getString(R.string.people_mark_mode_title, new Object[]{this.mMarkName});
                } else if (this.mMarkRelation != null) {
                    str = getString(R.string.people_mark_mode_title, new Object[]{PeopleContactInfo.getRelationName(this.mMarkRelation)});
                } else {
                    str = getString(R.string.people_mark_mode_title_no_mark_name);
                }
                this.mActivity.getActionBar().setTitle(str);
            }
        }
    }

    /* JADX WARNING: type inference failed for: r3v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i != 19) {
            if (i != 41) {
                switch (i) {
                    case 16:
                    case 17:
                        break;
                }
            } else if (this.mMarkMyselfHelper != null) {
                this.mMarkMyselfHelper.setLoadMoreMarkResult(i2 == -1);
            }
            super.onActivityResult(i, i2, intent);
            return;
        }
        PeopleContactInfo peopleContactInfo = null;
        if (intent != null && i2 == -1) {
            peopleContactInfo = InputFaceNameFragment.getContactInfo(this.mActivity, intent);
        }
        this.mFaceAlbumRenameHandler.finishWhenGetContact(peopleContactInfo);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        int firstVisiblePosition = this.mPeopleGridView.getFirstVisiblePosition();
        if (configuration.orientation == 2) {
            this.mPeopleGridView.setNumColumns(getResources().getInteger(R.integer.people_face_grid_view_columns_land));
        } else {
            this.mPeopleGridView.setNumColumns(getResources().getInteger(R.integer.people_face_grid_view_columns));
        }
        this.mPeopleGridView.setSelection(firstVisiblePosition);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mCompositeDisposable.add(this.mPeopleItemPublishSubject.observeOn(GallerySchedulers.misc()).delay(350, TimeUnit.MILLISECONDS, GallerySchedulers.misc()).throttleLatest(3000, TimeUnit.MILLISECONDS, GallerySchedulers.misc(), true).map($$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM.INSTANCE).subscribe());
    }

    public void onDestroy() {
        if (this.mPeoplePageAdapter != null) {
            this.mPeoplePageAdapter.swapCursor(null);
        }
        this.mCompositeDisposable.dispose();
        super.onDestroy();
    }

    /* JADX WARNING: type inference failed for: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r4v15, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 36
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
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.people_page, viewGroup, false);
        this.mPeopleGridView = (StickyGridHeadersGridView) inflate.findViewById(R.id.grid);
        this.mPeopleGridView.setHeadersIgnorePadding(true);
        this.mPeopleGridViewWrapper = new EditableListViewWrapperDeprecated(this.mPeopleGridView);
        this.mPeoplePageAdapter = new PeoplePageAdapter(this.mActivity);
        this.mPeopleGridViewWrapper.setAdapter(this.mPeoplePageAdapter);
        this.mPeopleGridViewWrapper.setOnItemClickListener(this.mItemClickListener);
        this.mPeopleGridViewWrapper.setChoiceMode(3);
        this.mPeopleGridViewWrapper.setMultiChoiceModeListener(this.mChoiceModeListener);
        this.mPeopleGridView.setAreHeadersSticky(false);
        this.mEmptyViewStub = (ViewStub) inflate.findViewById(R.id.empty_view);
        this.mFooterView = LayoutInflater.from(this.mActivity).inflate(R.layout.see_more_people_view, null, false);
        this.mFooterView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (PeoplePageFragment.this.mDisplayPeopleMode == DisplayPeopleMode.DISPLAY_PARTIAL_PEOPLE) {
                    PeoplePageFragment.this.mDisplayPeopleMode = DisplayPeopleMode.DISPLAY_ALL_PEOPLE;
                    PeoplePageFragment.this.mPeopleGridViewWrapper.getCheckedItemIds();
                } else if (PeoplePageFragment.this.mDisplayPeopleMode == DisplayPeopleMode.DISPLAY_ALL_PEOPLE) {
                    PeoplePageFragment.this.mDisplayPeopleMode = DisplayPeopleMode.DISPLAY_PARTIAL_PEOPLE;
                }
                PeoplePageFragment.this.getLoaderManager().getLoader(2).forceLoad();
                HashMap hashMap = new HashMap();
                hashMap.put("mode", PeoplePageFragment.this.mDisplayPeopleMode == DisplayPeopleMode.DISPLAY_ALL_PEOPLE ? "all" : "part");
                GallerySamplingStatHelper.recordCountEvent("people", "people_list_display_mode", hashMap);
            }
        });
        return inflate;
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 9
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
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != R.id.action_see_ignore_faces) {
            return false;
        }
        this.mActivity.startActivity(new Intent(this.mActivity, IgnorePeoplePageActivity.class));
        return true;
    }

    public void onStop() {
        super.onStop();
        if (this.mMarkMyselfHelper != null) {
            this.mMarkMyselfHelper.onStop();
        }
    }
}
