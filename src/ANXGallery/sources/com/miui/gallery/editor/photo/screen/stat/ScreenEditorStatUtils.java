package com.miui.gallery.editor.photo.screen.stat;

import com.miui.gallery.editor.photo.screen.core.ScreenRenderData;
import com.miui.gallery.editor.photo.screen.entity.ScreenNavigatorData;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.HashMap;

public class ScreenEditorStatUtils {
    public static final String TYPE_LONG_SCREEN_EDITOR = "long_screen_editor";
    public static final String TYPE_NORMAL_EDITOR = "normal_editor";

    private static String getNavName(ScreenNavigatorData screenNavigatorData) {
        switch (screenNavigatorData.id) {
            case 1:
                return "send";
            case 2:
                return "doodle";
            case 3:
                return "text";
            case 4:
                return "mosaic";
            case 5:
                return "crop";
            default:
                return "no_define";
        }
    }

    public static void statBtnCancelClick(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, z ? TYPE_LONG_SCREEN_EDITOR : TYPE_NORMAL_EDITOR);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "btn_cancel_click", hashMap);
    }

    public static void statBtnDoneClick(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, z ? TYPE_LONG_SCREEN_EDITOR : TYPE_NORMAL_EDITOR);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "btn_done_click", hashMap);
    }

    public static void statDoneFragmentClick(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("clickItem", str);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "done_fragment_click", hashMap);
    }

    public static void statDoodleColorChoose(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("colorProgress", String.valueOf(i));
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "doodle_color_choose", hashMap);
    }

    public static void statDoodleMenuItemClick(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("position", String.valueOf(i));
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "doodle_menu_item_click", hashMap);
    }

    public static void statDoodleSizeClick(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("size", str);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "doodle_size_click", hashMap);
    }

    public static void statMosaicMenuItemClick(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("position", String.valueOf(i));
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "mosaic_menu_item_click", hashMap);
    }

    public static void statMosaicSizeChoose(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("sizeProgress", String.valueOf(i));
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "mosaic_size_choose", hashMap);
    }

    public static void statNavItemClick(boolean z, ScreenNavigatorData screenNavigatorData, boolean z2) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, z ? TYPE_LONG_SCREEN_EDITOR : TYPE_NORMAL_EDITOR);
        hashMap.put("nav", getNavName(screenNavigatorData));
        hashMap.put("showMenu", z2 ? "true" : "false");
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "nav_item_click", hashMap);
    }

    public static void statRevertClick(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, z ? TYPE_LONG_SCREEN_EDITOR : TYPE_NORMAL_EDITOR);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "revert_click", hashMap);
    }

    public static void statRevokeClick(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, z ? TYPE_LONG_SCREEN_EDITOR : TYPE_NORMAL_EDITOR);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "revoke_click", hashMap);
    }

    public static void statShowExportFragment(ScreenRenderData screenRenderData, boolean z) {
        HashMap hashMap = new HashMap();
        screenRenderData.putStat(hashMap);
        hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, z ? TYPE_LONG_SCREEN_EDITOR : TYPE_NORMAL_EDITOR);
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "export_saving", hashMap);
    }

    public static void statTextMenuItemClick(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("position", String.valueOf(i));
        ScreenEditorSamplingStatHelper.recordCountEvent("ScreenEditor", "text_menu_item_click", hashMap);
    }
}
