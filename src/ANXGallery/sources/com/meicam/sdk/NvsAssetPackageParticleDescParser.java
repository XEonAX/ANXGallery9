package com.meicam.sdk;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class NvsAssetPackageParticleDescParser {
    public static final int EMITTER_PLACE_BOTTOM = 3;
    public static final int EMITTER_PLACE_CENTER = 4;
    public static final int EMITTER_PLACE_LEFT = 0;
    public static final int EMITTER_PLACE_RIGHT = 1;
    public static final int EMITTER_PLACE_TOP = 2;
    public static final int PARTICLE_TYPE_EYE = 3;
    public static final int PARTICLE_TYPE_GESTURE = 2;
    public static final int PARTICLE_TYPE_MOUTH = 4;
    public static final int PARTICLE_TYPE_NORMAL = 0;
    public static final int PARTICLE_TYPE_TOUCH = 1;
    int m_ParticleType = 0;
    ArrayList<NvsParticleEmitterDesc> m_emitters = new ArrayList<>();

    public class NvsParticleEmitterDesc {
        public ArrayList<String> m_emitterNames = new ArrayList<>();
        public int m_emitterPlace = 4;

        public NvsParticleEmitterDesc() {
        }
    }

    public NvsAssetPackageParticleDescParser(String str) {
        NvsUtils.checkFunctionInMainThread();
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("particleType");
            if (string.equals("touch")) {
                this.m_ParticleType = 1;
            } else if (string.equals("gesture")) {
                this.m_ParticleType = 2;
            } else if (string.equals("eye")) {
                this.m_ParticleType = 3;
            } else if (string.equals("mouth")) {
                this.m_ParticleType = 4;
            }
            JSONArray jSONArray = jSONObject.getJSONArray("emitterDesc");
            for (int i = 0; i < jSONArray.length(); i++) {
                try {
                    this.m_emitters.add(GetEmitterDescFromJson(jSONArray.getJSONObject(i)));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
    }

    private NvsParticleEmitterDesc GetEmitterDescFromJson(JSONObject jSONObject) throws JSONException {
        NvsParticleEmitterDesc nvsParticleEmitterDesc = new NvsParticleEmitterDesc();
        String str = "";
        if (jSONObject.has("place")) {
            str = jSONObject.getString("place");
        }
        nvsParticleEmitterDesc.m_emitterPlace = 4;
        if (str.equals("left")) {
            nvsParticleEmitterDesc.m_emitterPlace = 0;
        } else if (str.equals("right")) {
            nvsParticleEmitterDesc.m_emitterPlace = 1;
        } else if (str.equals("top")) {
            nvsParticleEmitterDesc.m_emitterPlace = 2;
        } else if (str.equals("bottom")) {
            nvsParticleEmitterDesc.m_emitterPlace = 3;
        }
        if (jSONObject.has("emitterName")) {
            JSONArray jSONArray = jSONObject.getJSONArray("emitterName");
            for (int i = 0; i < jSONArray.length(); i++) {
                nvsParticleEmitterDesc.m_emitterNames.add(jSONArray.getString(i));
            }
        }
        return nvsParticleEmitterDesc;
    }

    public List<String> GetLeftEyeEmitter() {
        NvsUtils.checkFunctionInMainThread();
        return GetParticlePartitionEmitter(0);
    }

    public int GetLeftEyePlace() {
        NvsUtils.checkFunctionInMainThread();
        return GetParticlePartitionPlace(0);
    }

    public int GetParticlePartitionCount() {
        return this.m_emitters.size();
    }

    public List<String> GetParticlePartitionEmitter(int i) {
        NvsUtils.checkFunctionInMainThread();
        if (i >= this.m_emitters.size()) {
            return null;
        }
        return ((NvsParticleEmitterDesc) this.m_emitters.get(i)).m_emitterNames;
    }

    public int GetParticlePartitionPlace(int i) {
        NvsUtils.checkFunctionInMainThread();
        if (i >= this.m_emitters.size()) {
            return 4;
        }
        return ((NvsParticleEmitterDesc) this.m_emitters.get(i)).m_emitterPlace;
    }

    public int GetParticleType() {
        return this.m_ParticleType;
    }

    public List<String> GetRightEyeEmitter() {
        NvsUtils.checkFunctionInMainThread();
        return GetParticlePartitionEmitter(1);
    }

    public int GetRightEyePlace() {
        NvsUtils.checkFunctionInMainThread();
        return GetParticlePartitionPlace(1);
    }
}
