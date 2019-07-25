package io.reactivex.internal.util;

import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.fuseable.SimpleQueue;
import org.reactivestreams.Subscriber;

public final class QueueDrainHelper {
    public static <T, U> boolean checkTerminated(boolean z, boolean z2, Subscriber<?> subscriber, boolean z3, SimpleQueue<?> simpleQueue, QueueDrain<T, U> queueDrain) {
        if (queueDrain.cancelled()) {
            simpleQueue.clear();
            return true;
        }
        if (z) {
            if (!z3) {
                Throwable error = queueDrain.error();
                if (error != null) {
                    simpleQueue.clear();
                    subscriber.onError(error);
                    return true;
                } else if (z2) {
                    subscriber.onComplete();
                    return true;
                }
            } else if (z2) {
                Throwable error2 = queueDrain.error();
                if (error2 != null) {
                    subscriber.onError(error2);
                } else {
                    subscriber.onComplete();
                }
                return true;
            }
        }
        return false;
    }

    public static <T, U> void drainMaxLoop(SimplePlainQueue<T> simplePlainQueue, Subscriber<? super U> subscriber, boolean z, Disposable disposable, QueueDrain<T, U> queueDrain) {
        int i = 1;
        while (true) {
            boolean done = queueDrain.done();
            Object poll = simplePlainQueue.poll();
            boolean z2 = poll == null;
            if (checkTerminated(done, z2, subscriber, z, simplePlainQueue, queueDrain)) {
                if (disposable != null) {
                    disposable.dispose();
                }
                return;
            } else if (z2) {
                i = queueDrain.leave(-i);
                if (i == 0) {
                    return;
                }
            } else {
                long requested = queueDrain.requested();
                if (requested == 0) {
                    simplePlainQueue.clear();
                    if (disposable != null) {
                        disposable.dispose();
                    }
                    subscriber.onError(new MissingBackpressureException("Could not emit value due to lack of requests."));
                    return;
                } else if (queueDrain.accept(subscriber, poll) && requested != Long.MAX_VALUE) {
                    queueDrain.produced(1);
                }
            }
        }
    }
}
