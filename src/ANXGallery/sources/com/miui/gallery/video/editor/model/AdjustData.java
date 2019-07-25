package com.miui.gallery.video.editor.model;

public abstract class AdjustData {
    public final int icon;
    public String name;
    public int priority;
    public int progress = getMin();

    public AdjustData(short s, String str, int i) {
        this.icon = i;
        this.name = str;
        this.priority = s;
    }

    public abstract int getMax();

    public abstract int getMin();

    public int getProgress() {
        return this.progress;
    }

    public abstract boolean isMid();

    public void setProgress(int i) {
        this.progress = i;
    }
}
