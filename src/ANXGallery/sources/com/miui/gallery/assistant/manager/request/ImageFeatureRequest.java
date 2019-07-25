package com.miui.gallery.assistant.manager.request;

import android.text.TextUtils;
import com.miui.gallery.assistant.manager.AlgorithmRequest;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureRequestParams;
import com.miui.gallery.assistant.manager.result.ImageFeatureResult;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.List;

public abstract class ImageFeatureRequest<I, P extends ImageFeatureRequestParams<I>, R extends ImageFeatureResult> extends AlgorithmRequest<I, P, R> {
    protected long mImageDateTime;
    protected long mImageId;
    protected String mSha1;

    public ImageFeatureRequest(Priority priority, P p) {
        super(priority, p);
        if (p != null && p.getMediaFeatureItem() != null) {
            this.mImageId = p.getMediaFeatureItem().getMediaId();
            this.mSha1 = p.getMediaFeatureItem().getSha1();
            this.mImageDateTime = p.getMediaFeatureItem().getDateTime();
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveResult(R r) {
        if (r != null && this.mImageId > 0 && !TextUtils.isEmpty(this.mSha1)) {
            updateFeatureToDb(r);
        }
    }

    public boolean updateFeatureToDb(R r) {
        GalleryEntityManager instance = GalleryEntityManager.getInstance();
        List query = instance.query(ImageFeature.class, String.format("%s=%s", new Object[]{"imageId", Long.valueOf(this.mImageId)}), null);
        if (MiscUtil.isValid(query)) {
            ImageFeature imageFeature = (ImageFeature) query.get(0);
            updateImageFeature(imageFeature, r);
            Log.d(this.TAG, "update image %d feature,flag:%d", Long.valueOf(imageFeature.getImageId()), Integer.valueOf(imageFeature.getFeatureFlag()));
            return instance.update(imageFeature);
        }
        ImageFeature imageFeature2 = new ImageFeature(this.mImageId, this.mSha1, this.mImageDateTime);
        updateImageFeature(imageFeature2, r);
        Log.d(this.TAG, "insert image %d feature,flag:%d", Long.valueOf(imageFeature2.getImageId()), Integer.valueOf(imageFeature2.getFeatureFlag()));
        return instance.insert((Entity) imageFeature2);
    }

    /* access modifiers changed from: protected */
    public void updateImageFeature(ImageFeature imageFeature, R r) {
        if (r != null && imageFeature != null) {
            imageFeature.setVersion(2);
            r.updateImageFeature(imageFeature);
        }
    }
}
