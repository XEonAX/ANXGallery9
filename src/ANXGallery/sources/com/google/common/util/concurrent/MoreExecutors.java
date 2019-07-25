package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

public final class MoreExecutors {

    private enum DirectExecutor implements Executor {
        INSTANCE;

        public void execute(Runnable runnable) {
            runnable.run();
        }

        public String toString() {
            return "MoreExecutors.directExecutor()";
        }
    }

    public static Executor directExecutor() {
        return DirectExecutor.INSTANCE;
    }

    static Executor rejectionPropagatingExecutor(final Executor executor, final AbstractFuture<?> abstractFuture) {
        Preconditions.checkNotNull(executor);
        Preconditions.checkNotNull(abstractFuture);
        return executor == directExecutor() ? executor : new Executor() {
            volatile boolean thrownFromDelegate = true;

            public void execute(final Runnable runnable) {
                try {
                    executor.execute(new Runnable() {
                        public void run() {
                            AnonymousClass5.this.thrownFromDelegate = false;
                            runnable.run();
                        }
                    });
                } catch (RejectedExecutionException e) {
                    if (this.thrownFromDelegate) {
                        abstractFuture.setException(e);
                    }
                }
            }
        };
    }
}
