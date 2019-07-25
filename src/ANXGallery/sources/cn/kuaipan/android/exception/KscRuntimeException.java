package cn.kuaipan.android.exception;

public class KscRuntimeException extends RuntimeException implements IKscError {
    private static final long serialVersionUID = 4693852528580738850L;
    private final String detailMessage;
    private final int errCode;

    public KscRuntimeException(int i) {
        this(i, null, null);
    }

    public KscRuntimeException(int i, String str) {
        this(i, str, null);
    }

    public KscRuntimeException(int i, String str, Throwable th) {
        String str2;
        StringBuilder sb = new StringBuilder();
        sb.append("ErrCode:");
        sb.append(i);
        if (str == null) {
            str2 = "";
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(" details:");
            sb2.append(str);
            str2 = sb2.toString();
        }
        sb.append(str2);
        super(sb.toString(), KscException.getSerial(th));
        this.errCode = i;
        this.detailMessage = str;
    }

    public KscRuntimeException(int i, Throwable th) {
        this(i, th == null ? null : th.toString(), th);
    }

    public int getErrorCode() {
        return this.errCode;
    }
}
