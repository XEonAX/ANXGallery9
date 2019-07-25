package com.miui.gallery.ui.renameface;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.activity.facebaby.InputFaceNameActivity;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;

public abstract class FaceAlbumHandlerBase {
    protected Activity mActivity;
    protected NormalPeopleFaceMediaSet mFaceSet;
    protected FaceAlbumHandlerListener mListener;

    public interface FaceAlbumHandlerListener {
        void onGetFolderItem(FaceFolderItem faceFolderItem);
    }

    public interface FaceFolderItem {
        String getId();

        String getName();
    }

    public class FaceFolderItemImpl implements FaceFolderItem {
        private String mLocalGroupId;
        private String mName;

        FaceFolderItemImpl(FaceDisplayFolderItem faceDisplayFolderItem) {
            this.mName = faceDisplayFolderItem.name;
            this.mLocalGroupId = faceDisplayFolderItem.localGroupId;
        }

        FaceFolderItemImpl(String str, String str2) {
            this.mName = str;
            this.mLocalGroupId = str2;
        }

        public String getId() {
            return this.mLocalGroupId;
        }

        public String getName() {
            return this.mName;
        }
    }

    public static class FaceNewFolerItem implements FaceFolderItem {
        boolean isCreatedInDb = false;
        String mContactJson;
        String mId;
        String mName;

        FaceNewFolerItem(String str) {
            this.mName = str;
        }

        public String getContactjson() {
            return this.mContactJson;
        }

        public String getId() {
            return this.mId;
        }

        public String getName() {
            return this.mName;
        }

        public boolean isCreatedInDb() {
            return this.isCreatedInDb;
        }

        public void setContactjson(String str) {
            this.mContactJson = str;
        }

        public void setCreatedInDb() {
            this.isCreatedInDb = true;
        }

        public void setId(String str) {
            this.mId = str;
        }
    }

    public FaceAlbumHandlerBase(Activity activity, NormalPeopleFaceMediaSet normalPeopleFaceMediaSet, FaceAlbumHandlerListener faceAlbumHandlerListener) {
        this.mActivity = activity;
        this.mFaceSet = normalPeopleFaceMediaSet;
        this.mListener = faceAlbumHandlerListener;
    }

    /* access modifiers changed from: protected */
    public void showInputFolderNameDialog(int i, String str, boolean z) {
        Intent intent = new Intent(this.mActivity, InputFaceNameActivity.class);
        Bundle bundle = new Bundle();
        bundle.putString("original_name", str);
        bundle.putBoolean("is_relation_setted", z);
        if (this.mFaceSet != null && this.mFaceSet.hasName()) {
            bundle.putString("original_path_album_local_id", String.valueOf(this.mFaceSet.getBucketId()));
        }
        if (i == 19) {
            bundle.putBoolean("only_use_contact", true);
        }
        intent.putExtras(bundle);
        this.mActivity.startActivityForResult(intent, i);
    }
}
