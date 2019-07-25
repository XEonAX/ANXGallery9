package com.miui.gallery.widget.recyclerview.transition;

public class TransitionAnchor {
    final long mFromAnchorId;
    final long mToAnchorId;

    public TransitionAnchor(long j, long j2) {
        this.mFromAnchorId = j;
        this.mToAnchorId = j2;
    }

    public boolean isValid() {
        return this.mFromAnchorId > 0 && this.mToAnchorId > 0;
    }
}
