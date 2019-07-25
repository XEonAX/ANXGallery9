package com.miui.gallery.cloud;

import com.miui.gallery.cloud.HostManager.OwnerImage;
import com.miui.gallery.cloud.HostManager.OwnerVideo;
import com.miui.gallery.cloud.HostManager.ShareImage;
import com.miui.gallery.cloud.HostManager.ShareVideo;

public abstract class CloudUrlProvider {
    private static final CloudUrlProvider sOwnerImage = new OwnerImageUrlProvider();
    private static final CloudUrlProvider sOwnerVideo = new OwnerVideoUrlProvider();
    private static final CloudUrlProvider sSharerImage = new SharerImageUrlProvider();
    private static final CloudUrlProvider sSharerVideo = new SharerVideoUrlProvider();

    private static class OwnerImageUrlProvider extends CloudUrlProvider {
        private OwnerImageUrlProvider() {
        }

        public String getCommitSubUbiUrl(String str, String str2, int i) {
            return OwnerImage.getCommitSubUbiUrl(str2, i);
        }

        public String getCommitUrl(String str, String str2) {
            return OwnerImage.getCommitUrl(str2);
        }

        public String getCopyUrl(String str, String str2) {
            return OwnerImage.getCopyUrl(str2);
        }

        public String getCreateSubUbiUrl(String str, String str2, int i) {
            return OwnerImage.getCreateSubUbiUrl(str2, i);
        }

        public String getCreateUrl(String str, String str2) {
            return OwnerImage.getCreateUrl();
        }

        public String getDeleteUrl(String str, String str2) {
            return OwnerImage.getDeleteUrl(str2);
        }

        public String getEditUrl(String str, String str2) {
            return OwnerImage.getEditUrl(str2);
        }

        public String getHideCopyUrl(String str, String str2) {
            return OwnerImage.getHideCopyUrl(str2);
        }

        public String getHideMoveUrl(String str, String str2) {
            return OwnerImage.getHideMoveUrl(str2);
        }

        public String getMoveUrl(String str, String str2) {
            return OwnerImage.getMoveUrl(str2);
        }

        public String getRequestDownloadUrl(String str, String str2) {
            return OwnerImage.getDownloadUrl(str2);
        }

        public String getUnHideMoveUrl(String str, String str2) {
            return OwnerImage.getUnHideMoveUrl(str2);
        }

        public String getUnhideCopyUrl(String str, String str2) {
            return OwnerImage.getUnHideCopyUrl(str2);
        }

        public String getUpdateUrl(String str, String str2) {
            return OwnerImage.getUpdateUrl(str2);
        }
    }

    private static class OwnerVideoUrlProvider extends CloudUrlProvider {
        private OwnerVideoUrlProvider() {
        }

        public String getCommitSubUbiUrl(String str, String str2, int i) {
            return null;
        }

        public String getCommitUrl(String str, String str2) {
            return OwnerVideo.getCommitUrl(str2);
        }

        public String getCopyUrl(String str, String str2) {
            return OwnerVideo.getCopyUrl(str2);
        }

        public String getCreateSubUbiUrl(String str, String str2, int i) {
            return null;
        }

        public String getCreateUrl(String str, String str2) {
            return OwnerVideo.getCreateUrl();
        }

        public String getDeleteUrl(String str, String str2) {
            return OwnerVideo.getDeleteUrl(str2);
        }

        public String getEditUrl(String str, String str2) {
            return null;
        }

        public String getHideCopyUrl(String str, String str2) {
            return OwnerVideo.getHideCopyUrl(str2);
        }

        public String getHideMoveUrl(String str, String str2) {
            return OwnerVideo.getHideMoveUrl(str2);
        }

        public String getMoveUrl(String str, String str2) {
            return OwnerVideo.getMoveUrl(str2);
        }

        public String getRequestDownloadUrl(String str, String str2) {
            return OwnerVideo.getDownloadUrl(str2);
        }

        public String getUnHideMoveUrl(String str, String str2) {
            return OwnerVideo.getUnHideMoveUrl(str2);
        }

        public String getUnhideCopyUrl(String str, String str2) {
            return OwnerVideo.getUnHideCopyUrl(str2);
        }

        public String getUpdateUrl(String str, String str2) {
            return OwnerVideo.getUpdateUrl(str2);
        }
    }

    private static class SharerImageUrlProvider extends CloudUrlProvider {
        private SharerImageUrlProvider() {
        }

        public String getCommitSubUbiUrl(String str, String str2, int i) {
            return ShareImage.getCommitSubUbiUrl(i);
        }

        public String getCommitUrl(String str, String str2) {
            return ShareImage.getCommitUrl();
        }

        public String getCopyUrl(String str, String str2) {
            return ShareImage.getCopyUrl();
        }

        public String getCreateSubUbiUrl(String str, String str2, int i) {
            return ShareImage.getCreateSubUbiUrl(i);
        }

        public String getCreateUrl(String str, String str2) {
            return ShareImage.getCreateUrl();
        }

        public String getDeleteUrl(String str, String str2) {
            return ShareImage.getDeleteUrl();
        }

        public String getEditUrl(String str, String str2) {
            return null;
        }

        public String getHideCopyUrl(String str, String str2) {
            return null;
        }

        public String getHideMoveUrl(String str, String str2) {
            return null;
        }

        public String getMoveUrl(String str, String str2) {
            return ShareImage.getMoveUrl(str2);
        }

        public String getRequestDownloadUrl(String str, String str2) {
            return ShareImage.getDownloadUrl();
        }

        public String getUnHideMoveUrl(String str, String str2) {
            return null;
        }

        public String getUnhideCopyUrl(String str, String str2) {
            return null;
        }

        public String getUpdateUrl(String str, String str2) {
            return null;
        }
    }

    private static class SharerVideoUrlProvider extends CloudUrlProvider {
        private SharerVideoUrlProvider() {
        }

        public String getCommitSubUbiUrl(String str, String str2, int i) {
            return null;
        }

        public String getCommitUrl(String str, String str2) {
            return ShareVideo.getCommitUrl();
        }

        public String getCopyUrl(String str, String str2) {
            return ShareVideo.getCopyUrl();
        }

        public String getCreateSubUbiUrl(String str, String str2, int i) {
            return null;
        }

        public String getCreateUrl(String str, String str2) {
            return ShareVideo.getCreateUrl();
        }

        public String getDeleteUrl(String str, String str2) {
            return ShareVideo.getDeleteUrl();
        }

        public String getEditUrl(String str, String str2) {
            return null;
        }

        public String getHideCopyUrl(String str, String str2) {
            return null;
        }

        public String getHideMoveUrl(String str, String str2) {
            return null;
        }

        public String getMoveUrl(String str, String str2) {
            return ShareVideo.getMoveUrl(str2);
        }

        public String getRequestDownloadUrl(String str, String str2) {
            return ShareVideo.getDownloadUrl();
        }

        public String getUnHideMoveUrl(String str, String str2) {
            return null;
        }

        public String getUnhideCopyUrl(String str, String str2) {
            return null;
        }

        public String getUpdateUrl(String str, String str2) {
            return null;
        }
    }

    public static CloudUrlProvider getUrlProvider(boolean z, boolean z2) {
        if (z) {
            return z2 ? sSharerVideo : sSharerImage;
        }
        return z2 ? sOwnerVideo : sOwnerImage;
    }

    public abstract String getCommitSubUbiUrl(String str, String str2, int i);

    public abstract String getCommitUrl(String str, String str2);

    public abstract String getCopyUrl(String str, String str2);

    public abstract String getCreateSubUbiUrl(String str, String str2, int i);

    public abstract String getCreateUrl(String str, String str2);

    public abstract String getDeleteUrl(String str, String str2);

    public abstract String getEditUrl(String str, String str2);

    public abstract String getHideCopyUrl(String str, String str2);

    public abstract String getHideMoveUrl(String str, String str2);

    public abstract String getMoveUrl(String str, String str2);

    public abstract String getRequestDownloadUrl(String str, String str2);

    public abstract String getUnHideMoveUrl(String str, String str2);

    public abstract String getUnhideCopyUrl(String str, String str2);

    public abstract String getUpdateUrl(String str, String str2);
}
