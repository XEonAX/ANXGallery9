package com.miui.gallery.util;

import android.text.TextUtils;
import com.miui.gallery.stat.BaseSamplingStatHelper;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: ExifUtil */
class UserComment {
    private ExifInterfaceWrapper mExif;
    private boolean mIsOriginalUserCommentUsable = false;
    private JSONObject mJsonUserComment;

    UserComment(ExifInterfaceWrapper exifInterfaceWrapper) throws Exception {
        this.mExif = exifInterfaceWrapper;
        String userComment = exifInterfaceWrapper.getUserComment();
        try {
            if (TextUtils.isEmpty(userComment)) {
                this.mJsonUserComment = new JSONObject();
                return;
            }
            this.mJsonUserComment = new JSONObject(userComment);
            this.mIsOriginalUserCommentUsable = true;
        } catch (JSONException e) {
            this.mJsonUserComment = new JSONObject();
            Log.w("UserComment", "userComment %s is not a json object", userComment);
            e.printStackTrace();
            HashMap hashMap = new HashMap();
            hashMap.put("usercomment", userComment);
            hashMap.put("exception", e.toString());
            BaseSamplingStatHelper.recordErrorEvent("exif_parser", "exif_invalid_usercomment", hashMap);
        }
    }

    /* access modifiers changed from: 0000 */
    public String getFileExt() {
        return this.mJsonUserComment.optString("ext");
    }

    /* access modifiers changed from: 0000 */
    public String getSha1() {
        return this.mJsonUserComment.optString("sha1");
    }

    /* access modifiers changed from: 0000 */
    public boolean isOriginalUserCommentUsable() {
        return this.mIsOriginalUserCommentUsable;
    }

    /* access modifiers changed from: 0000 */
    public void setData(UserCommentData userCommentData) throws Exception {
        if (userCommentData != null) {
            this.mJsonUserComment.put("sha1", userCommentData.getSha1());
            this.mJsonUserComment.put("ext", userCommentData.getExt());
            this.mExif.setUserComment(toString());
        }
    }

    public String toString() {
        return (!TextUtils.isEmpty(getSha1()) || !TextUtils.isEmpty(getFileExt())) ? this.mJsonUserComment.toString() : "";
    }
}
