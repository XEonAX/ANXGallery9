package com.miui.gallery.assistant.manager.result;

public abstract class AlgorithmResult {
    private final int resultCode;

    public AlgorithmResult(int i) {
        this.resultCode = i;
    }

    public int getResultCode() {
        return this.resultCode;
    }
}
