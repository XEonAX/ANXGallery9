package com.miui.gallery.video.editor.net;

import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.video.editor.factory.VideoEditorModuleFactory;
import com.miui.gallery.video.editor.model.LocalResource;
import com.miui.gallery.video.editor.model.SmartEffectLocalResource;
import com.miui.gallery.video.editor.model.VideoEditorBaseLocalResource;
import com.miui.gallery.video.editor.model.WaterMarkLocalResource;
import com.miui.gallery.video.editor.util.ToolsUtil;
import org.json.JSONException;
import org.json.JSONObject;

public class VideoEditorResourceRequest extends VideoEditorBaseResourceRequest {
    private final long RESOURCE_AUDIO_PARENT_ID = 9507179096834080L;
    private final long RESOURCE_SMART_EFFECT_PARENT_ID = 9506731220402368L;
    private final long RESOURCE_TEXT_PARENT_ID = 9468682483925152L;
    private VideoEditorModuleFactory mModuleFactory;

    public VideoEditorResourceRequest(int i, VideoEditorModuleFactory videoEditorModuleFactory) {
        super(i);
        this.mModuleFactory = videoEditorModuleFactory;
    }

    /* access modifiers changed from: protected */
    public long getParentId() {
        int i = this.type;
        if (i == R.id.video_editor_audio) {
            return 9507179096834080L;
        }
        if (i != R.id.video_editor_smart_effect) {
            return i != R.id.video_editor_water_mark ? 0 : 9468682483925152L;
        }
        return 9506731220402368L;
    }

    /* access modifiers changed from: protected */
    public LocalResource newLocalResource() {
        return this.type == R.id.video_editor_smart_effect ? new SmartEffectLocalResource(this.mModuleFactory) : this.type == R.id.video_editor_water_mark ? new WaterMarkLocalResource(this.mModuleFactory) : new VideoEditorBaseLocalResource(this.mModuleFactory);
    }

    /* access modifiers changed from: protected */
    public void setResult(LocalResource localResource) {
        if (localResource instanceof SmartEffectLocalResource) {
            SmartEffectLocalResource smartEffectLocalResource = (SmartEffectLocalResource) localResource;
            try {
                JSONObject jSONObject = new JSONObject(localResource.extra);
                String optString = jSONObject.optString("assetid");
                String optString2 = jSONObject.optString("update");
                String optString3 = jSONObject.optString("assetName");
                String optString4 = jSONObject.optString("longTime");
                String optString5 = jSONObject.optString("shortTime");
                String optString6 = jSONObject.optString("hasSpeedChange");
                String optString7 = jSONObject.optString("enName");
                smartEffectLocalResource.assetId = ToolsUtil.getTrimedString(optString);
                smartEffectLocalResource.update = ToolsUtil.getTrimedString(optString2);
                smartEffectLocalResource.assetName = ToolsUtil.getTrimedString(optString3);
                smartEffectLocalResource.longTime = ToolsUtil.getTrimedString(optString4);
                smartEffectLocalResource.shortTime = ToolsUtil.getTrimedString(optString5);
                smartEffectLocalResource.hasSpeedChange = ToolsUtil.getTrimedString(optString6);
                smartEffectLocalResource.enName = ToolsUtil.getTrimedString(optString7);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        if (localResource instanceof WaterMarkLocalResource) {
            WaterMarkLocalResource waterMarkLocalResource = (WaterMarkLocalResource) localResource;
            try {
                JSONObject jSONObject2 = new JSONObject(localResource.extra);
                String optString8 = jSONObject2.optString("assetid");
                String optString9 = jSONObject2.optString("update");
                String optString10 = jSONObject2.optString("assetName");
                String optString11 = jSONObject2.optString("cn");
                waterMarkLocalResource.assetId = TextUtils.isEmpty(optString8) ? "" : optString8.trim();
                waterMarkLocalResource.update = TextUtils.isEmpty(optString9) ? "" : optString9.trim();
                waterMarkLocalResource.assetName = TextUtils.isEmpty(optString10) ? "" : optString10.trim();
                waterMarkLocalResource.isInternational = ToolsUtil.parseIntFromStr(ToolsUtil.getTrimedString(optString11));
            } catch (JSONException e2) {
                e2.printStackTrace();
            }
        }
    }
}
