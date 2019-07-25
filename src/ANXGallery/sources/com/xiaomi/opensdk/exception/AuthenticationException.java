package com.xiaomi.opensdk.exception;

import android.text.TextUtils;

public class AuthenticationException extends Exception {
    private static final long serialVersionUID = 1;

    public String toString() {
        if (!TextUtils.isEmpty(getMessage())) {
            StringBuilder sb = new StringBuilder();
            sb.append(getClass().getSimpleName());
            sb.append(": 鉴权失败, ");
            sb.append(getMessage());
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(getClass().getSimpleName());
        sb2.append(": 鉴权失败");
        return sb2.toString();
    }
}
