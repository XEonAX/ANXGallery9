package io.reactivex.parallel;

import io.reactivex.Flowable;
import io.reactivex.Scheduler;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.operators.parallel.ParallelFromPublisher;
import io.reactivex.internal.operators.parallel.ParallelJoin;
import io.reactivex.internal.operators.parallel.ParallelMap;
import io.reactivex.internal.operators.parallel.ParallelRunOn;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;

public abstract class ParallelFlowable<T> {
    public static <T> ParallelFlowable<T> from(Publisher<? extends T> publisher) {
        return from(publisher, Runtime.getRuntime().availableProcessors(), Flowable.bufferSize());
    }

    public static <T> ParallelFlowable<T> from(Publisher<? extends T> publisher, int i, int i2) {
        ObjectHelper.requireNonNull(publisher, "source");
        ObjectHelper.verifyPositive(i, "parallelism");
        ObjectHelper.verifyPositive(i2, "prefetch");
        return RxJavaPlugins.onAssembly((ParallelFlowable<T>) new ParallelFromPublisher<T>(publisher, i, i2));
    }

    public final <R> ParallelFlowable<R> map(Function<? super T, ? extends R> function) {
        ObjectHelper.requireNonNull(function, "mapper");
        return RxJavaPlugins.onAssembly((ParallelFlowable<T>) new ParallelMap<T>(this, function));
    }

    public abstract int parallelism();

    public final ParallelFlowable<T> runOn(Scheduler scheduler) {
        return runOn(scheduler, Flowable.bufferSize());
    }

    public final ParallelFlowable<T> runOn(Scheduler scheduler, int i) {
        ObjectHelper.requireNonNull(scheduler, "scheduler");
        ObjectHelper.verifyPositive(i, "prefetch");
        return RxJavaPlugins.onAssembly((ParallelFlowable<T>) new ParallelRunOn<T>(this, scheduler, i));
    }

    public final Flowable<T> sequential() {
        return sequential(Flowable.bufferSize());
    }

    public final Flowable<T> sequential(int i) {
        ObjectHelper.verifyPositive(i, "prefetch");
        return RxJavaPlugins.onAssembly((Flowable<T>) new ParallelJoin<T>(this, i, false));
    }

    public abstract void subscribe(Subscriber<? super T>[] subscriberArr);

    /* access modifiers changed from: protected */
    public final boolean validate(Subscriber<?>[] subscriberArr) {
        int parallelism = parallelism();
        if (subscriberArr.length == parallelism) {
            return true;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("parallelism = ");
        sb.append(parallelism);
        sb.append(", subscribers = ");
        sb.append(subscriberArr.length);
        IllegalArgumentException illegalArgumentException = new IllegalArgumentException(sb.toString());
        for (Subscriber<?> error : subscriberArr) {
            EmptySubscription.error(illegalArgumentException, error);
        }
        return false;
    }
}
