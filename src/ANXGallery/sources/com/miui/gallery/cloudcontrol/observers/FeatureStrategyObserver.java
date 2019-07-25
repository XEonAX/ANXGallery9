package com.miui.gallery.cloudcontrol.observers;

import android.support.v4.util.Pair;
import com.miui.gallery.cloudcontrol.strategies.BaseStrategy;
import io.reactivex.observers.DisposableObserver;

public abstract class FeatureStrategyObserver<T extends BaseStrategy> extends DisposableObserver<Pair<String, T>> {
    public final void onComplete() {
    }

    public final void onError(Throwable th) {
    }

    public final void onNext(Pair<String, T> pair) {
        onStrategyChanged((String) pair.first, (BaseStrategy) pair.second);
    }

    public abstract void onStrategyChanged(String str, T t);
}
