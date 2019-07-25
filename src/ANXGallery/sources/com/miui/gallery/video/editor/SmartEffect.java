package com.miui.gallery.video.editor;

import com.miui.gallery.R;
import com.miui.gallery.video.editor.model.LocalResource;
import com.miui.gallery.video.editor.model.SmartEffectLocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import com.miui.gallery.video.editor.util.ToolsUtil;
import com.nexstreaming.nexeditorsdk.nexTemplateManager.Template;
import java.util.HashMap;

public class SmartEffect extends VideoEditorBaseModel {
    private static HashMap<String, Integer> smartEffectNames = new HashMap<String, Integer>() {
        {
            put("smart_effect_none", Integer.valueOf(R.string.video_editor_smart_effect_none));
            put("smart_effect_movie", Integer.valueOf(R.string.video_editor_smart_effect_movie));
            put("smart_effect_big_film", Integer.valueOf(R.string.video_editor_smart_effect_big_film));
            put("smart_effect_street", Integer.valueOf(R.string.video_editor_smart_effect_street));
            put("smart_effect_halo", Integer.valueOf(R.string.video_editor_smart_effect_halo));
            put("smart_effect_radical", Integer.valueOf(R.string.video_editor_smart_effect_radical));
            put("smart_effect_freeze", Integer.valueOf(R.string.video_editor_smart_effect_freesze));
            put("smart_effect_dynamic", Integer.valueOf(R.string.video_editor_smart_effect_dynamic));
        }
    };
    public final String TAG = "SmartEffect";
    private int mAssetId;
    private String mAssetName;
    private String mEnName;
    private boolean mHasSpeedChange;
    private int mIconResId;
    private int mLongTime;
    private int mNameResid;
    private int mShortTime;
    private Template mTemplate;

    public SmartEffect(LocalResource localResource) {
        if (localResource != null) {
            this.mID = localResource.id;
            this.mNameKey = localResource.nameKey;
            this.mLabel = localResource.label;
            this.mIconResId = localResource.imageId;
            this.mIconUrl = localResource.icon;
            this.mType = localResource.type;
            this.mExtra = "ve_type_extra".equals(localResource.type);
            if (!this.mExtra) {
                this.mDownloadState = 17;
            }
            if (localResource instanceof SmartEffectLocalResource) {
                SmartEffectLocalResource smartEffectLocalResource = (SmartEffectLocalResource) localResource;
                this.mAssetId = ToolsUtil.parseIntFromStr(smartEffectLocalResource.assetId);
                this.mAssetName = smartEffectLocalResource.assetName;
                this.mEnName = smartEffectLocalResource.enName;
                this.mLongTime = ToolsUtil.parseIntFromStr(smartEffectLocalResource.longTime);
                this.mShortTime = ToolsUtil.parseIntFromStr(smartEffectLocalResource.shortTime);
                boolean z = true;
                if (ToolsUtil.parseIntFromStr(smartEffectLocalResource.hasSpeedChange) != 1) {
                    z = false;
                }
                this.mHasSpeedChange = z;
            }
            this.mIsTemplate = this.mExtra;
        }
    }

    public SmartEffect(String str, int i, String str2, boolean z) {
        this.mNameKey = str;
        this.mIconResId = i;
        this.mType = str2;
        this.mExtra = "ve_type_extra".equals(str2);
        if (!this.mExtra) {
            this.mDownloadState = 17;
        }
    }

    public int getAssetId() {
        return this.mAssetId;
    }

    public String getAssetName() {
        return this.mAssetName;
    }

    public String getEnName() {
        return this.mEnName;
    }

    public int getIconResId() {
        return this.mIconResId;
    }

    public int getLongTime() {
        return this.mLongTime;
    }

    public int getNameResId() {
        if (this.mNameResid == 0 && smartEffectNames != null && smartEffectNames.containsKey(this.mNameKey)) {
            this.mNameResid = ((Integer) smartEffectNames.get(this.mNameKey)).intValue();
        }
        return this.mNameResid;
    }

    public int getShortTime() {
        return this.mShortTime;
    }

    public Template getTemplate() {
        return this.mTemplate;
    }

    public boolean isHasSpeedChange() {
        return this.mHasSpeedChange;
    }

    public boolean isLimitFourtySeconds() {
        return this.mLongTime == 40000;
    }

    public boolean isLimitSixtySeconds() {
        return this.mLongTime == 60000;
    }

    public void setTemplate(Template template) {
        this.mTemplate = template;
    }
}
