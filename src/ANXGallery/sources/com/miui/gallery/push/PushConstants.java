package com.miui.gallery.push;

import android.text.TextUtils;
import com.meicam.themehelper.BuildConfig;

public interface PushConstants {

    public enum MessageScope {
        DEBUG("debug"),
        RELEASE(BuildConfig.BUILD_TYPE);
        
        private String value;

        private MessageScope(String str) {
            this.value = str;
        }

        public static MessageScope getScope(String str) {
            MessageScope[] values;
            if (!TextUtils.isEmpty(str)) {
                for (MessageScope messageScope : values()) {
                    if (str.equals(messageScope.value)) {
                        return messageScope;
                    }
                }
            }
            return null;
        }
    }

    public enum MessageType {
        SYNC("sync"),
        DIRECT("direct");
        
        private String value;

        private MessageType(String str) {
            this.value = str;
        }

        public static MessageType getType(String str) {
            MessageType[] values;
            if (!TextUtils.isEmpty(str)) {
                for (MessageType messageType : values()) {
                    if (str.equalsIgnoreCase(messageType.value)) {
                        return messageType;
                    }
                }
            }
            return null;
        }
    }
}
