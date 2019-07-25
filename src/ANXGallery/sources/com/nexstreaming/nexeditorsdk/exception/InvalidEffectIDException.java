package com.nexstreaming.nexeditorsdk.exception;

public class InvalidEffectIDException extends nexSDKException {
    private static final long serialVersionUID = 1;

    public InvalidEffectIDException(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append(" is not valid ");
        sb.append(str);
        sb.append(" ID.");
        super(sb.toString());
    }
}
