package org.jcodec.common;

public final class Preconditions {
    public static void checkState(boolean z) {
        if (!z) {
            throw new IllegalStateException();
        }
    }
}
