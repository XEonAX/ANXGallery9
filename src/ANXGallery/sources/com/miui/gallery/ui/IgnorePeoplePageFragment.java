package com.miui.gallery.ui;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.ContentValues;
import android.content.Context;
import android.content.CursorLoader;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.Loader;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.widget.Button;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.activity.facebaby.InputFaceNameActivity;
import com.miui.gallery.adapter.IgnorePeoplePageAdapter;
import com.miui.gallery.adapter.IgnorePeoplePageAdapter.OnRecoveryButtonClickListener;
import com.miui.gallery.cloud.CreateGroupItem;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.provider.FaceManager;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.face.PeopleCursorHelper;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.display.CircleBitmapDisplayer;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.util.ArrayList;

public class IgnorePeoplePageFragment extends BaseFragment {
    /* access modifiers changed from: private */
    public IgnorePeoplePageAdapter mAdapter;
    /* access modifiers changed from: private */
    public View mEmptyView;
    /* access modifiers changed from: private */
    public ViewStub mEmptyViewStub;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler();
    /* access modifiers changed from: private */
    public GridView mIgnorePeopleGridView;
    private IgnorePeoplePageLoaderCallback mIgnorePeoplePageLoaderCallback;
    /* access modifiers changed from: private */
    public NormalPeopleFaceMediaSet mPeopleToRecovery;
    /* access modifiers changed from: private */
    public AlertDialog mRecoveryDialog;
    private OnRecoveryButtonClickListener mRecoveryListener = new OnRecoveryButtonClickListener() {
        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: type inference failed for: r3v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
        /* JADX WARNING: Unknown variable types count: 2 */
        public void onPeopleRecoveryButtonClick(String str, String str2, String str3, String str4, RectF rectF) {
            View inflate = LayoutInflater.from(IgnorePeoplePageFragment.this.mActivity).inflate(R.layout.ignore_to_visible_dialog, null, false);
            IgnorePeoplePageFragment.this.mRecoveryDialog = new Builder(IgnorePeoplePageFragment.this.mActivity).setView(inflate).setPositiveButton(17039370, null).setNegativeButton(17039360, null).create();
            ImageView imageView = (ImageView) inflate.findViewById(R.id.ignore_face);
            ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(str4), new ImageViewAware(imageView), new DisplayImageOptions.Builder().cacheThumbnail(true).loadFromMicroCache(true).cacheInMemory(true).considerExifParams(true).showStubImage(R.drawable.default_face_cover).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new CircleBitmapDisplayer()).usingRegionDecoderFace(true).build(), ThumbConfig.get().sMicroTargetSize, null, null, rectF);
            IgnorePeoplePageFragment.this.mRecoveryDialog.show();
            Button button = IgnorePeoplePageFragment.this.mRecoveryDialog.getButton(-1);
            final Button button2 = button;
            final String str5 = str;
            final String str6 = str2;
            final String str7 = str3;
            AnonymousClass1 r0 = new OnClickListener() {
                public void onClick(View view) {
                    button2.setEnabled(false);
                    IgnorePeoplePageFragment.this.recoveryPeople(str5, str6, str7, IgnorePeoplePageFragment.this.mRecoveryDialog);
                }
            };
            button.setOnClickListener(r0);
        }
    };
    private AlertDialog mRenameOrMergeDialog;

    private class IgnorePeoplePageLoaderCallback implements LoaderCallbacks {
        private IgnorePeoplePageLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
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
            CursorLoader cursorLoader = new CursorLoader(IgnorePeoplePageFragment.this.mActivity);
            cursorLoader.setUri(PeopleFace.IGNORE_PERSONS_URI);
            cursorLoader.setProjection(PeopleCursorHelper.PROJECTION);
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            Cursor cursor = (Cursor) obj;
            if (cursor == null || cursor.getCount() == 0) {
                if (IgnorePeoplePageFragment.this.mEmptyView == null) {
                    IgnorePeoplePageFragment.this.mEmptyView = IgnorePeoplePageFragment.this.mEmptyViewStub.inflate();
                    IgnorePeoplePageFragment.this.mEmptyView.findViewById(R.id.back).setVisibility(8);
                    ((TextView) IgnorePeoplePageFragment.this.mEmptyView.findViewById(R.id.content)).setText(R.string.no_ignore_faces);
                }
                IgnorePeoplePageFragment.this.mIgnorePeopleGridView.setEmptyView(IgnorePeoplePageFragment.this.mEmptyView);
            }
            IgnorePeoplePageFragment.this.mAdapter.swapCursor(cursor);
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    /* access modifiers changed from: private */
    public void doRecovery(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet, String str) {
        String l = Long.toString(normalPeopleFaceMediaSet.getBucketId());
        ArrayList arrayList = new ArrayList();
        arrayList.add(l);
        ContentValues contentValues = new ContentValues();
        if (FaceManager.getPeopleLocalFlagByLocalID(l) != 8) {
            contentValues.put("localFlag", Integer.valueOf(14));
            contentValues.put("visibilityType", Integer.valueOf(4));
        } else {
            contentValues.put("visibilityType", Integer.valueOf(1));
        }
        contentValues.put("peopleName", str);
        FaceManager.safeUpdatePeopleFaceByIds(contentValues, arrayList);
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 37
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
    public void mergeWhenRecovery(NormalPeopleFaceMediaSet normalPeopleFaceMediaSet, String str) {
        synchronized (FaceDataManager.PEOPLE_FACE_URI) {
            ContentValues contentValues = new ContentValues();
            if (FaceManager.getPeopleLocalFlagByLocalID(Long.toString(normalPeopleFaceMediaSet.getBucketId())) != 8) {
                contentValues.put("localFlag", Integer.valueOf(14));
                contentValues.put("visibilityType", Integer.valueOf(4));
            } else {
                contentValues.put("visibilityType", Integer.valueOf(1));
            }
            FaceDataManager.safeUpdateFace(contentValues, String.format("%s = ? and %s != ? ", new Object[]{"_id", "localFlag"}), new String[]{Long.toString(normalPeopleFaceMediaSet.getBucketId()), String.valueOf(2)});
            normalPeopleFaceMediaSet.rename((Context) this.mActivity, str, false);
        }
    }

    /* access modifiers changed from: private */
    public void recoveryPeople(String str, String str2, String str3, AlertDialog alertDialog) {
        ThreadPool miscPool = ThreadManager.getMiscPool();
        final String str4 = str3;
        final String str5 = str;
        final String str6 = str2;
        final AlertDialog alertDialog2 = alertDialog;
        AnonymousClass2 r1 = new Job<Void>() {
            /* JADX WARNING: type inference failed for: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
            public Void run(JobContext jobContext) {
                String str = str4;
                if (!TextUtils.isEmpty(str4)) {
                    str = str4.split("-", 2)[0];
                }
                final NormalPeopleFaceMediaSet normalPeopleFaceMediaSet = new NormalPeopleFaceMediaSet(Long.parseLong(str5), str6, str4);
                final com.miui.gallery.cloud.peopleface.PeopleFace groupByPeopleName = FaceDataManager.getGroupByPeopleName(IgnorePeoplePageFragment.this.mActivity, str);
                IgnorePeoplePageFragment.this.mHandler.post(new Runnable() {
                    public void run() {
                        IgnorePeoplePageFragment.this.dismissDialog(alertDialog2);
                    }
                });
                if (groupByPeopleName == null) {
                    IgnorePeoplePageFragment.this.doRecovery(normalPeopleFaceMediaSet, str);
                } else {
                    IgnorePeoplePageFragment.this.mHandler.post(new Runnable() {
                        public void run() {
                            IgnorePeoplePageFragment.this.showMergeOrRenameDialog(normalPeopleFaceMediaSet, groupByPeopleName.peopleName);
                        }
                    });
                }
                return null;
            }
        };
        miscPool.submit(r1);
    }

    private void setTitle() {
        if (this.mActivity != null) {
            this.mActivity.getActionBar().setTitle(getString(R.string.ignore_faces_title));
        }
    }

    /* JADX WARNING: type inference failed for: r4v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    public void showMergeOrRenameDialog(final NormalPeopleFaceMediaSet normalPeopleFaceMediaSet, final String str) {
        AnonymousClass3 r0 = new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        IgnorePeoplePageFragment.this.mergeWhenRecovery(normalPeopleFaceMediaSet, str);
                        return null;
                    }
                });
            }
        };
        this.mRenameOrMergeDialog = new Builder(this.mActivity).setTitle(R.string.recovery_merge_or_rename).setMessage(R.string.recovery_merge_or_rename_message).setPositiveButton(R.string.recovery_merge, r0).setNegativeButton(R.string.recovery_rename, new DialogInterface.OnClickListener() {
            /* JADX WARNING: type inference failed for: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
            public void onClick(DialogInterface dialogInterface, int i) {
                IgnorePeoplePageFragment.this.mPeopleToRecovery = normalPeopleFaceMediaSet;
                Intent intent = new Intent(IgnorePeoplePageFragment.this.mActivity, InputFaceNameActivity.class);
                Bundle bundle = new Bundle();
                bundle.putString("original_name", str);
                intent.putExtras(bundle);
                IgnorePeoplePageFragment.this.mActivity.startActivityForResult(intent, 39);
            }
        }).create();
        this.mRenameOrMergeDialog.show();
    }

    public void dismissDialog(AlertDialog alertDialog) {
        if (alertDialog != null && alertDialog.isShowing()) {
            alertDialog.dismiss();
        }
    }

    public String getPageName() {
        return "ignore_people";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        setTitle();
        this.mIgnorePeoplePageLoaderCallback = new IgnorePeoplePageLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mIgnorePeoplePageLoaderCallback);
    }

    /* JADX WARNING: type inference failed for: r3v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r2v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v7, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 32
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
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i != 39) {
            super.onActivityResult(i, i2, intent);
        } else if (intent != null && this.mPeopleToRecovery != null) {
            final String string = intent.getExtras().getString("name");
            if (!TextUtils.isEmpty(string)) {
                String checkFileNameValid = CreateGroupItem.checkFileNameValid(this.mActivity, string);
                if (!TextUtils.isEmpty(checkFileNameValid)) {
                    ToastUtils.makeText((Context) this.mActivity, (CharSequence) checkFileNameValid);
                    return;
                }
            }
            if (!intent.getExtras().getBoolean("is_repeat_name")) {
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        IgnorePeoplePageFragment.this.doRecovery(IgnorePeoplePageFragment.this.mPeopleToRecovery, string);
                        return null;
                    }
                });
            } else {
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        IgnorePeoplePageFragment.this.mergeWhenRecovery(IgnorePeoplePageFragment.this.mPeopleToRecovery, string);
                        return null;
                    }
                });
            }
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        int firstVisiblePosition = this.mIgnorePeopleGridView.getFirstVisiblePosition();
        if (configuration.orientation == 2) {
            this.mIgnorePeopleGridView.setNumColumns(getResources().getInteger(R.integer.people_face_grid_view_columns_land));
        } else {
            this.mIgnorePeopleGridView.setNumColumns(getResources().getInteger(R.integer.people_face_grid_view_columns));
        }
        this.mIgnorePeopleGridView.setSelection(firstVisiblePosition);
    }

    public void onDestroy() {
        super.onDestroy();
        dismissDialog(this.mRecoveryDialog);
        dismissDialog(this.mRenameOrMergeDialog);
        if (this.mAdapter != null) {
            this.mAdapter.swapCursor(null);
        }
    }

    /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
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
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.ignore_people_page, viewGroup, false);
        this.mIgnorePeopleGridView = (GridView) inflate.findViewById(R.id.grid);
        this.mAdapter = new IgnorePeoplePageAdapter(this.mActivity);
        this.mAdapter.setRecoveryListener(this.mRecoveryListener);
        this.mIgnorePeopleGridView.setAdapter(this.mAdapter);
        this.mEmptyViewStub = (ViewStub) inflate.findViewById(R.id.empty_view);
        return inflate;
    }
}
