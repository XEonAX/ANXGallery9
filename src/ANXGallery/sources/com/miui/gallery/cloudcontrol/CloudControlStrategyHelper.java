package com.miui.gallery.cloudcontrol;

import com.miui.gallery.cloudcontrol.strategies.AlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.AlbumsStrategy.Album;
import com.miui.gallery.cloudcontrol.strategies.AlbumsStrategy.AlbumPattern;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy;
import com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy;
import com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy.Component;
import com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy.Priority;
import com.miui.gallery.cloudcontrol.strategies.CreationStrategy;
import com.miui.gallery.cloudcontrol.strategies.FeatureSwitchStrategy;
import com.miui.gallery.cloudcontrol.strategies.HiddenAlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.IgnoreAlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.LocationStrategy;
import com.miui.gallery.cloudcontrol.strategies.PhotoPrintStrategy;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy.FileSizeLimitStrategy;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy.SpecialTypeMediaStrategy;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy.StreamFileStrategy;
import com.miui.gallery.cloudcontrol.strategies.SearchStrategy;
import com.miui.gallery.cloudcontrol.strategies.ServerReservedAlbumNamesStrategy;
import com.miui.gallery.cloudcontrol.strategies.ServerUnModifyAlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.SyncStrategy;
import com.miui.gallery.cloudcontrol.strategies.UploadSupportedFileTypeStrategy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

public class CloudControlStrategyHelper {
    public static Album getAlbumByPath(String str) {
        AlbumsStrategy albumsStrategy = (AlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("album-list");
        if (albumsStrategy != null) {
            return albumsStrategy.getAlbumByPath(str);
        }
        return null;
    }

    public static List<AlbumPattern> getAlbumPatterns() {
        AlbumsStrategy albumsStrategy = (AlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("album-list");
        if (albumsStrategy != null) {
            return albumsStrategy.getAlbumPatterns();
        }
        return null;
    }

    public static ArrayList<Pattern> getAlbumWhiteListPatterns() {
        AlbumsStrategy albumsStrategy = (AlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("album-list");
        if (albumsStrategy != null) {
            return albumsStrategy.getWhiteListPatterns();
        }
        return null;
    }

    public static ArrayList<String> getAlbumsInWhiteList() {
        AlbumsStrategy albumsStrategy = (AlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("album-list");
        if (albumsStrategy != null) {
            return albumsStrategy.getAlbumsInWhiteList();
        }
        return null;
    }

    public static AssistantScenarioStrategy getAssistantScenarioStrategy() {
        return (AssistantScenarioStrategy) CloudControlManager.getInstance().queryFeatureStrategy("assistant-rules");
    }

    public static List<Priority> getComponentPriority() {
        ComponentsStrategy componentsStrategy = (ComponentsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("components-list", ComponentsStrategy.CLOUD_FIRST_MERGER);
        if (componentsStrategy == null) {
            componentsStrategy = ComponentsStrategy.createDefault();
        }
        return componentsStrategy.getComponentPriority();
    }

    public static CreationStrategy getCreationStrategy() {
        CreationStrategy creationStrategy = (CreationStrategy) CloudControlManager.getInstance().queryFeatureStrategy("creation");
        return creationStrategy != null ? creationStrategy : CreationStrategy.createDefault();
    }

    public static FileSizeLimitStrategy getFileSizeLimitStrategy() {
        ScannerStrategy scannerStrategy = (ScannerStrategy) CloudControlManager.getInstance().queryFeatureStrategy("media_scanner", ScannerStrategy.CLOUD_FIRST_MERGER);
        if (scannerStrategy == null) {
            scannerStrategy = ScannerStrategy.createDefault();
        }
        return scannerStrategy.getFileSizeStrategy();
    }

    public static HiddenAlbumsStrategy getHiddenAlbums() {
        return (HiddenAlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("hidden-albums");
    }

    public static int getIgnoreAlbumVersion() {
        IgnoreAlbumsStrategy ignoreAlbums = getIgnoreAlbums();
        if (ignoreAlbums != null) {
            return ignoreAlbums.getVersion();
        }
        return 0;
    }

    public static IgnoreAlbumsStrategy getIgnoreAlbums() {
        return (IgnoreAlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("ignore-albums");
    }

    public static LocationStrategy getLocationStrategy() {
        LocationStrategy locationStrategy = (LocationStrategy) CloudControlManager.getInstance().queryFeatureStrategy("location");
        return locationStrategy == null ? LocationStrategy.createDefault() : locationStrategy;
    }

    public static PhotoPrintStrategy getPhotoPrintStrategy() {
        return (PhotoPrintStrategy) CloudControlManager.getInstance().queryFeatureStrategy("photo-print");
    }

    public static String getPrintPackageName() {
        PhotoPrintStrategy photoPrintStrategy = getPhotoPrintStrategy();
        if (photoPrintStrategy == null) {
            return null;
        }
        return photoPrintStrategy.getPhotoPrintPackageName();
    }

    public static SearchStrategy getSearchStrategy() {
        SearchStrategy searchStrategy = (SearchStrategy) CloudControlManager.getInstance().queryFeatureStrategy("search");
        return searchStrategy == null ? SearchStrategy.createDefault() : searchStrategy;
    }

    public static ServerReservedAlbumNamesStrategy getServerReservedAlbumNamesStrategy() {
        ServerReservedAlbumNamesStrategy serverReservedAlbumNamesStrategy = (ServerReservedAlbumNamesStrategy) CloudControlManager.getInstance().queryFeatureStrategy("server-reserved-album-names");
        return serverReservedAlbumNamesStrategy == null ? ServerReservedAlbumNamesStrategy.createDefault() : serverReservedAlbumNamesStrategy;
    }

    public static ServerUnModifyAlbumsStrategy getServerUnModifyAlbumsStrategy() {
        ServerUnModifyAlbumsStrategy serverUnModifyAlbumsStrategy = (ServerUnModifyAlbumsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("server-unmodify-albums");
        return (serverUnModifyAlbumsStrategy == null || serverUnModifyAlbumsStrategy.getAlbums() == null) ? ServerUnModifyAlbumsStrategy.createDefault() : serverUnModifyAlbumsStrategy;
    }

    public static List<Component> getShareComponents() {
        ComponentsStrategy componentsStrategy = (ComponentsStrategy) CloudControlManager.getInstance().queryFeatureStrategy("components-list", ComponentsStrategy.CLOUD_FIRST_MERGER);
        if (componentsStrategy == null) {
            componentsStrategy = ComponentsStrategy.createDefault();
        }
        return componentsStrategy.getShareComponents();
    }

    public static SpecialTypeMediaStrategy getSpecialTypeMediaStrategy() {
        ScannerStrategy scannerStrategy = (ScannerStrategy) CloudControlManager.getInstance().queryFeatureStrategy("media_scanner", ScannerStrategy.CLOUD_FIRST_MERGER);
        if (scannerStrategy == null) {
            scannerStrategy = ScannerStrategy.createDefault();
        }
        return scannerStrategy.getSpecialTypeMediaStrategy();
    }

    public static StreamFileStrategy getStreamFileStrategy() {
        ScannerStrategy scannerStrategy = (ScannerStrategy) CloudControlManager.getInstance().queryFeatureStrategy("media_scanner", ScannerStrategy.CLOUD_FIRST_MERGER);
        if (scannerStrategy == null) {
            scannerStrategy = ScannerStrategy.createDefault();
        }
        return scannerStrategy.getStreamFileStrategy();
    }

    public static SyncStrategy getSyncStrategy() {
        SyncStrategy syncStrategy = (SyncStrategy) CloudControlManager.getInstance().queryFeatureStrategy("sync");
        return syncStrategy == null ? SyncStrategy.createDefault() : syncStrategy;
    }

    public static HashMap<String, String> getUploadSupportedFileTypes() {
        UploadSupportedFileTypeStrategy uploadSupportedFileTypeStrategy = (UploadSupportedFileTypeStrategy) CloudControlManager.getInstance().queryFeatureStrategy("upload-supported-file-types");
        if (uploadSupportedFileTypeStrategy == null) {
            uploadSupportedFileTypeStrategy = UploadSupportedFileTypeStrategy.createDefault();
        }
        return uploadSupportedFileTypeStrategy.getSupportedFileTypeMap();
    }

    public static boolean isGlobalSecretVideoSupported() {
        FeatureSwitchStrategy featureSwitchStrategy = (FeatureSwitchStrategy) CloudControlManager.getInstance().queryFeatureStrategy("feature-switch");
        if (featureSwitchStrategy == null) {
            featureSwitchStrategy = FeatureSwitchStrategy.createDefault();
        }
        return featureSwitchStrategy.isGlobalSecretVideoSupported();
    }
}
