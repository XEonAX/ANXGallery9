package com.miui.gallery.card.ui.detail;

import android.app.Fragment;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.movie.utils.MovieBackgroundDownloadManager;
import com.miui.gallery.util.MiscUtil;

public class StoryAlbumActivity extends BaseActivity {
    private StoryAlbumFragment mStoryAlbumFragment;

    private boolean isValidCard(Card card) {
        return card != null && MiscUtil.isValid(card.getSelectedMediaSha1s()) && card.isValid();
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    public void onAttachFragment(Fragment fragment) {
        super.onAttachFragment(fragment);
        if (this.mStoryAlbumFragment != null) {
            this.mStoryAlbumFragment.onAttachDialogFragment(fragment);
        }
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.card.ui.detail.StoryAlbumActivity] */
    /* JADX WARNING: type inference failed for: r4v12, types: [com.miui.gallery.card.ui.detail.StoryAlbumFragment, android.app.Fragment] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v12, types: [com.miui.gallery.card.ui.detail.StoryAlbumFragment, android.app.Fragment]
  assigns: [com.miui.gallery.card.ui.detail.StoryAlbumFragment]
  uses: [android.app.Fragment]
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
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        long longExtra = getIntent().getLongExtra("card_id", 0);
        getWindow().setBackgroundDrawableResource(R.color.story_background_color);
        Card cardByCardId = CardManager.getInstance().getCardByCardId(longExtra);
        if (!isValidCard(cardByCardId)) {
            finish();
            return;
        }
        MovieBackgroundDownloadManager.getInstance().downloadTemplate(this, CardUtil.getMovieTemplateFromCard(cardByCardId));
        this.mStoryAlbumFragment = (StoryAlbumFragment) getFragmentManager().findFragmentByTag("StoryAlbumFragment");
        if (this.mStoryAlbumFragment == null) {
            this.mStoryAlbumFragment = new StoryAlbumFragment();
            Bundle bundle2 = new Bundle();
            bundle2.putLong("card_id", longExtra);
            this.mStoryAlbumFragment.setArguments(bundle2);
            startFragment(this.mStoryAlbumFragment, "StoryAlbumFragment", false, true);
        }
    }
}
