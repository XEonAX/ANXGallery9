package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class OperatePushHelper {
    private static volatile OperatePushHelper sInstance;
    private Context appContext;
    private List<MessageBean> operateMessages = new ArrayList();

    private OperatePushHelper(Context context) {
        this.appContext = context.getApplicationContext();
        if (this.appContext == null) {
            this.appContext = context;
        }
    }

    public static OperatePushHelper getInstance(Context context) {
        if (sInstance == null) {
            synchronized (OperatePushHelper.class) {
                if (sInstance == null) {
                    sInstance = new OperatePushHelper(context);
                }
            }
        }
        return sInstance;
    }

    public int getRetryCount(String str) {
        synchronized (this.operateMessages) {
            MessageBean messageBean = new MessageBean();
            messageBean.messageId = str;
            if (this.operateMessages.contains(messageBean)) {
                for (MessageBean messageBean2 : this.operateMessages) {
                    if (messageBean2.equals(messageBean)) {
                        int i = messageBean2.count;
                        return i;
                    }
                }
            }
            return 0;
        }
    }

    public synchronized String getSyncStatus(RetryType retryType) {
        return this.appContext.getSharedPreferences("mipush_extra", 0).getString(retryType.name(), "");
    }

    public void increaseRetryCount(String str) {
        synchronized (this.operateMessages) {
            MessageBean messageBean = new MessageBean();
            messageBean.messageId = str;
            if (this.operateMessages.contains(messageBean)) {
                Iterator it = this.operateMessages.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    MessageBean messageBean2 = (MessageBean) it.next();
                    if (messageBean.equals(messageBean2)) {
                        messageBean = messageBean2;
                        break;
                    }
                }
            }
            messageBean.count++;
            this.operateMessages.remove(messageBean);
            this.operateMessages.add(messageBean);
        }
    }

    public boolean isMessageOperating(String str) {
        synchronized (this.operateMessages) {
            MessageBean messageBean = new MessageBean();
            messageBean.messageId = str;
            return this.operateMessages.contains(messageBean);
        }
    }

    public synchronized void putSyncStatus(RetryType retryType, String str) {
        SharedPreferences sharedPreferences = this.appContext.getSharedPreferences("mipush_extra", 0);
        sharedPreferences.edit().putString(retryType.name(), str).commit();
    }

    public void removeOperateMessage(String str) {
        synchronized (this.operateMessages) {
            MessageBean messageBean = new MessageBean();
            messageBean.messageId = str;
            if (this.operateMessages.contains(messageBean)) {
                this.operateMessages.remove(messageBean);
            }
        }
    }

    public void resetOperateMessage(String str) {
        synchronized (this.operateMessages) {
            MessageBean messageBean = new MessageBean();
            messageBean.count = 0;
            messageBean.messageId = str;
            if (this.operateMessages.contains(messageBean)) {
                this.operateMessages.remove(messageBean);
            }
            this.operateMessages.add(messageBean);
        }
    }
}
