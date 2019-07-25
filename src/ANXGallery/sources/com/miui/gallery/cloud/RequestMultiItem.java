package com.miui.gallery.cloud;

import java.util.ArrayList;
import java.util.Iterator;

public class RequestMultiItem extends RequestItemBase {
    public ArrayList<RequestItemBase> multiRequestItems;

    public RequestMultiItem(ArrayList<RequestItemBase> arrayList, int i) {
        super(i);
        this.multiRequestItems = arrayList;
        init();
    }

    public boolean compareAndSetStatus(int i, int i2) {
        boolean compareAndSetStatus = super.compareAndSetStatus(i, i2);
        Iterator it = this.multiRequestItems.iterator();
        while (it.hasNext()) {
            ((RequestItemBase) it.next()).compareAndSetStatus(i, i2);
        }
        return compareAndSetStatus;
    }

    public ArrayList<RequestItemBase> getItems() {
        ArrayList<RequestItemBase> arrayList = new ArrayList<>();
        arrayList.addAll(this.multiRequestItems);
        return arrayList;
    }

    public int getRequestLimitAGroup() {
        return 1;
    }

    public boolean isInSameAlbum(RequestItemBase requestItemBase) {
        return false;
    }

    public void setStatus(int i) {
        super.setStatus(i);
        Iterator it = this.multiRequestItems.iterator();
        while (it.hasNext()) {
            ((RequestItemBase) it.next()).setStatus(i);
        }
    }

    public boolean supportMultiRequest() {
        return false;
    }
}
