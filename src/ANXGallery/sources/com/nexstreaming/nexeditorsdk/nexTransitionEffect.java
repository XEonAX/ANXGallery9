package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.LruCache;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.e;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.assetpackage.h;
import com.nexstreaming.app.common.nexasset.assetpackage.i;
import com.nexstreaming.app.common.util.n;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexEffectOf;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParserException;

public final class nexTransitionEffect extends nexEffect implements Cloneable {
    private static final int TRANSITION_MAX_DURATION = 30000;
    private static final int TRANSITON_MIN_DURATION = 500;
    private static LruCache<String, a> s_cachedProperty = new LruCache<>(100);
    int mEffectOffset;
    int mEffectOverlap;
    private int mMaxDuration;
    private int mMinDuration;

    private class a {
        int a;
        int b;

        public a(int i, int i2) {
            this.a = i;
            this.b = i2;
        }
    }

    nexTransitionEffect() {
        this.mType = 3;
        this.mDuration = nexProject.kAutoThemeTransitionDuration;
    }

    nexTransitionEffect(b bVar) {
        this.mType = 3;
        this.mDuration = nexProject.kAutoThemeTransitionDuration;
        setObserver(bVar);
    }

    nexTransitionEffect(b bVar, nexEffectOf nexeffectof) {
        this.mID = nexeffectof.mID;
        this.mAutoID = nexeffectof.mAutoID;
        this.mName = nexeffectof.mName;
        this.mType = nexeffectof.mType;
        this.mDuration = nexeffectof.mDuration;
        this.itemMethodType = nexeffectof.itemMethodType;
        this.mIsResolveOptions = nexeffectof.mIsResolveOptions;
        this.mOptionsUpdate = nexeffectof.mOptionsUpdate;
        this.m_effectOptions = nexeffectof.m_effectOptions;
        this.mMinDuration = nexeffectof.mMinDuration;
        this.mMaxDuration = nexeffectof.mMaxDuration;
        this.mEffectOffset = nexeffectof.mEffectOffset;
        this.mEffectOverlap = nexeffectof.mEffectOverlap;
        setObserver(bVar);
    }

    nexTransitionEffect(String str) {
        setTransitionEffect(str);
        this.mDuration = nexProject.kAutoThemeTransitionDuration;
    }

    protected static nexTransitionEffect clone(nexTransitionEffect nextransitioneffect) {
        nexTransitionEffect nextransitioneffect2;
        try {
            nextransitioneffect2 = (nexTransitionEffect) nextransitioneffect.clone();
            try {
                nextransitioneffect2.mMinDuration = nextransitioneffect.mMinDuration;
                nextransitioneffect2.mMaxDuration = nextransitioneffect.mMaxDuration;
                nextransitioneffect2.mEffectOffset = nextransitioneffect.mEffectOffset;
                nextransitioneffect2.mEffectOverlap = nextransitioneffect.mEffectOverlap;
            } catch (CloneNotSupportedException e) {
                e = e;
            }
        } catch (CloneNotSupportedException e2) {
            e = e2;
            nextransitioneffect2 = null;
            e.printStackTrace();
            return nextransitioneffect2;
        }
        return nextransitioneffect2;
    }

    public String getCategoryTitle(Context context) {
        if (this.mType == 0) {
            return "None";
        }
        if (this.mType == 3) {
            return "Theme";
        }
        if (context == null) {
            return null;
        }
        f c = c.a().c(this.mID);
        if (c != null) {
            return c.getCategory().toString();
        }
        return null;
    }

    public String getDesc(Context context) {
        if (this.mType == 0) {
            return "None Transition Effect";
        }
        if (this.mType == 3) {
            return "Theme Transition Effect";
        }
        if (context == null) {
            return null;
        }
        f c = c.a().c(this.mID);
        if (c != null) {
            return (String) c.getLabel().get("en");
        }
        return null;
    }

    public Bitmap getIcon() {
        if (this.mID != null) {
            f c = c.a().c(this.mID);
            if (c != null) {
                try {
                    return e.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), c, 0, 0);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public int getMaxDuration() {
        return this.mMaxDuration;
    }

    public int getMinDuration() {
        return this.mMinDuration;
    }

    public String getName(Context context) {
        if (this.mType == 0) {
            return "None Transition";
        }
        if (this.mType == 3) {
            return "Theme Transition";
        }
        f c = c.a().c(this.mID);
        if (c != null) {
            if (context != null) {
                this.mName = n.a(context, c.getLabel());
                if (this.mName == null) {
                    this.mName = (String) c.getLabel().get("en");
                }
            } else {
                this.mName = (String) c.getLabel().get("en");
            }
        }
        return this.mName;
    }

    public int getOffset() {
        return this.mEffectOffset;
    }

    public int getOverlap() {
        return this.mEffectOverlap;
    }

    /* access modifiers changed from: 0000 */
    public nexEffectOf getSaveData() {
        nexEffectOf nexeffectof = new nexEffectOf();
        nexeffectof.mID = this.mID;
        nexeffectof.mAutoID = this.mAutoID;
        nexeffectof.mName = this.mName;
        nexeffectof.mType = this.mType;
        nexeffectof.mDuration = this.mDuration;
        nexeffectof.itemMethodType = this.itemMethodType;
        nexeffectof.mIsResolveOptions = this.mIsResolveOptions;
        nexeffectof.mOptionsUpdate = this.mOptionsUpdate;
        nexeffectof.m_effectOptions = this.m_effectOptions;
        nexeffectof.mShowStartTime = 0;
        nexeffectof.mShowEndTime = 0;
        nexeffectof.mMinDuration = this.mMinDuration;
        nexeffectof.mMaxDuration = this.mMaxDuration;
        nexeffectof.mEffectOffset = this.mEffectOffset;
        nexeffectof.mEffectOverlap = this.mEffectOverlap;
        return nexeffectof;
    }

    public void setAutoTheme() {
        if (this.mType != 3) {
            this.mUpdated = true;
            setModified(false);
        }
        this.mType = 3;
    }

    public void setTransitionEffect(String str) {
        if (setEffect(str, 4)) {
            setModified(false);
            if (str.compareTo("none") == 0) {
                this.mEffectOffset = 0;
                this.mEffectOverlap = 0;
                return;
            }
            a aVar = (a) s_cachedProperty.get(str);
            if (aVar == null) {
                h hVar = null;
                try {
                    hVar = i.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), str);
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                if (hVar == null) {
                    this.mEffectOffset = 0;
                    this.mEffectOverlap = 0;
                } else {
                    this.mEffectOffset = hVar.b();
                    this.mEffectOverlap = hVar.c();
                }
                s_cachedProperty.put(str, new a(this.mEffectOffset, this.mEffectOverlap));
            } else {
                this.mEffectOffset = aVar.a;
                this.mEffectOverlap = aVar.b;
            }
            this.mMinDuration = TRANSITON_MIN_DURATION;
            this.mMaxDuration = TRANSITION_MAX_DURATION;
        }
    }
}
