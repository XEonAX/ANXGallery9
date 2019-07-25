package io.reactivex;

import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.EmptyCompletableObserver;
import io.reactivex.internal.operators.completable.CompletableConcatArray;
import io.reactivex.internal.operators.completable.CompletableDefer;
import io.reactivex.internal.operators.completable.CompletableEmpty;
import io.reactivex.internal.operators.completable.CompletableFromUnsafeSource;
import io.reactivex.internal.operators.completable.CompletableTimer;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

public abstract class Completable implements CompletableSource {
    public static Completable complete() {
        return RxJavaPlugins.onAssembly(CompletableEmpty.INSTANCE);
    }

    public static Completable concatArray(CompletableSource... completableSourceArr) {
        ObjectHelper.requireNonNull(completableSourceArr, "sources is null");
        return completableSourceArr.length == 0 ? complete() : completableSourceArr.length == 1 ? wrap(completableSourceArr[0]) : RxJavaPlugins.onAssembly((Completable) new CompletableConcatArray(completableSourceArr));
    }

    public static Completable defer(Callable<? extends CompletableSource> callable) {
        ObjectHelper.requireNonNull(callable, "completableSupplier");
        return RxJavaPlugins.onAssembly((Completable) new CompletableDefer(callable));
    }

    public static Completable timer(long j, TimeUnit timeUnit, Scheduler scheduler) {
        ObjectHelper.requireNonNull(timeUnit, "unit is null");
        ObjectHelper.requireNonNull(scheduler, "scheduler is null");
        return RxJavaPlugins.onAssembly((Completable) new CompletableTimer(j, timeUnit, scheduler));
    }

    private static NullPointerException toNpe(Throwable th) {
        NullPointerException nullPointerException = new NullPointerException("Actually not, but can't pass out an exception otherwise...");
        nullPointerException.initCause(th);
        return nullPointerException;
    }

    public static Completable wrap(CompletableSource completableSource) {
        ObjectHelper.requireNonNull(completableSource, "source is null");
        return completableSource instanceof Completable ? RxJavaPlugins.onAssembly((Completable) completableSource) : RxJavaPlugins.onAssembly((Completable) new CompletableFromUnsafeSource(completableSource));
    }

    public final Completable andThen(CompletableSource completableSource) {
        return concatWith(completableSource);
    }

    public final Completable concatWith(CompletableSource completableSource) {
        ObjectHelper.requireNonNull(completableSource, "other is null");
        return concatArray(this, completableSource);
    }

    public final Completable delaySubscription(long j, TimeUnit timeUnit, Scheduler scheduler) {
        return timer(j, timeUnit, scheduler).andThen(this);
    }

    public final Disposable subscribe() {
        EmptyCompletableObserver emptyCompletableObserver = new EmptyCompletableObserver();
        subscribe(emptyCompletableObserver);
        return emptyCompletableObserver;
    }

    public final void subscribe(CompletableObserver completableObserver) {
        ObjectHelper.requireNonNull(completableObserver, "s is null");
        try {
            CompletableObserver onSubscribe = RxJavaPlugins.onSubscribe(this, completableObserver);
            ObjectHelper.requireNonNull(onSubscribe, "The RxJavaPlugins.onSubscribe hook returned a null CompletableObserver. Please check the handler provided to RxJavaPlugins.setOnCompletableSubscribe for invalid null returns. Further reading: https://github.com/ReactiveX/RxJava/wiki/Plugins");
            subscribeActual(onSubscribe);
        } catch (NullPointerException e) {
            throw e;
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            RxJavaPlugins.onError(th);
            throw toNpe(th);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void subscribeActual(CompletableObserver completableObserver);
}
