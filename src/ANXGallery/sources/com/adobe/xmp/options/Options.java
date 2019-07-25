package com.adobe.xmp.options;

import com.adobe.xmp.XMPException;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.util.Map;

public abstract class Options {
    private Map optionNames = null;
    private int options = 0;

    public Options() {
    }

    public Options(int i) throws XMPException {
        assertOptionsValid(i);
        setOptions(i);
    }

    private void assertOptionsValid(int i) throws XMPException {
        int validOptions = (getValidOptions() ^ -1) & i;
        if (validOptions == 0) {
            assertConsistency(i);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("The option bit(s) 0x");
        sb.append(Integer.toHexString(validOptions));
        sb.append(" are invalid!");
        throw new XMPException(sb.toString(), BaiduSceneResult.MOUNTAINEERING);
    }

    /* access modifiers changed from: protected */
    public void assertConsistency(int i) throws XMPException {
    }

    public boolean equals(Object obj) {
        return getOptions() == ((Options) obj).getOptions();
    }

    /* access modifiers changed from: protected */
    public boolean getOption(int i) {
        return (i & this.options) != 0;
    }

    public int getOptions() {
        return this.options;
    }

    /* access modifiers changed from: protected */
    public abstract int getValidOptions();

    public int hashCode() {
        return getOptions();
    }

    public void setOption(int i, boolean z) {
        int i2;
        if (z) {
            i2 = i | this.options;
        } else {
            i2 = (i ^ -1) & this.options;
        }
        this.options = i2;
    }

    public void setOptions(int i) throws XMPException {
        assertOptionsValid(i);
        this.options = i;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("0x");
        sb.append(Integer.toHexString(this.options));
        return sb.toString();
    }
}
