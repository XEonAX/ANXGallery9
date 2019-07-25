package com.nexstreaming.nexeditorsdk.exception;

public class InvalidRangeException extends nexSDKException {
    private static final long serialVersionUID = 1;

    public InvalidRangeException(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("duration is zero or minus. (");
        sb.append(i);
        sb.append(")");
        super(sb.toString());
    }

    public InvalidRangeException(int i, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("end is low then start (");
        sb.append(i);
        sb.append(" >= ");
        sb.append(i2);
        sb.append(")");
        super(sb.toString());
    }

    public InvalidRangeException(int i, int i2, int i3) {
        StringBuilder sb = new StringBuilder();
        sb.append("value is not range. (");
        sb.append(i);
        sb.append(" < ");
        sb.append(i3);
        sb.append(" < ");
        sb.append(i2);
        sb.append(")");
        super(sb.toString());
    }

    public InvalidRangeException(int i, int i2, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("value is low then limit. (");
        sb.append(i2);
        sb.append(" < ");
        sb.append(i);
        sb.append(")");
        super(sb.toString());
    }
}
