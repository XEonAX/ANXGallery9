package com.miui.gallery.assistant.library;

import com.miui.gallery.assistant.manager.ImageFeatureManager;

public class LibraryConstants {
    public static final String CURRENT_ABI = LibraryUtils.getCurrentAbi();
    public static final Long[] sAllLibraries = LibraryUtils.getAllLibraries();
    public static final Long[] sImageFeatureSelectionLibraries = {Long.valueOf(1002001), Long.valueOf(1004001)};
    public static final Long[] sImageProcessLibraries;
    public static final Long[] sPhotoMovieLibraries = {Long.valueOf(1011)};
    public static final Long[] sSkyTransferLibraries = {Long.valueOf(1012)};
    public static final Long[] sStoryLibraries = {Long.valueOf(1002001), Long.valueOf(1004001), Long.valueOf(1005)};

    static {
        Long[] lArr = ImageFeatureManager.isDeviceSupportStoryFunction() ? sStoryLibraries : ImageFeatureManager.isImageFeatureCalculationEnable() ? sImageFeatureSelectionLibraries : new Long[0];
        sImageProcessLibraries = lArr;
    }
}
