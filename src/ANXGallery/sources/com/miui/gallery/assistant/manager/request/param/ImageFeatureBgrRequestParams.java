package com.miui.gallery.assistant.manager.request.param;

import android.graphics.Bitmap;
import android.text.TextUtils;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.assistant.process.BaseImageTask;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.assistant.ImageUtil;

public class ImageFeatureBgrRequestParams extends ImageFeatureRequestParams<BgrParams> {
    public ImageFeatureBgrRequestParams(MediaFeatureItem mediaFeatureItem) {
        super(mediaFeatureItem);
    }

    public ImageFeatureBgrRequestParams(MediaFeatureItem mediaFeatureItem, boolean z, boolean z2, DownloadType downloadType) {
        super(mediaFeatureItem, z, z2, downloadType);
    }

    public BgrParams getAlgorithmRequestInputs() {
        if (this.mMediaFeatureItem != null) {
            String imagePath = this.mMediaFeatureItem.getImagePath();
            if (TextUtils.isEmpty(imagePath) && this.mShouldDownloadIfNotExist) {
                imagePath = (String) BaseImageTask.getImageFilePath(this.mMediaFeatureItem, this.mDownloadType, true).get();
            }
            Bitmap scaledBitmap = ImageUtil.getScaledBitmap(imagePath);
            if (scaledBitmap != null) {
                return new BgrParams(ImageUtil.getPixelsBGR(scaledBitmap), scaledBitmap.getWidth(), scaledBitmap.getHeight());
            }
        }
        return null;
    }
}
