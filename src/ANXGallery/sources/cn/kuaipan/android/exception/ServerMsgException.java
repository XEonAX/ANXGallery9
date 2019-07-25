package cn.kuaipan.android.exception;

import android.text.TextUtils;

public class ServerMsgException extends KscException {
    private static final long serialVersionUID = -681123175263669159L;
    private final String origMessage;
    private final int statusCode;

    public ServerMsgException(int i, String str) {
        this(i, str, null);
    }

    public ServerMsgException(int i, String str, String str2) {
        super(ServerMsgMap.getErrorCode(i, str), str2);
        this.statusCode = i;
        this.origMessage = str;
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
        sb.append("): StatusCode: ");
        sb.append(this.statusCode);
        String sb2 = sb.toString();
        if (this.origMessage != null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append(", msg: ");
            sb3.append(this.origMessage);
            sb2 = sb3.toString();
        }
        if (this.detailMessage == null || this.detailMessage.length() >= 100) {
            return sb2;
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append(sb2);
        sb4.append(", ");
        sb4.append(this.detailMessage);
        return sb4.toString();
    }
}
