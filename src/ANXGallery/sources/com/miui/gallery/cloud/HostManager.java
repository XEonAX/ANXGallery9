package com.miui.gallery.cloud;

import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import java.util.Locale;

public class HostManager {
    /* access modifiers changed from: private */
    public static final String BASE_FACE_HOST;
    /* access modifiers changed from: private */
    public static final String BASE_HOST;
    /* access modifiers changed from: private */
    public static final String BASE_SEARCH_FEEDBACK_HOST = BASE_FACE_HOST;
    /* access modifiers changed from: private */
    public static final String BASE_SEARCH_HOST;
    private static final String FACE_URL_BASE = (ApplicationHelper.getMiCloudProvider().getCloudManager().usePreview() ? "http://galleryfaceapi.micloud.preview.n.xiaomi.net" : "http://galleryfaceapi.micloud.xiaomi.net");
    private static final String SEARCH_URL_BASE = (ApplicationHelper.getMiCloudProvider().getCloudManager().usePreview() ? "http://gallerysearchapi.micloud.preview.n.xiaomi.net" : "http://gallerysearchapi.micloud.xiaomi.net");

    public static class AlbumShareOperation {
        public static String getAcceptInvitationUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/shareurl/accept");
            return sb.toString();
        }

        public static String getBarcodeShareUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/shareurl/barcode", new Object[]{str}));
            return sb.toString();
        }

        public static String getChangePublicUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/webshare", new Object[]{str}));
            return sb.toString();
        }

        public static String getDeleteSharerUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/sharer/delete", new Object[]{str}));
            return sb.toString();
        }

        public static String getExitShareUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/sharer/delete");
            return sb.toString();
        }

        public static String getOwnerRequestPublicUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/websharelink", new Object[]{str}));
            return sb.toString();
        }

        public static String getRefuseInvitationUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/anonymous/share/album/shareurl/refuse");
            return sb.toString();
        }

        public static String getRequestUserInfoUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/profile/basic");
            return sb.toString();
        }

        public static String getSharerRequestPublicUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/websharelink");
            return sb.toString();
        }

        public static String getSmsShareUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/shareurl/sms", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class Baby {
        public static String getUpdateBabyInfoUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class CloudControl {
        public static String getAnonymousUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/anonymous/policies");
            return sb.toString();
        }

        public static String getUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/modules");
            return sb.toString();
        }
    }

    public static class OwnerAlbum {
        public static String getCreateAlbumUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/full/album");
            return sb.toString();
        }

        public static String getDeleteAlbumUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/delete", new Object[]{str}));
            return sb.toString();
        }

        public static String getEditAlbumUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s", new Object[]{str}));
            return sb.toString();
        }

        public static String getRenameAlbumUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s", new Object[]{str}));
            return sb.toString();
        }

        public static String getThumbnailInfoUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/album/%s/thumbnail", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class OwnerImage extends OwnerMedia {
        public static String getCommitSubUbiUrl(String str, int i) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s/subimage/%s/storage", new Object[]{str, Integer.valueOf(i)}));
            return sb.toString();
        }

        public static String getCopyUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/copy", new Object[]{str}));
            return sb.toString();
        }

        public static String getCreateSubUbiUrl(String str, int i) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s/subimage/%s", new Object[]{str, Integer.valueOf(i)}));
            return sb.toString();
        }

        public static String getCreateUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/full");
            return sb.toString();
        }

        public static String getDeleteUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s/delete", new Object[]{str}));
            return sb.toString();
        }

        public static String getDownloadUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s/storage", new Object[]{str}));
            return sb.toString();
        }

        public static String getEditUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s", new Object[]{str}));
            return sb.toString();
        }

        public static String getHideCopyUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/hide/copy", new Object[]{str}));
            return sb.toString();
        }

        public static String getHideMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/hide/move", new Object[]{str}));
            return sb.toString();
        }

        public static String getMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/move", new Object[]{str}));
            return sb.toString();
        }

        public static String getUnHideCopyUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/unhide/copy", new Object[]{str}));
            return sb.toString();
        }

        public static String getUnHideMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/unhide/move", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class OwnerMedia {
        public static String getCommitUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s/storage", new Object[]{str}));
            return sb.toString();
        }

        public static String getRequestThumbnailUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/thumbnails");
            return sb.toString();
        }

        public static String getUpdateUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/%s", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class OwnerVideo extends OwnerMedia {
        public static String getCopyUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/copy", new Object[]{str}));
            return sb.toString();
        }

        public static String getCreateUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/full/video");
            return sb.toString();
        }

        public static String getDeleteUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/delete", new Object[]{str}));
            return sb.toString();
        }

        public static String getDownloadUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/storage", new Object[]{str}));
            return sb.toString();
        }

        public static String getHideCopyUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/hide/copy", new Object[]{str}));
            return sb.toString();
        }

        public static String getHideMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/hide/move", new Object[]{str}));
            return sb.toString();
        }

        public static String getMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/move", new Object[]{str}));
            return sb.toString();
        }

        public static String getUnHideCopyUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/unhide/copy", new Object[]{str}));
            return sb.toString();
        }

        public static String getUnHideMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/unhide/move", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class PeopleFace {
        public static String getFaceDeleteUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append(String.format(Locale.US, "/user/face/%s/delete", new Object[]{str}));
            return sb.toString();
        }

        public static String getFaceInfoSyncUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append("/user/faceinfo");
            return sb.toString();
        }

        public static String getFaceMoveUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append("/user/face/batchmove");
            return sb.toString();
        }

        public static String getPeopleCreateUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append("/user/people/create");
            return sb.toString();
        }

        public static String getPeopleFaceSyncUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append("/user");
            return sb.toString();
        }

        public static String getPeopleFeedBackUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append("/user/feedback");
            return sb.toString();
        }

        public static String getPeopleIgnoreUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append(String.format(Locale.US, "/user/people/%s/ignore", new Object[]{str}));
            return sb.toString();
        }

        public static String getPeopleMergeUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append("/user/people/merge");
            return sb.toString();
        }

        public static String getPeopleRecommendUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append(String.format(Locale.US, "/user/people/%s/recommend", new Object[]{str}));
            return sb.toString();
        }

        public static String getPeopleRecoveryUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append(String.format(Locale.US, "/user/people/%s/recovery", new Object[]{str}));
            return sb.toString();
        }

        public static String getPeopleRenameUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_FACE_HOST);
            sb.append(String.format(Locale.US, "/user/people/%s/updatename", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class Search {
        public static String getSearchFeedbackUrlHost() {
            return HostManager.BASE_SEARCH_FEEDBACK_HOST;
        }

        public static String getSearchUrlHost() {
            return HostManager.BASE_SEARCH_HOST;
        }
    }

    public static class Setting {
        public static String getSyncUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/setting");
            return sb.toString();
        }
    }

    public static class ShareAlbum {
        public static String getEditAlbumUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/relation");
            return sb.toString();
        }

        public static String getThumbnailInfoUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/thumbnail");
            return sb.toString();
        }
    }

    public static class ShareImage extends ShareMedia {
        public static String getCommitSubUbiUrl(int i) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/share/subimage/%s/storage", new Object[]{Integer.valueOf(i)}));
            return sb.toString();
        }

        public static String getCopyUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/copy");
            return sb.toString();
        }

        public static String getCreateSubUbiUrl(int i) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/share/subimage/%s", new Object[]{Integer.valueOf(i)}));
            return sb.toString();
        }

        public static String getCreateUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album");
            return sb.toString();
        }

        public static String getDeleteUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/delete");
            return sb.toString();
        }

        public static String getDownloadUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/storage");
            return sb.toString();
        }

        public static String getMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/image/%s/move", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class ShareMedia {
        public static String getCommitUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/storage");
            return sb.toString();
        }

        public static String getRequestThumbnailUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/thumbnails");
            return sb.toString();
        }
    }

    public static class ShareVideo extends ShareMedia {
        public static String getCopyUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/video/copy");
            return sb.toString();
        }

        public static String getCreateUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/video");
            return sb.toString();
        }

        public static String getDeleteUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/video/delete");
            return sb.toString();
        }

        public static String getDownloadUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/video/storage");
            return sb.toString();
        }

        public static String getMoveUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/video/%s/move", new Object[]{str}));
            return sb.toString();
        }
    }

    public static class Story {
        public static String getCardInfosUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/cardinfo");
            return sb.toString();
        }

        public static String getCreateCardUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/cardinfo");
            return sb.toString();
        }

        public static String getDeleteCardUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/cardinfo/delete");
            return sb.toString();
        }

        public static String getOperationCardAnonymousUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/anonymous/operationcard");
            return sb.toString();
        }

        public static String getOperationCardUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/operationcard");
            return sb.toString();
        }

        public static String getUpdateCardUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/cardinfo/update");
            return sb.toString();
        }
    }

    public static class SyncPull {
        public static String getPullOwnerAlbumUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/full/album_v2");
            return sb.toString();
        }

        public static String getPullOwnerAllUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/full");
            return sb.toString();
        }

        public static String getPullOwnerPrivateUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/full/hide");
            return sb.toString();
        }

        public static String getPullOwnerShareUserUrl(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append(String.format(Locale.US, "/user/full/album/%s/sharer", new Object[]{str}));
            return sb.toString();
        }

        public static String getPullShareAlbumImage() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album");
            return sb.toString();
        }

        public static String getPullShareAll() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/changes");
            return sb.toString();
        }

        public static String getPullShareUserUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/share/album/sharer");
            return sb.toString();
        }
    }

    public static class Upgrade {
        public static String getUpgradeUrl() {
            StringBuilder sb = new StringBuilder();
            sb.append(HostManager.BASE_HOST);
            sb.append("/user/upgrade");
            return sb.toString();
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(ApplicationHelper.getMiCloudProvider().getCloudManager().getGalleryBaseUrl());
        sb.append("/mic/gallery/v3");
        BASE_HOST = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(FACE_URL_BASE);
        sb2.append("/mic/gallery/face/v1");
        BASE_FACE_HOST = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(SEARCH_URL_BASE);
        sb3.append("/mic/gallery/search/v1");
        BASE_SEARCH_HOST = sb3.toString();
    }
}
