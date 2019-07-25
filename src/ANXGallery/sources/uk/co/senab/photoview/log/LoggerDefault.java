package uk.co.senab.photoview.log;

import android.util.Log;

public class LoggerDefault implements Logger {
    public int d(String str, String str2) {
        return Log.d(str, str2);
    }

    public int e(String str, String str2) {
        return Log.e(str, str2);
    }

    public int i(String str, String str2) {
        return Log.i(str, str2);
    }

    public int w(String str, String str2) {
        return Log.w(str, str2);
    }
}
