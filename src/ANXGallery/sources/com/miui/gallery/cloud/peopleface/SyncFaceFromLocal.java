package com.miui.gallery.cloud.peopleface;

import android.accounts.Account;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.RequestOperationBase;
import com.miui.gallery.cloud.RetryOperation;
import com.miui.gallery.cloud.SyncFromLocalBase;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.peopleface.syncoperation.CreatePeopleOperation;
import com.miui.gallery.cloud.peopleface.syncoperation.DeleteFaceOperation;
import com.miui.gallery.cloud.peopleface.syncoperation.FaceRequestOperationBase;
import com.miui.gallery.cloud.peopleface.syncoperation.IgnorePeopleOperation;
import com.miui.gallery.cloud.peopleface.syncoperation.MergePeopleOperation;
import com.miui.gallery.cloud.peopleface.syncoperation.MoveFaceOperation;
import com.miui.gallery.cloud.peopleface.syncoperation.RecoveryPeopleOperation;
import com.miui.gallery.cloud.peopleface.syncoperation.RenamePeopleOperation;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;
import java.util.List;

public class SyncFaceFromLocal extends SyncFromLocalBase {
    private RequestItemGroup mCreatePeople;
    private RequestItemGroup mDeleteFace;
    private RequestItemGroup mIgnorePeople;
    private RequestItemGroup mMergePeople;
    private RequestItemGroup mMoveFace;
    private RequestItemGroup mRecoveryPeople;
    private RequestItemGroup mRenamePeople;

    private class RequestItemGroup {
        private List<RequestFaceItem> mRequestItems = new ArrayList();

        RequestItemGroup() {
        }

        private GallerySyncResult doRequest(RequestOperationBase requestOperationBase, List<RequestFaceItem> list) {
            try {
                return RetryOperation.doOperation(SyncFaceFromLocal.this.mContext, SyncFaceFromLocal.this.mAccount, SyncFaceFromLocal.this.mExtendedAuthToken, list, requestOperationBase);
            } catch (Exception e) {
                e.printStackTrace();
                return new Builder().setCode(GallerySyncCode.UNKNOWN).setException(e).build();
            }
        }

        public void addItem(RequestFaceItem requestFaceItem) {
            this.mRequestItems.add(requestFaceItem);
        }

        public boolean needRequest() {
            return this.mRequestItems.size() > 0;
        }

        public GallerySyncResult request(FaceRequestOperationBase faceRequestOperationBase) {
            GallerySyncResult gallerySyncResult;
            int limitCountForOperation = faceRequestOperationBase.getLimitCountForOperation();
            if (limitCountForOperation == -1 || limitCountForOperation >= this.mRequestItems.size()) {
                gallerySyncResult = doRequest(faceRequestOperationBase, this.mRequestItems);
            } else {
                int i = 0;
                int size = this.mRequestItems.size();
                gallerySyncResult = null;
                while (i < size) {
                    int i2 = i + limitCountForOperation;
                    GallerySyncResult doRequest = doRequest(faceRequestOperationBase, this.mRequestItems.subList(i, i2 > size ? size : i2));
                    if (doRequest.code == GallerySyncCode.CANCEL || doRequest.code == GallerySyncCode.NOT_CONTINUE_ERROR || doRequest.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                        return doRequest;
                    }
                    int i3 = i2;
                    gallerySyncResult = doRequest;
                    i = i3;
                }
            }
            return gallerySyncResult;
        }
    }

    public SyncFaceFromLocal(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        super(context, account, galleryExtendedAuthToken);
    }

    /* access modifiers changed from: protected */
    public DBItem generateDBImage(Cursor cursor) {
        return new PeopleFace(cursor);
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return FaceDataManager.PEOPLE_FACE_URI;
    }

    /* access modifiers changed from: protected */
    public String getSelectionClause() {
        return String.format(" (%s) ", new Object[]{"localFlag != 0"});
    }

    /* access modifiers changed from: protected */
    public String getSortOrder() {
        return null;
    }

    /* access modifiers changed from: protected */
    public void handleRequestCloudItemList() {
        try {
            if (this.mCreatePeople.needRequest()) {
                SyncLog.v("SyncFaceFromLocal", "start create group items");
                GallerySyncResult request = this.mCreatePeople.request(new CreatePeopleOperation(this.mContext));
                if (request != null && request.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                    return;
                }
            }
            if (this.mRecoveryPeople.needRequest()) {
                GallerySyncResult request2 = this.mRecoveryPeople.request(new RecoveryPeopleOperation(this.mContext));
                if (request2 != null && request2.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                    return;
                }
            }
            if (this.mMoveFace.needRequest()) {
                SyncLog.v("SyncFaceFromLocal", "start move image items");
                GallerySyncResult request3 = this.mMoveFace.request(new MoveFaceOperation(this.mContext));
                if (request3 != null && request3.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                    return;
                }
            }
            if (this.mDeleteFace.needRequest()) {
                SyncLog.v("SyncFaceFromLocal", "start delete image items");
                GallerySyncResult request4 = this.mDeleteFace.request(new DeleteFaceOperation(this.mContext));
                if (request4 != null && request4.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                    return;
                }
            }
            if (this.mRenamePeople.needRequest()) {
                SyncLog.v("SyncFaceFromLocal", "start rename group items");
                GallerySyncResult request5 = this.mRenamePeople.request(new RenamePeopleOperation(this.mContext));
                if (request5 != null && request5.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                    return;
                }
            }
            if (this.mMergePeople.needRequest()) {
                SyncLog.v("SyncFaceFromLocal", "start delete group items");
                GallerySyncResult request6 = this.mMergePeople.request(new MergePeopleOperation(this.mContext));
                if (request6 != null && request6.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                    return;
                }
            }
            if (this.mIgnorePeople.needRequest()) {
                SyncLog.v("SyncFaceFromLocal", "start delete group items");
                GallerySyncResult request7 = this.mIgnorePeople.request(new IgnorePeopleOperation(this.mContext));
                if (request7 == null || request7.code == GallerySyncCode.CONDITION_INTERRUPTED) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: protected */
    public void initRequestCloudItemList() {
        this.mCreatePeople = new RequestItemGroup();
        this.mMoveFace = new RequestItemGroup();
        this.mDeleteFace = new RequestItemGroup();
        this.mMergePeople = new RequestItemGroup();
        this.mRenamePeople = new RequestItemGroup();
        this.mIgnorePeople = new RequestItemGroup();
        this.mRecoveryPeople = new RequestItemGroup();
    }

    /* access modifiers changed from: protected */
    public void putToRequestCloudItemList(DBItem dBItem) {
        PeopleFace peopleFace = (PeopleFace) dBItem;
        boolean equalsIgnoreCase = peopleFace.type.equalsIgnoreCase("PEOPLE");
        if (peopleFace.visibilityType == 4) {
            this.mRecoveryPeople.addItem(new RequestFaceItem(0, peopleFace));
        }
        int i = peopleFace.localFlag;
        if (i == 2) {
            RequestFaceItem requestFaceItem = new RequestFaceItem(0, peopleFace);
            if (!equalsIgnoreCase) {
                this.mDeleteFace.addItem(requestFaceItem);
            }
        } else if (i != 5) {
            if (i == 8) {
                this.mCreatePeople.addItem(new RequestFaceItem(0, peopleFace));
            } else if (i != 10) {
                switch (i) {
                    case 12:
                        if (!TextUtils.equals(peopleFace.groupId, peopleFace.serverId)) {
                            this.mMergePeople.addItem(new RequestFaceItem(0, peopleFace));
                            return;
                        }
                        return;
                    case 13:
                        this.mIgnorePeople.addItem(new RequestFaceItem(0, peopleFace));
                        return;
                    default:
                        return;
                }
            } else if (equalsIgnoreCase) {
                this.mRenamePeople.addItem(new RequestFaceItem(0, peopleFace));
            }
        } else if (!equalsIgnoreCase) {
            this.mMoveFace.addItem(new RequestFaceItem(0, peopleFace));
        }
    }
}
