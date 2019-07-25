package com.miui.gallery.ui;

import android.content.ContentUris;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.adapter.AlbumDetailSimpleAdapter;
import com.miui.gallery.preference.GalleryPreferences.Baby;
import com.miui.gallery.provider.GalleryContract.Media;
import java.util.Locale;

public class AlbumNewPhotoDetailFragment extends PhotoListFragmentBase {
    private AlbumDetailSimpleAdapter mAdapter;
    protected boolean mIsOtherShareAlbum;

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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public AlbumDetailSimpleAdapter getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = new AlbumDetailSimpleAdapter(this.mActivity);
        }
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public int getLayoutSource() {
        return R.layout.album_new_photo_detail;
    }

    public String getPageName() {
        return "album_new_photo_detail";
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        if (this.mIsOtherShareAlbum) {
            return String.format(Locale.US, "(%s >= %s)", new Object[]{"serverTag", String.valueOf(Baby.getMinServerTagOfNewPhoto(this.mAlbumId))});
        }
        return String.format(Locale.US, "(%s >= ? AND %s = ?)", new Object[]{"serverTag", "localGroupId"});
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        if (this.mIsOtherShareAlbum) {
            return null;
        }
        return new String[]{String.valueOf(Baby.getMinServerTagOfNewPhoto(this.mAlbumId)), String.valueOf(this.mAlbumId)};
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return this.mIsOtherShareAlbum ? ContentUris.withAppendedId(Media.URI_OTHER_ALBUM_MEDIA, this.mAlbumId) : Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
    }

    public void onDestroy() {
        Baby.saveMinServerTagOfNewPhoto(this.mAlbumId, Long.valueOf(0));
        super.onDestroy();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onInflateView = super.onInflateView(layoutInflater, viewGroup, bundle);
        this.mAlbumDetailGridView.setAdapter(getAdapter());
        this.mAlbumDetailGridView.setOnItemClickListener(getGridViewOnItemClickListener());
        Intent intent = this.mActivity.getIntent();
        this.mAlbumName = intent.getStringExtra("album_name");
        if (!TextUtils.isEmpty(this.mAlbumName)) {
            this.mActivity.getActionBar().setTitle(this.mAlbumName);
        }
        this.mAlbumId = intent.getLongExtra("album_id", -1);
        this.mIsOtherShareAlbum = intent.getBooleanExtra("other_share_album", false);
        this.mAlbumDetailGridView.setLongClickable(false);
        return onInflateView;
    }
}
