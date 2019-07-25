package com.miui.gallery.app;

import android.arch.lifecycle.Lifecycle;
import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.Lifecycle.State;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.LifecycleRegistry;
import android.os.Bundle;

public class Fragment extends miui.app.Fragment implements LifecycleOwner {
    private LifecycleRegistry mLifecycleRegistry = new LifecycleRegistry(this);

    public Lifecycle getLifecycle() {
        return this.mLifecycleRegistry;
    }

    public void onCreate(Bundle bundle) {
        Fragment.super.onCreate(bundle);
        this.mLifecycleRegistry.handleLifecycleEvent(Event.ON_CREATE);
    }

    public void onDestroy() {
        this.mLifecycleRegistry.handleLifecycleEvent(Event.ON_DESTROY);
        Fragment.super.onDestroy();
    }

    public void onPause() {
        this.mLifecycleRegistry.handleLifecycleEvent(Event.ON_PAUSE);
        Fragment.super.onPause();
    }

    public void onResume() {
        Fragment.super.onResume();
        this.mLifecycleRegistry.handleLifecycleEvent(Event.ON_RESUME);
    }

    public void onSaveInstanceState(Bundle bundle) {
        this.mLifecycleRegistry.markState(State.CREATED);
        Fragment.super.onSaveInstanceState(bundle);
    }

    public void onStart() {
        Fragment.super.onStart();
        this.mLifecycleRegistry.handleLifecycleEvent(Event.ON_START);
    }

    public void onStop() {
        this.mLifecycleRegistry.handleLifecycleEvent(Event.ON_STOP);
        Fragment.super.onStop();
    }
}
