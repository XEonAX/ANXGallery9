package com.miui.gallery.app;

import android.arch.lifecycle.Lifecycle;
import android.arch.lifecycle.Lifecycle.State;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.LifecycleRegistry;
import android.arch.lifecycle.ReportFragment;
import android.os.Bundle;

public class Activity extends miui.app.Activity implements LifecycleOwner {
    private LifecycleRegistry mLifecycleRegistry = new LifecycleRegistry(this);

    public Lifecycle getLifecycle() {
        return this.mLifecycleRegistry;
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [miui.app.Activity, com.miui.gallery.app.Activity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        Activity.super.onCreate(bundle);
        ReportFragment.injectIfNeededIn(this);
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        this.mLifecycleRegistry.markState(State.CREATED);
        Activity.super.onSaveInstanceState(bundle);
    }
}
