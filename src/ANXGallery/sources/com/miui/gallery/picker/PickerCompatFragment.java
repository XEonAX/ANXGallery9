package com.miui.gallery.picker;

import android.app.Activity;
import android.os.Bundle;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.nostra13.universalimageloader.core.ImageLoader;
import miui.app.Fragment;

public abstract class PickerCompatFragment extends Fragment {
    private static int IMAGE_LOADER_USED_COUNT;
    protected Activity mActivity;
    protected boolean mUserFirstVisible = false;

    /* access modifiers changed from: protected */
    public abstract String getPageName();

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return 2131820703;
    }

    public void onAttach(Activity activity) {
        PickerCompatFragment.super.onAttach(activity);
        this.mActivity = activity;
    }

    public void onCreate(Bundle bundle) {
        PickerCompatFragment.super.onCreate(bundle);
        int themeRes = getThemeRes();
        if (themeRes != 0) {
            setThemeRes(themeRes);
        }
    }

    public void onDetach() {
        PickerCompatFragment.super.onDetach();
        this.mActivity = null;
    }

    public void onPause() {
        PickerCompatFragment.super.onPause();
        if (useImageLoader()) {
            IMAGE_LOADER_USED_COUNT--;
            if (IMAGE_LOADER_USED_COUNT <= 0) {
                ImageLoader.getInstance().pause();
                IMAGE_LOADER_USED_COUNT = 0;
            }
        }
        if (recordPageByDefault()) {
            GallerySamplingStatHelper.recordPageEnd(this.mActivity, getPageName());
        }
    }

    public void onResume() {
        PickerCompatFragment.super.onResume();
        if (useImageLoader()) {
            IMAGE_LOADER_USED_COUNT++;
            ImageLoader.getInstance().resume();
        }
        if (recordPageByDefault()) {
            GallerySamplingStatHelper.recordPageStart(this.mActivity, getPageName());
        }
    }

    /* access modifiers changed from: protected */
    public void onUserFirstVisible() {
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return true;
    }

    public void setUserVisibleHint(boolean z) {
        PickerCompatFragment.super.setUserVisibleHint(z);
        if (getUserVisibleHint() && !this.mUserFirstVisible) {
            onUserFirstVisible();
            this.mUserFirstVisible = true;
        }
    }

    /* access modifiers changed from: protected */
    public boolean useImageLoader() {
        return true;
    }
}
