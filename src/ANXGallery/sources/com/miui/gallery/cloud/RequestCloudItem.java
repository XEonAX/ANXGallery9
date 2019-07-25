package com.miui.gallery.cloud;

import android.content.ContentValues;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.LocalUbifocus;
import com.miui.gallery.data.UbiIndexMapper;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.util.ArrayList;

public class RequestCloudItem extends RequestItemBase {
    public DBImage dbCloud;

    public RequestCloudItem(int i, DBImage dBImage) {
        this(i, dBImage, false);
    }

    public RequestCloudItem(int i, DBImage dBImage, boolean z) {
        super(i, z ? 0 : getDelay(dBImage));
        this.dbCloud = dBImage;
        init();
    }

    public static String getDownloadOriginalFilePath(DBImage dBImage) {
        return new RequestCloudItem(dBImage.isVideoType() ? 9 : 10, dBImage).getVerifiedDownloadFilePathForRead();
    }

    private boolean isOriginFileValidate(String str) {
        return !TextUtils.isEmpty(str) && new File(str).length() >= this.dbCloud.getSize();
    }

    public static boolean shouldHideDownloadFolder(String str) {
        String relativePath = StorageUtils.getRelativePath(GalleryApp.sGetAndroidContext(), str);
        return ExtraTextUtils.startsWithIgnoreCase(relativePath, "MIUI/Gallery/cloud/.microthumbnailFile") || ExtraTextUtils.startsWithIgnoreCase(relativePath, StorageUtils.DIRECTORY_SECRET_ALBUM_PATH);
    }

    public String getDownloadFilePathForRead() {
        switch (getDownloadType()) {
            case 1:
                String microThumbnailFile = this.dbCloud.getMicroThumbnailFile();
                return new File(microThumbnailFile).exists() ? microThumbnailFile : DownloadPathHelper.getFilePathForRead(StorageUtils.getMicroThumbnailDirectories(GalleryApp.sGetAndroidContext()), getFileName());
            case 2:
                String thumbnailFile = this.dbCloud.getThumbnailFile();
                return new File(thumbnailFile).exists() ? thumbnailFile : DownloadPathHelper.getFilePathForRead(DownloadPathHelper.getDownloadFolderRelativePath(this.dbCloud), getFileName());
            case 3:
            case 4:
                String localFile = this.dbCloud.getLocalFile();
                if (isOriginFileValidate(localFile)) {
                    return localFile;
                }
                String filePathForRead = DownloadPathHelper.getFilePathForRead(DownloadPathHelper.getDownloadFolderRelativePath(this.dbCloud), getFileName());
                if (isOriginFileValidate(filePathForRead)) {
                    return filePathForRead;
                }
                break;
        }
        return "";
    }

    public String getDownloadFilePathForWrite() {
        String fileName = getFileName();
        if (getDownloadType() == 3 && (this.dbCloud.isUbiFocus() || this.dbCloud.isSubUbiFocus())) {
            fileName = LocalUbifocus.createInnerFileName(fileName, UbiIndexMapper.cloudToLocal(this.dbCloud.getSubUbiIndex(), this.dbCloud.getSubUbiImageCount() + 1), this.dbCloud.getSubUbiImageCount() + 1);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(getFolderPathForWrite());
        sb.append(File.separator);
        sb.append(fileName);
        return sb.toString();
    }

    public String getDownloadTempFilePath() {
        switch (getDownloadType()) {
            case 1:
                StringBuilder sb = new StringBuilder();
                sb.append(getDownloadFilePathForWrite());
                sb.append(".temp");
                return sb.toString();
            case 2:
                return FileUtils.concat(StorageUtils.getThumbnailTempDirectory(), this.dbCloud.getSha1());
            case 3:
            case 4:
                return FileUtils.concat(StorageUtils.getOriginTempDirectory(), this.dbCloud.getSha1());
            default:
                return "";
        }
    }

    public String getFileName() {
        switch (getDownloadType()) {
            case 1:
                return isSecretItem() ? this.dbCloud.getSha1ThumbnailSA() : this.dbCloud.getSha1Thumbnail();
            case 2:
                return isSecretItem() ? this.dbCloud.getSha1ThumbnailSA() : DownloadPathHelper.getThumbnailDownloadFileNameNotSecret(this.dbCloud);
            case 3:
            case 4:
                return isSecretItem() ? this.dbCloud.getEncodedFileName() : DownloadPathHelper.getOriginDownloadFileNameNotSecret(this.dbCloud);
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("bad checktype, checktype=");
                sb.append(getDownloadType());
                throw new UnsupportedOperationException(sb.toString());
        }
    }

    public String getFolderPathForWrite() {
        switch (getDownloadType()) {
            case 1:
                return StorageUtils.getPriorMicroThumbnailDirectory();
            case 2:
            case 3:
            case 4:
                return DownloadPathHelper.getDownloadFolderPath(this.dbCloud);
            default:
                return "";
        }
    }

    public String getIdentity() {
        return this.dbCloud.getTagId();
    }

    public ArrayList<RequestItemBase> getItems() {
        ArrayList<RequestItemBase> arrayList = new ArrayList<>();
        arrayList.add(this);
        return arrayList;
    }

    public int getRequestLimitAGroup() {
        return 10;
    }

    /* JADX WARNING: Removed duplicated region for block: B:39:0x00bf  */
    public String getVerifiedDownloadFilePathForRead() {
        String str;
        String downloadFilePathForRead = getDownloadFilePathForRead();
        String str2 = "";
        int downloadType = getDownloadType();
        if (!TextUtils.isEmpty(downloadFilePathForRead)) {
            if (downloadType == 1) {
                if (!downloadFilePathForRead.equalsIgnoreCase(this.dbCloud.getMicroThumbnailFile())) {
                    str2 = "microthumbfile";
                }
            } else if (downloadType == 2) {
                if (!downloadFilePathForRead.equalsIgnoreCase(this.dbCloud.getThumbnailFile())) {
                    if (isSecretItem() || TextUtils.equals(this.dbCloud.getSha1(), ExifUtil.getUserCommentSha1(downloadFilePathForRead))) {
                        str2 = "thumbnailFile";
                        this.dbCloud.setThumbnailFile(downloadFilePathForRead);
                    } else {
                        str = "";
                        if (!TextUtils.isEmpty(str2)) {
                            ContentValues contentValues = new ContentValues();
                            contentValues.put(str2, downloadFilePathForRead);
                            CloudUtils.updateToLocalDB(this.dbCloud.getBaseUri(), contentValues, this.dbCloud.getId());
                        }
                        return str;
                    }
                }
            } else if ((downloadType == 3 || downloadType == 4) && !downloadFilePathForRead.equalsIgnoreCase(this.dbCloud.getLocalFile())) {
                if (isSecretItem()) {
                    str2 = "localFile";
                    this.dbCloud.setLocalFile(downloadFilePathForRead);
                } else {
                    if (TextUtils.equals(ExifUtil.getUserCommentSha1(downloadFilePathForRead), this.dbCloud.getSha1())) {
                        if (!downloadFilePathForRead.equalsIgnoreCase(this.dbCloud.getThumbnailFile())) {
                            str2 = "thumbnailFile";
                            this.dbCloud.setThumbnailFile(downloadFilePathForRead);
                        }
                        str = "";
                    } else if (TextUtils.equals(this.dbCloud.getSha1(), FileUtils.getSha1(downloadFilePathForRead))) {
                        str2 = "localFile";
                        this.dbCloud.setLocalFile(downloadFilePathForRead);
                    } else {
                        str = "";
                    }
                    if (!TextUtils.isEmpty(str2)) {
                    }
                    return str;
                }
            }
        }
        str = downloadFilePathForRead;
        if (!TextUtils.isEmpty(str2)) {
        }
        return str;
    }

    public boolean isInSameAlbum(RequestItemBase requestItemBase) {
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        if (requestCloudItem.getDownloadType() != 1 || getDownloadType() != 1 || !requestCloudItem.dbCloud.isShareItem() || !this.dbCloud.isShareItem()) {
            return true;
        }
        return TextUtils.equals(requestCloudItem.dbCloud.getShareAlbumId(), this.dbCloud.getShareAlbumId());
    }

    public boolean isSecretItem() {
        return this.dbCloud.isSecretItem();
    }

    public boolean supportMultiRequest() {
        return getDownloadType() == 1;
    }
}
