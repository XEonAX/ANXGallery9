package cn.kuaipan.android.exception;

import android.text.TextUtils;

public class NetworkException extends KscException {
    private static final long serialVersionUID = 3410936099313815279L;
    private final String origMessage;

    public NetworkException(int i, String str, Throwable th) {
        super(i, str, th);
        this.origMessage = th == null ? null : th.getMessage();
    }

    public String getMessage() {
        if (TextUtils.isEmpty(this.origMessage)) {
            return super.getMessage();
        }
        StringBuilder sb = new StringBuilder();
        sb.append(this.origMessage);
        sb.append("\n");
        sb.append(super.getMessage());
        return sb.toString();
    }

    public String getSimpleMessage() {
        String name = getClass().getName();
        StringBuilder sb = new StringBuilder();
        sb.append(name);
        sb.append("(ErrCode: ");
        sb.append(getErrorCode());
        sb.append(")");
        String sb2 = sb.toString();
        Throwable cause = getCause();
        if (cause != null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append(" - [");
            sb3.append(cause.getClass().getName());
            String sb4 = sb3.toString();
            if (this.origMessage != null) {
                StringBuilder sb5 = new StringBuilder();
                sb5.append(sb4);
                sb5.append(": ");
                sb5.append(this.origMessage);
                sb4 = sb5.toString();
            }
            StringBuilder sb6 = new StringBuilder();
            sb6.append(sb4);
            sb6.append("]");
            sb2 = sb6.toString();
        }
        if (this.detailMessage == null || this.detailMessage.length() >= 100) {
            return sb2;
        }
        StringBuilder sb7 = new StringBuilder();
        sb7.append(sb2);
        sb7.append(": ");
        sb7.append(this.detailMessage);
        return sb7.toString();
    }
}
