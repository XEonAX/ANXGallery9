package com.miui.gallery.share;

import android.text.TextUtils;

public class AlbumShareState {
    private static final int[] NEGATIVE_NEXT = {-1, 0, 4, 2, 2, 6, 5};
    private static final int[] POSITIVE_NEXT = {1, 2, 3, 5, -1, -1, -1};
    private static final StateValue[] STATE_VALUE_ARR = {new StateValue("invited", null, 0), new StateValue("invited", "requesting", 0), new StateValue("invited", null, 1), new StateValue("invited", "accepting", 1), new StateValue("invited", "denying", 1), new StateValue("normal", null, 2), new StateValue("normal", "exiting", 2)};

    private static final class StateValue {
        public final String mDBState;
        public final int mShareDetailInfoRequest;
        public final String mUIState;

        public StateValue(String str, String str2, int i) {
            this.mDBState = str;
            this.mUIState = str2;
            this.mShareDetailInfoRequest = i;
        }
    }

    public static int accept(int i) {
        if (i == 2) {
            return advance(i, true);
        }
        return -1;
    }

    public static int advance(int i, boolean z) {
        if (!isValid(i)) {
            return -1;
        }
        return z ? POSITIVE_NEXT[i] : NEGATIVE_NEXT[i];
    }

    public static int deny(int i) {
        if (i == 2) {
            return advance(i, false);
        }
        return -1;
    }

    public static int exit(int i) {
        if (i == 5) {
            return advance(i, false);
        }
        return -1;
    }

    public static int getState(String str, String str2, boolean z) {
        StateValue[] stateValueArr;
        int i = 0;
        for (StateValue stateValue : STATE_VALUE_ARR) {
            if (TextUtils.equals(stateValue.mDBState, str) && TextUtils.equals(stateValue.mUIState, str2)) {
                if (stateValue.mShareDetailInfoRequest != 2) {
                    boolean z2 = true;
                    if (stateValue.mShareDetailInfoRequest != 1) {
                        z2 = false;
                    }
                    if (z2 == z) {
                    }
                }
                return i;
            }
            i++;
        }
        return -1;
    }

    public static boolean isValid(int i) {
        return i >= 0 && i <= 6;
    }

    public static int requestLongUrl(int i) {
        if (i == 0) {
            return advance(i, true);
        }
        return -1;
    }
}
