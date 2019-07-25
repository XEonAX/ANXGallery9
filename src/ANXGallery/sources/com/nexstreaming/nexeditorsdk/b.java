package com.nexstreaming.nexeditorsdk;

/* compiled from: nexObserver */
class b {
    protected boolean mClipTimeUpdated = true;
    protected int mEffectLoad2Engine;
    protected boolean mNeedLoadList = true;

    b() {
    }

    /* access modifiers changed from: 0000 */
    public boolean setEffectLoad(int i) {
        if (this.mEffectLoad2Engine == i) {
            return false;
        }
        this.mEffectLoad2Engine = i;
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void updateTimeLine(boolean z) {
        this.mNeedLoadList = true;
        if (!z) {
            this.mClipTimeUpdated = true;
        }
    }
}
