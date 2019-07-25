package com.xiaomi.push.service.xmpush;

import android.text.TextUtils;
import com.xiaomi.push.service.clientReport.PushClientReportHelper;

public enum Command {
    COMMAND_REGISTER("register"),
    COMMAND_UNREGISTER("unregister"),
    COMMAND_SET_ALIAS("set-alias"),
    COMMAND_UNSET_ALIAS("unset-alias"),
    COMMAND_SET_ACCOUNT("set-account"),
    COMMAND_UNSET_ACCOUNT("unset-account"),
    COMMAND_SUBSCRIBE_TOPIC("subscribe-topic"),
    COMMAND_UNSUBSCRIBE_TOPIC("unsubscibe-topic"),
    COMMAND_SET_ACCEPT_TIME("accept-time"),
    COMMAND_CHK_VDEVID("check-vdeviceid");
    
    public final String value;

    private Command(String str) {
        this.value = str;
    }

    public static int getCode(String str) {
        Command[] values;
        int i = -1;
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        for (Command command : values()) {
            if (command.value.equals(str)) {
                i = PushClientReportHelper.changeOrdinalToCode(command);
            }
        }
        return i;
    }
}
