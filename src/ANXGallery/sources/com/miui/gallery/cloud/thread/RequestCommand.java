package com.miui.gallery.cloud.thread;

import android.accounts.Account;
import android.os.SystemClock;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.data.DBImage;

public class RequestCommand implements Command {
    final Account mAccount;
    final long mInvokeTime = SystemClock.uptimeMillis();
    final RequestCloudItem mRequestItem;

    public RequestCommand(Account account, RequestCloudItem requestCloudItem) {
        this.mAccount = account;
        this.mRequestItem = requestCloudItem;
    }

    public static String getKey(RequestCloudItem requestCloudItem) {
        return getKey(requestCloudItem.dbCloud, requestCloudItem.priority);
    }

    public static String getKey(DBImage dBImage, int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(dBImage.getTagId());
        sb.append("#");
        sb.append(i);
        return sb.toString();
    }

    public boolean canMergeWith(Command command) {
        RequestCommand requestCommand = (RequestCommand) command;
        return this.mRequestItem.priority == requestCommand.mRequestItem.priority && this.mAccount.equals(requestCommand.mAccount);
    }

    public long getDelay(long j) {
        return this.mRequestItem.getDelayToExecuteInMillis(j);
    }

    public String getKey() {
        return getKey(this.mRequestItem);
    }

    public int getPriority() {
        return this.mRequestItem.priority;
    }

    public boolean needProcess() {
        return this.mRequestItem.getStatus() != 0;
    }
}
