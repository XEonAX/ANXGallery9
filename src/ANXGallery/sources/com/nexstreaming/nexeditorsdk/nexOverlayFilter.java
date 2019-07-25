package com.nexstreaming.nexeditorsdk;

import android.graphics.Bitmap;
import android.graphics.Rect;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.e;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.overlay.OverlayAsset;
import com.nexstreaming.app.common.nexasset.overlay.OverlayAssetFactory;
import com.nexstreaming.kminternal.kinemaster.config.a;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParserException;

public class nexOverlayFilter {
    private static final int kMaxStringTrackCount = 8;
    private String cacheEncodeOption = "";
    private OverlayAsset cachedOverlayAsset;
    private int height = 700;
    private String id;
    private boolean isRelativeHeight = true;
    private boolean isRelativeWidth = true;
    private String[] mTitles = null;
    private nexEffectOptions option;
    private float relativeHeight = 1.0f;
    private float relativeWidth = 1.0f;
    private boolean updateBound;
    private boolean updateOption;
    private int width = 700;

    nexOverlayFilter(String str) {
        this.id = str;
    }

    /* access modifiers changed from: 0000 */
    public void getBound(Rect rect) {
        rect.left = 0 - (getWidth() / 2);
        rect.top = 0 - (getHeight() / 2);
        rect.right = (getWidth() / 2) + 0;
        rect.bottom = (getHeight() / 2) + 0;
    }

    public nexEffectOptions getEffectOption() {
        if (this.option == null) {
            this.option = nexEffectLibrary.getEffectLibrary(a.a().b()).getEffectOptions(a.a().b(), this.id);
            this.option.setEffectType(5);
        }
        this.updateOption = true;
        return this.option;
    }

    /* access modifiers changed from: 0000 */
    public String getEncodedEffectOptions() {
        if (this.option == null) {
            return "";
        }
        if (this.updateOption) {
            this.updateOption = false;
            this.option.clearUpadted();
            this.cacheEncodeOption = nexEffect.getTitleOptions(this.option);
        }
        return this.cacheEncodeOption;
    }

    public int getHeight() {
        return !this.isRelativeWidth ? this.height : (int) (((float) nexApplicationConfig.getAspectProfile().getHeight()) * this.relativeHeight);
    }

    public Bitmap getIcon() {
        if (this.id != null) {
            f c = c.a().c(this.id);
            if (c != null) {
                try {
                    return e.a(a.a().b(), c, 0, 0);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public String getId() {
        return this.id;
    }

    public String getName(String str) {
        f c = c.a().c(this.id);
        if (c != null) {
            return (String) c.getLabel().get("en");
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public OverlayAsset getOverlayAssetFilter() throws IOException, XmlPullParserException {
        if (this.cachedOverlayAsset == null) {
            this.cachedOverlayAsset = OverlayAssetFactory.forItem(this.id);
        }
        return this.cachedOverlayAsset;
    }

    public float getRelativeHeight() {
        return this.relativeHeight;
    }

    public float getRelativeWidth() {
        return this.relativeWidth;
    }

    public String getTitle(int i) {
        if (this.mTitles != null && i < 8) {
            return this.mTitles[i];
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public String[] getTitles() {
        return this.mTitles;
    }

    public int getWidth() {
        return !this.isRelativeWidth ? this.width : (int) (((float) nexApplicationConfig.getAspectProfile().getWidth()) * this.relativeWidth);
    }

    /* access modifiers changed from: 0000 */
    public boolean isUpdated() {
        if (this.updateBound) {
            return true;
        }
        if (this.option == null) {
            return false;
        }
        return this.option.isUpdated();
    }

    public void setHeight(int i) {
        this.isRelativeHeight = false;
        if (this.height != i) {
            this.updateBound = true;
        }
        this.height = i;
    }

    public void setRelativeHeight(float f) {
        this.isRelativeHeight = true;
        if (this.relativeHeight != f) {
            this.updateBound = true;
        }
        this.relativeHeight = f;
    }

    public void setRelativeWidth(float f) {
        this.isRelativeWidth = true;
        if (this.relativeWidth != f) {
            this.updateBound = true;
        }
        this.relativeWidth = f;
    }

    public void setTitle(int i, String str) {
        if (this.mTitles == null) {
            this.mTitles = new String[8];
        }
        if (i < 8) {
            this.mTitles[i] = str;
        }
    }

    public void setWidth(int i) {
        this.isRelativeWidth = false;
        if (this.width != i) {
            this.updateBound = true;
        }
        this.width = i;
    }
}
