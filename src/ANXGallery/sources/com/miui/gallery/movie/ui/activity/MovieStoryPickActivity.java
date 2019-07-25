package com.miui.gallery.movie.ui.activity;

import android.content.ClipData;
import android.content.ClipData.Item;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.card.model.MediaInfo;
import com.miui.gallery.movie.ui.adapter.StoryMoviePickAdapter;
import com.miui.gallery.movie.ui.fragment.MovieStoryPickFragment;
import com.miui.gallery.picker.PickerActivity;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryOpenProvider;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MovieStoryPickActivity extends PickerActivity {
    /* access modifiers changed from: private */
    public List<MediaInfo> mMediaInfos;
    /* access modifiers changed from: private */
    public ParseTask mParseTask;
    private Intent mPickIntent;
    private MovieStoryPickFragment mPickStoryFragment;
    /* access modifiers changed from: private */
    public Set<String> mSelectedPhotoSha1s;

    private class ParseTask extends AsyncTask<Void, Void, Boolean> {
        private ParseTask() {
        }

        private String getSelection() {
            if (MovieStoryPickActivity.this.mSelectedPhotoSha1s == null) {
                MovieStoryPickActivity.this.mSelectedPhotoSha1s = new HashSet();
            }
            MovieStoryPickActivity.this.mSelectedPhotoSha1s.clear();
            for (String add : MovieStoryPickActivity.this.mPicker) {
                MovieStoryPickActivity.this.mSelectedPhotoSha1s.add(add);
            }
            return String.format("%s IN ('%s')", new Object[]{"sha1", TextUtils.join("','", MovieStoryPickActivity.this.mSelectedPhotoSha1s)});
        }

        private Uri getUri() {
            return Media.URI_OWNER_ALBUM_MEDIA.buildUpon().appendQueryParameter("remove_duplicate_items", String.valueOf(true)).build();
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Void... voidArr) {
            Cursor cursor;
            Exception e;
            boolean z = false;
            try {
                cursor = MovieStoryPickActivity.this.getContentResolver().query(getUri(), StoryMoviePickAdapter.PROJECTION, getSelection(), null, "alias_create_time DESC ");
                if (cursor != null) {
                    try {
                        MovieStoryPickActivity.this.mMediaInfos = new ArrayList(cursor.getCount());
                        while (cursor.moveToNext()) {
                            MovieStoryPickActivity.this.mMediaInfos.add(new MediaInfo(cursor));
                        }
                        z = true;
                    } catch (Exception e2) {
                        e = e2;
                        try {
                            Log.d("MovieStoryPickActivity", e.getMessage());
                        } catch (Throwable unused) {
                        }
                        MiscUtil.closeSilently(cursor);
                        return Boolean.valueOf(z);
                    }
                }
            } catch (Exception e3) {
                Exception exc = e3;
                cursor = null;
                e = exc;
                Log.d("MovieStoryPickActivity", e.getMessage());
            } catch (Throwable unused2) {
                cursor = null;
            }
            MiscUtil.closeSilently(cursor);
            return Boolean.valueOf(z);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean bool) {
            if (isCancelled()) {
                Log.e("MovieStoryPickActivity", "onPostExecute: the task is cancel.");
            } else if (!bool.booleanValue()) {
                Log.e("MovieStoryPickActivity", "onPostExecute: fail.");
            } else if (!MiscUtil.isValid(MovieStoryPickActivity.this.mMediaInfos)) {
                Log.e("MovieStoryPickActivity", "mMediaInfos is invalid .");
            } else {
                try {
                    MovieStoryPickActivity.this.mParseTask = null;
                    ClipData clipData = null;
                    for (int i = 0; i < MovieStoryPickActivity.this.mMediaInfos.size(); i++) {
                        if (MovieStoryPickActivity.this.mMediaInfos.get(i) != null) {
                            Uri translateToContent = GalleryOpenProvider.translateToContent(((MediaInfo) MovieStoryPickActivity.this.mMediaInfos.get(i)).getUri());
                            String sha1 = ((MediaInfo) MovieStoryPickActivity.this.mMediaInfos.get(i)).getSha1();
                            if (clipData == null) {
                                clipData = new ClipData("data", new String[]{"image/*", "text/uri-list"}, new Item(sha1, null, translateToContent));
                            } else {
                                clipData.addItem(new Item(sha1, null, translateToContent));
                            }
                        }
                    }
                    Intent resultIntent = MovieStoryPickActivity.this.getResultIntent();
                    resultIntent.setClipData(clipData);
                    MovieStoryPickActivity.this.setResult(-1, resultIntent);
                    MovieStoryPickActivity.this.finish();
                } catch (Exception e) {
                    Log.d("MovieStoryPickActivity", e.toString());
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    public Intent getResultIntent() {
        return this.mPickIntent != null ? this.mPickIntent : new Intent();
    }

    public void onBackPressed() {
        onCancel();
    }

    /* access modifiers changed from: protected */
    public void onCancel() {
        finish();
    }

    /* JADX WARNING: type inference failed for: r4v8, types: [com.miui.gallery.movie.ui.fragment.MovieStoryPickFragment, android.app.Fragment] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v8, types: [com.miui.gallery.movie.ui.fragment.MovieStoryPickFragment, android.app.Fragment]
  assigns: [com.miui.gallery.movie.ui.fragment.MovieStoryPickFragment]
  uses: [android.app.Fragment]
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setBackgroundDrawableResource(R.color.story_background_color);
        initActionBar();
        this.mPickIntent = getIntent();
        this.mPickStoryFragment = (MovieStoryPickFragment) getFragmentManager().findFragmentByTag("StoryMoviePickFragment");
        if (this.mPickStoryFragment == null) {
            this.mPickStoryFragment = new MovieStoryPickFragment();
            startFragment(this.mPickStoryFragment, "StoryMoviePickFragment", false, true);
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        if (this.mPickIntent != null) {
            this.mPickIntent = null;
        }
        if (this.mParseTask != null) {
            if (!this.mParseTask.isCancelled()) {
                this.mParseTask.cancel(true);
            }
            this.mParseTask = null;
        }
    }

    /* access modifiers changed from: protected */
    public void onDone() {
        if (this.mParseTask == null) {
            this.mParseTask = new ParseTask();
            this.mParseTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
            return;
        }
        Log.w("MovieStoryPickActivity", "parse task is running, skip");
    }
}
