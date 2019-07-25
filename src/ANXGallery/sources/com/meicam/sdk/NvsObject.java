package com.meicam.sdk;

import java.util.HashMap;

public class NvsObject {
    private HashMap<String, Object> m_attachmentMap = new HashMap<>();
    protected long m_internalObject = 0;

    public Object getAttachment(String str) {
        return this.m_attachmentMap.get(str);
    }

    /* access modifiers changed from: protected */
    public long getInternalObject() {
        return this.m_internalObject;
    }

    public void setAttachment(String str, Object obj) {
        this.m_attachmentMap.put(str, obj);
    }

    /* access modifiers changed from: protected */
    public void setInternalObject(long j) {
        this.m_internalObject = j;
    }
}
