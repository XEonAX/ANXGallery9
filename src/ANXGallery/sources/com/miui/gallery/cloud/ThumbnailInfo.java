package com.miui.gallery.cloud;

import android.text.TextUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Utils;
import org.json.JSONException;
import org.json.JSONObject;

public class ThumbnailInfo {
    private String mBgImageId;
    private long mBgImageLocalId = -1;
    private String mBgUrl;
    private String mCoverImageId;
    private String mCoverUrl;
    private String mFaceId;
    private FaceInfo mFaceInfo;
    private String mFaceUrl;
    private final int mGroupLocalId;
    private final boolean mIsSharerAlbum;
    private long mLastTimeRequest;

    private static class FaceInfo {
        private final double eyeLeftXScale;
        private final double eyeLeftYScale;
        private final double eyeRightXScale;
        private final double eyeRightYScale;
        private final double faceHScale;
        private final int faceRegionOrientation;
        private final double faceWScale;
        private final double faceXScale;
        private final double faceYScale;

        private FaceInfo(double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, int i) {
            this.eyeLeftXScale = d;
            this.eyeLeftYScale = d2;
            this.eyeRightXScale = d3;
            this.eyeRightYScale = d4;
            this.faceXScale = d5;
            this.faceYScale = d6;
            this.faceWScale = d7;
            this.faceHScale = d8;
            this.faceRegionOrientation = i;
        }

        static boolean equals(FaceInfo faceInfo, FaceInfo faceInfo2) {
            if (faceInfo != null) {
                return faceInfo.equals(faceInfo2);
            }
            return faceInfo2 == null;
        }

        static FaceInfo from(String str) throws JSONException {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            JSONObject jSONObject = new JSONObject(str);
            FaceInfo faceInfo = new FaceInfo(jSONObject.getDouble("eyeLeftXScale"), jSONObject.getDouble("eyeLeftYScale"), jSONObject.getDouble("eyeRightXScale"), jSONObject.getDouble("eyeRightYScale"), jSONObject.getDouble("faceXScale"), jSONObject.getDouble("faceYScale"), jSONObject.getDouble("faceWScale"), jSONObject.getDouble("faceHScale"), jSONObject.getInt("faceOrientation"));
            return faceInfo;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof FaceInfo)) {
                return false;
            }
            FaceInfo faceInfo = (FaceInfo) obj;
            if (!Utils.doubleEquals(this.eyeLeftXScale, faceInfo.eyeLeftXScale) || !Utils.doubleEquals(this.eyeLeftYScale, faceInfo.eyeLeftYScale) || !Utils.doubleEquals(this.eyeRightXScale, faceInfo.eyeRightXScale) || !Utils.doubleEquals(this.eyeRightYScale, faceInfo.eyeRightYScale) || !Utils.doubleEquals(this.faceXScale, faceInfo.faceXScale) || !Utils.doubleEquals(this.faceYScale, faceInfo.faceYScale) || !Utils.doubleEquals(this.faceWScale, faceInfo.faceWScale) || !Utils.doubleEquals(this.faceHScale, faceInfo.faceHScale) || this.faceRegionOrientation != faceInfo.faceRegionOrientation) {
                z = false;
            }
            return z;
        }

        /* access modifiers changed from: 0000 */
        public String toJSON() throws JSONException {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("eyeLeftXScale", this.eyeLeftXScale);
            jSONObject.put("eyeLeftYScale", this.eyeLeftYScale);
            jSONObject.put("eyeRightXScale", this.eyeRightXScale);
            jSONObject.put("eyeRightYScale", this.eyeRightYScale);
            jSONObject.put("faceXScale", this.faceXScale);
            jSONObject.put("faceYScale", this.faceYScale);
            jSONObject.put("faceWScale", this.faceWScale);
            jSONObject.put("faceHScale", this.faceHScale);
            jSONObject.put("faceOrientation", this.faceRegionOrientation);
            return jSONObject.toString();
        }
    }

    public ThumbnailInfo(int i, boolean z, String str) {
        this.mGroupLocalId = i;
        this.mIsSharerAlbum = z;
        initBy(str);
    }

    private void initBy(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                this.mCoverImageId = jSONObject.optString("coverImageId");
                this.mBgImageId = jSONObject.optString("backgroundImageId");
                this.mBgImageLocalId = jSONObject.optLong("backgroundImageLocalId", -1);
                this.mFaceId = jSONObject.optString("faceId");
                this.mCoverUrl = jSONObject.optString("coverUrl");
                this.mFaceUrl = jSONObject.optString("faceUrl");
                this.mBgUrl = jSONObject.optString("backgroundUrl");
                String optString = jSONObject.optString("faceInfo");
                if (!TextUtils.isEmpty(optString)) {
                    JSONObject jSONObject2 = new JSONObject(optString);
                    JSONObject optJSONObject = jSONObject.optJSONObject("faceExif");
                    int i = -1;
                    if (optJSONObject != null) {
                        i = optJSONObject.optInt("orientation", -1);
                    }
                    jSONObject2.put("faceOrientation", i);
                    optString = jSONObject2.toString();
                }
                this.mFaceInfo = FaceInfo.from(optString);
                this.mLastTimeRequest = jSONObject.optLong("lastTimeRequest");
            } catch (JSONException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("fail to parse ThumbnailInfo from ");
                sb.append(str);
                Log.e("ThumbnailInfo", sb.toString(), (Object) e);
            }
        }
    }

    private void putString(JSONObject jSONObject, String str, String str2) throws JSONException {
        if (!TextUtils.isEmpty(str2)) {
            jSONObject.put(str, str2);
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ThumbnailInfo)) {
            return false;
        }
        ThumbnailInfo thumbnailInfo = (ThumbnailInfo) obj;
        if (!TextUtils.equals(this.mCoverImageId, thumbnailInfo.mCoverImageId) || !TextUtils.equals(this.mBgImageId, thumbnailInfo.mBgImageId) || this.mBgImageLocalId != thumbnailInfo.mBgImageLocalId || !TextUtils.equals(this.mFaceId, thumbnailInfo.mFaceId) || !TextUtils.equals(this.mCoverUrl, thumbnailInfo.mCoverUrl) || !TextUtils.equals(this.mFaceUrl, thumbnailInfo.mFaceUrl) || !TextUtils.equals(this.mBgUrl, thumbnailInfo.mBgUrl) || !FaceInfo.equals(this.mFaceInfo, thumbnailInfo.mFaceInfo)) {
            z = false;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public long getBgImageLocalId() {
        return this.mBgImageLocalId;
    }

    public String getFaceId() {
        return this.mFaceId;
    }

    public String toString() {
        try {
            JSONObject jSONObject = new JSONObject();
            putString(jSONObject, "coverImageId", this.mCoverImageId);
            putString(jSONObject, "backgroundImageId", this.mBgImageId);
            putString(jSONObject, "faceId", this.mFaceId);
            putString(jSONObject, "coverUrl", this.mCoverUrl);
            putString(jSONObject, "faceUrl", this.mFaceUrl);
            putString(jSONObject, "backgroundUrl", this.mBgUrl);
            jSONObject.put("faceInfo", this.mFaceInfo == null ? null : this.mFaceInfo.toJSON());
            if (this.mBgImageLocalId != -1) {
                jSONObject.put("backgroundImageLocalId", this.mBgImageLocalId);
            }
            if (this.mLastTimeRequest > 0) {
                jSONObject.put("lastTimeRequest", this.mLastTimeRequest);
            }
            return jSONObject.toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }
}
