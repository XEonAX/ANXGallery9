package com.miui.gallery.assistant.manager.request.param;

import android.graphics.Bitmap;
import android.text.TextUtils;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.assistant.process.BaseImageTask;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.assistant.ImageUtil;

public class ImageFeatureBitmapRequestParams extends ImageFeatureRequestParams<Bitmap> {
    public ImageFeatureBitmapRequestParams(MediaFeatureItem mediaFeatureItem, boolean z) {
        super(mediaFeatureItem, z, true, DownloadType.MICRO);
    }

    public ImageFeatureBitmapRequestParams(MediaFeatureItem mediaFeatureItem, boolean z, boolean z2, DownloadType downloadType) {
        super(mediaFeatureItem, z, z2, downloadType);
    }

    public Bitmap getAlgorithmRequestInputs() {
        if (this.mMediaFeatureItem == null) {
            return null;
        }
        String imagePath = this.mMediaFeatureItem.getImagePath();
        if (TextUtils.isEmpty(imagePath) && this.mShouldDownloadIfNotExist) {
            imagePath = (String) BaseImageTask.getImageFilePath(this.mMediaFeatureItem, this.mDownloadType, true).get();
        }
        return ImageUtil.getScaledBitmap(imagePath);
    }
}
