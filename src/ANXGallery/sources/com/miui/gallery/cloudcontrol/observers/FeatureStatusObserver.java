package com.miui.gallery.cloudcontrol.observers;

import android.support.v4.util.Pair;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import io.reactivex.observers.DisposableObserver;

public abstract class FeatureStatusObserver extends DisposableObserver<Pair<String, Status>> {
    public final void onComplete() {
    }

    public final void onError(Throwable th) {
    }

    public final void onNext(Pair<String, Status> pair) {
        onStatusChanged((String) pair.first, (Status) pair.second);
    }

    public abstract void onStatusChanged(String str, Status status);
}
