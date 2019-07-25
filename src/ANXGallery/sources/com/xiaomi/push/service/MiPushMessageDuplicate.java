package com.xiaomi.push.service;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;

public class MiPushMessageDuplicate {
    private static Object lock = new Object();
    private static Map<String, Queue<String>> mCachedMsgIds = new HashMap();

    public static boolean isDuplicateMessage(XMPushService xMPushService, String str, String str2) {
        synchronized (lock) {
            SharedPreferences sharedPreferences = xMPushService.getSharedPreferences("push_message_ids", 0);
            Queue queue = (Queue) mCachedMsgIds.get(str);
            if (queue == null) {
                String[] split = sharedPreferences.getString(str, "").split(",");
                Queue linkedList = new LinkedList();
                for (String add : split) {
                    linkedList.add(add);
                }
                mCachedMsgIds.put(str, linkedList);
                queue = linkedList;
            }
            if (queue.contains(str2)) {
                return true;
            }
            queue.add(str2);
            if (queue.size() > 25) {
                queue.poll();
            }
            String join = XMStringUtils.join((Collection<?>) queue, ",");
            Editor edit = sharedPreferences.edit();
            edit.putString(str, join);
            edit.commit();
            return false;
        }
    }
}
