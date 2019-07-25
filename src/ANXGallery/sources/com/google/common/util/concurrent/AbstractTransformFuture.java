package com.google.common.util.concurrent;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

abstract class AbstractTransformFuture<I, O, F, T> extends TrustedFuture<O> implements Runnable {
    F function;
    ListenableFuture<? extends I> inputFuture;

    private static final class TransformFuture<I, O> extends AbstractTransformFuture<I, O, Function<? super I, ? extends O>, O> {
        TransformFuture(ListenableFuture<? extends I> listenableFuture, Function<? super I, ? extends O> function) {
            super(listenableFuture, function);
        }

        /* access modifiers changed from: 0000 */
        public O doTransform(Function<? super I, ? extends O> function, I i) {
            return function.apply(i);
        }

        /* access modifiers changed from: 0000 */
        public void setResult(O o) {
            set(o);
        }
    }

    AbstractTransformFuture(ListenableFuture<? extends I> listenableFuture, F f) {
        this.inputFuture = (ListenableFuture) Preconditions.checkNotNull(listenableFuture);
        this.function = Preconditions.checkNotNull(f);
    }

    static <I, O> ListenableFuture<O> create(ListenableFuture<I> listenableFuture, Function<? super I, ? extends O> function2, Executor executor) {
        Preconditions.checkNotNull(function2);
        TransformFuture transformFuture = new TransformFuture(listenableFuture, function2);
        listenableFuture.addListener(transformFuture, MoreExecutors.rejectionPropagatingExecutor(executor, transformFuture));
        return transformFuture;
    }

    /* access modifiers changed from: protected */
    public final void afterDone() {
        maybePropagateCancellation(this.inputFuture);
        this.inputFuture = null;
        this.function = null;
    }

    /* access modifiers changed from: 0000 */
    public abstract T doTransform(F f, I i) throws Exception;

    public final void run() {
        ListenableFuture<? extends I> listenableFuture = this.inputFuture;
        F f = this.function;
        boolean z = true;
        boolean isCancelled = isCancelled() | (listenableFuture == null);
        if (f != null) {
            z = false;
        }
        if (!isCancelled && !z) {
            this.inputFuture = null;
            this.function = null;
            try {
                try {
                    setResult(doTransform(f, Futures.getDone(listenableFuture)));
                } catch (UndeclaredThrowableException e) {
                    setException(e.getCause());
                } catch (Throwable th) {
                    setException(th);
                }
            } catch (CancellationException unused) {
                cancel(false);
            } catch (ExecutionException e2) {
                setException(e2.getCause());
            } catch (RuntimeException e3) {
                setException(e3);
            } catch (Error e4) {
                setException(e4);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public abstract void setResult(T t);
}
