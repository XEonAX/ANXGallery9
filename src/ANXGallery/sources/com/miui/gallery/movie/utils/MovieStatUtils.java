package com.miui.gallery.movie.utils;

import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.entity.MovieResource;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.HashMap;

public class MovieStatUtils {
    public static final String DOWNLOAD_FAILED = "-1";
    public static final String DOWNLOAD_SUCCESS = "0";
    public static final String DURATION_LONG = "long";
    public static final String DURATION_SHORT = "short";
    public static final String FROM_NORMAL = "movieAssetsNormal";
    public static final String FROM_STORY = "story";
    public static final String PAGER_EDITOR = "editor";
    public static final String PAGER_PREVIEW = "preview";

    public static void statDownload(MovieResource movieResource) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, movieResource.getStatTypeString());
        hashMap.put("name", movieResource.getStatNameString());
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_download", hashMap);
    }

    public static void statDownloadResult(MovieResource movieResource, boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, movieResource.getStatTypeString());
        hashMap.put("name", movieResource.getStatNameString());
        hashMap.put("success", z ? DOWNLOAD_SUCCESS : DOWNLOAD_FAILED);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_download_result", hashMap);
    }

    public static void statDurationClick(MovieInfo movieInfo, boolean z, boolean z2) {
        HashMap hashMap = new HashMap();
        hashMap.put("size", String.valueOf(movieInfo.imageList.size()));
        hashMap.put("pager", z ? PAGER_PREVIEW : PAGER_EDITOR);
        hashMap.put("duration", z2 ? DURATION_SHORT : DURATION_LONG);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_duration_click", hashMap);
    }

    public static void statEditorMove(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("size", String.valueOf(i));
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_editor_move", hashMap);
    }

    public static void statEnter(int i, boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("size", String.valueOf(i));
        hashMap.put("from", z ? FROM_STORY : FROM_NORMAL);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_enter", hashMap);
    }

    public static void statItemChoose(MovieResource movieResource) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, movieResource.getStatTypeString());
        hashMap.put("name", movieResource.getStatNameString());
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_item_choose", hashMap);
    }

    public static void statMovieLibraryDownloadResult(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("success", z ? DOWNLOAD_SUCCESS : DOWNLOAD_FAILED);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_library_download_result", hashMap);
    }

    public static void statPreviewEnterEditPage(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("duration", z ? DURATION_SHORT : DURATION_LONG);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_editor_preview_edit_click", hashMap);
    }

    public static void statPreviewPlayBtn(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("duration", z ? DURATION_SHORT : DURATION_LONG);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_editor_preview_play_click", hashMap);
    }

    public static void statSaveClick(boolean z, MovieInfo movieInfo) {
        HashMap hashMap = new HashMap();
        hashMap.put("pager", z ? PAGER_PREVIEW : PAGER_EDITOR);
        hashMap.put("template", movieInfo.template);
        hashMap.put("audio", movieInfo.audio);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_save_click", hashMap);
    }

    public static void statSaveResult(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("success", str);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_save_result", hashMap);
    }

    public static void statShareClick(MovieInfo movieInfo) {
        HashMap hashMap = new HashMap();
        hashMap.put("template", movieInfo.template);
        hashMap.put("audio", movieInfo.audio);
        MovieSamplingStatHelper.recordCountEvent("movie", "movie_share_click", hashMap);
    }
}
