package com.nexstreaming.nexeditorsdk.exception;

public class ExpiredTimeException extends Exception {
    private static final long serialVersionUID = 1;

    public ExpiredTimeException() {
        super("Asset has expired.");
    }

    public ExpiredTimeException(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" has expired.");
        super(sb.toString());
    }
}
