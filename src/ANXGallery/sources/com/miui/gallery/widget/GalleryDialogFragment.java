package com.miui.gallery.widget;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.FragmentManager;
import com.miui.gallery.util.Log;

public class GalleryDialogFragment extends DialogFragment {
    public void dismissSafely() {
        Dialog dialog = getDialog();
        if (dialog != null && dialog.isShowing()) {
            dismissAllowingStateLoss();
        }
    }

    public void showAllowingStateLoss(FragmentManager fragmentManager, String str) {
        if (fragmentManager != null) {
            try {
                show(fragmentManager, str);
            } catch (IllegalStateException e) {
                Log.w("GalleryDialogFragment", "%s : showAllowingStateLoss ignore:%s", getClass().getSimpleName(), e);
            }
        } else {
            Log.e("GalleryDialogFragment", "null FragmentManager");
        }
    }
}
