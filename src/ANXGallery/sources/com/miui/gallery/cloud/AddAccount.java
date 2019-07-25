package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.net.Uri.Builder;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.cloudcontrol.CloudControlRequestHelper;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.push.GalleryPushManager;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deleterecorder.DeleteRecorder;
import java.io.File;
import java.util.ArrayList;

public class AddAccount {
    public static void onAddAccount(Context context, Account account) {
        GalleryPushManager.getInstance().onAddAccount(context, account);
        boolean existXiaomiAccount = SyncUtil.existXiaomiAccount(GalleryApp.sGetAndroidContext());
        Log.d("AddAccount", "Exist xiaomi Account %s", (Object) String.valueOf(existXiaomiAccount));
        if (existXiaomiAccount) {
            Log.d("AddAccount", "Done request cloud control data, result %s", (Object) String.valueOf(new CloudControlRequestHelper(GalleryApp.sGetAndroidContext()).execRequestSync(true)));
        }
        String[] pathsInExternalStorage = StorageUtils.getPathsInExternalStorage(context, StorageUtils.DIRECTORY_SECRET_ALBUM_PATH);
        if (account != null && !TextUtils.isEmpty(account.name) && pathsInExternalStorage != null && pathsInExternalStorage.length > 0) {
            for (String file : pathsInExternalStorage) {
                File file2 = new File(file);
                if (file2.exists() && file2.isDirectory()) {
                    File[] listFiles = file2.listFiles();
                    if (listFiles != null && listFiles.length > 0) {
                        ArrayList arrayList = new ArrayList();
                        for (File file3 : listFiles) {
                            if (file3.isFile()) {
                                String probeSecretFileName = SecretAlbumUtils.probeSecretFileName(file3.getName(), account.name);
                                if (probeSecretFileName != null) {
                                    Log.d("AddAccount", "Recover secret file [%s] to album", (Object) file3.getAbsolutePath());
                                    File file4 = new File(file3.getParent(), probeSecretFileName);
                                    if (FileUtils.move(file3, file4)) {
                                        arrayList.add(new Builder().scheme("file").path(file4.getAbsolutePath()).build());
                                    }
                                }
                            }
                        }
                        if (!arrayList.isEmpty()) {
                            CloudUtils.addToSecret(context, arrayList);
                        }
                    }
                }
            }
        }
        DeleteRecorder.onAddAccount();
    }
}
