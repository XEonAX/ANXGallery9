package com.miui.gallery.cloud;

import com.miui.gallery.data.DBShareAlbum;
import java.util.ArrayList;

public class RequestSharerAlbumItem extends RequestItemBase {
    public final DBShareAlbum mDBItem;

    public RequestSharerAlbumItem(int i, DBShareAlbum dBShareAlbum) {
        super(i);
        this.mDBItem = dBShareAlbum;
    }

    public ArrayList<RequestItemBase> getItems() {
        ArrayList<RequestItemBase> arrayList = new ArrayList<>();
        arrayList.add(this);
        return arrayList;
    }

    public int getRequestLimitAGroup() {
        return 1;
    }

    public boolean isInSameAlbum(RequestItemBase requestItemBase) {
        return false;
    }

    public boolean supportMultiRequest() {
        return false;
    }
}
