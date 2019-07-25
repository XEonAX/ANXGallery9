package com.miui.gallery.sdk.download.executor;

import android.accounts.Account;
import android.text.TextUtils;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadItem;
import com.miui.gallery.sdk.download.executor.queue.Command;

public class DownloadCommand implements Command {
    private Account mAccount;
    private DownloadItem mItem;

    public DownloadCommand(Account account, DownloadItem downloadItem) {
        this.mAccount = account;
        this.mItem = downloadItem;
    }

    public DownloadCommand(DownloadCommand downloadCommand) {
        this.mAccount = downloadCommand.getAccount();
        this.mItem = new DownloadItem(downloadCommand.mItem);
    }

    public static boolean checkValid(DownloadCommand downloadCommand) {
        Account account = AccountCache.getAccount();
        if (account != null && downloadCommand != null && account.equals(downloadCommand.getAccount())) {
            return true;
        }
        DownloadItem item = downloadCommand.getItem();
        if (item != null) {
            DownloadItem.callbackError(item, new DownloadFailReason(ErrorCode.NO_ACCOUNT, "illegal account", null));
        }
        return false;
    }

    public boolean equals(Object obj) {
        return obj != null && (obj instanceof DownloadCommand) && TextUtils.equals(getKey(), ((DownloadCommand) obj).getKey());
    }

    public Account getAccount() {
        return this.mAccount;
    }

    public DownloadItem getItem() {
        return this.mItem;
    }

    public String getKey() {
        return this.mItem.getKey();
    }

    public int getPriority() {
        return this.mItem.getPriority();
    }

    public int hashCode() {
        return getKey().hashCode();
    }
}
