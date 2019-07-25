package com.adobe.xmp.options;

import com.adobe.xmp.XMPException;

public final class AliasOptions extends Options {
    public AliasOptions() {
    }

    public AliasOptions(int i) throws XMPException {
        super(i);
    }

    /* access modifiers changed from: protected */
    public int getValidOptions() {
        return 7680;
    }

    public boolean isArray() {
        return getOption(512);
    }

    public boolean isArrayAltText() {
        return getOption(4096);
    }

    public boolean isSimple() {
        return getOptions() == 0;
    }

    public AliasOptions setArrayAltText(boolean z) {
        setOption(7680, z);
        return this;
    }

    public AliasOptions setArrayOrdered(boolean z) {
        setOption(1536, z);
        return this;
    }

    public PropertyOptions toPropertyOptions() throws XMPException {
        return new PropertyOptions(getOptions());
    }
}
