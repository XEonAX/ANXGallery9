package com.miui.gallery.cloud;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.Notification;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteCantOpenDatabaseException;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.baby.BabyAlbumUtils;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy.FileSizeLimitStrategy;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBImage.ExifDataConst;
import com.miui.gallery.data.DBOwnerSubUbiImage;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.data.DBShareImage;
import com.miui.gallery.data.DBShareSubUbiImage;
import com.miui.gallery.data.DBShareUser;
import com.miui.gallery.data.DecodeUtils;
import com.miui.gallery.data.DecodeUtils.GalleryOptions;
import com.miui.gallery.data.LocalUbifocus;
import com.miui.gallery.data.LocalUbifocus.SubFile;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.model.SecretInfo;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.provider.GalleryContract.ShareUser;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.provider.GalleryDBHelper.TableColumn;
import com.miui.gallery.provider.deprecated.GalleryCloudProvider;
import com.miui.gallery.util.BaseDocumentProviderUtils.WriteHandler;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.Encode;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.NotificationHelper;
import com.miui.gallery.util.SecretAlbumCryptoUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.UbiFocusUtils;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.Utils;
import com.miui.gallery.util.deprecated.Preference;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.miui.os.Rom;
import com.miui.settings.Settings;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import miui.os.ExtraFileUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.message.BasicNameValuePair;
import org.jcodec.containers.mp4.boxes.Box;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

public class CloudUtils {
    @Deprecated
    public static final String HTTPHOST_GALLERY_V1;
    @Deprecated
    public static final String HTTPHOST_GALLERY_V1_1;
    @Deprecated
    public static final String HTTPHOST_GALLERY_V2;
    @Deprecated
    public static final String HTTPHOST_GALLERY_V2_1;
    @Deprecated
    public static final String HTTPHOST_GALLERY_V2_2;
    public static final String HTTPHOST_GALLERY_V3;
    private static final String SELECTION_CAN_SYNC = String.format(Locale.US, "(((%s = %d OR %s = %d OR %s = %d) AND %s = '%s') OR (%s) OR (%s AND (%s IN (%d, %d) OR (%s IN (SELECT %s FROM %s WHERE %s)))))", new Object[]{"localFlag", Integer.valueOf(0), "localFlag", Integer.valueOf(2), "localFlag", Integer.valueOf(10), "serverStatus", "custom", SELECTION_GROUP_AUTO_UPLOAD, itemIsNotGroup, "localGroupId", Long.valueOf(CloudTableUtils.getCloudIdForGroupWithoutRecord(1000)), Long.valueOf(CloudTableUtils.getCloudIdForGroupWithoutRecord(1001)), "localGroupId", "_id", "cloud", SELECTION_GROUP_AUTO_UPLOAD});
    private static final String SELECTION_EDITED = String.format(Locale.US, "(%s NOT NULL AND %s!='') AND (%s IS NULL OR %s!=%d) AND (%s IS NULL OR %s='' OR %s='%s')", new Object[]{"editedColumns", "editedColumns", "localFlag", "localFlag", Integer.valueOf(2), "serverStatus", "serverStatus", "serverStatus", "custom"});
    private static final String SELECTION_GROUP_AUTO_UPLOAD = String.format(Locale.US, "(%s AND (%s & %d != 0))", new Object[]{itemIsGroup, "attributes", Long.valueOf(1)});
    public static final String SELECTION_NOT_SYNCED_OR_EDITED;
    public static final String SELECTION_OWNER_NEED_SYNC;
    public static final String itemIsGroup = String.format(Locale.US, "(%s = %d)", new Object[]{"serverType", Integer.valueOf(0)});
    public static final String itemIsNotGroup = String.format(Locale.US, "(%s = %d OR %s = %d)", new Object[]{"serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2)});
    private static final String photoLocalFlag_Create_ForceCreate_Move_Copy_Rename = String.format(Locale.US, "(%s = %d OR %s = %d OR %s = %d OR %s = %d OR %s = %d OR %s = %d )", new Object[]{"localFlag", Integer.valueOf(8), "localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(5), "localFlag", Integer.valueOf(6), "localFlag", Integer.valueOf(9), "localFlag", Integer.valueOf(10)});
    public static final String photoLocalFlag_Synced = String.format(Locale.US, "(%s = %d AND %s = \"%s\")", new Object[]{"localFlag", Integer.valueOf(0), "serverStatus", "custom"});
    private static FileSizeLimitStrategy sFileSizeLimitStrategy;
    private static final Object sLock = new Object();

    public static class CheckInternalAccountTask extends AsyncTask<Void, Integer, Void> {
        private Runnable mRunOnPostExecute;

        public CheckInternalAccountTask(Runnable runnable) {
            this.mRunOnPostExecute = runnable;
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            run();
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (this.mRunOnPostExecute != null) {
                this.mRunOnPostExecute.run();
            }
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
        }

        public void run() {
            if (Preference.sIsInternationalAccount() == 2) {
                Preference.sSetIsInternationalAccount(com.xiaomi.micloudsdk.request.utils.CloudUtils.isInternationalAccount(true));
            }
        }
    }

    public interface Insertable {
        long insert(Uri uri, String str, String str2, ContentValues contentValues);
    }

    public static class SecretAlbumUtils {
        public static final String ENCRYPTED_IMAGE_EXTENSION = ".sa";
        public static final String ENCRYPTED_VIDEO_EXTENSION = ".sav";
        private static final Set<String> UNENCRYPTED_FILE_EXTENSIONS = new HashSet();
        public static final String UNENCRYPTED_IMAGE_EXTENSION = ".img";
        public static final String UNENCRYPTED_VIDEO_EXTENSION = ".vid";

        static {
            UNENCRYPTED_FILE_EXTENSIONS.add(UNENCRYPTED_IMAGE_EXTENSION);
            UNENCRYPTED_FILE_EXTENSIONS.add(UNENCRYPTED_VIDEO_EXTENSION);
        }

        private static String decodeFileName(String str, String str2) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            int lastIndexOf = str.lastIndexOf("/");
            if (lastIndexOf == -1) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str.substring(0, lastIndexOf + 1));
            sb.append(str2);
            String sb2 = sb.toString();
            if (new File(sb2).exists()) {
                sb2 = DownloadPathHelper.addPostfixToFileName(sb2, String.valueOf(System.currentTimeMillis()));
            }
            if (!FileUtils.move(new File(str), new File(sb2))) {
                sb2 = null;
            }
            return sb2;
        }

        /* JADX WARNING: Removed duplicated region for block: B:10:0x0030  */
        /* JADX WARNING: Removed duplicated region for block: B:18:? A[RETURN, SYNTHETIC] */
        public static void decodeFileNames(DBImage dBImage, ContentValues contentValues) {
            boolean z;
            String thumbnailFile;
            String localFile = dBImage.getLocalFile();
            if (FileUtils.isFileExist(localFile)) {
                String decodeFileName = decodeFileName(localFile, dBImage.getFileName());
                contentValues.put("localFile", decodeFileName);
                if (FileUtils.isFileExist(decodeFileName) && !ExtraTextUtils.equalsIgnoreCase(localFile, decodeFileName)) {
                    z = true;
                    thumbnailFile = dBImage.getThumbnailFile();
                    if (!FileUtils.isFileExist(thumbnailFile)) {
                        String thumbnailNameByTitle = CloudUtils.getThumbnailNameByTitle(dBImage.getTitle());
                        if (z) {
                            contentValues.putNull("thumbnailFile");
                            return;
                        }
                        String decodeFileName2 = decodeFileName(thumbnailFile, thumbnailNameByTitle);
                        if (decodeFileName2 != null) {
                            contentValues.put("thumbnailFile", decodeFileName2);
                            return;
                        }
                        contentValues.put("localFile", localFile);
                        contentValues.put("thumbnailFile", thumbnailFile);
                        return;
                    }
                    return;
                }
            }
            z = false;
            thumbnailFile = dBImage.getThumbnailFile();
            if (!FileUtils.isFileExist(thumbnailFile)) {
            }
        }

        public static String decryptFile(String str, String str2, boolean z, long j, boolean z2) {
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
                return null;
            }
            SecretInfo secretInfo = new SecretInfo();
            secretInfo.mSecretId = j;
            secretInfo.mSecretPath = str;
            SecretInfo secretInfo2 = com.miui.gallery.provider.CloudUtils.getSecretInfo(GalleryApp.sGetAndroidContext(), secretInfo.mSecretId, secretInfo);
            if (TextUtils.isEmpty(secretInfo2.mSecretPath)) {
                return null;
            }
            if (secretInfo2.mSecretKey != null) {
                return decryptFile(secretInfo2.mSecretPath, str2, z, secretInfo2.mSecretKey, z2);
            }
            if (z2) {
                FileUtils.renameFile(new File(secretInfo2.mSecretPath), new File(str2));
            } else {
                FileUtils.copyFile(new File(secretInfo2.mSecretPath), new File(str2));
            }
            return str2;
        }

        private static String decryptFile(String str, String str2, boolean z, byte[] bArr) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            int lastIndexOf = str.lastIndexOf("/");
            if (lastIndexOf == -1) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str.substring(0, lastIndexOf + 1));
            sb.append(str2);
            return decryptFile(str, sb.toString(), z, bArr, true);
        }

        public static String decryptFile(String str, String str2, boolean z, byte[] bArr, boolean z2) {
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
                return null;
            }
            File file = new File(str);
            if (!file.isFile()) {
                return null;
            }
            if (SecretAlbumCryptoUtils.decrypt(str, str2, z, bArr)) {
                if (z2) {
                    MediaFileUtils.deleteFileType(FileType.NORMAL, file);
                }
                return str2;
            }
            if (z2) {
                MediaFileUtils.deleteFileType(FileType.NORMAL, str2);
            }
            return null;
        }

        /* JADX WARNING: Removed duplicated region for block: B:16:0x0060  */
        public static void decryptFiles(DBImage dBImage, ContentValues contentValues) {
            boolean z;
            String thumbnailFile;
            if (dBImage.getSecretKeyNoGenerate() != null) {
                boolean isVideoType = dBImage.isVideoType();
                String microThumbnailFile = dBImage.getMicroThumbnailFile();
                if (FileUtils.isFileExist(microThumbnailFile)) {
                    contentValues.put("microthumbfile", decryptFile(microThumbnailFile, CloudUtils.getThumbnailNameBySha1(dBImage.getSha1()), false, dBImage.getSecretKey()));
                }
                String localFile = dBImage.getLocalFile();
                if (FileUtils.isFileExist(localFile)) {
                    String decryptFile = decryptFile(localFile, dBImage.getFileName(), isVideoType, dBImage.getSecretKey());
                    contentValues.put("localFile", decryptFile);
                    if (FileUtils.isFileExist(decryptFile) && !decryptFile.equals(localFile)) {
                        z = true;
                        thumbnailFile = dBImage.getThumbnailFile();
                        if (FileUtils.isFileExist(thumbnailFile)) {
                            String thumbnailNameByTitle = CloudUtils.getThumbnailNameByTitle(dBImage.getTitle());
                            if (z || FileUtils.isFileExist(thumbnailNameByTitle)) {
                                MediaFileUtils.deleteFileType(FileType.THUMBNAIL, thumbnailFile);
                                contentValues.putNull("thumbnailFile");
                            } else {
                                contentValues.put("thumbnailFile", decryptFile(thumbnailFile, thumbnailNameByTitle, false, dBImage.getSecretKey()));
                            }
                        }
                    }
                }
                z = false;
                thumbnailFile = dBImage.getThumbnailFile();
                if (FileUtils.isFileExist(thumbnailFile)) {
                }
            }
        }

        public static String encodeFileName(String str, boolean z) {
            if (TextUtils.isEmpty(str)) {
                return str;
            }
            Account account = AccountCache.getAccount();
            if (account == null || TextUtils.isEmpty(account.name)) {
                return str;
            }
            if (str.startsWith("{-sec-}") && probeSecretFileName(str, account.name) != null) {
                return str;
            }
            CharSequence[] charSequenceArr = new CharSequence[3];
            charSequenceArr[0] = "{-sec-}";
            charSequenceArr[1] = Encode.encodeBase64(TextUtils.concat(new CharSequence[]{account.name, "#", str}).toString());
            charSequenceArr[2] = z ? UNENCRYPTED_VIDEO_EXTENSION : UNENCRYPTED_IMAGE_EXTENSION;
            return TextUtils.concat(charSequenceArr).toString();
        }

        private static String encryptFile(String str, String str2, boolean z, byte[] bArr) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            int lastIndexOf = str.lastIndexOf("/");
            if (lastIndexOf == -1) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str.substring(0, lastIndexOf + 1));
            sb.append(str2);
            String sb2 = sb.toString();
            File file = new File(str);
            if (!file.isFile()) {
                return null;
            }
            if (SecretAlbumCryptoUtils.encrypt(str, sb2, z, bArr)) {
                MediaFileUtils.deleteFileType(FileType.NORMAL, file);
                return sb2;
            }
            MediaFileUtils.deleteFileType(FileType.NORMAL, sb2);
            return null;
        }

        public static void encryptFiles(DBImage dBImage, ContentValues contentValues) {
            if (dBImage.getSecretKeyNoGenerate() == null) {
                byte[] secretKey = dBImage.getSecretKey();
                contentValues.put("secretKey", secretKey);
                boolean isVideoType = dBImage.isVideoType();
                String microThumbnailFile = dBImage.getMicroThumbnailFile();
                if (FileUtils.isFileExist(microThumbnailFile)) {
                    contentValues.put("microthumbfile", encryptFile(microThumbnailFile, dBImage.getSha1ThumbnailSA(), false, secretKey));
                }
                String localFile = dBImage.getLocalFile();
                if (FileUtils.isFileExist(localFile)) {
                    contentValues.put("localFile", encryptFile(localFile, dBImage.getEncodedFileName(), isVideoType, secretKey));
                }
                String thumbnailFile = dBImage.getThumbnailFile();
                if (FileUtils.isFileExist(thumbnailFile)) {
                    contentValues.put("thumbnailFile", encryptFile(thumbnailFile, dBImage.getSha1ThumbnailSA(), false, secretKey));
                }
            }
        }

        public static String getEncryptedFileName(String str, String str2, boolean z) {
            int lastIndexOf = str.lastIndexOf(".");
            String str3 = "%s.%s%s";
            Locale locale = Locale.US;
            Object[] objArr = new Object[3];
            if (!(lastIndexOf == -1 || lastIndexOf == 0)) {
                str = str.substring(0, lastIndexOf);
            }
            objArr[0] = str;
            objArr[1] = str2;
            objArr[2] = z ? ENCRYPTED_VIDEO_EXTENSION : ENCRYPTED_IMAGE_EXTENSION;
            return String.format(locale, str3, objArr);
        }

        public static String getMD5Key(byte[] bArr) {
            try {
                MessageDigest instance = MessageDigest.getInstance("MD5");
                instance.update(bArr, 0, bArr.length);
                return Encode.byteArrayToHexString(instance.digest());
            } catch (NoSuchAlgorithmException e) {
                Log.w("CloudUtils", (Throwable) e);
                return null;
            }
        }

        public static String getSha1ThumbnailSA(String str, String str2, boolean z) {
            return String.format(Locale.US, "%s.%s%s", new Object[]{str, str2, ENCRYPTED_IMAGE_EXTENSION});
        }

        public static boolean isEmpty(byte[] bArr) {
            return bArr == null || bArr.length <= 0;
        }

        public static boolean isEncryptedVideoByPath(String str) {
            return str != null && str.endsWith(ENCRYPTED_VIDEO_EXTENSION);
        }

        public static boolean isUnencryptedImageByPath(String str) {
            return str != null && str.endsWith(UNENCRYPTED_IMAGE_EXTENSION);
        }

        public static boolean isUnencryptedVideoByPath(String str) {
            return str != null && str.endsWith(UNENCRYPTED_VIDEO_EXTENSION);
        }

        public static String probeSecretFileName(String str, String str2) {
            String str3;
            if (!TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str) && str.startsWith("{-sec-}") && str.length() > "{-sec-}".length()) {
                StringBuilder sb = new StringBuilder();
                sb.append(".");
                sb.append(FileUtils.getExtension(str));
                String sb2 = sb.toString();
                if (TextUtils.isEmpty(sb2) || !UNENCRYPTED_FILE_EXTENSIONS.contains(sb2)) {
                    str3 = str.substring("{-sec-}".length());
                } else {
                    int length = str.length() - sb2.length();
                    if (length < "{-sec-}".length()) {
                        return null;
                    }
                    str3 = str.substring("{-sec-}".length(), length);
                }
                try {
                    String decodeBase64 = Encode.decodeBase64(str3);
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(str2);
                    sb3.append("#");
                    String sb4 = sb3.toString();
                    if (decodeBase64.startsWith(sb4)) {
                        return decodeBase64.substring(sb4.length());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return null;
        }
    }

    interface ThumbnailFactory {
        Bitmap create();

        String getDirectory();

        String getFileName();
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("localFlag != 0 OR ");
        sb.append(SELECTION_EDITED);
        SELECTION_NOT_SYNCED_OR_EDITED = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("(");
        sb2.append(SELECTION_NOT_SYNCED_OR_EDITED);
        sb2.append(") ");
        sb2.append(" AND ");
        sb2.append(SELECTION_CAN_SYNC);
        SELECTION_OWNER_NEED_SYNC = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb3.append("/mic/v1/gallery");
        HTTPHOST_GALLERY_V1 = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb4.append("/mic/v1.1/gallery");
        HTTPHOST_GALLERY_V1_1 = sb4.toString();
        StringBuilder sb5 = new StringBuilder();
        sb5.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb5.append("/mic/gallery/v2");
        HTTPHOST_GALLERY_V2 = sb5.toString();
        StringBuilder sb6 = new StringBuilder();
        sb6.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb6.append("/mic/gallery/v2.1");
        HTTPHOST_GALLERY_V2_1 = sb6.toString();
        StringBuilder sb7 = new StringBuilder();
        sb7.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb7.append("/mic/gallery/v2.2");
        HTTPHOST_GALLERY_V2_2 = sb7.toString();
        StringBuilder sb8 = new StringBuilder();
        sb8.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb8.append("/mic/gallery/v3");
        HTTPHOST_GALLERY_V3 = sb8.toString();
    }

    public static void addRecordsForCameraAndScreenshots(Insertable insertable) {
        insertable.insert(GalleryCloudUtils.CLOUD_URI, "cloud", null, getCameraRecordValues());
        insertable.insert(GalleryCloudUtils.CLOUD_URI, "cloud", null, getScreenshotsRecordValues());
    }

    private static void addRetryParameters(List<NameValuePair> list, int i, boolean z, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        if (i > 0) {
            list.add(new BasicNameValuePair("retry", Integer.toString(i)));
        }
        if (z) {
            list.add(new BasicNameValuePair("needReRequest", String.valueOf(z)));
        }
    }

    public static String buildBigThumbnailForImage(final String str, String str2, final String str3, final String str4, ThumbnailMetaWriter thumbnailMetaWriter) {
        if (TextUtils.isEmpty(str)) {
            Log.w("CloudUtils", "failed to convert, sourceFile=%s", str);
            return null;
        } else if (TextUtils.isEmpty(str3) || TextUtils.isEmpty(str4)) {
            Log.w("CloudUtils", "failed to convert, sourceFile=%s, thumbnailDir=%s, thumbnailFileName=%s", str, str3, str4);
            return null;
        } else {
            File buildThumbnail = buildThumbnail(str, new ThumbnailFactory() {
                public Bitmap create() {
                    GalleryOptions galleryOptions = new GalleryOptions();
                    galleryOptions.inPreferredConfig = Config.ARGB_8888;
                    return DecodeUtils.requestDecodeThumbNail(str, galleryOptions);
                }

                public String getDirectory() {
                    return str3;
                }

                public String getFileName() {
                    return str4;
                }
            }, thumbnailMetaWriter);
            if (buildThumbnail != null) {
                return buildThumbnail.getAbsolutePath();
            }
            return null;
        }
    }

    private static File buildThumbnail(String str, ThumbnailFactory thumbnailFactory, ThumbnailMetaWriter thumbnailMetaWriter) {
        String fileName = thumbnailFactory.getFileName();
        File file = new File(thumbnailFactory.getDirectory(), fileName);
        if (file.exists()) {
            return file;
        }
        Bitmap create = thumbnailFactory.create();
        if (create != null) {
            try {
                File saveBitmapToFile = saveBitmapToFile(create, thumbnailFactory.getDirectory(), fileName);
                if (saveBitmapToFile != null) {
                    if (!thumbnailMetaWriter.write(saveBitmapToFile.getAbsolutePath())) {
                        if (!StorageUtils.getPriorMicroThumbnailDirectory().equals(thumbnailFactory.getDirectory())) {
                            MediaFileUtils.deleteFileType(FileType.THUMBNAIL, saveBitmapToFile);
                        }
                    }
                    return saveBitmapToFile;
                }
                if (!create.isRecycled()) {
                    create.recycle();
                }
            } finally {
                if (!create.isRecycled()) {
                    create.recycle();
                }
            }
        }
        return null;
    }

    public static int canUpload(File file, boolean z) {
        if (!file.exists() || file.isDirectory()) {
            return 6;
        }
        int serverType = getServerType(file);
        if (serverType == -1 || serverType == 0) {
            return 5;
        }
        long sGetFilterMinSize = Preference.sGetFilterMinSize();
        long length = file.length();
        if (length <= sGetFilterMinSize) {
            return 10;
        }
        if (!z || serverType != 1 || length <= getFileSizeLimitStrategy().getImageMaxSize()) {
            return (!z || serverType != 2 || length <= getFileSizeLimitStrategy().getVideoMaxSize()) ? 0 : 4;
        }
        return 4;
    }

    public static int canUpload(String str) {
        if (TextUtils.isEmpty(str)) {
            return 6;
        }
        return canUpload(new File(str), true);
    }

    public static int canUpload(String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            return 6;
        }
        return canUpload(new File(str), z);
    }

    public static boolean checkAccount(Activity activity, boolean z, Runnable runnable) {
        boolean z2;
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
        Account accountFromDB = getAccountFromDB(sGetAndroidContext);
        if (accountFromDB == null || (xiaomiAccount != null && accountFromDB.name.equals(xiaomiAccount.name))) {
            z2 = true;
        } else {
            Log.w("CloudUtils", "account from DB not equals account from system, delete DB account");
            if (z) {
                z2 = DeleteAccount.executeDeleteAccount(2);
            } else {
                DeleteAccount.deleteAccountInTask(activity, accountFromDB, 2, null);
                z2 = false;
            }
        }
        if (xiaomiAccount != null && CTA.canConnectNetwork()) {
            if (z) {
                new CheckInternalAccountTask(runnable).run();
            } else {
                new CheckInternalAccountTask(runnable).execute(new Void[0]);
            }
        }
        return z2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002e A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x004b A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x004d A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x0059 A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x005b A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0067 A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0069 A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0075 A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0077 A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x007a A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x0094 A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00ae A[Catch:{ JSONException -> 0x00e3 }] */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c8 A[Catch:{ JSONException -> 0x00e3 }] */
    public static String collectAlbumDescription(DBImage dBImage) {
        JSONObject jSONObject;
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        try {
            String description = dBImage.getDescription();
            if (!TextUtils.isEmpty(description)) {
                try {
                    jSONObject = new JSONObject(description);
                } catch (JSONException e) {
                    String str = "CloudUtils";
                    StringBuilder sb = new StringBuilder();
                    sb.append("failed to parse: ");
                    sb.append(description);
                    Log.w(str, sb.toString());
                    e.printStackTrace();
                }
                if (jSONObject == null) {
                    jSONObject = new JSONObject();
                }
                jSONObject.put("localFile", dBImage.getLocalFile());
                boolean z5 = false;
                z = (dBImage.getAttributes() & 2) == 0;
                z2 = (dBImage.getAttributes() & 128) == 0;
                z3 = (dBImage.getAttributes() & 8) == 0;
                z4 = (dBImage.getAttributes() & 32) == 0;
                if (z) {
                    jSONObject.put("autoUpload", (dBImage.getAttributes() & 1) != 0);
                    jSONObject.put("manualSetUpload", true);
                }
                if (z2) {
                    jSONObject.put("showInOtherAlbums", (dBImage.getAttributes() & 64) != 0);
                    jSONObject.put("manualShowInOtherAlbums", true);
                }
                if (z3) {
                    jSONObject.put("showInPhotosTab", (dBImage.getAttributes() & 4) != 0);
                    jSONObject.put("manualShowInPhotosTab", true);
                }
                if (z4) {
                    if ((dBImage.getAttributes() & 16) != 0) {
                        z5 = true;
                    }
                    jSONObject.put("hidden", z5);
                    jSONObject.put("manualHidden", true);
                }
                return jSONObject.toString();
            }
            jSONObject = null;
            if (jSONObject == null) {
            }
            jSONObject.put("localFile", dBImage.getLocalFile());
            boolean z52 = false;
            if ((dBImage.getAttributes() & 2) == 0) {
            }
            if ((dBImage.getAttributes() & 128) == 0) {
            }
            if ((dBImage.getAttributes() & 8) == 0) {
            }
            if ((dBImage.getAttributes() & 32) == 0) {
            }
            if (z) {
            }
            if (z2) {
            }
            if (z3) {
            }
            if (z4) {
            }
            return jSONObject.toString();
        } catch (JSONException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002e A[Catch:{ JSONException -> 0x004a }] */
    public static String collectMediaDescription(DBImage dBImage) {
        JSONObject jSONObject;
        try {
            String description = dBImage.getDescription();
            if (!TextUtils.isEmpty(description)) {
                try {
                    jSONObject = new JSONObject(description);
                } catch (JSONException e) {
                    String str = "CloudUtils";
                    StringBuilder sb = new StringBuilder();
                    sb.append("failed to parse: ");
                    sb.append(description);
                    Log.w(str, sb.toString());
                    e.printStackTrace();
                }
                if (jSONObject == null) {
                    jSONObject = new JSONObject();
                }
                jSONObject.put("isFavorite", dBImage.isFavorite());
                jSONObject.put("specialTypeFlags", dBImage.getSpecialTypeFlags());
                return jSONObject.toString();
            }
            jSONObject = null;
            if (jSONObject == null) {
            }
            jSONObject.put("isFavorite", dBImage.isFavorite());
            jSONObject.put("specialTypeFlags", dBImage.getSpecialTypeFlags());
            return jSONObject.toString();
        } catch (JSONException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    public static String copyImage(String str, final String str2, boolean z) {
        final FileInputStream fileInputStream;
        IOException e;
        if (!FileUtils.createFolder(FileUtils.getParentFolderPath(str2), z)) {
            return str;
        }
        final long currentTimeMillis = System.currentTimeMillis();
        try {
            fileInputStream = new FileInputStream(str);
            try {
                Boolean bool = (Boolean) DocumentProviderUtils.safeWriteFile(str2, new WriteHandler<Boolean>() {
                    public Boolean handle(FileOutputStream fileOutputStream) {
                        if (!GalleryUtils.copyFile(fileInputStream, fileOutputStream)) {
                            return Boolean.valueOf(false);
                        }
                        Utils.setPermissions(str2, 438, -1, -1);
                        StringBuilder sb = new StringBuilder();
                        sb.append("copy image finish, time:");
                        sb.append(System.currentTimeMillis() - currentTimeMillis);
                        Log.d("CloudUtils", sb.toString());
                        return Boolean.valueOf(true);
                    }
                });
                String str3 = (bool == null || !bool.booleanValue()) ? str : str2;
                MiscUtil.closeSilently(fileInputStream);
                boolean lastModified = new File(str2).setLastModified(new File(str).lastModified());
                StringBuilder sb = new StringBuilder();
                sb.append("change mtime ret:");
                sb.append(lastModified);
                Log.d("moveimage", sb.toString());
                return str3;
            } catch (IOException e2) {
                e = e2;
                try {
                    Log.w("CloudUtils", (Throwable) e);
                    MiscUtil.closeSilently(fileInputStream);
                    MediaFileUtils.deleteFileType(FileType.NORMAL, str2);
                    return str;
                } catch (Throwable th) {
                    th = th;
                    MiscUtil.closeSilently(fileInputStream);
                    boolean lastModified2 = new File(str2).setLastModified(new File(str).lastModified());
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("change mtime ret:");
                    sb2.append(lastModified2);
                    Log.d("moveimage", sb2.toString());
                    throw th;
                }
            }
        } catch (IOException e3) {
            fileInputStream = null;
            e = e3;
            Log.w("CloudUtils", (Throwable) e);
            MiscUtil.closeSilently(fileInputStream);
            MediaFileUtils.deleteFileType(FileType.NORMAL, str2);
            return str;
        } catch (Throwable th2) {
            fileInputStream = null;
            th = th2;
            MiscUtil.closeSilently(fileInputStream);
            boolean lastModified22 = new File(str2).setLastModified(new File(str).lastModified());
            StringBuilder sb22 = new StringBuilder();
            sb22.append("change mtime ret:");
            sb22.append(lastModified22);
            Log.d("moveimage", sb22.toString());
            throw th;
        }
    }

    public static DBImage createDBImageByUri(Uri uri, Cursor cursor) {
        if (uri.equals(GalleryCloudUtils.CLOUD_URI)) {
            return new DBCloud(cursor);
        }
        if (uri.equals(GalleryCloudUtils.SHARE_IMAGE_URI)) {
            return new DBShareImage(cursor);
        }
        if (uri.equals(GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI)) {
            return new DBOwnerSubUbiImage(cursor);
        }
        if (uri.equals(GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI)) {
            return new DBShareSubUbiImage(cursor);
        }
        return null;
    }

    public static void deleteDirty(DBImage dBImage) {
        Uri baseUri = dBImage.getBaseUri();
        StringBuilder sb = new StringBuilder();
        sb.append("_id = '");
        sb.append(dBImage.getId());
        sb.append("'");
        GalleryUtils.safeDelete(baseUri, sb.toString(), null);
        UbiFocusUtils.safeDeleteSubUbi(dBImage);
    }

    public static boolean deleteItemInHiddenAlbum(long j) {
        return GalleryUtils.safeDelete(GalleryCloudUtils.CLOUD_URI, String.format(Locale.US, "%s=? AND %s", new Object[]{"_id", CloudTableUtils.sGetWhereClauseAll(String.valueOf(CloudTableUtils.getCloudIdForGroupWithoutRecord(1001)), String.valueOf(1001), 0)}), null) == 1;
    }

    public static void deleteShareAlbumInLocal(final String str, String str2) {
        int safeDelete = GalleryUtils.safeDelete(GalleryCloudUtils.SHARE_ALBUM_URI, "albumId = ? ", new String[]{str});
        StringBuilder sb = new StringBuilder();
        sb.append("deleted ");
        sb.append(safeDelete);
        sb.append(" share albums which shareAlbumId = ");
        sb.append(str);
        Log.d("CloudUtils", sb.toString());
        GalleryUtils.safeQuery(ShareImage.SHARE_URI, new String[]{"localFile", "thumbnailFile", "microthumbfile"}, "(groupId = ? OR localGroupId = ?) AND serverStatus = ?", new String[]{str, str2, "custom"}, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor != null) {
                    int i = 0;
                    while (cursor.moveToNext()) {
                        String string = cursor.getString(0);
                        String string2 = cursor.getString(1);
                        String string3 = cursor.getString(2);
                        i = i + MediaFileUtils.deleteFileType(FileType.ORIGINAL, string) + MediaFileUtils.deleteFileType(FileType.THUMBNAIL, string2, string3);
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Deleted ");
                    sb.append(i);
                    sb.append(" share image files of share album ");
                    sb.append(str);
                    Log.d("CloudUtils", sb.toString());
                }
                return null;
            }
        });
        int safeDelete2 = GalleryUtils.safeDelete(ShareImage.SHARE_URI, "albumId = ? OR localGroupId = ? ", new String[]{str, str2});
        StringBuilder sb2 = new StringBuilder();
        sb2.append("deleted ");
        sb2.append(safeDelete2);
        sb2.append(" share images which shareAlbumId = ");
        sb2.append(str);
        Log.d("CloudUtils", sb2.toString());
        int safeDelete3 = GalleryUtils.safeDelete(ShareUser.SHARE_USER_URI, "albumId = ? ", new String[]{str});
        StringBuilder sb3 = new StringBuilder();
        sb3.append("deleted ");
        sb3.append(safeDelete3);
        sb3.append(" share users which shareAlbumId = ");
        sb3.append(str);
        Log.d("CloudUtils", sb3.toString());
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0048  */
    public static Account getAccountFromDB(Context context) {
        Cursor cursor;
        Throwable th;
        Account account = null;
        try {
            cursor = context.getContentResolver().query(GalleryCloudUtils.CLOUD_SETTING_URI, new String[]{"accountName", "accountType"}, null, null, null);
            if (cursor != null) {
                try {
                    if (cursor.moveToNext()) {
                        String string = cursor.getString(0);
                        String string2 = cursor.getString(1);
                        if (!TextUtils.isEmpty(string) && !TextUtils.isEmpty(string2)) {
                            account = new Account(string, string2);
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (cursor != null) {
                cursor.close();
            }
            return account;
        } catch (Throwable th3) {
            th = th3;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static Boolean getAutoUploadAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("autoUpload")) {
                    return Boolean.valueOf(jSONObject.getBoolean("autoUpload"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static String getCameraFileName() {
        return GalleryApp.sGetAndroidContext().getString(R.string.cloud_camera_display_name);
    }

    public static String getCameraLocalFile() {
        return "DCIM/Camera";
    }

    public static ContentValues getCameraRecordValues() {
        ContentValues contentValues = new ContentValues();
        contentValues.put("dateModified", Long.valueOf(-999));
        contentValues.put("dateTaken", Long.valueOf(-999));
        contentValues.put("mixedDateTime", Long.valueOf(-999));
        contentValues.put("fileName", getCameraFileName());
        contentValues.put("serverId", Long.valueOf(1));
        contentValues.put("serverType", Integer.valueOf(0));
        contentValues.put("serverStatus", "custom");
        contentValues.put("localFlag", Integer.valueOf(0));
        contentValues.put("localFile", getCameraLocalFile());
        contentValues.put("attributes", Long.valueOf(5));
        return contentValues;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x00cc, code lost:
        if (r4 != null) goto L_0x00da;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x00d8, code lost:
        if (r4 != null) goto L_0x00da;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x00da, code lost:
        r4.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00dd, code lost:
        return r3;
     */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x00e3  */
    public static List<DBImage> getCandidateItemsInAGroup(Context context, String str, String str2, String str3, boolean z) {
        Cursor cursor;
        Cursor cursor2;
        String str4;
        String[] strArr;
        String str5 = str2;
        String str6 = str3;
        ArrayList newArrayList = Lists.newArrayList();
        try {
            boolean isGroupWithoutRecordByCloudId = CloudTableUtils.isGroupWithoutRecordByCloudId(Long.valueOf(str3).longValue());
            StringBuilder sb = new StringBuilder();
            sb.append(FileUtils.getFileTitle(str));
            sb.append("%");
            String sb2 = sb.toString();
            if (isGroupWithoutRecordByCloudId) {
                strArr = new String[]{sb2, str5, str6, String.valueOf(CloudTableUtils.getServerIdForGroupWithoutRecord(Long.valueOf(str3).longValue()))};
                str4 = String.format(Locale.US, "(%s = ? OR %s = ?)", new Object[]{"localGroupId", "groupId"});
            } else {
                strArr = new String[]{sb2, str5, str6};
                str4 = String.format(Locale.US, "%s = ?", new Object[]{"localGroupId"});
            }
            cursor2 = context.getContentResolver().query(z ? GalleryCloudUtils.SHARE_IMAGE_URI : GalleryCloudUtils.CLOUD_URI, getProjectionAll(), String.format(Locale.US, "(%s like ? OR %s = ?) AND %s AND %s AND %s", new Object[]{"fileName", "sha1", photoLocalFlag_Create_ForceCreate_Move_Copy_Rename, itemIsNotGroup, str4}), strArr, null);
            if (cursor2 != null) {
                while (cursor2.moveToNext()) {
                    try {
                        newArrayList.add(z ? new DBShareImage(cursor2) : new DBCloud(cursor2));
                    } catch (SQLiteCantOpenDatabaseException e) {
                        e = e;
                        try {
                            e.printStackTrace();
                        } catch (Throwable th) {
                            th = th;
                            cursor = cursor2;
                            if (cursor != null) {
                            }
                            throw th;
                        }
                    }
                }
            } else {
                Log.d("CloudUtils", "there isn't have any item in group: %s for name: %s, sha1: %s", str6, str, str5);
            }
        } catch (SQLiteCantOpenDatabaseException e2) {
            e = e2;
            cursor2 = null;
            e.printStackTrace();
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static Uri getCloudDistinctUri(Uri uri) {
        return UriUtil.appendDistinct(uri, true);
    }

    public static Uri getCloudLimit1Uri() {
        return getCloudLimitUri(1);
    }

    public static Uri getCloudLimitUri(int i) {
        return UriUtil.appendLimit(GalleryCloudUtils.CLOUD_URI, i);
    }

    private static Uri getCloudShareAlbumLimit1Uri() {
        return getLimitUri(GalleryCloudUtils.SHARE_ALBUM_URI, 1);
    }

    public static ContentValues getContentValuesForAll(JSONObject jSONObject) throws JSONException {
        return getContentValuesForAll(jSONObject, true);
    }

    public static ContentValues getContentValuesForAll(JSONObject jSONObject, boolean z) throws JSONException {
        String str = null;
        if (jSONObject == null) {
            return null;
        }
        if (jSONObject.has("content")) {
            jSONObject = jSONObject.getJSONObject("content");
        }
        ContentValues contentValuesForDefault = getContentValuesForDefault(jSONObject);
        contentValuesForDefault.put("fileName", jSONObject.getString("fileName"));
        if (jSONObject.has("groupId")) {
            contentValuesForDefault.put("groupId", Long.valueOf(getLongAttributeFromJson(jSONObject, "groupId")));
        }
        if (ApplicationHelper.isAutoUploadFeatureOpen() && jSONObject.has("appKey")) {
            contentValuesForDefault.put("appKey", jSONObject.getString("appKey"));
        }
        parseBabyInfo(jSONObject, contentValuesForDefault);
        if (jSONObject.has("size")) {
            contentValuesForDefault.put("size", Long.valueOf(getLongAttributeFromJson(jSONObject, "size")));
        }
        if (jSONObject.has("dateModified")) {
            contentValuesForDefault.put("dateModified", Long.valueOf(getLongAttributeFromJson(jSONObject, "dateModified")));
        }
        if (jSONObject.has("mimeType")) {
            contentValuesForDefault.put("mimeType", jSONObject.getString("mimeType"));
        }
        if (jSONObject.has("title")) {
            contentValuesForDefault.put("title", jSONObject.getString("title"));
        }
        if (jSONObject.has("description")) {
            String string = jSONObject.getString("description");
            contentValuesForDefault.put("description", string);
            parseDescription(contentValuesForDefault, string);
        }
        if (jSONObject.has("dateTaken")) {
            if (contentValuesForDefault.containsKey("babyInfoJson")) {
                contentValuesForDefault.put("dateTaken", Long.valueOf(-996));
            } else {
                contentValuesForDefault.put("dateTaken", Long.valueOf(getLongAttributeFromJson(jSONObject, "dateTaken")));
            }
        }
        if (jSONObject.has("duration")) {
            contentValuesForDefault.put("duration", Integer.valueOf(jSONObject.getInt("duration")));
        }
        if (jSONObject.has("size")) {
            contentValuesForDefault.put("size", Long.valueOf(getLongAttributeFromJson(jSONObject, "size")));
        }
        if (z && jSONObject.has("shareId")) {
            contentValuesForDefault.put("shareId", jSONObject.getString("shareId"));
        }
        if (jSONObject.has("albumId")) {
            contentValuesForDefault.put("albumId", jSONObject.getString("albumId"));
        }
        if (jSONObject.has("creatorInfo")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("creatorInfo");
            if (jSONObject2.has("creatorId")) {
                contentValuesForDefault.put("creatorId", jSONObject2.getString("creatorId"));
            }
        }
        if (jSONObject.has("isPublic")) {
            if (jSONObject.getBoolean("isPublic")) {
                contentValuesForDefault.put("isPublic", Integer.valueOf(1));
                if (jSONObject.has("publicUrl")) {
                    contentValuesForDefault.put("publicUrl", jSONObject.getString("publicUrl"));
                }
            } else {
                contentValuesForDefault.put("isPublic", Integer.valueOf(0));
                contentValuesForDefault.putNull("publicUrl");
            }
        }
        if (jSONObject.has("ubiDefaultIndex")) {
            contentValuesForDefault.put("ubiSubIndex", Integer.valueOf(jSONObject.getInt("ubiDefaultIndex")));
        }
        if (jSONObject.has("ubiSubImageCount")) {
            contentValuesForDefault.put("ubiSubImageCount", Integer.valueOf(jSONObject.getInt("ubiSubImageCount")));
        }
        if (jSONObject.has("currentFocusIndex")) {
            contentValuesForDefault.put("ubiFocusIndex", Integer.valueOf(jSONObject.getInt("currentFocusIndex")));
        }
        if (jSONObject.has("exifInfo")) {
            JSONObject jSONObject3 = jSONObject.getJSONObject("exifInfo");
            Iterator it = DBImage.sExifDataConst.iterator();
            while (it.hasNext()) {
                ExifDataConst exifDataConst = (ExifDataConst) it.next();
                switch (exifDataConst.exifValueType) {
                    case 0:
                        if (!jSONObject3.has(exifDataConst.cloudTagName)) {
                            break;
                        } else {
                            contentValuesForDefault.put(((TableColumn) GalleryDBHelper.getInstance().getCloudColumns().get(exifDataConst.columnIndex)).mName, Long.valueOf(getLongAttributeFromJson(jSONObject3, exifDataConst.cloudTagName)));
                            break;
                        }
                    case 1:
                        if (!jSONObject3.has(exifDataConst.cloudTagName)) {
                            break;
                        } else {
                            contentValuesForDefault.put(((TableColumn) GalleryDBHelper.getInstance().getCloudColumns().get(exifDataConst.columnIndex)).mName, jSONObject3.getString(exifDataConst.cloudTagName));
                            break;
                        }
                    default:
                        StringBuilder sb = new StringBuilder();
                        sb.append("exifDataConst.exifValueType is wrong: ");
                        sb.append(exifDataConst.exifValueType);
                        Log.e("CloudUtils", sb.toString());
                        break;
                }
            }
        }
        if (jSONObject.has("geoInfo")) {
            JSONObject jSONObject4 = jSONObject.getJSONObject("geoInfo");
            String optString = jSONObject4.optString("addressList");
            String optString2 = jSONObject4.optString("address");
            boolean optBoolean = jSONObject4.optBoolean("isAccurate", true);
            String optString3 = jSONObject4.optString("gps");
            if (optString != null && optString.length() > 0) {
                JSONArray jSONArray = new JSONArray(optString);
                if (!optBoolean) {
                    str = optString3;
                }
                contentValuesForDefault.put("location", LocationManager.formatAddress(jSONArray, str));
                contentValuesForDefault.put("address", optString);
            } else if (optString2 != null) {
                if (!optBoolean) {
                    str = optString3;
                }
                contentValuesForDefault.put("location", LocationManager.formatAddress(optString2, str));
            }
            if (!optBoolean && !TextUtils.isEmpty(optString3)) {
                contentValuesForDefault.put("extraGPS", optString3);
            }
        }
        if (contentValuesForDefault.get("serverType") != null && contentValuesForDefault.getAsInteger("serverType").intValue() == 0 && contentValuesForDefault.get("serverId") != null && isUmodifyAlbum(String.valueOf(contentValuesForDefault.getAsLong("serverId")))) {
            replaceFieldsForSystemAlbum(contentValuesForDefault);
        }
        return contentValuesForDefault;
    }

    public static ContentValues getContentValuesForAllAndThumbNull(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        if (jSONObject.has("content")) {
            jSONObject = jSONObject.getJSONObject("content");
        }
        ContentValues contentValuesForAll = getContentValuesForAll(jSONObject);
        contentValuesForAll.putNull("thumbnailFile");
        contentValuesForAll.putNull("microthumbfile");
        return contentValuesForAll;
    }

    private static ContentValues getContentValuesForDefault(JSONObject jSONObject) throws JSONException {
        int i;
        ContentValues contentValues = new ContentValues();
        if (jSONObject.has("id")) {
            contentValues.put("serverId", Long.valueOf(getLongAttributeFromJson(jSONObject, "id")));
        }
        if (jSONObject.has("status")) {
            contentValues.put("serverStatus", jSONObject.getString("status"));
        }
        if (jSONObject.has(nexExportFormat.TAG_FORMAT_TAG)) {
            contentValues.put("serverTag", Long.valueOf(getLongAttributeFromJson(jSONObject, nexExportFormat.TAG_FORMAT_TAG)));
        }
        int i2 = 0;
        if (jSONObject.has(nexExportFormat.TAG_FORMAT_TYPE)) {
            String string = jSONObject.getString(nexExportFormat.TAG_FORMAT_TYPE);
            if (string.equals("image")) {
                i = 1;
            } else if (string.equals("video")) {
                i = 2;
            } else {
                if (!string.equals("group")) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("error server type:");
                    sb.append(string);
                    Log.e("CloudUtils", sb.toString());
                }
                i = 0;
            }
            contentValues.put("serverType", Integer.valueOf(i));
        }
        if (jSONObject.has("sha1")) {
            contentValues.put("sha1", jSONObject.getString("sha1"));
        }
        if (jSONObject.has("labels")) {
            JSONArray jSONArray = jSONObject.getJSONArray("labels");
            if (jSONArray.length() > 0) {
                while (true) {
                    if (i2 >= jSONArray.length()) {
                        break;
                    }
                    JSONObject jSONObject2 = jSONArray.getJSONObject(i2);
                    if (jSONObject2.has("label") && "pet".equalsIgnoreCase(jSONObject2.getString("label"))) {
                        contentValues.put("lables", Integer.valueOf(1));
                        break;
                    }
                    i2++;
                }
            }
        }
        return contentValues;
    }

    public static ContentValues getContentValuesForOwnerAlbum(JSONObject jSONObject) throws JSONException {
        ContentValues contentValues = new ContentValues();
        if (jSONObject != null) {
            if (jSONObject.has("albumId")) {
                contentValues.put("serverId", Long.valueOf(getLongAttributeFromJson(jSONObject, "albumId")));
            }
            if (jSONObject.has("description")) {
                String string = jSONObject.getString("description");
                contentValues.put("description", string);
                parseDescription(contentValues, string);
            }
            if (jSONObject.has("name")) {
                contentValues.put("fileName", jSONObject.getString("name"));
            }
            if (ApplicationHelper.isAutoUploadFeatureOpen() && jSONObject.has("appKey")) {
                contentValues.put("appKey", jSONObject.getString("appKey"));
            }
            parseBabyInfo(jSONObject, contentValues);
            if (jSONObject.has("lastUpdateTime")) {
                contentValues.put("dateModified", Long.valueOf(getLongAttributeFromJson(jSONObject, "lastUpdateTime")));
            }
            if (jSONObject.has("createTime")) {
                contentValues.put("dateTaken", Long.valueOf(getLongAttributeFromJson(jSONObject, "createTime")));
            }
            contentValues.put("serverType", Integer.valueOf(0));
            contentValues.put("serverStatus", "custom");
            if (contentValues.get("serverId") != null && isUmodifyAlbum(String.valueOf(contentValues.getAsLong("serverId")))) {
                replaceFieldsForSystemAlbum(contentValues);
            }
        }
        return contentValues;
    }

    public static ContentValues getContentValuesForUploadDeletePurged(JSONObject jSONObject) throws JSONException {
        ContentValues contentValues = new ContentValues();
        if (jSONObject != null) {
            if (jSONObject.has("content")) {
                jSONObject = jSONObject.getJSONObject("content");
            }
            contentValues = getContentValuesForDefault(jSONObject);
        }
        contentValues.put("localFlag", Integer.valueOf(0));
        return contentValues;
    }

    public static String getCreatorIdByAlbumId(String str) {
        return getStringColumnValue(getLimitUri(GalleryCloudUtils.SHARE_ALBUM_URI, 1), "creatorId", "albumId", str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0068  */
    private static DBShareAlbum getDBShareAlbum(String str, String str2) {
        Cursor cursor;
        try {
            cursor = GalleryApp.sGetAndroidContext().getContentResolver().query(getLimitUri(GalleryCloudUtils.SHARE_ALBUM_URI, 1), getProjectionAll(), String.format(Locale.US, "%s=?", new Object[]{str}), new String[]{str2}, null);
            if (cursor != null) {
                try {
                    if (cursor.moveToNext()) {
                        DBShareAlbum dBShareAlbum = new DBShareAlbum(cursor);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return dBShareAlbum;
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                    }
                    throw th;
                }
            } else {
                String str3 = "CloudUtils";
                StringBuilder sb = new StringBuilder();
                sb.append("there isn't have any share album in local DB for ");
                sb.append(str);
                sb.append(" = ");
                sb.append(str2);
                Log.d(str3, sb.toString());
            }
            if (cursor != null) {
                cursor.close();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static DBShareAlbum getDBShareAlbumByLocalId(String str) {
        return getDBShareAlbum("_id", str);
    }

    public static DBShareAlbum getDBShareAlbumBySharedId(String str) {
        return getDBShareAlbum("albumId", str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x005e  */
    public static DBShareUser getDBShareUserInLocal(Uri uri, String str, String str2) {
        Cursor cursor;
        try {
            cursor = GalleryApp.sGetAndroidContext().getContentResolver().query(getLimitUri(uri, 1), getProjectionAll(), "userId = ? AND albumId = ? ", new String[]{str, str2}, null);
            if (cursor != null) {
                try {
                    if (cursor.moveToNext()) {
                        DBShareUser dBShareUser = new DBShareUser(cursor);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return dBShareUser;
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } else {
                String str3 = "CloudUtils";
                StringBuilder sb = new StringBuilder();
                sb.append("there isn't have any user for userId = ");
                sb.append(str);
                sb.append(", albumId = ");
                sb.append(str2);
                Log.d(str3, sb.toString());
            }
            if (cursor != null) {
                cursor.close();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
            }
            throw th;
        }
    }

    public static int getDownloadFileStatusFromDB(DBImage dBImage) {
        return ((Integer) GalleryUtils.safeQuery(dBImage.getBaseUri(), new String[]{"downloadFileStatus"}, "_id=?", new String[]{dBImage.getId()}, (String) null, (QueryHandler<T>) new QueryHandler<Integer>() {
            public Integer handle(Cursor cursor) {
                return (cursor == null || !cursor.moveToNext()) ? Integer.valueOf(-1) : Integer.valueOf(UpDownloadManager.mapStatusToRequestItem(cursor.getInt(0)));
            }
        })).intValue();
    }

    public static GalleryExtendedAuthToken getExtToken(Context context, Account account) {
        if (!CTA.canConnectNetwork()) {
            Log.e("CloudUtils", "get extToken failed : cta not allowed");
            return null;
        }
        if (account == null) {
            account = AccountHelper.getXiaomiAccount(context);
        }
        Account account2 = account;
        if (account2 == null) {
            Log.e("CloudUtils", "get extToken failed : account is null");
            return null;
        }
        try {
            return GalleryExtendedAuthToken.parse(((Bundle) AccountManager.get(context).getAuthToken(account2, "micgallery", null, true, null, null).getResult()).getString("authtoken"));
        } catch (Exception e) {
            Log.e("CloudUtils", "get extToken error", (Object) e);
            return null;
        }
    }

    private static FileSizeLimitStrategy getFileSizeLimitStrategy() {
        FileSizeLimitStrategy fileSizeLimitStrategy;
        synchronized (sLock) {
            if (sFileSizeLimitStrategy == null) {
                sFileSizeLimitStrategy = CloudControlStrategyHelper.getFileSizeLimitStrategy();
                Log.d("CloudUtils", (Object) sFileSizeLimitStrategy);
            }
            fileSizeLimitStrategy = sFileSizeLimitStrategy;
        }
        return fileSizeLimitStrategy;
    }

    public static JSONObject getFromXiaomi(String str, List<NameValuePair> list, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, int i, boolean z) throws IllegalBlockSizeException, BadPaddingException, JSONException, IOException, URISyntaxException, GalleryMiCloudServerException {
        if (!CTA.canConnectNetwork()) {
            Log.d("CloudUtils", "CTA not confirmed when get from server");
            return null;
        }
        if (list == null) {
            list = new ArrayList<>();
        }
        addRetryParameters(list, i, z, galleryExtendedAuthToken);
        StringBuilder sb = new StringBuilder();
        sb.append("GET URL:");
        sb.append(str);
        Log.d("CloudUtils", sb.toString());
        return new JSONObject(ApplicationHelper.getMiCloudProvider().secureGet(str, getParamsMap(list)));
    }

    public static DBCloud getGroupByAppKey(Context context, String str) {
        return getItemByAppKey(context, str);
    }

    public static DBCloud getGroupByFileName(Context context, String str) {
        return getGroupItemByColumnnameAndValue(context, "fileName", str, true);
    }

    public static String getGroupIdByPhotoLocalId(String str) {
        return getStringColumnValue(GalleryApp.sGetAndroidContext(), GalleryCloudUtils.CLOUD_URI, "groupId", "_id", str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0085  */
    public static DBCloud getGroupItemByColumnnameAndValue(Context context, String str, String str2, boolean z) {
        Throwable th;
        StringBuilder sb;
        Cursor cursor = null;
        if (z) {
            try {
                sb = new StringBuilder();
                sb.append(str);
                sb.append(" like ? ");
            } catch (Throwable th2) {
                th = th2;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        } else {
            sb = new StringBuilder();
            sb.append(str);
            sb.append(" = ? ");
        }
        String sb2 = sb.toString();
        ContentResolver contentResolver = context.getContentResolver();
        Uri cloudLimit1Uri = getCloudLimit1Uri();
        String[] projectionAll = getProjectionAll();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append("  AND ( ");
        sb3.append(photoLocalFlag_Synced);
        sb3.append(" OR ");
        sb3.append(photoLocalFlag_Create_ForceCreate_Move_Copy_Rename);
        sb3.append(" ) AND ");
        sb3.append(itemIsGroup);
        Cursor query = contentResolver.query(cloudLimit1Uri, projectionAll, sb3.toString(), new String[]{str2}, null);
        if (query != null) {
            try {
                if (query.moveToNext()) {
                    DBCloud dBCloud = new DBCloud(query);
                    if (query != null) {
                        query.close();
                    }
                    return dBCloud;
                }
            } catch (Throwable th3) {
                cursor = query;
                th = th3;
                if (cursor != null) {
                }
                throw th;
            }
        }
        if (query != null) {
            query.close();
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0048  */
    public static DBShareAlbum getGroupItemByColumnnameAndValueFromShare(Context context, String str, String str2) {
        Cursor cursor = null;
        try {
            ContentResolver contentResolver = context.getContentResolver();
            Uri cloudShareAlbumLimit1Uri = getCloudShareAlbumLimit1Uri();
            String[] projectionAll = getProjectionAll();
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" = ? ");
            Cursor query = contentResolver.query(cloudShareAlbumLimit1Uri, projectionAll, sb.toString(), new String[]{str2}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        DBShareAlbum dBShareAlbum = new DBShareAlbum(query);
                        if (query != null) {
                            query.close();
                        }
                        return dBShareAlbum;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static Boolean getHiddenAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("hidden")) {
                    return Boolean.valueOf(jSONObject.getBoolean("hidden"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static Boolean getHiddenManualAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("manualHidden")) {
                    return Boolean.valueOf(jSONObject.getBoolean("manualHidden"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0035 A[Catch:{ all -> 0x00ba }] */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0038 A[Catch:{ all -> 0x00ba }] */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0081 A[SYNTHETIC, Splitter:B:15:0x0081] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0096  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x00b6  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x00bd  */
    public static DBShareUser getInvitedDBShareUserInLocal(Uri uri, String str, String str2, String str3, String str4) {
        boolean z;
        Cursor query;
        Cursor cursor = null;
        try {
            if (!TextUtils.equals(str3, "friend")) {
                if (!TextUtils.equals(str3, "family")) {
                    z = false;
                    ContentResolver contentResolver = GalleryApp.sGetAndroidContext().getContentResolver();
                    Uri limitUri = getLimitUri(uri, 1);
                    String[] projectionAll = getProjectionAll();
                    Locale locale = Locale.US;
                    StringBuilder sb = new StringBuilder();
                    sb.append("%s = '%s' AND (%s IS NULL OR %s = '%s') AND %s = '%s' AND %s = '%s'");
                    sb.append(!z ? " AND %s = '%s'" : "");
                    query = contentResolver.query(limitUri, projectionAll, String.format(locale, sb.toString(), new Object[]{"serverStatus", "invited", "userId", "userId", str, "albumId", str2, "relation", str3, "relationText", str4}), null, null);
                    if (query == null) {
                        try {
                            if (query.moveToNext()) {
                                DBShareUser dBShareUser = new DBShareUser(query);
                                if (query != null) {
                                    query.close();
                                }
                                return dBShareUser;
                            }
                        } catch (Throwable th) {
                            cursor = query;
                            th = th;
                            if (cursor != null) {
                                cursor.close();
                            }
                            throw th;
                        }
                    } else {
                        String str5 = "CloudUtils";
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("there isn't have any user for userId = ");
                        sb2.append(str);
                        sb2.append(", albumId = ");
                        sb2.append(str2);
                        Log.d(str5, sb2.toString());
                    }
                    if (query != null) {
                        query.close();
                    }
                    return null;
                }
            }
            z = true;
            ContentResolver contentResolver2 = GalleryApp.sGetAndroidContext().getContentResolver();
            Uri limitUri2 = getLimitUri(uri, 1);
            String[] projectionAll2 = getProjectionAll();
            Locale locale2 = Locale.US;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("%s = '%s' AND (%s IS NULL OR %s = '%s') AND %s = '%s' AND %s = '%s'");
            sb3.append(!z ? " AND %s = '%s'" : "");
            query = contentResolver2.query(limitUri2, projectionAll2, String.format(locale2, sb3.toString(), new Object[]{"serverStatus", "invited", "userId", "userId", str, "albumId", str2, "relation", str3, "relationText", str4}), null, null);
            if (query == null) {
            }
            if (query != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
            }
            throw th;
        }
    }

    public static Boolean getIsFavoriteFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("isFavorite")) {
                    return Boolean.valueOf(jSONObject.getBoolean("isFavorite"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0069  */
    public static DBImage getItem(Uri uri, Context context, String str, String str2) {
        Cursor cursor;
        try {
            ContentResolver contentResolver = context.getContentResolver();
            Uri limitUri = getLimitUri(uri, 1);
            String[] projectionAll = getProjectionAll();
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" = '");
            sb.append(str2);
            sb.append("'");
            cursor = contentResolver.query(limitUri, projectionAll, sb.toString(), null, null);
            if (cursor != null) {
                try {
                    if (cursor.moveToNext()) {
                        DBImage createDBImageByUri = createDBImageByUri(uri, cursor);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return createDBImageByUri;
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                    }
                    throw th;
                }
            } else {
                String str3 = "CloudUtils";
                StringBuilder sb2 = new StringBuilder();
                sb2.append("there isn't have any item in local DB for ");
                sb2.append(str);
                sb2.append(" = ");
                sb2.append(str2);
                Log.d(str3, sb2.toString());
            }
            if (cursor != null) {
                cursor.close();
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static DBCloud getItemByAppKey(Context context, String str) {
        return getGroupItemByColumnnameAndValue(context, "appKey", str, false);
    }

    public static DBImage getItemByServerID(Context context, String str) {
        return getItem(GalleryCloudUtils.CLOUD_URI, context, "serverId", str);
    }

    public static long getItemId(Uri uri, String str, String str2) {
        ContentResolver contentResolver = GalleryApp.sGetAndroidContext().getContentResolver();
        Uri limitUri = getLimitUri(uri, 1);
        String[] strArr = {"_id"};
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("=?");
        Cursor query = contentResolver.query(limitUri, strArr, sb.toString(), new String[]{str2}, null);
        if (query != null) {
            try {
                if (query.moveToFirst()) {
                    return query.getLong(0);
                }
                query.close();
            } finally {
                query.close();
            }
        }
        return 0;
    }

    public static Uri getLimitUri(Uri uri, int i) {
        return UriUtil.appendLimit(uri, i);
    }

    public static Uri getLimitUri(Uri uri, int i, int i2) {
        return UriUtil.appendLimit(uri, i, i2);
    }

    public static String getLocalFileFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return new JSONObject(str).optString("localFile");
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static String getLocalGroupIdForSharerAlbum(String str) {
        return (String) GalleryUtils.safeQuery(getCloudShareAlbumLimit1Uri(), new String[]{"_id"}, String.format(Locale.US, "%s=? AND %s='%s'", new Object[]{"albumId", "serverStatus", "custom"}), new String[]{str}, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
            public String handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToNext()) {
                    return null;
                }
                return String.valueOf(cursor.getInt(0));
            }
        });
    }

    public static long getLongAttributeFromJson(JSONObject jSONObject, String str) throws JSONException {
        return Long.parseLong(jSONObject.getString(str));
    }

    public static Boolean getManualSetUploadFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("manualSetUpload")) {
                    return Boolean.valueOf(jSONObject.getBoolean("manualSetUpload"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static long getMaxImageSizeLimit() {
        return getFileSizeLimitStrategy().getImageMaxSize();
    }

    public static long getMaxVideoSizeLimit() {
        return getFileSizeLimitStrategy().getVideoMaxSize();
    }

    public static long getMinFileSizeLimit(String str) {
        return Preference.sGetFilterMinSize();
    }

    public static String getOwnerAlbumLocalFile(String str, String str2) {
        HashMap newHashMap = Maps.newHashMap();
        newHashMap.put("com.sina.weibo", "sina/weibo/weibo");
        newHashMap.put("com.tencent.mobileqq", "tencent/qq_images");
        newHashMap.put("com.tencent.mm", "tencent/micromsg/weixin");
        newHashMap.put("com.xiaomi.channel", "miliao/saved");
        newHashMap.put("com.xiaomi.shop", "mishop/save");
        newHashMap.put("com.UCMobile", "ucdownloads");
        newHashMap.put("com.mt.mtxx.mtxx", "mtxx");
        newHashMap.put("cn.wps.moffice_eng", "kingsoftoffice/file/summary/preview");
        newHashMap.put("com.baidu.tieba", "tieba");
        newHashMap.put("com.qzone", "tencent/qzonepic");
        newHashMap.put("com.manboker.headportrait", "dcim/momentcam");
        String str3 = !TextUtils.isEmpty(str2) ? (String) newHashMap.get(str2) : null;
        return TextUtils.isEmpty(str3) ? DownloadPathHelper.getFolderRelativePathInCloud(str) : str3;
    }

    private static Map<String, String> getParamsMap(List<NameValuePair> list) {
        HashMap newHashMap = Maps.newHashMap();
        for (NameValuePair nameValuePair : list) {
            newHashMap.put(nameValuePair.getName(), nameValuePair.getValue());
        }
        return newHashMap;
    }

    public static String[] getProjectionAll() {
        return new String[]{" * "};
    }

    private static Cursor getRecordFromCloudAlbum(String str, Uri uri, String str2, String str3, String str4, String str5) {
        try {
            ContentResolver contentResolver = GalleryApp.sGetAndroidContext().getContentResolver();
            String[] projectionAll = getProjectionAll();
            StringBuilder sb = new StringBuilder();
            sb.append("(");
            sb.append(str2);
            sb.append(" = ? ");
            sb.append(" COLLATE NOCASE ");
            sb.append(" OR ");
            sb.append(str3);
            sb.append(" = ? ");
            sb.append(" COLLATE NOCASE ");
            sb.append(" OR ");
            sb.append(str4);
            sb.append(" = ? ");
            sb.append(" COLLATE NOCASE ");
            sb.append(") AND ( ");
            sb.append(photoLocalFlag_Create_ForceCreate_Move_Copy_Rename);
            sb.append(" OR ");
            sb.append(str5);
            sb.append(" ) AND ");
            sb.append(itemIsNotGroup);
            return contentResolver.query(uri, projectionAll, sb.toString(), new String[]{str, str, str}, null);
        } catch (Exception e) {
            Log.w("CloudUtils", (Throwable) e);
            return null;
        }
    }

    private static Cursor getRecordFromCloudOwnerAlbum(String str) {
        return getRecordFromCloudAlbum(str, getCloudLimit1Uri(), "thumbnailFile", "microthumbfile", "localFile", photoLocalFlag_Synced);
    }

    private static Cursor getRecordFromCloudSharerAlbum(String str) {
        return getRecordFromCloudAlbum(str, getLimitUri(GalleryCloudUtils.SHARE_IMAGE_URI, 1), "thumbnailFile", "microthumbfile", "localFile", photoLocalFlag_Synced);
    }

    public static String getScreenshotsFileName() {
        return GalleryApp.sGetAndroidContext().getString(R.string.cloud_screenshots_display_name);
    }

    public static String getScreenshotsLocalFile() {
        return "DCIM/Screenshots";
    }

    public static ContentValues getScreenshotsRecordValues() {
        ContentValues contentValues = new ContentValues();
        contentValues.put("dateModified", Long.valueOf(-995));
        contentValues.put("dateTaken", Long.valueOf(-995));
        contentValues.put("mixedDateTime", Long.valueOf(-995));
        contentValues.put("fileName", getScreenshotsFileName());
        contentValues.put("serverId", Long.valueOf(2));
        contentValues.put("serverType", Integer.valueOf(0));
        contentValues.put("serverStatus", "custom");
        contentValues.put("localFlag", Integer.valueOf(0));
        contentValues.put("localFile", getScreenshotsLocalFile());
        contentValues.put("attributes", Long.valueOf(1));
        return contentValues;
    }

    public static String getServerIdByLocalId(Context context, String str, RequestCloudItem requestCloudItem) {
        long serverIdForGroupWithoutRecord = CloudTableUtils.getServerIdForGroupWithoutRecord(Long.valueOf(str).longValue());
        return serverIdForGroupWithoutRecord > 0 ? String.valueOf(serverIdForGroupWithoutRecord) : getStringColumnValue(context, GalleryCloudUtils.CLOUD_URI, "serverId", "_id", str);
    }

    public static int getServerType(File file) {
        if (file != null) {
            String supportUploadMimeType = FileMimeUtil.getSupportUploadMimeType(file.getAbsolutePath());
            if (!FileMimeUtil.isImageFromMimeType(supportUploadMimeType)) {
                if (FileMimeUtil.isVideoFromMimeType(supportUploadMimeType)) {
                    return 2;
                }
                String extension = ExtraFileUtils.getExtension(file);
                if (!extension.equalsIgnoreCase("y") && !extension.equalsIgnoreCase("img")) {
                    if (extension.equalsIgnoreCase("vid")) {
                        return 2;
                    }
                }
            }
            return 1;
        }
        return -1;
    }

    public static String getShareAlbumIdByLocalId(Context context, RequestCloudItem requestCloudItem) {
        return getStringColumnValue(context, GalleryCloudUtils.SHARE_ALBUM_URI, "albumId", "_id", requestCloudItem.dbCloud.getLocalGroupId());
    }

    public static String getShareIdByLocalId(Context context, String str) {
        return getStringColumnValue(context, GalleryCloudUtils.SHARE_IMAGE_URI, "shareId", "_id", str);
    }

    public static Boolean getShowInOtherAlbumsAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("showInOtherAlbums")) {
                    return Boolean.valueOf(jSONObject.getBoolean("showInOtherAlbums"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static Boolean getShowInOtherAlbumsManualAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("manualShowInOtherAlbums")) {
                    return Boolean.valueOf(jSONObject.getBoolean("manualShowInOtherAlbums"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static Boolean getShowInPhotoTabAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("showInPhotosTab")) {
                    return Boolean.valueOf(jSONObject.getBoolean("showInPhotosTab"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static Boolean getShowInPhotoTabManualAttributeFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("manualShowInPhotosTab")) {
                    return Boolean.valueOf(jSONObject.getBoolean("manualShowInPhotosTab"));
                }
                return null;
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    public static Long getSpecialTypeFlagsFromDescription(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.has("specialTypeFlags")) {
                    return Long.valueOf(jSONObject.getLong("specialTypeFlags"));
                }
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0060  */
    public static String getStringColumnValue(Context context, Uri uri, String str, String str2, String str3) {
        Cursor cursor = null;
        try {
            ContentResolver contentResolver = context.getContentResolver();
            Uri limitUri = getLimitUri(uri, 1);
            String[] strArr = {str};
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(" = '");
            sb.append(str3);
            sb.append("'");
            Cursor query = contentResolver.query(limitUri, strArr, sb.toString(), null, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        String cursorString = GalleryDBHelper.getCursorString(query, 0);
                        if (query != null) {
                            query.close();
                        }
                        return cursorString;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } else {
                Log.d("CloudUtils", String.format("No item in DB for:  %s = %s", new Object[]{str2, str3}));
            }
            if (query != null) {
                query.close();
            }
            return "";
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
            }
            throw th;
        }
    }

    public static String getStringColumnValue(Uri uri, String str, String str2, String str3) {
        return getStringColumnValue(GalleryApp.sGetAndroidContext(), uri, str, str2, str3);
    }

    public static String getThumbnailNameBySha1(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".jpg");
        return sb.toString();
    }

    public static String getThumbnailNameByTitle(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".jpg");
        return sb.toString();
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0074  */
    public static boolean hasCreateCopyMoveImageByGroupId(Context context, String str) {
        Cursor cursor = null;
        try {
            Cursor query = context.getContentResolver().query(getCloudLimit1Uri(), new String[]{"_id"}, "localGroupId = ? AND (localFlag = ? OR localFlag = ? OR localFlag = ? OR localFlag = ? OR localFlag = ? ) ", new String[]{str, String.valueOf(6), String.valueOf(9), String.valueOf(8), String.valueOf(7), String.valueOf(5)}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        if (query != null) {
                            query.close();
                        }
                        return true;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                    }
                    throw th;
                }
            } else {
                String str2 = "CloudUtils";
                StringBuilder sb = new StringBuilder();
                sb.append("there isn't have any item in local DB for localId = ");
                sb.append(str);
                Log.d(str2, sb.toString());
            }
            if (query != null) {
                query.close();
            }
            return false;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static boolean isActive(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x003e  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0043  */
    public static boolean isFileInCloudDB(String str) {
        Cursor cursor;
        Cursor cursor2 = null;
        try {
            cursor = getRecordFromCloudOwnerAlbum(str);
            try {
                if (tryToMoveToNext(cursor)) {
                    if (cursor != null) {
                        cursor.close();
                    }
                    return true;
                }
                Cursor recordFromCloudSharerAlbum = getRecordFromCloudSharerAlbum(str);
                try {
                    if (tryToMoveToNext(recordFromCloudSharerAlbum)) {
                        if (cursor != null) {
                            cursor.close();
                        }
                        if (recordFromCloudSharerAlbum != null) {
                            recordFromCloudSharerAlbum.close();
                        }
                        return true;
                    }
                    if (cursor != null) {
                        cursor.close();
                    }
                    if (recordFromCloudSharerAlbum != null) {
                        recordFromCloudSharerAlbum.close();
                    }
                    return false;
                } catch (Throwable th) {
                    Throwable th2 = th;
                    cursor2 = recordFromCloudSharerAlbum;
                    th = th2;
                    if (cursor != null) {
                        cursor.close();
                    }
                    if (cursor2 != null) {
                        cursor2.close();
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                if (cursor != null) {
                }
                if (cursor2 != null) {
                }
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
            cursor = null;
            if (cursor != null) {
            }
            if (cursor2 != null) {
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x004b  */
    private static boolean isFileNeedUpload(Uri uri, String str) {
        Cursor cursor = null;
        try {
            Cursor query = GalleryApp.sGetAndroidContext().getContentResolver().query(getLimitUri(uri, 1), new String[]{"_id"}, "localFile = ?  COLLATE NOCASE  AND ( localFlag = ? OR localFlag = ? ) ", new String[]{str, String.valueOf(8), String.valueOf(7)}, null);
            if (query != null) {
                try {
                    if (query.moveToNext()) {
                        if (query != null) {
                            query.close();
                        }
                        return true;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return false;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static boolean isFileNeedUpload(String str) {
        return isFileNeedUpload(GalleryCloudUtils.CLOUD_URI, str) || isFileNeedUpload(GalleryCloudUtils.SHARE_IMAGE_URI, str) || isFileNeedUpload(GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, str) || isFileNeedUpload(GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI, str);
    }

    public static boolean isUmodifyAlbum(String str) {
        return CloudTableUtils.isCameraGroup(str) || CloudTableUtils.isScreenshotGroup(str);
    }

    public static boolean isValidAlbumId(String str) {
        return !TextUtils.isEmpty(str) && !str.trim().equals(MovieStatUtils.DOWNLOAD_SUCCESS);
    }

    private static long mergeAttributes(long j, long j2, long j3, boolean z, boolean z2) {
        if (!z2) {
            return (j3 & j) == 0 ? z ? j | j2 : j & (j2 ^ -1) : j;
        }
        return (z ? j | j2 : j & (j2 ^ -1)) | j3;
    }

    public static String moveImage(String str, String str2, boolean z) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return str;
        }
        File file = new File(str);
        File file2 = new File(str2);
        long lastModified = file.lastModified();
        if (!FileUtils.createFolder(file2.getParentFile(), z)) {
            return str;
        }
        if (FileUtils.move(file, file2)) {
            if (lastModified != 0) {
                file2.setLastModified(lastModified);
            }
            return str2;
        }
        String copyImage = copyImage(str, str2, z);
        if (Utils.isNullOrEmpty(copyImage) || copyImage.equals(str) || !FileUtils.isFileExist(copyImage)) {
            return str;
        }
        MediaFileUtils.deleteFileType(FileType.NORMAL, str);
        return copyImage;
    }

    public static String moveImageToFolder(String str, String str2, boolean z) {
        return moveImage(str, FileUtils.concat(str2, ExtraFileUtils.getFileName(str)), z);
    }

    private static void parseBabyInfo(JSONObject jSONObject, ContentValues contentValues) throws JSONException {
        if (ApplicationHelper.isBabyAlbumFeatureOpen() && jSONObject.has("renderInfos")) {
            JSONArray jSONArray = jSONObject.getJSONArray("renderInfos");
            int i = 0;
            while (i < jSONArray.length()) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                if (!jSONObject2.has(nexExportFormat.TAG_FORMAT_TYPE) || !jSONObject2.getString(nexExportFormat.TAG_FORMAT_TYPE).equalsIgnoreCase(BabyAlbumUtils.BABY_BABY)) {
                    i++;
                } else {
                    contentValues.put("babyInfoJson", jSONObject2.toString());
                    if (jSONObject2.has("peopleId")) {
                        contentValues.put("peopleId", jSONObject2.getString("peopleId"));
                        return;
                    }
                    return;
                }
            }
        }
    }

    public static void parseDescription(ContentValues contentValues, String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                String optString = new JSONObject(str).optString("localFile");
                if (!TextUtils.isEmpty(optString)) {
                    contentValues.put("localFile", optString);
                }
            } catch (Exception e) {
                Log.w("CloudUtils", (Throwable) e);
            }
        }
    }

    public static JSONObject postToXiaomi(String str, List<NameValuePair> list, JSONObject jSONObject, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, int i, boolean z) throws IllegalBlockSizeException, BadPaddingException, JSONException, IOException, GalleryMiCloudServerException {
        if (!CTA.canConnectNetwork()) {
            Log.d("CloudUtils", "CTA not confirmed when post request");
            return null;
        }
        if (list == null) {
            list = new ArrayList<>();
        }
        addRetryParameters(list, i, z, galleryExtendedAuthToken);
        if (jSONObject != null) {
            list.add(new BasicNameValuePair("data", jSONObject.toString()));
        }
        StringBuilder sb = new StringBuilder();
        sb.append("POST URL:");
        sb.append(str);
        Log.d("CloudUtils", sb.toString());
        return new JSONObject(galleryExtendedAuthToken != null ? ApplicationHelper.getMiCloudProvider().securePost(str, getParamsMap(list)) : NetworkUtils.httpPostRequestForString(str, new UrlEncodedFormEntity(list, Keyczar.DEFAULT_ENCODING), null));
    }

    public static String readFileNameFromExif(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                UserCommentData userCommentData = ExifUtil.getUserCommentData(str);
                return userCommentData != null ? userCommentData.getFileName(FileUtils.getFileTitle(FileUtils.getFileName(str))) : null;
            } catch (Exception e) {
                Log.e("CloudUtils", "Failed to read exif!!", (Object) e);
            }
        }
        return null;
    }

    public static void renameAnItemInLocal(DBImage dBImage, String str, String str2, boolean z) {
        String str3;
        if (CloudTableUtils.isSecretAlbum(String.valueOf(dBImage.getGroupId()), dBImage.getLocalGroupId())) {
            Log.i("CloudUtils", "item in secret album needn't be renamed.");
            return;
        }
        String downloadFileNameNotSecret = dBImage.isShareItem() ? DownloadPathHelper.getDownloadFileNameNotSecret(dBImage, str) : str;
        String downloadFolderRelativePath = DownloadPathHelper.getDownloadFolderRelativePath(dBImage);
        String safePathInPriorStorage = StorageUtils.getSafePathInPriorStorage(downloadFolderRelativePath);
        String localFile = dBImage.getLocalFile();
        String str4 = null;
        if (FileUtils.isFileExist(localFile)) {
            str3 = moveImage(localFile, new File(safePathInPriorStorage, downloadFileNameNotSecret).getAbsolutePath(), false);
            if (z && !localFile.equals(str3)) {
                MediaFileUtils.deleteFileType(FileType.NORMAL, localFile);
                MediaFileUtils.triggerMediaScan(true, new File(str3));
            }
        } else {
            str3 = null;
        }
        String thumbnailFile = dBImage.getThumbnailFile();
        if (FileUtils.isFileExist(thumbnailFile)) {
            str4 = moveImage(thumbnailFile, new File(safePathInPriorStorage, downloadFileNameNotSecret).getAbsolutePath(), false);
            if (z && !thumbnailFile.equals(str4)) {
                MediaFileUtils.deleteFileType(FileType.NORMAL, thumbnailFile);
                MediaFileUtils.triggerMediaScan(true, new File(str4));
            }
        } else if (!TextUtils.isEmpty(thumbnailFile)) {
            str4 = str3;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("fileName", str);
        contentValues.put("title", FileUtils.getFileNameWithoutExtension(str));
        contentValues.put("localFile", str3);
        contentValues.put("thumbnailFile", str4);
        GalleryUtils.safeUpdate(dBImage.getBaseUri(), contentValues, String.format(Locale.US, "%s=?", new Object[]{"_id"}), new String[]{String.valueOf(dBImage.getId())});
        Log.i("CloudUtils", "item renamed, folderRelativePath: %s, oldFileName: %s, newFileName: %s", downloadFolderRelativePath, str2, str);
    }

    public static void renameAnItemInLocal(DBImage dBImage, boolean z) {
        String fileName = dBImage.getFileName();
        renameAnItemInLocal(dBImage, DownloadPathHelper.addPostfixToFileName(fileName, String.valueOf(System.currentTimeMillis())), fileName, z);
    }

    public static String renameForPhotoConflict(String str) {
        String sb;
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        long currentTimeMillis = System.currentTimeMillis();
        String str2 = "_";
        StringBuilder sb2 = new StringBuilder();
        String fileName = FileUtils.getFileName(str);
        if (LocalUbifocus.isUbifocusImage(str)) {
            int ubifocusPatternIndex = LocalUbifocus.getUbifocusPatternIndex(fileName);
            sb2.append(FileUtils.getParentFolderPath(str));
            sb2.append(File.separator);
            sb2.append(fileName.substring(0, ubifocusPatternIndex));
            sb2.append(str2);
            sb2.append(currentTimeMillis);
            sb2.append(fileName.substring(ubifocusPatternIndex));
            sb = sb2.toString();
            List ubifocusSubFiles = LocalUbifocus.getUbifocusSubFiles(str);
            if (ubifocusSubFiles != null) {
                int size = ubifocusSubFiles.size();
                for (int i = 0; i < size; i++) {
                    sb2.setLength(0);
                    String filePath = ((SubFile) ubifocusSubFiles.get(i)).getFilePath();
                    File file = new File(filePath);
                    String name = file.getName();
                    int ubifocusPatternIndex2 = LocalUbifocus.getUbifocusPatternIndex(name);
                    if (ubifocusPatternIndex2 >= 0) {
                        sb2.append(FileUtils.getParentFolderPath(filePath));
                        sb2.append(File.separator);
                        sb2.append(name.substring(0, ubifocusPatternIndex2));
                        sb2.append(str2);
                        sb2.append(currentTimeMillis);
                        sb2.append(name.substring(ubifocusPatternIndex2));
                        FileUtils.move(file, new File(sb2.toString()));
                    }
                }
            }
        } else {
            int indexOf = fileName.indexOf("_BURST");
            if (indexOf >= 0) {
                sb2.append(FileUtils.getParentFolderPath(str));
                sb2.append(File.separator);
                sb2.append(fileName.substring(0, indexOf));
                sb2.append(str2);
                sb2.append(currentTimeMillis);
                sb2.append(fileName.substring(indexOf));
                return sb2.toString();
            } else if (fileName.endsWith("_STEREO.jpg")) {
                int indexOf2 = fileName.indexOf("_STEREO.jpg");
                sb2.append(FileUtils.getParentFolderPath(str));
                sb2.append(File.separator);
                sb2.append(fileName.substring(0, indexOf2));
                sb2.append(str2);
                sb2.append(currentTimeMillis);
                sb2.append(fileName.substring(indexOf2));
                return sb2.toString();
            } else {
                int indexOf3 = fileName.indexOf(".");
                if (indexOf3 >= 0) {
                    sb2.append(FileUtils.getParentFolderPath(str));
                    sb2.append(File.separator);
                    sb2.append(fileName.substring(0, indexOf3));
                    sb2.append(str2);
                    sb2.append(currentTimeMillis);
                    sb2.append(fileName.substring(indexOf3));
                    sb = sb2.toString();
                    FileUtils.move(new File(str), new File(sb));
                    sb2.setLength(0);
                    File imageRelativeDngFile = FileUtils.getImageRelativeDngFile(str);
                    if (imageRelativeDngFile != null) {
                        sb2.append(imageRelativeDngFile.getAbsolutePath().substring(0, indexOf3));
                        sb2.append(str2);
                        sb2.append(currentTimeMillis);
                        sb2.append(".dng");
                        FileUtils.move(imageRelativeDngFile, new File(sb2.toString()));
                    }
                } else {
                    sb2.append(str);
                    sb2.append(str2);
                    sb2.append(currentTimeMillis);
                    String sb3 = sb2.toString();
                    FileUtils.move(new File(str), new File(sb3));
                    return sb3;
                }
            }
        }
        return sb;
    }

    public static void renameItemIfNeeded(DBImage dBImage, ContentValues contentValues, boolean z) {
        if (contentValues.containsKey("fileName")) {
            String asString = contentValues.getAsString("fileName");
            String fileName = dBImage.getFileName();
            if (!TextUtils.equals(asString, fileName)) {
                renameAnItemInLocal(dBImage, asString, fileName, z);
            }
        }
    }

    private static void replaceFieldsForSystemAlbum(ContentValues contentValues) {
        long longValue = contentValues.getAsLong("serverId").longValue();
        if (longValue == 1) {
            contentValues.put("fileName", getCameraFileName());
            contentValues.put("localFile", getCameraLocalFile());
            contentValues.put("dateTaken", Long.valueOf(-999));
            contentValues.put("mixedDateTime", Long.valueOf(-999));
        } else if (longValue == 2) {
            contentValues.put("fileName", getScreenshotsFileName());
            contentValues.put("localFile", getScreenshotsLocalFile());
            contentValues.put("dateTaken", Long.valueOf(-995));
            contentValues.put("mixedDateTime", Long.valueOf(-995));
        }
    }

    public static void reviseAttributes(ContentValues contentValues, DBImage dBImage) {
        ContentValues contentValues2 = contentValues;
        String asString = contentValues2.getAsString("description");
        Boolean autoUploadAttributeFromDescription = getAutoUploadAttributeFromDescription(asString);
        Boolean manualSetUploadFromDescription = getManualSetUploadFromDescription(asString);
        Boolean showInOtherAlbumsAttributeFromDescription = getShowInOtherAlbumsAttributeFromDescription(asString);
        Boolean showInOtherAlbumsManualAttributeFromDescription = getShowInOtherAlbumsManualAttributeFromDescription(asString);
        Boolean showInPhotoTabAttributeFromDescription = getShowInPhotoTabAttributeFromDescription(asString);
        Boolean showInPhotoTabManualAttributeFromDescription = getShowInPhotoTabManualAttributeFromDescription(asString);
        Boolean hiddenAttributeFromDescription = getHiddenAttributeFromDescription(asString);
        Boolean hiddenManualAttributeFromDescription = getHiddenManualAttributeFromDescription(asString);
        long j = dBImage != null ? dBImage.getAttributes() | 0 : (!ExtraTextUtils.startsWithIgnoreCase(contentValues2.getAsString("localFile"), "MIUI/Gallery/cloud") || autoUploadAttributeFromDescription != null) ? 0 : 1;
        if (!TextUtils.isEmpty(contentValues2.getAsString("babyInfoJson"))) {
            if (autoUploadAttributeFromDescription == null || !autoUploadAttributeFromDescription.booleanValue() || (j & 1) == 0) {
                Log.w("CloudUtils", "correct attribute autoUpload to true for baby album");
            }
            j |= 1;
        } else if (!(autoUploadAttributeFromDescription == null || manualSetUploadFromDescription == null)) {
            j = mergeAttributes(j, 1, 2, autoUploadAttributeFromDescription.booleanValue(), manualSetUploadFromDescription.booleanValue());
        }
        long j2 = j;
        if (showInOtherAlbumsAttributeFromDescription != null && showInOtherAlbumsManualAttributeFromDescription != null) {
            j2 = mergeAttributes(j2, 64, 128, showInOtherAlbumsAttributeFromDescription.booleanValue(), showInOtherAlbumsManualAttributeFromDescription.booleanValue());
        } else if (autoUploadAttributeFromDescription != null) {
            j2 = !autoUploadAttributeFromDescription.booleanValue() ? j2 | 64 : j2 & -65;
        }
        long j3 = j2;
        if (!(showInPhotoTabAttributeFromDescription == null || showInPhotoTabManualAttributeFromDescription == null)) {
            j3 = mergeAttributes(j3, 4, 8, showInPhotoTabAttributeFromDescription.booleanValue(), showInPhotoTabManualAttributeFromDescription.booleanValue());
        }
        long j4 = j3;
        if (!(hiddenAttributeFromDescription == null || hiddenManualAttributeFromDescription == null)) {
            j4 = mergeAttributes(j4, 16, 32, hiddenAttributeFromDescription.booleanValue(), hiddenManualAttributeFromDescription.booleanValue());
        }
        contentValues2.put("attributes", Long.valueOf(j4));
        boolean z = false;
        if (((j4 & 1) == 0) == (autoUploadAttributeFromDescription == null || !autoUploadAttributeFromDescription.booleanValue())) {
            if (((j4 & 64) == 0) == (showInOtherAlbumsAttributeFromDescription == null || !showInOtherAlbumsAttributeFromDescription.booleanValue())) {
                if (((j4 & 4) == 0) == (showInPhotoTabAttributeFromDescription == null || !showInPhotoTabAttributeFromDescription.booleanValue())) {
                    boolean z2 = (j4 & 16) == 0;
                    if (hiddenAttributeFromDescription == null || !hiddenAttributeFromDescription.booleanValue()) {
                        z = true;
                    }
                    if (z2 == z) {
                        return;
                    }
                }
            }
        }
        String str = "";
        if (dBImage != null && !TextUtils.isEmpty(dBImage.getEditedColumns())) {
            str = dBImage.getEditedColumns();
        }
        contentValues2.put("editedColumns", GalleryCloudUtils.mergeEditedColumns(GalleryCloudUtils.mergeEditedColumns(str, contentValues2.getAsString("editedColumns")), GalleryCloudUtils.transformToEditedColumnsElement(6)));
    }

    public static void reviseSpecialTypeFlags(ContentValues contentValues, DBImage dBImage) {
        Long specialTypeFlagsFromDescription = getSpecialTypeFlagsFromDescription(contentValues.getAsString("description"));
        if (!(dBImage == null || specialTypeFlagsFromDescription == null)) {
            specialTypeFlagsFromDescription = Long.valueOf(specialTypeFlagsFromDescription.longValue() | dBImage.getSpecialTypeFlags());
        }
        if (specialTypeFlagsFromDescription != null) {
            contentValues.put("specialTypeFlags", specialTypeFlagsFromDescription);
        }
    }

    public static File saveBitmapToFile(final Bitmap bitmap, String str, String str2) {
        final String extension = ExtraFileUtils.getExtension(str2);
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("/");
        sb.append(str2);
        File file = new File(sb.toString());
        try {
            if (!FileUtils.createFolder(str, RequestCloudItem.shouldHideDownloadFolder(str))) {
                return null;
            }
            if (!file.exists() && !DocumentProviderUtils.needUseDocumentProvider(file.getAbsolutePath()) && !file.createNewFile()) {
                return null;
            }
            DocumentProviderUtils.safeWriteFile(file.getAbsolutePath(), new WriteHandler<Boolean>() {
                public Boolean handle(FileOutputStream fileOutputStream) {
                    GalleryUtils.saveBitmapToOutputStream(bitmap, GalleryUtils.convertExtensionToCompressFormat(extension), fileOutputStream);
                    return Boolean.valueOf(true);
                }
            });
            return file;
        } catch (IOException e) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("fail to save image: ");
            sb2.append(file.getAbsolutePath());
            Log.e("CloudUtils", sb2.toString(), (Object) e);
            MediaFileUtils.deleteFileType(FileType.NORMAL, file);
            return null;
        }
    }

    public static void sendBabyAlbumNewPhotoNotification(Context context, String str, int i, Uri uri, long j, String str2, boolean z) {
        sendNotification(context, str, i, uri, R.string.baby_album, R.string.baby_album, R.drawable.album_share_invitation_stat, "com.miui.gallery.action.VIEW_ALBUM_NEW_PHOTO", j, str2, z);
    }

    private static void sendNotification(Context context, String str, int i, Uri uri, int i2, int i3, int i4, String str2, long j, String str3, boolean z) {
        Builder builder = new Builder(context);
        builder.setTicker(context.getString(i2));
        builder.setContentTitle(context.getString(i3));
        builder.setContentText(str);
        builder.setSmallIcon(i4);
        if (uri != null) {
            builder.setSound(uri);
            NotificationHelper.setDefaultChannel(context, builder);
        } else {
            NotificationHelper.setLowChannel(context, builder);
        }
        Intent intent = new Intent(str2);
        if (j != -1) {
            intent.putExtra("album_id", j);
            intent.putExtra("album_name", str3);
            intent.putExtra("other_share_album", z);
            intent.addFlags(67108864);
            intent.addFlags(2);
        }
        builder.setContentIntent(PendingIntent.getActivity(context, 0, intent, Box.MAX_BOX_SIZE));
        Notification build = builder.build();
        build.flags = 16;
        ((NotificationManager) context.getSystemService("notification")).notify(i, build);
    }

    public static void sendShareAlbumNotification(Context context, String str, int i, Uri uri) {
        sendNotification(context, str, i, uri, R.string.share_album, R.string.share_album, R.drawable.album_share_invitation_stat, "com.miui.gallery.action.VIEW_ALBUM", -1, null, true);
    }

    public static String sqlNotEmptyStr(String str) {
        return String.format("%s!='' AND %s is not NULL", new Object[]{str, str});
    }

    public static boolean supportShare() {
        int sIsInternationalAccount = Preference.sIsInternationalAccount();
        boolean z = false;
        if (sIsInternationalAccount == 1) {
            return false;
        }
        if (sIsInternationalAccount == 0) {
            return true;
        }
        if (!Rom.IS_INTERNATIONAL || Settings.checkRegion("HK") || Settings.checkRegion("TW")) {
            z = true;
        }
        return z;
    }

    private static boolean tryToMoveToNext(Cursor cursor) {
        if (cursor == null) {
            return false;
        }
        return cursor.moveToNext();
    }

    public static void updateFilePathForSync(Uri uri, ContentValues contentValues, DBImage dBImage) {
        String fileName = dBImage.getFileName();
        String asString = contentValues.getAsString("fileName");
        if (!TextUtils.equals(fileName, asString)) {
            String localFile = dBImage.getLocalFile();
            String str = "localFile";
            if (TextUtils.isEmpty(localFile)) {
                localFile = dBImage.getThumbnailFile();
                str = "thumbnailFile";
            }
            if (FileUtils.isFileExist(localFile)) {
                String concat = FileUtils.concat(FileUtils.getParentFolderPath(localFile), asString);
                if (new File(concat).exists()) {
                    concat = FileUtils.concat(FileUtils.getParentFolderPath(localFile), String.format("%s_%s.%s", new Object[]{FileUtils.getFileNameWithoutExtension(asString), Long.valueOf(System.currentTimeMillis()), FileUtils.getExtension(asString)}));
                }
                if (FileUtils.move(new File(localFile), new File(concat))) {
                    Uri fileMediaUri = MediaStoreUtils.getFileMediaUri(localFile);
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put(str, concat);
                    GalleryUtils.safeUpdate(uri, contentValues2, "_id=?", new String[]{String.valueOf(dBImage.getId())});
                    MediaStoreUtils.update(fileMediaUri, concat);
                }
            }
        }
    }

    public static int updateLocalGroupIdInGroup(Uri uri, String str, String str2, String str3) {
        if (TextUtils.isEmpty(str2) || TextUtils.isEmpty(str)) {
            return 0;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("localGroupId", str2);
        return GalleryUtils.safeUpdate(uri, contentValues, String.format(Locale.US, "%s=?", new Object[]{str3}), new String[]{str});
    }

    public static boolean updateMicroThumbPath(Uri uri, String str, String str2, boolean z) {
        String matchTableName = GalleryCloudProvider.matchTableName(uri);
        boolean z2 = false;
        if (TextUtils.isEmpty(matchTableName)) {
            Log.e("CloudUtils", "No table matched with provided uri: %s", (Object) uri.toString());
            return false;
        }
        String format = String.format(Locale.US, "update %s set %s='%s', %s=replace(%s,%s,''), %s=replace(%s,%s,'') where _id=%s", new Object[]{matchTableName, "microthumbfile", str, "thumbnailFile", "thumbnailFile", "thumbnailFile", "localFile", "localFile", "localFile", str2});
        Bundle bundle = new Bundle();
        bundle.putString("statement", format);
        if (z) {
            bundle.putParcelable("notify_uri", uri);
        }
        Bundle call = GalleryApp.sGetAndroidContext().getContentResolver().call(uri, "raw_update", null, bundle);
        if (call != null && call.getBoolean("bool_result", false)) {
            z2 = true;
        }
        return z2;
    }

    public static int updateToLocalDB(Uri uri, ContentValues contentValues, DBImage dBImage) throws JSONException {
        return updateToLocalDB(uri, contentValues, dBImage.getId());
    }

    public static int updateToLocalDB(Uri uri, ContentValues contentValues, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("_id = '");
        sb.append(str);
        sb.append("'");
        return GalleryUtils.safeUpdate(uri, contentValues, sb.toString(), null);
    }

    public static void updateToLocalDBByServerId(Uri uri, ContentValues contentValues, String str) throws JSONException {
        StringBuilder sb = new StringBuilder();
        sb.append("serverId = '");
        sb.append(str);
        sb.append("'");
        GalleryUtils.safeUpdate(uri, contentValues, sb.toString(), null);
    }

    public static void updateToLocalDBForSync(Uri uri, ContentValues contentValues, DBImage dBImage) throws JSONException {
        updateToLocalDBForSync(uri, contentValues, dBImage.getId());
    }

    public static void updateToLocalDBForSync(Uri uri, ContentValues contentValues, String str) throws JSONException {
        updateToLocalDBForSync(uri, contentValues, str, false);
    }

    public static void updateToLocalDBForSync(Uri uri, ContentValues contentValues, String str, boolean z) throws JSONException {
        if (contentValues != null) {
            String asString = contentValues.getAsString("serverId");
            if (!TextUtils.isEmpty(asString)) {
                ContentValues contentValues2 = new ContentValues();
                contentValues2.putNull("serverId");
                GalleryUtils.safeUpdate(uri, contentValues2, "serverId = ?", new String[]{asString});
            }
            updateToLocalDB(uri, contentValues, str);
        } else {
            contentValues = new ContentValues();
        }
        if (!z) {
            contentValues.put("localFlag", Integer.valueOf(0));
        }
        GalleryUtils.safeUpdate(uri, contentValues, "_id = ? AND localFlag != ? ", new String[]{str, String.valueOf(2)});
    }

    public static void updateToPeopleFaceDBForDeleteItem(Uri uri, ContentValues contentValues, String str) throws JSONException {
        contentValues.put("localFlag", Integer.valueOf(0));
        updateToLocalDBByServerId(uri, contentValues, str);
    }

    public static void updateToPeopleFaceDBForSync(Uri uri, ContentValues contentValues, String str) throws JSONException {
        updateToLocalDBByServerId(uri, contentValues, str);
        contentValues.put("localFlag", Integer.valueOf(0));
        GalleryUtils.safeUpdate(uri, contentValues, "serverId = ? AND localFlag != ? ", new String[]{str, String.valueOf(2)});
    }
}
