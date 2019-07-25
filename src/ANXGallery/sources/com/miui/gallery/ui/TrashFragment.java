package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.CursorLoader;
import android.content.Loader;
import android.database.Cursor;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import com.miui.gallery.R;
import com.miui.gallery.adapter.TrashAdapter;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.widget.HeaderGridView;

public class TrashFragment extends BaseFragment {
    private HeaderGridView mGridView;
    /* access modifiers changed from: private */
    public TrashAdapter mTrashAdapter;
    private TrashedPhotoLoaderCallback mTrashedPhotoLoaderCallback;

    private class TrashedPhotoLoaderCallback implements LoaderCallbacks {
        private TrashedPhotoLoaderCallback() {
        }

        /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
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
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader onCreateLoader(int i, Bundle bundle) {
            CursorLoader cursorLoader = new CursorLoader(TrashFragment.this.mActivity);
            cursorLoader.setUri(Media.URI.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build());
            cursorLoader.setProjection(TrashAdapter.PROJECTION);
            cursorLoader.setSortOrder("alias_create_time DESC ");
            return cursorLoader;
        }

        public void onLoadFinished(Loader loader, Object obj) {
            TrashFragment.this.mTrashAdapter.swapCursor((Cursor) obj);
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    public String getPageName() {
        return "trash";
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mTrashedPhotoLoaderCallback = new TrashedPhotoLoaderCallback();
        getLoaderManager().initLoader(1, null, this.mTrashedPhotoLoaderCallback);
    }

    public void onDestroy() {
        if (this.mTrashAdapter != null) {
            this.mTrashAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.trash, viewGroup, false);
        this.mGridView = (HeaderGridView) inflate.findViewById(R.id.trash_grid);
        this.mTrashAdapter = new TrashAdapter(this.mActivity);
        this.mGridView.setAdapter((ListAdapter) this.mTrashAdapter);
        return inflate;
    }
}
