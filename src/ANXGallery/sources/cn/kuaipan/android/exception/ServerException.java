package cn.kuaipan.android.exception;

public class ServerException extends KscException {
    private static final long serialVersionUID = 6373467541984892922L;
    private final int statusCode;

    public ServerException(int i, String str) {
        super(validCode(i) + 503000, str);
        this.statusCode = i;
    }

    private static int validCode(int i) {
        if (i < 100 || i > 599) {
            return 0;
        }
        return i;
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
        if (this.detailMessage == null || this.detailMessage.length() >= 100) {
            return sb2;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(", ");
        sb3.append(this.detailMessage);
        return sb3.toString();
    }

    public int getStatusCode() {
        return this.statusCode;
    }
}
