package android.support.v4.app;

import android.app.Activity;
import android.app.ActivityOptions;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.util.Pair;
import android.view.View;

public class ActivityOptionsCompat {

    private static class ActivityOptionsCompatApi16Impl extends ActivityOptionsCompat {
        protected final ActivityOptions mActivityOptions;

        ActivityOptionsCompatApi16Impl(ActivityOptions activityOptions) {
            this.mActivityOptions = activityOptions;
        }

        public Bundle toBundle() {
            return this.mActivityOptions.toBundle();
        }
    }

    private static class ActivityOptionsCompatApi23Impl extends ActivityOptionsCompatApi16Impl {
        ActivityOptionsCompatApi23Impl(ActivityOptions activityOptions) {
            super(activityOptions);
        }
    }

    private static class ActivityOptionsCompatApi24Impl extends ActivityOptionsCompatApi23Impl {
        ActivityOptionsCompatApi24Impl(ActivityOptions activityOptions) {
            super(activityOptions);
        }
    }

    protected ActivityOptionsCompat() {
    }

    private static ActivityOptionsCompat createImpl(ActivityOptions activityOptions) {
        return VERSION.SDK_INT >= 24 ? new ActivityOptionsCompatApi24Impl(activityOptions) : VERSION.SDK_INT >= 23 ? new ActivityOptionsCompatApi23Impl(activityOptions) : new ActivityOptionsCompatApi16Impl(activityOptions);
    }

    public static ActivityOptionsCompat makeSceneTransitionAnimation(Activity activity, Pair<View, String>... pairArr) {
        if (VERSION.SDK_INT < 21) {
            return new ActivityOptionsCompat();
        }
        android.util.Pair[] pairArr2 = null;
        if (pairArr != null) {
            pairArr2 = new android.util.Pair[pairArr.length];
            for (int i = 0; i < pairArr.length; i++) {
                pairArr2[i] = android.util.Pair.create(pairArr[i].first, pairArr[i].second);
            }
        }
        return createImpl(ActivityOptions.makeSceneTransitionAnimation(activity, pairArr2));
    }

    public Bundle toBundle() {
        return null;
    }
}
