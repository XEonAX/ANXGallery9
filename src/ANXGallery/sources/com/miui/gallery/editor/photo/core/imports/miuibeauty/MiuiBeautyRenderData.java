package com.miui.gallery.editor.photo.core.imports.miuibeauty;

import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.gallery.editor.photo.core.RenderData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class MiuiBeautyRenderData extends RenderData {
    public List<BeautyParams> mBeautyParamsList = new ArrayList();

    public class BeautyParams {
        public int mBrightEyeRatio;
        public int mDeblemish;
        public int mDepouchRatio;
        public int mEyeLarge;
        public int mFaceThin;
        public int mIrisShineRatio;
        public int mLipBeautyRatio;
        public int mNoseThin;
        public int mRelightingRatio;
        public int mRuddyRatio;
        public int mSmooth;
        public int mWhite;

        public BeautyParams(Map<BeautyParameterType, Float> map) {
            Iterator it;
            for (Entry value : map.entrySet()) {
                int round = Math.round(((Float) value.getValue()).floatValue());
                switch ((BeautyParameterType) ((Entry) it.next()).getKey()) {
                    case ENLARGE_EYE_RATIO:
                        this.mEyeLarge = round;
                        break;
                    case SHRINK_FACE_RATIO:
                        this.mFaceThin = round;
                        break;
                    case WHITEN_STRENGTH:
                        this.mWhite = round;
                        break;
                    case SMOOTH_STRENGTH:
                        this.mSmooth = round;
                        break;
                    case RUDDY_STRENGTH:
                        this.mRuddyRatio = round;
                        break;
                    case BRIGHT_EYE_RATIO:
                        this.mBrightEyeRatio = round;
                        break;
                    case DEBLEMISH:
                        this.mDeblemish = round;
                        break;
                    case DEPOUCH_RATIO:
                        this.mDepouchRatio = round;
                        break;
                    case RELIGHTING_RATIO:
                        this.mRelightingRatio = round;
                        break;
                    case LIP_BEAUTY_RATIO:
                        this.mLipBeautyRatio = round;
                        break;
                    case IRIS_SHINE_RATIO:
                        this.mIrisShineRatio = round;
                        break;
                    case SHRINK_NOSE_RATIO:
                        this.mNoseThin = round;
                        break;
                }
            }
        }
    }

    public MiuiBeautyRenderData(Map<BeautyParameterType, Float> map) {
        if (map != null) {
            this.mBeautyParamsList.add(new BeautyParams(map));
        }
    }

    public void addParams(Map<BeautyParameterType, Float> map) {
        this.mBeautyParamsList.add(new BeautyParams(map));
    }
}
