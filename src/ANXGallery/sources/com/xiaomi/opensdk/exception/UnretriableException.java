package com.xiaomi.opensdk.exception;

public class UnretriableException extends Exception {
    private static final long serialVersionUID = 1;
    private String mDescription;
    private int mErrorCode;

    public UnretriableException(String str) {
        this.mDescription = str;
    }

    public UnretriableException(Throwable th) {
        super(th);
    }

    public UnretriableException(Throwable th, int i) {
        super(th);
        this.mErrorCode = i;
    }

    public String toString() {
        String simpleName = getClass().getSimpleName();
        Throwable cause = getCause();
        if (cause != null) {
            StringBuilder sb = new StringBuilder();
            sb.append(simpleName);
            sb.append("[");
            sb.append(cause.getClass().getSimpleName());
            String sb2 = sb.toString();
            if (cause.getMessage() != null) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(sb2);
                sb3.append(":");
                sb3.append(cause.getMessage());
                sb2 = sb3.toString();
            }
            StringBuilder sb4 = new StringBuilder();
            sb4.append(sb2);
            sb4.append("]");
            simpleName = sb4.toString();
        }
        if (this.mErrorCode > 0) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append(simpleName);
            sb5.append("[");
            sb5.append(this.mErrorCode);
            sb5.append("]");
            simpleName = sb5.toString();
        }
        if (this.mDescription == null) {
            return simpleName;
        }
        StringBuilder sb6 = new StringBuilder();
        sb6.append(simpleName);
        sb6.append(": ");
        sb6.append(this.mDescription);
        return sb6.toString();
    }
}
