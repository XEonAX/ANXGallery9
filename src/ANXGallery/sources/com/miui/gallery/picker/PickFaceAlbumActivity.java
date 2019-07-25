package com.miui.gallery.picker;

import android.content.Intent;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.util.UriUtil;
import java.util.ArrayList;
import java.util.Iterator;

public class PickFaceAlbumActivity extends PickAlbumDetailActivityBase {
    private AsyncTask<Void, Void, Intent> mParseTask = new AsyncTask<Void, Void, Intent>() {
        /* access modifiers changed from: protected */
        public Intent doInBackground(Void... voidArr) {
            return PickFaceAlbumActivity.this.parseResult();
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Intent intent) {
            if (intent == null) {
                PickFaceAlbumActivity.this.finish();
                return;
            }
            intent.putExtra("local_id_of_album", PickFaceAlbumActivity.this.getIntent().getStringExtra("local_id_of_album"));
            PickFaceAlbumActivity.this.setResult(-1, intent);
            PickFaceAlbumActivity.this.finish();
        }
    };

    /* access modifiers changed from: private */
    public Intent parseResult() {
        String join = TextUtils.join("','", getPicker());
        Cursor query = getContentResolver().query(UriUtil.appendGroupBy(Media.URI_PICKER, "sha1", null), PICKABLE_PROJECTION, String.format("sha1 IN ('%s') AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new Object[]{join}), null, String.format("INSTR(\"'%s'\", sha1)", new Object[]{join}));
        if (query == null) {
            return null;
        }
        try {
            Intent intent = new Intent();
            ArrayList arrayList = new ArrayList();
            while (query.moveToNext()) {
                arrayList.add(Long.valueOf(query.getLong(0)));
            }
            intent.putExtra("pick-result-data", arrayList);
            return intent;
        } finally {
            query.close();
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.mPicker != null) {
            setContentView(R.layout.picker_face_detail_activity);
            this.mAlbumDetailFragment = (PickFaceAlbumFragment) getFragmentManager().findFragmentById(R.id.album_detail);
            this.mAlbumDetailFragment.setItemStateListener(this.mItemStateListener);
            this.mAlbumDetailFragment.setSelectionCloudNotContainUnique();
            String stringExtra = getIntent().getStringExtra("album_name");
            if (!TextUtils.isEmpty(stringExtra)) {
                setTitle(stringExtra);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onDone() {
        if (!getIntent().getBooleanExtra("pick_face_direct", false)) {
            super.onDone();
        } else if (getIntent().getBooleanExtra("need_pick_face_id", false)) {
            Iterator it = getPicker().iterator();
            if (it != null && it.hasNext()) {
                Intent intent = new Intent();
                intent.putExtra("picked_face_id", (String) it.next());
                setResult(-1, intent);
            }
            finish();
        } else {
            this.mParseTask.execute(new Void[0]);
        }
    }
}
