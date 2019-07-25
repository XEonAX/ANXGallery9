package com.miui.gallery.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import com.miui.gallery.R;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.preference.GalleryPreferences.Assistant;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.GalleryDialogFragment;

public class ImageSelectionTipFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public ImageSelectionTipDialog mImageSelectionTipDialog;

    private class ImageSelectionTipDialog extends Dialog implements OnClickListener {
        private Button mPositiveBtn;
        private OnClickListener mPositiveListener;

        public ImageSelectionTipDialog(Context context) {
            super(context);
        }

        public void onClick(View view) {
            if (view.getId() == R.id.positive_btn && this.mPositiveListener != null) {
                this.mPositiveListener.onClick(view);
            }
        }

        /* access modifiers changed from: protected */
        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            setContentView(R.layout.image_selection_tips_dialog);
            this.mPositiveBtn = (Button) findViewById(R.id.positive_btn);
            this.mPositiveBtn.setOnClickListener(this);
            Window window = getWindow();
            LayoutParams attributes = window.getAttributes();
            attributes.gravity = 80;
            attributes.width = -1;
            attributes.height = -2;
            window.setAttributes(attributes);
            setCanceledOnTouchOutside(false);
        }

        public ImageSelectionTipDialog setPositiveButtonOnClickListener(OnClickListener onClickListener) {
            this.mPositiveListener = onClickListener;
            return this;
        }
    }

    /* access modifiers changed from: private */
    public void onDone(DialogInterface dialogInterface) {
        if (getActivity() != null) {
            dismissAllowingStateLoss();
        }
    }

    public static void showImageSelectionTipDialogIfNecessary(Activity activity) {
        if (activity == null || activity.isFinishing()) {
            Log.d("ImageSelectionTipFragment", "activity is null or finishing ,no need to show selection tip dialog");
            return;
        }
        if (ImageFeatureManager.isImageFeatureSelectionVisiable() && ImageFeatureCacheManager.getInstance().shouldShowImageSelectionTip()) {
            Assistant.setIsFirstShowImageSelection(false);
            ImageFeatureCacheManager.getInstance().setFirstShowImageSelection(false);
            new ImageSelectionTipFragment().showAllowingStateLoss(activity.getFragmentManager(), "ImageSelectionTip");
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        onDone(dialogInterface);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mImageSelectionTipDialog = new ImageSelectionTipDialog(getActivity()).setPositiveButtonOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                ImageSelectionTipFragment.this.onDone(ImageSelectionTipFragment.this.mImageSelectionTipDialog);
            }
        });
        return this.mImageSelectionTipDialog;
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        onDone(dialogInterface);
    }
}
