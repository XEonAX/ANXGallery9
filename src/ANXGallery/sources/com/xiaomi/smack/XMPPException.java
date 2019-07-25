package com.xiaomi.smack;

import com.xiaomi.smack.packet.StreamError;
import com.xiaomi.smack.packet.XMPPError;
import java.io.PrintStream;
import java.io.PrintWriter;

public class XMPPException extends Exception {
    private XMPPError error = null;
    private StreamError streamError = null;
    private Throwable wrappedThrowable = null;

    public XMPPException() {
    }

    public XMPPException(StreamError streamError2) {
        this.streamError = streamError2;
    }

    public XMPPException(String str) {
        super(str);
    }

    public XMPPException(String str, Throwable th) {
        super(str);
        this.wrappedThrowable = th;
    }

    public XMPPException(Throwable th) {
        this.wrappedThrowable = th;
    }

    public String getMessage() {
        String message = super.getMessage();
        return (message != null || this.error == null) ? (message != null || this.streamError == null) ? message : this.streamError.toString() : this.error.toString();
    }

    public Throwable getWrappedThrowable() {
        return this.wrappedThrowable;
    }

    public void printStackTrace() {
        printStackTrace(System.err);
    }

    public void printStackTrace(PrintStream printStream) {
        super.printStackTrace(printStream);
        if (this.wrappedThrowable != null) {
            printStream.println("Nested Exception: ");
            this.wrappedThrowable.printStackTrace(printStream);
        }
    }

    public void printStackTrace(PrintWriter printWriter) {
        super.printStackTrace(printWriter);
        if (this.wrappedThrowable != null) {
            printWriter.println("Nested Exception: ");
            this.wrappedThrowable.printStackTrace(printWriter);
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        String message = super.getMessage();
        if (message != null) {
            sb.append(message);
            sb.append(": ");
        }
        if (this.error != null) {
            sb.append(this.error);
        }
        if (this.streamError != null) {
            sb.append(this.streamError);
        }
        if (this.wrappedThrowable != null) {
            sb.append("\n  -- caused by: ");
            sb.append(this.wrappedThrowable);
        }
        return sb.toString();
    }
}
