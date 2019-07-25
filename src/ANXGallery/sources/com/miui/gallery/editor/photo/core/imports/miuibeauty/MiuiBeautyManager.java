package com.miui.gallery.editor.photo.core.imports.miuibeauty;

import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.BeautyProcessorManager;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;

public class MiuiBeautyManager {
    public static MiuiBeautyEffect[] getBeautyEffects() {
        BeautyParameterType[] supportedBeautyParamTypes = BeautyProcessorManager.INSTANCE.getBeautyProcessor().getSupportedBeautyParamTypes();
        int length = supportedBeautyParamTypes.length;
        int i = length;
        for (BeautyParameterType beautyParameterType : supportedBeautyParamTypes) {
            if (BeautyParameterType.RUDDY_STRENGTH == beautyParameterType || BeautyParameterType.IRIS_SHINE_RATIO == beautyParameterType) {
                i--;
            }
        }
        MiuiBeautyEffect[] miuiBeautyEffectArr = null;
        if (supportedBeautyParamTypes != null && i > 0) {
            miuiBeautyEffectArr = new MiuiBeautyEffect[i];
            for (int i2 = 0; i2 < supportedBeautyParamTypes.length; i2++) {
                switch (supportedBeautyParamTypes[i2]) {
                    case SHRINK_FACE_RATIO:
                        miuiBeautyEffectArr[0] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_face_thin), 1, supportedBeautyParamTypes[i2]);
                        break;
                    case WHITEN_STRENGTH:
                        miuiBeautyEffectArr[1] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_skin_white), 2, supportedBeautyParamTypes[i2]);
                        break;
                    case SMOOTH_STRENGTH:
                        miuiBeautyEffectArr[2] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_smooth), 3, supportedBeautyParamTypes[i2]);
                        break;
                    case ENLARGE_EYE_RATIO:
                        miuiBeautyEffectArr[3] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_eye_large), 4, supportedBeautyParamTypes[i2]);
                        break;
                    case BRIGHT_EYE_RATIO:
                        miuiBeautyEffectArr[4] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_eye_bright), 5, supportedBeautyParamTypes[i2]);
                        break;
                    case DEPOUCH_RATIO:
                        miuiBeautyEffectArr[5] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_eraser_pouch), 6, supportedBeautyParamTypes[i2]);
                        break;
                    case DEBLEMISH:
                        miuiBeautyEffectArr[6] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_eraser_blemish), 7, supportedBeautyParamTypes[i2]);
                        break;
                    case RELIGHTING_RATIO:
                        miuiBeautyEffectArr[7] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_relighting), 8, supportedBeautyParamTypes[i2]);
                        break;
                    case SHRINK_NOSE_RATIO:
                        miuiBeautyEffectArr[8] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_nose_thin), 9, supportedBeautyParamTypes[i2]);
                        break;
                    case LIP_BEAUTY_RATIO:
                        miuiBeautyEffectArr[9] = new MiuiBeautyEffect(GalleryApp.sGetAndroidContext().getString(R.string.photo_editor_miui_beauty_menu_lip_beauty), 10, supportedBeautyParamTypes[i2]);
                        break;
                }
            }
        }
        return miuiBeautyEffectArr;
    }
}
