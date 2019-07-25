package com.miui.gallery.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuItem;
import com.miui.gallery.R;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.ui.PeoplePageFragment;
import com.miui.gallery.util.SyncUtil;

public class PeoplePageActivity extends BaseActivity {
    private final Handler mMainHandler = new Handler();
    PeoplePageFragment mPeopleFragment;
    private Runnable mRequestSyncRunnable = new Runnable() {
        /* JADX WARNING: type inference failed for: r1v2, types: [android.content.Context, com.miui.gallery.activity.PeoplePageActivity] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v2, types: [android.content.Context, com.miui.gallery.activity.PeoplePageActivity]
  assigns: [com.miui.gallery.activity.PeoplePageActivity]
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
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void run() {
            SyncUtil.requestSync(PeoplePageActivity.this, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(8).build());
        }
    };

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mPeopleFragment.onActivityResult(i, i2, intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.people_page_activity);
        this.mPeopleFragment = (PeoplePageFragment) getFragmentManager().findFragmentById(R.id.people_page);
        this.mMainHandler.postDelayed(this.mRequestSyncRunnable, 3000);
        setImmersionMenuEnabled(true);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.people_album_menu, menu);
        return true;
    }

    public void onDestroy() {
        super.onDestroy();
        this.mMainHandler.removeCallbacks(this.mRequestSyncRunnable);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (this.mPeopleFragment.onOptionsItemSelected(menuItem)) {
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    public void onResume() {
        super.onResume();
    }
}
