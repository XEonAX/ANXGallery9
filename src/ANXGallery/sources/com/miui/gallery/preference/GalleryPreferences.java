package com.miui.gallery.preference;

import android.content.SharedPreferences.Editor;
import android.support.annotation.Keep;
import android.text.TextUtils;
import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.syncstate.SyncStatus;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.FeatureUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SyncUtil;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public class GalleryPreferences {

    public static class Album {
        public static Set<String> getCachedSortByModifyAlbumIds() {
            return PreferenceHelper.getStringSet(PrefKeys.ALBUM_CACHED_SORT_BY_MODIFY_ALBUM_IDS, null);
        }

        public static Set<String> getCachedSortByModifyAlbumPaths() {
            return PreferenceHelper.getStringSet(PrefKeys.ALBUM_CACHED_SORT_BY_MODIFY_ALBUM_PATHS, null);
        }

        public static long getNextForceTopTime() {
            long j = PreferenceHelper.getLong(PrefKeys.ALBUM_NEXT_FORCE_TOP_TIME, -1002);
            PreferenceHelper.putLong(PrefKeys.ALBUM_NEXT_FORCE_TOP_TIME, j - 1);
            return j;
        }

        public static long getVirtualAlbumSortBy(long j, long j2) {
            return PreferenceHelper.getLong(String.format(PrefKeys.ALBUM_VIRTUAL_ALBUM_PREFIX, new Object[]{Long.valueOf(j)}), j2);
        }

        public static boolean isForceTopAlbumByTopTime(long j) {
            return j >= PreferenceHelper.getLong(PrefKeys.ALBUM_NEXT_FORCE_TOP_TIME, -1002) && j <= -1002;
        }

        public static void setCachedSortByModifyAlbumIds(Set<String> set) {
            PreferenceHelper.putStringSet(PrefKeys.ALBUM_CACHED_SORT_BY_MODIFY_ALBUM_IDS, set);
        }

        public static void setCachedSortByModifyAlbumPaths(Set<String> set) {
            PreferenceHelper.putStringSet(PrefKeys.ALBUM_CACHED_SORT_BY_MODIFY_ALBUM_PATHS, set);
        }

        public static void setVirtualAlbumSortBy(long j, long j2) {
            PreferenceHelper.putLong(String.format(PrefKeys.ALBUM_VIRTUAL_ALBUM_PREFIX, new Object[]{Long.valueOf(j)}), j2);
        }
    }

    public static class Assistant {
        public static long getLastGuaranteeTriggerTime() {
            return PreferenceHelper.getLong(PrefKeys.ASSISTANT_LAST_GUARANTEE_TRIGGER_TIME, 0);
        }

        public static long getLastImageFeatureTaskTime() {
            return PreferenceHelper.getLong(PrefKeys.ASSISTANT_LAST_IMAGE_FEATURE_TASK_TIME, 0);
        }

        public static long getLastTriggerTime() {
            return PreferenceHelper.getLong(PrefKeys.ASSISTANT_LAST_TRIGGER_TIME, 0);
        }

        public static boolean hasCardEver() {
            return PreferenceHelper.getBoolean(PrefKeys.ASSISTANT_HAS_CARD_EVER, false);
        }

        public static boolean isFirstShowImageSelection() {
            return PreferenceHelper.getBoolean(PrefKeys.ASSISTANT_FIRST_SHOW_IMAGE_SELECTION, true);
        }

        public static boolean isImageSelectionFunctionOn() {
            return PreferenceHelper.getBoolean(PrefKeys.ASSISTANT_IMAGE_SELECTION_FUNCTION, true);
        }

        public static boolean isStoryFunctionOn() {
            return PreferenceHelper.getBoolean(PrefKeys.ASSISTANT_STORY_FUNCTION, true);
        }

        public static void setHasCardEver() {
            PreferenceHelper.putBoolean(PrefKeys.ASSISTANT_HAS_CARD_EVER, true);
        }

        public static void setImageSelectionFunctionState(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.ASSISTANT_IMAGE_SELECTION_FUNCTION, z);
        }

        public static void setIsFirstShowImageSelection(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.ASSISTANT_FIRST_SHOW_IMAGE_SELECTION, z);
        }

        public static void setLastGuaranteeTriggerTime(long j) {
            PreferenceHelper.putLong(PrefKeys.ASSISTANT_LAST_GUARANTEE_TRIGGER_TIME, j);
        }

        public static void setLastImageFeatureTaskTime(long j) {
            PreferenceHelper.putLong(PrefKeys.ASSISTANT_LAST_IMAGE_FEATURE_TASK_TIME, j);
        }

        public static void setLastTriggerTime(long j) {
            PreferenceHelper.putLong(PrefKeys.ASSISTANT_LAST_TRIGGER_TIME, j);
        }

        public static void setStoryFunctionState(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.ASSISTANT_STORY_FUNCTION, z);
        }
    }

    public static class Baby {
        private static String createBabyShortcutKey(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append("baby_shortcut_prefix");
            sb.append(str);
            return sb.toString();
        }

        private static String createServerIdKeyForSaveServerTagOfNewPhoto(long j) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.BABY_SERVER_TAG_SAVE_PREFIX);
            sb.append(j);
            return sb.toString();
        }

        public static ArrayList<String> getBabyAlbumsHasShortcut() {
            ArrayList<String> arrayList = new ArrayList<>();
            for (String str : PreferenceHelper.getPreferences().getAll().keySet()) {
                if (isBabyAlbumHasShortcutKey(str)) {
                    arrayList.add(PreferenceHelper.getString(str, ""));
                }
            }
            return arrayList;
        }

        public static boolean getHasShowAutoUpdateTipWithoutSelectingAll(String str) {
            return PreferenceHelper.getBoolean(str, false);
        }

        public static long getLastClickBabyPhotosRecommandationTime(String str) {
            return PreferenceHelper.getLong(str, 0);
        }

        public static long getLastClickPeopleRecommandationTime(String str) {
            return PreferenceHelper.getLong(str, 0);
        }

        public static Long getMinServerTagOfNewPhoto(long j) {
            return Long.valueOf(PreferenceHelper.getLong(createServerIdKeyForSaveServerTagOfNewPhoto(j), 0));
        }

        private static boolean isBabyAlbumHasShortcutKey(String str) {
            return str != null && str.startsWith("baby_shortcut_prefix");
        }

        /* access modifiers changed from: private */
        public static boolean isMinServerTagOfNewPhotoKey(String str) {
            return str != null && str.startsWith(PrefKeys.BABY_SERVER_TAG_SAVE_PREFIX);
        }

        public static void recordBabyAlbumHasShortcut(String str) {
            PreferenceHelper.putString(createBabyShortcutKey(str), str);
        }

        public static void removeBabyAlbumShortcut(String str) {
            PreferenceHelper.removeKey(createBabyShortcutKey(str));
        }

        public static void saveMinServerTagOfNewPhoto(long j, Long l) {
            PreferenceHelper.putLong(createServerIdKeyForSaveServerTagOfNewPhoto(j), l.longValue());
        }

        public static void setHasShowAutoUpdateTipWithoutSelectingAll(String str) {
            PreferenceHelper.putBoolean(str, true);
        }

        public static void setLastClickBabyPhotosRecommandationTime(String str) {
            PreferenceHelper.putLong(str, System.currentTimeMillis());
        }

        public static void setLastClickPeopleRecommandationTime(String str) {
            PreferenceHelper.putLong(str, System.currentTimeMillis());
        }
    }

    public static class CTA extends com.miui.gallery.preference.BaseGalleryPreferences.CTA {
        public static void onCreateOrDestroyHomePage() {
            setCanConnectToNetworkTemp(false);
            setToAllowUseOnOfflineGlobal(false);
        }
    }

    public static class CleanFilePath {
        public static boolean hasCleanFilePath() {
            return PreferenceHelper.getBoolean(PrefKeys.HAS_CLEAN_FILE_NAME_AND_PATH, false);
        }

        public static void setHasCleanFilePath(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.HAS_CLEAN_FILE_NAME_AND_PATH, z);
        }
    }

    public static class CloudControl {
        public static long getLastRequestSucceedTime() {
            return PreferenceHelper.getLong(PrefKeys.CLOUD_CONTROL_LAST_REQUEST_SUCCEED_TIME, 0);
        }

        public static long getLastRequestTime() {
            return PreferenceHelper.getLong(PrefKeys.CLOUD_CONTROL_LAST_REQUEST_TIME, 0);
        }

        public static long getPushTag() {
            return PreferenceHelper.getLong(PrefKeys.CLOUD_CONTROL_PUSH_TAG, 0);
        }

        public static String getSyncToken() {
            return PreferenceHelper.getString(PrefKeys.CLOUD_CONTROL_SYNC_TOKEN, null);
        }

        public static void remove() {
            PreferenceHelper.getPreferences().edit().remove(PrefKeys.CLOUD_CONTROL_SYNC_TOKEN).remove(PrefKeys.CLOUD_CONTROL_LAST_REQUEST_SUCCEED_TIME).remove(PrefKeys.CLOUD_CONTROL_PUSH_TAG).apply();
        }

        public static void setLastRequestSucceedTime(long j) {
            PreferenceHelper.putLong(PrefKeys.CLOUD_CONTROL_LAST_REQUEST_SUCCEED_TIME, j);
        }

        public static void setLastRequestTime(long j) {
            PreferenceHelper.putLong(PrefKeys.CLOUD_CONTROL_LAST_REQUEST_TIME, j);
        }

        public static void setPushTag(long j) {
            PreferenceHelper.putLong(PrefKeys.CLOUD_CONTROL_PUSH_TAG, j);
        }

        public static void setSyncToken(String str) {
            PreferenceHelper.putString(PrefKeys.CLOUD_CONTROL_SYNC_TOKEN, str);
        }
    }

    public static final class CloudGuide {
        /* access modifiers changed from: private */
        public static void remove() {
            PreferenceHelper.getPreferences().edit().remove(PrefKeys.CLOUD_GUIDE_SLIM_NOTIFICATION_TIMES).remove(PrefKeys.CLOUD_GUIDE_SLIM_NOTIFICATION_CLICKED).remove(PrefKeys.CLOUD_GUIDE_TOPBAR_LAST_AUTO_SHOW_TIME).remove(PrefKeys.CLOUD_GUIDE_TOPBAR_AUTO_SHOW_TIMES).remove(PrefKeys.CLOUD_GUIDE_TOPBAR_CLICKED).remove(PrefKeys.CLOUD_GUIDE_TOPBAR_LAST_TEXT_ID).remove(PrefKeys.CLOUD_GUIDE_EVER_NOTIFY_SLIM_RESULT).apply();
        }

        public static void setCloudGuideTopbarClicked() {
            PreferenceHelper.putBoolean(PrefKeys.CLOUD_GUIDE_TOPBAR_CLICKED, true);
        }
    }

    public static class DataBase {
        public static boolean getEverFixedCameraAlbumAttributes() {
            return PreferenceHelper.getBoolean(PrefKeys.DATABASE_EVER_UPDATE_CAMERA_ALBUM_ATTRIBUTES, false);
        }

        public static boolean getEverUpgradeAlbumEditedColumns() {
            return PreferenceHelper.getBoolean(PrefKeys.DATABASE_EVER_UPGRADE_ALBUM_EDITED_COLUMNS, false);
        }

        public static int getViewVersion(String str) {
            return PreferenceHelper.getInt(String.format(Locale.US, PrefKeys.DATABASE_VIEW_VERSION_PREFIX, new Object[]{str}), 0);
        }

        public static void setEverFixedCameraAlbumAttributes() {
            PreferenceHelper.putBoolean(PrefKeys.DATABASE_EVER_UPDATE_CAMERA_ALBUM_ATTRIBUTES, true);
        }

        public static void setEverUpgradeAlbumEditedColumns() {
            PreferenceHelper.putBoolean(PrefKeys.DATABASE_EVER_UPGRADE_ALBUM_EDITED_COLUMNS, true);
        }

        public static void setViewVersion(String str, int i) {
            PreferenceHelper.putInt(String.format(Locale.US, PrefKeys.DATABASE_VIEW_VERSION_PREFIX, new Object[]{str}), i);
        }
    }

    public static class Delete {
        private static boolean isFirstDelete(String str) {
            boolean z = PreferenceHelper.getBoolean(str, true);
            if (z) {
                PreferenceHelper.putBoolean(str, false);
            }
            return z;
        }

        public static boolean isFirstDeleteFromAlbum() {
            return isFirstDelete(PrefKeys.DELETE_FIRST_DELETE_FROM_ALBUM);
        }

        public static boolean isFirstDeleteFromHomePage() {
            return isFirstDelete(PrefKeys.DELETE_FIRST_DELETE_FROM_HOMEPAGE);
        }
    }

    public static class Face {
        public static boolean getFaceSwitchEnabled() {
            boolean z = true;
            if (!isFaceSwitchSet()) {
                return true;
            }
            int i = PreferenceHelper.getInt(PrefKeys.FACE_CLOUD_STATUS, 0);
            if (!(i == 2 || i == 4)) {
                z = false;
            }
            return z;
        }

        public static int getMarkMyselfTriggeredCount() {
            return PreferenceHelper.getInt(PrefKeys.FACE_MARK_MYSELF_TRIGGERED_COUNT, 0);
        }

        public static boolean isFaceRecommendGroupHidden(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.FACE_RECOMMEND_GROUP_HIDDEN);
            sb.append(str);
            return PreferenceHelper.getBoolean(sb.toString(), false);
        }

        public static boolean isFaceSwitchSet() {
            return PreferenceHelper.contains(PrefKeys.FACE_CLOUD_STATUS);
        }

        public static boolean isFirstSyncCompleted() {
            return PreferenceHelper.getBoolean(PrefKeys.FACE_FIRST_SYNC_COMPLETED, false);
        }

        public static boolean isShowRecommendConfirmDialog() {
            return PreferenceHelper.getBoolean(PrefKeys.FACE_FIRST_CONFIRM_RECOMMEND_FACE, true);
        }

        public static void onMarkMyselfTriggered() {
            PreferenceHelper.putInt(PrefKeys.FACE_MARK_MYSELF_TRIGGERED_COUNT, getMarkMyselfTriggeredCount() + 1);
        }

        public static void remove() {
            PreferenceHelper.getPreferences().edit().remove(PrefKeys.FACE_CLOUD_STATUS).remove(PrefKeys.FACE_CLOUD_STATUS_NEXT_CHECK_TIME).remove(PrefKeys.FACE_FEATURE_SWITCH_PENDING).remove(PrefKeys.FACE_URL_FOR_QUEUING).remove(PrefKeys.FACE_URL_FOR_WAITING).remove(PrefKeys.FACE_CLOUD_STATUS_SYNC_TIME).remove(PrefKeys.FACE_MARK_MYSELF_TRIGGERED_COUNT).remove(PrefKeys.FACE_MARK_MYSELF_RESULT).remove(PrefKeys.FACE_FIRST_SYNC_COMPLETED).apply();
        }

        public static void setFaceRecommendGroupHidden(String str, boolean z) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.FACE_RECOMMEND_GROUP_HIDDEN);
            sb.append(str);
            PreferenceHelper.putBoolean(sb.toString(), z);
        }

        public static void setFaceSwitchStatus(boolean z) {
            PreferenceHelper.putInt(PrefKeys.FACE_CLOUD_STATUS, z ? 2 : 0);
        }

        public static void setFirstSyncCompleted() {
            PreferenceHelper.putBoolean(PrefKeys.FACE_FIRST_SYNC_COMPLETED, true);
        }

        public static void setMarkMyselfResult(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.FACE_MARK_MYSELF_RESULT, z);
        }

        public static void setShowRecommendConfirmDialog(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.FACE_FIRST_CONFIRM_RECOMMEND_FACE, z);
        }
    }

    public static class Favorites {
        public static boolean isFirstTimeAddToFavorites() {
            boolean z = PreferenceHelper.getBoolean(PrefKeys.FIRST_TIME_ADD_TO_FAVORITES, true);
            if (z) {
                PreferenceHelper.putBoolean(PrefKeys.FIRST_TIME_ADD_TO_FAVORITES, false);
            }
            return z;
        }
    }

    public static class FeatureRedDot {
        public static boolean hasUpdateFeatureUsed(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.FEATURE_EVER_DISPLAYED);
            sb.append(str);
            return PreferenceHelper.getBoolean(sb.toString(), false);
        }

        public static boolean isFeatureRedDotValid(String str, long j) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.FEATURE_RED_DOT_VALID_START_TIME);
            sb.append(str);
            if (j >= PreferenceHelper.getLong(sb.toString(), 0)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(PrefKeys.FEATURE_RED_DOT_VALID_END_TIME);
                sb2.append(str);
                if (j <= PreferenceHelper.getLong(sb2.toString(), 0)) {
                    return true;
                }
            }
            return false;
        }

        public static boolean isUpdateFeatureStated(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.UPDATE_FEATURE_STATED);
            sb.append(str);
            return PreferenceHelper.getBoolean(sb.toString(), false);
        }

        public static void setFeatureRedDotValidTime(String str, long j, long j2) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.FEATURE_RED_DOT_VALID_START_TIME);
            sb.append(str);
            PreferenceHelper.putLong(sb.toString(), j);
            StringBuilder sb2 = new StringBuilder();
            sb2.append(PrefKeys.FEATURE_RED_DOT_VALID_END_TIME);
            sb2.append(str);
            PreferenceHelper.putLong(sb2.toString(), j2);
        }

        public static void setUpdateFeatureStated(String str, boolean z) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.UPDATE_FEATURE_STATED);
            sb.append(str);
            PreferenceHelper.putBoolean(sb.toString(), z);
        }

        public static void setUpdateFeatureUsed(String str, boolean z) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.FEATURE_EVER_DISPLAYED);
            sb.append(str);
            PreferenceHelper.putBoolean(sb.toString(), z);
        }
    }

    public static class FileDownload {
        public static int clampConnTimeout(int i) {
            return MiscUtil.clamp(i, 5000, 30000);
        }

        public static int getConnTimeout(DownloadType downloadType) {
            return MemoryPreferenceHelper.getInt(getConnTimeoutKey(downloadType), 5000);
        }

        private static String getConnTimeoutKey(DownloadType downloadType) {
            return String.format(Locale.US, PrefKeys.FILE_DOWNLOAD_CONN_TIMEOUT_FORMAT, new Object[]{downloadType.name()});
        }

        public static boolean setConnTimeout(DownloadType downloadType, int i) {
            int clampConnTimeout = clampConnTimeout(i);
            MemoryPreferenceHelper.putInt(getConnTimeoutKey(downloadType), clampConnTimeout);
            return i == clampConnTimeout;
        }
    }

    public static class HiddenAlbum {
        public static boolean isShowHiddenAlbum() {
            return PreferenceHelper.getBoolean(PrefKeys.HIDDEN_ALBUM_SHOW, false);
        }

        public static void setShowHiddenAlbum(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.HIDDEN_ALBUM_SHOW, z);
        }
    }

    public static class HomePage {
        public static String getHomePageImageIds() {
            return PreferenceHelper.getString(PrefKeys.HOME_PAGE_IMAGE_IDS, "");
        }

        public static void setHomePageImageIds(String str) {
            PreferenceHelper.putString(PrefKeys.HOME_PAGE_IMAGE_IDS, str);
        }
    }

    public static class LocalMode {
        public static synchronized boolean isOnlyShowLocalPhoto() {
            boolean z;
            synchronized (LocalMode.class) {
                z = false;
                if (PreferenceHelper.getBoolean(PrefKeys.LOCAL_MODE_ONLY_SHOW_LOCAL_PHOTO, false) && SyncUtil.existXiaomiAccount(GalleryApp.sGetAndroidContext())) {
                    z = true;
                }
            }
            return z;
        }

        public static synchronized void setOnlyShowLocalPhoto(boolean z) {
            synchronized (LocalMode.class) {
                PreferenceHelper.putBoolean(PrefKeys.LOCAL_MODE_ONLY_SHOW_LOCAL_PHOTO, z);
            }
        }
    }

    public static class LocationManager {
        public static int getLocationDetailsVersion(int i) {
            return PreferenceHelper.getInt(PrefKeys.ADDRESS_VERSION, i);
        }

        public static void remove() {
            PreferenceHelper.removeKey(PrefKeys.ADDRESS_VERSION);
        }

        public static void setLocationDetailsVersion(int i) {
            PreferenceHelper.putInt(PrefKeys.ADDRESS_VERSION, i);
        }
    }

    public static class MediaScanner {
        private static final long PRUNE_PROTECT_THRESHOLD_MILLIS = TimeUnit.DAYS.toMillis(3);

        public static boolean getEverCleanUnsupportUploadItems() {
            return PreferenceHelper.getBoolean(PrefKeys.SCANNER_EVER_CLEAN_UNSUPPORT_UPLOAD_ITEMS, false);
        }

        public static long getLastImagesScanTime() {
            long j = PreferenceHelper.getLong(PrefKeys.SCANNER_LAST_IMAGES_SCAN_TIME, 0);
            if (j != 0) {
                return j;
            }
            long currentTimeMillis = System.currentTimeMillis();
            setLastImagesScanTime(currentTimeMillis);
            return currentTimeMillis;
        }

        public static int getLastRefreshedIgnoreListVersion() {
            return PreferenceHelper.getInt(PrefKeys.SCANNER_LAST_REFRESHED_IGNORE_LIST_VERSION, 0);
        }

        public static long getLastVideosScanTime() {
            long j = PreferenceHelper.getLong(PrefKeys.SCANNER_LAST_VIDEOS_SCAN_TIME, 0);
            if (j != 0) {
                return j;
            }
            long currentTimeMillis = System.currentTimeMillis();
            setLastVideosScanTime(currentTimeMillis);
            return currentTimeMillis;
        }

        public static boolean isAlbumPruneProtected() {
            long j = PreferenceHelper.getLong(PrefKeys.SCANNER_LAST_LOCAL_RESTORE_TIME, 0);
            return j > 0 && System.currentTimeMillis() - j < PRUNE_PROTECT_THRESHOLD_MILLIS;
        }

        public static boolean isEverFillSpecialTypeFlags() {
            return PreferenceHelper.getBoolean(String.format(Locale.US, PrefKeys.SCANNER_EVER_FILL_SPECIAL_TYPE_FLAGS_PREFIX, new Object[]{Integer.valueOf(1)}), false);
        }

        public static boolean isEverRestoreSecretItems() {
            return PreferenceHelper.getBoolean(PrefKeys.SCANNER_EVER_RESTORE_SECRET_ITEMS, false);
        }

        public static void recordAlbumRestoreTimeMillis() {
            PreferenceHelper.putLong(PrefKeys.SCANNER_LAST_LOCAL_RESTORE_TIME, System.currentTimeMillis());
        }

        public static void setEverCleanUnsupportUploadItems() {
            PreferenceHelper.putBoolean(PrefKeys.SCANNER_EVER_CLEAN_UNSUPPORT_UPLOAD_ITEMS, true);
        }

        public static void setEverFillSpecialTypeFlags() {
            PreferenceHelper.putBoolean(String.format(Locale.US, PrefKeys.SCANNER_EVER_FILL_SPECIAL_TYPE_FLAGS_PREFIX, new Object[]{Integer.valueOf(1)}), true);
        }

        public static void setHasRestoredSecretItems() {
            PreferenceHelper.putBoolean(PrefKeys.SCANNER_EVER_RESTORE_SECRET_ITEMS, true);
        }

        public static void setLastImagesScanTime(long j) {
            PreferenceHelper.putLong(PrefKeys.SCANNER_LAST_IMAGES_SCAN_TIME, j);
        }

        public static void setLastRefreshedIgnoreListVersion(int i) {
            PreferenceHelper.putInt(PrefKeys.SCANNER_LAST_REFRESHED_IGNORE_LIST_VERSION, i);
        }

        public static void setLastVideosScanTime(long j) {
            PreferenceHelper.putLong(PrefKeys.SCANNER_LAST_VIDEOS_SCAN_TIME, j);
        }
    }

    public static class MonthView {
        public static boolean hasShownTip() {
            return PreferenceHelper.getBoolean(PrefKeys.MONTH_VIEW_HAS_SHOWN_TIP, false);
        }

        public static void setHasShownTip(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.MONTH_VIEW_HAS_SHOWN_TIP, z);
        }
    }

    public static class PhotoEditor {
        public static void addCropTipsShowTimes() {
            PreferenceHelper.putInt(PrefKeys.PHOTO_EDITOR_CROP_TIPS_TIMES, PreferenceHelper.getInt(PrefKeys.PHOTO_EDITOR_CROP_TIPS_TIMES, 0) + 1);
        }

        public static boolean isCropTipsShow() {
            return PreferenceHelper.getInt(PrefKeys.PHOTO_EDITOR_CROP_TIPS_TIMES, 0) < 3;
        }

        public static void setCompareTipShow() {
            PreferenceHelper.putBoolean(PrefKeys.PHOTO_EDITOR_COMPARE_TIP, true);
        }

        public static boolean shouldCompareTipShow() {
            return !PreferenceHelper.getBoolean(PrefKeys.PHOTO_EDITOR_COMPARE_TIP, false);
        }
    }

    public static class PhotoPrint {
        public static int getSilentInstallTimes() {
            return PreferenceHelper.getInt(PrefKeys.PHOTO_PRINT_SILENT_INSTALL_TIMES, 0);
        }

        public static void increaseSilentInstallTimes() {
            setSilentInstallTimes(getSilentInstallTimes() + 1);
        }

        public static boolean isPrintFirstClicked() {
            return PreferenceHelper.getBoolean(PrefKeys.PRINT_FIRST_CLICKED, true);
        }

        public static void setIsPrintFirstClicked(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.PRINT_FIRST_CLICKED, z);
        }

        public static void setSilentInstallTimes(int i) {
            PreferenceHelper.putInt(PrefKeys.PHOTO_PRINT_SILENT_INSTALL_TIMES, i);
        }
    }

    public static class PhotoSlim {
        public static boolean isFirstUsePhotoSlim() {
            return PreferenceHelper.getBoolean(PrefKeys.PHOTO_SLIM_FIRST_USE, true);
        }

        public static void setIsFirstUsePhotoSlim(Boolean bool) {
            PreferenceHelper.putBoolean(PrefKeys.PHOTO_SLIM_FIRST_USE, bool.booleanValue());
        }
    }

    @Keep
    public interface PrefKeys {
        public static final String ADDRESS_VERSION = "address_version";
        public static final String ADD_TO_ALBUM_DELETE_ORIGIN_CHECKED = "add_to_album_delete_origin_checked";
        public static final String ALBUM_CACHED_SORT_BY_MODIFY_ALBUM_IDS = "key_cached_album_sort_by_modify_album_ids";
        public static final String ALBUM_CACHED_SORT_BY_MODIFY_ALBUM_PATHS = "key_cached_album_sort_by_modify_album_paths";
        public static final String ALBUM_NEXT_FORCE_TOP_TIME = "key_next_force_top_create_time";
        public static final String ALBUM_VIRTUAL_ALBUM_PREFIX = "key_virtual_album_prefix_%d";
        public static final String ALBUM_VISIT_PREFIX = "key_album_visit_prefix_%d";
        public static final String ASSISTANT_FIRST_SHOW_IMAGE_SELECTION = "assistant_first_show_image_selection";
        public static final String ASSISTANT_HAS_CARD_EVER = "assistant_has_card_ever";
        public static final String ASSISTANT_IMAGE_SELECTION_FUNCTION = "assistant_image_selection_function";
        public static final String ASSISTANT_LAST_GUARANTEE_TRIGGER_TIME = "assistant_last_guarantee_trigger_time";
        public static final String ASSISTANT_LAST_IMAGE_FEATURE_TASK_TIME = "assistant_last_image_feature_task_time";
        public static final String ASSISTANT_LAST_TRIGGER_TIME = "assistant_last_trigger_time";
        public static final String ASSISTANT_STORY_FUNCTION = "assistant_story_function";
        public static final String BABY_SERVER_TAG_SAVE_PREFIX = "save_server_tag_of_new_image_prefix";
        public static final String CARD_ADDED_TIME = "card_added_time";
        public static final String CARD_OPERATION_SYNC_TOKEN = "card_operation_sync_token";
        public static final String CARD_OPERATION_WATERMARK = "card_operation_watermark";
        public static final String CLOUD_CONTROL_LAST_REQUEST_SUCCEED_TIME = "cloud_control_last_request_succeed_time";
        public static final String CLOUD_CONTROL_LAST_REQUEST_TIME = "cloud_control_last_request_time";
        public static final String CLOUD_CONTROL_PUSH_TAG = "cloud_control_push_tag";
        public static final String CLOUD_CONTROL_SYNC_TOKEN = "cloud_control_sync_token";
        public static final String CLOUD_GUIDE_EVER_NOTIFY_SLIM_RESULT = "ever_notify_slim_result";
        public static final String CLOUD_GUIDE_SLIM_NOTIFICATION_CLICKED = "slim_notification_clicked";
        public static final String CLOUD_GUIDE_SLIM_NOTIFICATION_TIMES = "slim_notification_times";
        public static final String CLOUD_GUIDE_TOPBAR_AUTO_SHOW_TIMES = "cloud_guide_topbar_auto_show_times";
        public static final String CLOUD_GUIDE_TOPBAR_CLICKED = "cloud_guide_topbar_clicked";
        public static final String CLOUD_GUIDE_TOPBAR_LAST_AUTO_SHOW_TIME = "cloud_guide_topbar_last_auto_show_time";
        public static final String CLOUD_GUIDE_TOPBAR_LAST_TEXT_ID = "cloud_guide_topbar_last_text_id";
        public static final String DATABASE_EVER_UPDATE_CAMERA_ALBUM_ATTRIBUTES = "ever_update_camera_album_attributes";
        public static final String DATABASE_EVER_UPGRADE_ALBUM_EDITED_COLUMNS = "ever_upgrade_album_edited_columns";
        public static final String DATABASE_VIEW_VERSION_PREFIX = "view_version_prefix_%s";
        public static final String DELETE_FIRST_DELETE_FROM_ALBUM = "first_delete_from_album";
        public static final String DELETE_FIRST_DELETE_FROM_HOMEPAGE = "first_delete_from_homepage";
        public static final String FACE_CLOUD_STATUS = "cloud_face_status";
        public static final String FACE_CLOUD_STATUS_NEXT_CHECK_TIME = "cloud_face_status_retry_time";
        public static final String FACE_CLOUD_STATUS_SYNC_TIME = "cloud_face_status_sync_time";
        public static final String FACE_FEATURE_SWITCH_PENDING = "face_feature_switch_pending";
        public static final String FACE_FIRST_CONFIRM_RECOMMEND_FACE = "first_confirm_recommend_face";
        public static final String FACE_FIRST_SYNC_COMPLETED = "face_first_sync_completed";
        public static final String FACE_HAS_TOAST_SET_GROUP = "has_toast_how_to_set_group";
        public static final String FACE_MARK_MYSELF_RESULT = "face_mark_myself_result";
        public static final String FACE_MARK_MYSELF_TRIGGERED_COUNT = "face_mark_myself_triggered_count";
        public static final String FACE_RECOMMEND_GROUP_HIDDEN = "face_recommend_group_hidden";
        public static final String FACE_URL_FOR_QUEUING = "face_url_for_queuing";
        public static final String FACE_URL_FOR_WAITING = "face_url_for_waiting";
        public static final String FEATURE_EVER_DISPLAYED = "feature_ever_displayed";
        public static final String FEATURE_EVER_USED_FORMATTER = "new_feature_ever_used_%s";
        public static final String FEATURE_RED_DOT_VALID_END_TIME = "feature_red_dot_valid_end_time";
        public static final String FEATURE_RED_DOT_VALID_START_TIME = "feature_red_dot_valid_start_time";
        public static final String FILE_DOWNLOAD_CONN_TIMEOUT_FORMAT = "file_download_conn_timeout_%s";
        public static final String FIRST_TIME_ADD_TO_FAVORITES = "first_time_add_to_favorites";
        public static final String HAS_CLEAN_FILE_NAME_AND_PATH = "has_clean_file_name_and_path";
        @AutoBackup
        public static final String HIDDEN_ALBUM_SHOW = "show_hidden_album";
        public static final String HOME_PAGE_IMAGE_IDS = "home_page_image_ids";
        @AutoBackup
        public static final String LOCAL_MODE_ONLY_SHOW_LOCAL_PHOTO = "only_show_local_photo";
        public static final String LOCATIONS_ALBUM_COVER_SERVER_IDS = "locations_album_cover_server_ids";
        public static final String MONTH_VIEW_HAS_SHOWN_TIP = "month_view_has_shown_tip";
        public static final String PHOTO_EDITOR_COMPARE_TIP = "photo_editor_compare_tip";
        public static final String PHOTO_EDITOR_CROP_TIPS_TIMES = "photo_editor_crop_tips_times";
        public static final String PHOTO_EDITOR_DOODLE_COLOR_LOCATION = "photo_editor_doodle_color_location";
        public static final String PHOTO_PRINT_SILENT_INSTALL_TIMES = "photo_print_silent_install_times";
        public static final String PHOTO_SLIM_FIRST_USE = "photo_slim_first_use";
        public static final String PRINT_FIRST_CLICKED = "print_first_clicked";
        public static final String PROJECTION_DEVICE_KEY_PREFIX = "big_screen_device_key_prefix_";
        public static final String SCANNER_EVER_CLEAN_UNSUPPORT_UPLOAD_ITEMS = "ever_clean_unsupport_upload_items";
        public static final String SCANNER_EVER_FILL_SPECIAL_TYPE_FLAGS_PREFIX = "ever_fill_special_type_flags_v%d";
        public static final String SCANNER_EVER_RESTORE_SECRET_ITEMS = "ever_restore_secret_items";
        public static final String SCANNER_LAST_IMAGES_SCAN_TIME = "last_images_scan_time";
        public static final String SCANNER_LAST_LOCAL_RESTORE_TIME = "last_local_restore_time";
        public static final String SCANNER_LAST_REFRESHED_IGNORE_LIST_VERSION = "last_refreshed_ignore_list_version";
        public static final String SCANNER_LAST_VIDEOS_SCAN_TIME = "last_videos_scan_time";
        public static final String SEARCH_CACHE_STATUS = "search_cache_status";
        public static final String SEARCH_FEEDBACK_SHOULD_SHOW_POLICY = "search_feedback_task_should_show_policy";
        public static final String SEARCH_FEEDBACK_TASK_REPORTED_TAGS = "search_feedback_task_reported_tags";
        public static final String SEARCH_USER_LAST_REQUEST_OPEN_TIME = "search_user_last_request_open_time";
        public static final String SEARCH_USER_SWITCH_STATUS = "search_user_switch_status";
        public static final String SECRET_FIRST_ADD_SECRET = "first_add_secret";
        public static final String SECRET_FIRST_ADD_SECRET_VIDEO = "first_add_secret_video";
        public static final String SECRET_FIRST_USE_PRIVACY_PASSWORD = "first_use_privacy_password";
        public static final String SERVER_CONTROL_LIST_EVER_CLEAR_OLD_FILE = "ever_clear_old_file";
        public static final String SETTINGS_SYNC_FIRST_UPLOAD_COMPLETE = "settings_sync_first_upload_complete";
        public static final String SETTINGS_SYNC_IS_DIRTY = "settings_sync_is_dirty";
        @AutoBackup
        public static final String SLIDESHOW_INTERVAL = "slideshow_interval";
        public static final String SMART_VIDEO_GUIDE_COMPLETED = "smart_video_guide_completed";
        public static final String SYNC_ACTIVE_PULL_TIMES = "active_pull_times";
        public static final String SYNC_AUTO_DOWNLOAD = "auto_download";
        public static final String SYNC_AUTO_DOWNLOAD_TIME = "auto_download_time";
        @AutoBackup
        public static final String SYNC_BACKUP_ONLY_IN_WIFI = "backup_only_in_wifi";
        public static final String SYNC_COMPLETELY_FINISH = "sync_completely_finish";
        public static final String SYNC_DEVICE_STORAGE_LOW = "device_storage_low";
        public static final String SYNC_DOWNLOAD_TYPE = "download_type";
        public static final String SYNC_EVER_AUTO_DOWNLOADED = "ever_auto_download";
        public static final String SYNC_EVER_REFILL_LOCAL_GROUP_ID = "ever_refill_local_group_id";
        public static final String SYNC_EVER_RESET_SLIM_SWITCH = "ever_reset_slim_switch";
        public static final String SYNC_EVER_SYNCED_SYSTEM_ALBUM = "ever_synced_system_album";
        public static final String SYNC_FIRST_SYNC_FAIL_COUNT = "first_sync_fail_count";
        public static final String SYNC_FIRST_SYNC_START_TIME = "first_sync_start_time";
        public static final String SYNC_IS_PLUGGED = "is_plugged";
        public static final String SYNC_LAST_SYNC_TIMESTAMP = "last_sync_timestamp";
        public static final String SYNC_POWER_CAN_SYNC = "power_can_sync";
        @AutoBackup
        public static final String SYNC_SLIM_AFTER_BACKUPED = "slim_after_backuped_v2";
        public static final String TAGS_ALBUM_COVER_SERVER_IDS = "tags_album_cover_server_ids";
        public static final String TOP_BAR_CANNOT_SYNC_PREFIX = "top_bar_cannot_sync_";
        public static final String TOP_BAR_LAST_SYNC_STATUS = "top_bar_last_sync_status";
        public static final String UNIQUE_ID = "unique_id";
        public static final String UPDATE_FEATURE_STATED = "update_feature_stated";
        public static final String UPGRADE_OLD_CACHE_CLEANED = "old_cache_cleaned";
        public static final String UPGRADE_OLD_PREFERENCES_TRANSFERED = "old_preferences_transfered";
        public static final String UPGRADE_OLD_THUMBNAIL_TRANSFERED = "old_thumbnail_transfered";
    }

    public static class SampleStatistic extends com.miui.gallery.preference.BaseGalleryPreferences.SampleStatistic {
    }

    public static class Search {
        public static String getFeedbackReportedTags() {
            return PreferenceHelper.getString(PrefKeys.SEARCH_FEEDBACK_TASK_REPORTED_TAGS, null);
        }

        public static long getUserLastRequestOpenTime() {
            return PreferenceHelper.getLong(PrefKeys.SEARCH_USER_LAST_REQUEST_OPEN_TIME, -1);
        }

        public static boolean isSearchCacheStatusOpen(boolean z) {
            return PreferenceHelper.getBoolean(PrefKeys.SEARCH_CACHE_STATUS, z);
        }

        public static boolean isUserSearchSwitchOpen(boolean z) {
            return PreferenceHelper.getBoolean(PrefKeys.SEARCH_USER_SWITCH_STATUS, z);
        }

        public static boolean isUserSearchSwitchSet() {
            return PreferenceHelper.contains(PrefKeys.SEARCH_USER_SWITCH_STATUS);
        }

        public static void remove() {
            removeIsUserSearchSwitchOpen();
            PreferenceHelper.removeKey(PrefKeys.SEARCH_FEEDBACK_TASK_REPORTED_TAGS);
            PreferenceHelper.removeKey(PrefKeys.SEARCH_USER_LAST_REQUEST_OPEN_TIME);
            removeSearchCacheStatus();
        }

        public static void removeIsUserSearchSwitchOpen() {
            PreferenceHelper.removeKey(PrefKeys.SEARCH_USER_SWITCH_STATUS);
        }

        public static void removeSearchCacheStatus() {
            PreferenceHelper.removeKey(PrefKeys.SEARCH_CACHE_STATUS);
        }

        public static void setFeedbackReportedTags(String str) {
            PreferenceHelper.putString(PrefKeys.SEARCH_FEEDBACK_TASK_REPORTED_TAGS, str);
        }

        public static void setIsSearchCacheStatusOpen(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SEARCH_CACHE_STATUS, z);
        }

        public static void setIsUserSearchSwitchOpen(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SEARCH_USER_SWITCH_STATUS, z);
        }

        public static void setShouldShowFeedbackPolicy(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SEARCH_FEEDBACK_SHOULD_SHOW_POLICY, z);
        }

        public static void setUserLastRequestOpenTime(long j) {
            PreferenceHelper.putLong(PrefKeys.SEARCH_USER_LAST_REQUEST_OPEN_TIME, j);
        }

        public static boolean shouldShowFeedbackPolicy() {
            return PreferenceHelper.getBoolean(PrefKeys.SEARCH_FEEDBACK_SHOULD_SHOW_POLICY, true);
        }
    }

    public static class SearchBackedAlbum {
        public static List<String> getLocationsAlbumServerIds() {
            String string = PreferenceHelper.getString(PrefKeys.LOCATIONS_ALBUM_COVER_SERVER_IDS, null);
            if (string != null) {
                return Splitter.on(",").splitToList(string);
            }
            return null;
        }

        public static List<String> getTagsAlbumServerIds() {
            String string = PreferenceHelper.getString(PrefKeys.TAGS_ALBUM_COVER_SERVER_IDS, null);
            if (string != null) {
                return Splitter.on(",").splitToList(string);
            }
            return null;
        }

        public static void setLocationsAlbumServerIds(List<String> list) {
            PreferenceHelper.putString(PrefKeys.LOCATIONS_ALBUM_COVER_SERVER_IDS, MiscUtil.isValid(list) ? Joiner.on(",").join((Iterable<?>) list) : null);
        }

        public static void setTagsAlbumServerIds(List<String> list) {
            PreferenceHelper.putString(PrefKeys.TAGS_ALBUM_COVER_SERVER_IDS, MiscUtil.isValid(list) ? Joiner.on(",").join((Iterable<?>) list) : null);
        }
    }

    public static class Secret {
        public static boolean isFirstAddSecret() {
            return PreferenceHelper.getBoolean(PrefKeys.SECRET_FIRST_ADD_SECRET, true);
        }

        public static boolean isFirstAddSecretVideo() {
            return PreferenceHelper.getBoolean(PrefKeys.SECRET_FIRST_ADD_SECRET_VIDEO, true);
        }

        public static boolean isFirstUsePrivacyPassword() {
            return PreferenceHelper.getBoolean(PrefKeys.SECRET_FIRST_USE_PRIVACY_PASSWORD, true);
        }

        public static void setFirstAddSecretVideo(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SECRET_FIRST_ADD_SECRET_VIDEO, z);
        }

        public static void setIsFirstAddSecret(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SECRET_FIRST_ADD_SECRET, z);
        }

        public static void setIsFirstUsePrivacyPassword(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SECRET_FIRST_USE_PRIVACY_PASSWORD, z);
        }
    }

    public static class SettingsSync {
        public static boolean isDirty() {
            return PreferenceHelper.getBoolean(PrefKeys.SETTINGS_SYNC_IS_DIRTY, false);
        }

        public static boolean isFirstUploadComplete() {
            return PreferenceHelper.getBoolean(PrefKeys.SETTINGS_SYNC_FIRST_UPLOAD_COMPLETE, false);
        }

        public static void markDirty(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SETTINGS_SYNC_IS_DIRTY, z);
        }

        public static void remove() {
            PreferenceHelper.removeKey(PrefKeys.SETTINGS_SYNC_IS_DIRTY);
            PreferenceHelper.removeKey(PrefKeys.SETTINGS_SYNC_FIRST_UPLOAD_COMPLETE);
        }

        public static void setFirstUploadComplete() {
            PreferenceHelper.putBoolean(PrefKeys.SETTINGS_SYNC_FIRST_UPLOAD_COMPLETE, true);
        }
    }

    public static class SlideShow {
        public static int getSlideShowInterval() {
            return PreferenceHelper.getInt(PrefKeys.SLIDESHOW_INTERVAL, 3);
        }

        public static void setSlideShowInterval(int i) {
            PreferenceHelper.putInt(PrefKeys.SLIDESHOW_INTERVAL, i);
        }
    }

    public static class SmartVideoGuide {
        public static boolean hasGuided() {
            return PreferenceHelper.getBoolean(PrefKeys.SMART_VIDEO_GUIDE_COMPLETED, false);
        }

        public static void setSmartVideoGuided(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SMART_VIDEO_GUIDE_COMPLETED, z);
        }
    }

    public static class Sync {
        private static final boolean DEFAULT_AUTO_BATCH_DOWNLOAD = CloudControlStrategyHelper.getSyncStrategy().isAutoDownload();
        private static final String DEFAULT_DOWNLOAD_TYPE = (CloudControlStrategyHelper.getSyncStrategy().getAutoDownloadType() == 0 ? "thumbnail" : "origin");

        public static void clearActivePullTimes() {
            PreferenceHelper.removeKey(PrefKeys.SYNC_ACTIVE_PULL_TIMES);
        }

        public static void clearFirstSyncFailCount() {
            PreferenceHelper.removeKey(PrefKeys.SYNC_FIRST_SYNC_FAIL_COUNT);
        }

        public static int getActivePullTimes() {
            return PreferenceHelper.getInt(PrefKeys.SYNC_ACTIVE_PULL_TIMES, 0);
        }

        public static long getAutoDownloadTime() {
            return PreferenceHelper.getLong(PrefKeys.SYNC_AUTO_DOWNLOAD_TIME, -1);
        }

        public static boolean getBackupOnlyInWifi() {
            if (!FeatureUtil.isSupportBackupOnlyWifi()) {
                return true;
            }
            return PreferenceHelper.getBoolean(PrefKeys.SYNC_BACKUP_ONLY_IN_WIFI, true);
        }

        public static DownloadType getDownloadType() {
            String string = PreferenceHelper.getString(PrefKeys.SYNC_DOWNLOAD_TYPE, DEFAULT_DOWNLOAD_TYPE);
            if ("thumbnail".equals(string)) {
                return DownloadType.THUMBNAIL;
            }
            if ("origin".equals(string)) {
                return DownloadType.ORIGIN;
            }
            return null;
        }

        public static boolean getEverRefillLocalGroupId() {
            return PreferenceHelper.getBoolean(PrefKeys.SYNC_EVER_REFILL_LOCAL_GROUP_ID, false);
        }

        public static boolean getEverSyncedSystemAlbum() {
            return PreferenceHelper.getBoolean(PrefKeys.SYNC_EVER_SYNCED_SYSTEM_ALBUM, false);
        }

        public static int getFirstSyncFailCount() {
            return PreferenceHelper.getInt(PrefKeys.SYNC_FIRST_SYNC_FAIL_COUNT, 0);
        }

        public static long getFirstSyncStartTime() {
            return PreferenceHelper.getLong(PrefKeys.SYNC_FIRST_SYNC_START_TIME, 0);
        }

        public static boolean getIsPlugged() {
            return MemoryPreferenceHelper.getBoolean(PrefKeys.SYNC_IS_PLUGGED, false);
        }

        public static long getLastSyncTimestamp() {
            return MemoryPreferenceHelper.getLong(PrefKeys.SYNC_LAST_SYNC_TIMESTAMP, 0);
        }

        public static boolean getPowerCanSync() {
            return MemoryPreferenceHelper.getBoolean(PrefKeys.SYNC_POWER_CAN_SYNC, false);
        }

        public static boolean getSyncCompletelyFinish() {
            return PreferenceHelper.getBoolean(PrefKeys.SYNC_COMPLETELY_FINISH, false);
        }

        public static void increaseActivePullTimes() {
            PreferenceHelper.putInt(PrefKeys.SYNC_ACTIVE_PULL_TIMES, getActivePullTimes() + 1);
        }

        public static void increaseFirstSyncFailCount() {
            PreferenceHelper.putInt(PrefKeys.SYNC_FIRST_SYNC_FAIL_COUNT, getFirstSyncFailCount() + 1);
        }

        public static boolean isAutoDownload() {
            return PreferenceHelper.getBoolean(PrefKeys.SYNC_AUTO_DOWNLOAD, DEFAULT_AUTO_BATCH_DOWNLOAD);
        }

        public static boolean isDeviceStorageLow() {
            return MemoryPreferenceHelper.getBoolean(PrefKeys.SYNC_DEVICE_STORAGE_LOW, false);
        }

        public static boolean isEverAutoDownloaded() {
            return PreferenceHelper.getBoolean(PrefKeys.SYNC_EVER_AUTO_DOWNLOADED, false);
        }

        public static void remove() {
            PreferenceHelper.getPreferences().edit().remove(PrefKeys.SYNC_BACKUP_ONLY_IN_WIFI).remove(PrefKeys.SYNC_COMPLETELY_FINISH).remove(PrefKeys.SYNC_SLIM_AFTER_BACKUPED).remove(PrefKeys.SYNC_EVER_SYNCED_SYSTEM_ALBUM).remove(PrefKeys.SYNC_EVER_AUTO_DOWNLOADED).remove(PrefKeys.SYNC_AUTO_DOWNLOAD_TIME).remove(PrefKeys.SYNC_DOWNLOAD_TYPE).remove(PrefKeys.SYNC_AUTO_DOWNLOAD).remove(PrefKeys.SYNC_ACTIVE_PULL_TIMES).remove(PrefKeys.SYNC_FIRST_SYNC_START_TIME).remove(PrefKeys.SYNC_FIRST_SYNC_FAIL_COUNT).apply();
        }

        public static void setAutoDownload(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SYNC_AUTO_DOWNLOAD, z);
        }

        public static void setAutoDownloadTime(long j) {
            PreferenceHelper.putLong(PrefKeys.SYNC_AUTO_DOWNLOAD_TIME, j);
        }

        public static void setBackupOnlyInWifi(boolean z) {
            if (FeatureUtil.isSupportBackupOnlyWifi()) {
                PreferenceHelper.putBoolean(PrefKeys.SYNC_BACKUP_ONLY_IN_WIFI, z);
            }
        }

        public static void setDeviceStorageLow(boolean z) {
            MemoryPreferenceHelper.putBoolean(PrefKeys.SYNC_DEVICE_STORAGE_LOW, z);
        }

        public static void setDownloadType(DownloadType downloadType) {
            DownloadType downloadType2 = getDownloadType();
            if (downloadType == DownloadType.THUMBNAIL) {
                PreferenceHelper.putString(PrefKeys.SYNC_DOWNLOAD_TYPE, "thumbnail");
            } else if (downloadType == DownloadType.ORIGIN) {
                PreferenceHelper.putString(PrefKeys.SYNC_DOWNLOAD_TYPE, "origin");
            }
            if (downloadType2 != downloadType) {
                PreferenceHelper.removeKey(PrefKeys.SYNC_AUTO_DOWNLOAD_TIME);
                PreferenceHelper.removeKey(PrefKeys.SYNC_EVER_AUTO_DOWNLOADED);
            }
        }

        public static void setEverAutoDownloaded() {
            PreferenceHelper.putBoolean(PrefKeys.SYNC_EVER_AUTO_DOWNLOADED, true);
        }

        public static void setEverRefillLocalGroupId() {
            PreferenceHelper.putBoolean(PrefKeys.SYNC_EVER_REFILL_LOCAL_GROUP_ID, true);
        }

        public static void setEverSyncedSystemAlbum() {
            PreferenceHelper.putBoolean(PrefKeys.SYNC_EVER_SYNCED_SYSTEM_ALBUM, true);
        }

        public static void setFirstSyncStartTime(long j) {
            if (getFirstSyncStartTime() <= 0 && j > 0) {
                PreferenceHelper.putLong(PrefKeys.SYNC_FIRST_SYNC_START_TIME, j);
            }
        }

        public static void setIsPlugged(boolean z) {
            MemoryPreferenceHelper.putBoolean(PrefKeys.SYNC_IS_PLUGGED, z);
        }

        public static void setLastSyncTimestamp(long j) {
            MemoryPreferenceHelper.putLong(PrefKeys.SYNC_LAST_SYNC_TIMESTAMP, j);
        }

        public static void setPowerCanSync(boolean z) {
            MemoryPreferenceHelper.putBoolean(PrefKeys.SYNC_POWER_CAN_SYNC, z);
        }

        public static void setSyncCompletelyFinish(boolean z) {
            PreferenceHelper.putBoolean(PrefKeys.SYNC_COMPLETELY_FINISH, z);
        }
    }

    public static class TopBar {
        public static SyncStatus getLastSyncStatus() {
            return SyncStatus.fromName(MemoryPreferenceHelper.getString(PrefKeys.TOP_BAR_LAST_SYNC_STATUS, SyncStatus.UNKNOWN_ERROR.name()));
        }

        private static String getSyncStatusTipKey(SyncStatus syncStatus) {
            StringBuilder sb = new StringBuilder();
            sb.append(PrefKeys.TOP_BAR_CANNOT_SYNC_PREFIX);
            sb.append(syncStatus.name());
            return sb.toString();
        }

        public static boolean hasShowedSyncStatusTip(SyncStatus syncStatus) {
            return PreferenceHelper.getBoolean(getSyncStatusTipKey(syncStatus), false);
        }

        static void remove() {
            Editor edit = PreferenceHelper.getPreferences().edit();
            for (String str : PreferenceHelper.getPreferences().getAll().keySet()) {
                if (!TextUtils.isEmpty(str) && str.startsWith(PrefKeys.TOP_BAR_CANNOT_SYNC_PREFIX)) {
                    edit.remove(str);
                }
            }
            edit.apply();
        }

        public static void saveLastSyncStatus(SyncStatus syncStatus) {
            MemoryPreferenceHelper.putString(PrefKeys.TOP_BAR_LAST_SYNC_STATUS, syncStatus.name());
        }

        public static void setHasShowedSyncStatusTip(SyncStatus syncStatus, boolean z) {
            PreferenceHelper.putBoolean(getSyncStatusTipKey(syncStatus), z);
        }
    }

    public static class UUID {
        public static String get() {
            String string = PreferenceHelper.getString(PrefKeys.UNIQUE_ID, null);
            if (!TextUtils.isEmpty(string)) {
                return string;
            }
            String uuid = java.util.UUID.randomUUID().toString();
            PreferenceHelper.putString(PrefKeys.UNIQUE_ID, uuid);
            return uuid;
        }
    }

    public static List<String> getAutoBackupPrefKeys() {
        Field[] declaredFields = PrefKeys.class.getDeclaredFields();
        if (declaredFields == null) {
            return null;
        }
        LinkedList linkedList = new LinkedList();
        try {
            for (Field field : declaredFields) {
                if (field.isAnnotationPresent(AutoBackup.class)) {
                    linkedList.add(field.get(null).toString());
                }
            }
        } catch (IllegalAccessException e) {
            Log.e("GalleryPreferences", (Throwable) e);
        } catch (Exception e2) {
            Log.e("GalleryPreferences", (Throwable) e2);
        }
        return linkedList;
    }

    public static void sRemoveCloudSettings() {
        Face.remove();
        Sync.remove();
        CloudGuide.remove();
        TopBar.remove();
        Search.remove();
        CloudControl.remove();
        SettingsSync.remove();
        LocationManager.remove();
        Editor edit = PreferenceHelper.getPreferences().edit();
        for (String str : PreferenceHelper.getPreferences().getAll().keySet()) {
            if (Baby.isMinServerTagOfNewPhotoKey(str)) {
                edit.remove(str);
            }
        }
        edit.apply();
        MemoryPreferenceHelper.clear();
    }
}
