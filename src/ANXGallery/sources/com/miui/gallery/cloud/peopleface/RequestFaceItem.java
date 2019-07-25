package com.miui.gallery.cloud.peopleface;

import android.text.TextUtils;
import com.miui.gallery.cloud.RequestItemBase;
import java.util.ArrayList;

public class RequestFaceItem extends RequestItemBase {
    public PeopleFace face;

    public RequestFaceItem(int i, PeopleFace peopleFace) {
        super(i, 0);
        this.face = peopleFace;
        init();
    }

    public ArrayList<RequestItemBase> getItems() {
        ArrayList<RequestItemBase> arrayList = new ArrayList<>();
        arrayList.add(this);
        return arrayList;
    }

    public int getRequestLimitAGroup() {
        return 50;
    }

    public boolean isInSameAlbum(RequestItemBase requestItemBase) {
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        if (requestFaceItem.face.localFlag == this.face.localFlag) {
            if (requestFaceItem.face.localFlag == 5) {
                return TextUtils.equals(requestFaceItem.face.localGroupId, this.face.localGroupId);
            }
            if (requestFaceItem.face.localFlag == 2) {
                return TextUtils.equals(requestFaceItem.face.groupId, this.face.groupId);
            }
        }
        return true;
    }

    public boolean supportMultiRequest() {
        return this.face.localFlag == 5;
    }
}
