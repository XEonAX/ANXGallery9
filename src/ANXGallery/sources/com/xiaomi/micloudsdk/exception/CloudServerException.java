package com.xiaomi.micloudsdk.exception;

import android.text.TextUtils;
import android.util.Log;
import com.xiaomi.opensdk.exception.ServerException;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;

public class CloudServerException extends ServerException {
    public int code;
    public int retryTime;
    public long serverDate;
    public int statusCode;

    public CloudServerException(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("status: ");
        sb.append(i);
        super(sb.toString());
        this.statusCode = i;
    }

    public CloudServerException(int i, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("status: ");
        sb.append(i);
        super(sb.toString());
        this.statusCode = i;
        this.code = i2;
        this.retryTime = Integer.MAX_VALUE;
    }

    public CloudServerException(int i, int i2, int i3) {
        StringBuilder sb = new StringBuilder();
        sb.append("status: ");
        sb.append(i);
        super(sb.toString());
        this.statusCode = i;
        this.code = i2;
        this.retryTime = i3 * 1000;
    }

    public CloudServerException(int i, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("status: ");
        sb.append(i);
        sb.append(" message: ");
        sb.append(str);
        super(sb.toString());
        this.statusCode = i;
    }

    public CloudServerException(int i, Throwable th) {
        StringBuilder sb = new StringBuilder();
        sb.append("status: ");
        sb.append(i);
        super(sb.toString(), th);
        this.statusCode = i;
    }

    public CloudServerException(int i, HttpResponse httpResponse) {
        StringBuilder sb = new StringBuilder();
        sb.append("status: ");
        sb.append(i);
        super(sb.toString());
        this.statusCode = i;
        if (httpResponse != null) {
            try {
                if (httpResponse.getStatusLine() != null && httpResponse.getStatusLine().getStatusCode() == 503) {
                    Header firstHeader = httpResponse.getFirstHeader("Retry-After");
                    if (firstHeader != null && !TextUtils.isEmpty(firstHeader.getValue())) {
                        this.retryTime = Integer.valueOf(firstHeader.getValue()).intValue() * 1000;
                    }
                }
                Header firstHeader2 = httpResponse.getFirstHeader("Date");
                if (firstHeader2 != null) {
                    String value = firstHeader2.getValue();
                    if (value != null) {
                        try {
                            this.serverDate = DateUtils.parseDate(value).getTime();
                        } catch (DateParseException e) {
                            Log.w("CloudServerException", "Error parsing server date", e);
                        }
                    }
                }
            } catch (NumberFormatException unused) {
                Log.d("CloudServerException", "Can't find retry time in 503 HttpURLConnection response");
            }
        }
    }

    public static boolean isMiCloudServerException(int i) {
        return i == 400 || i == 401 || i == 403 || i == 406 || i / 100 == 5;
    }

    public long get5xxServerExceptionRetryTime() {
        if (this.statusCode != 503 || this.retryTime <= 0) {
            return 2147483647L;
        }
        return (long) this.retryTime;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public boolean is5xxServerException() {
        return this.statusCode / 100 == 5;
    }
}
