package com.adobe.xmp.options;

public final class ParseOptions extends Options {
    public ParseOptions() {
        setOption(24, true);
    }

    public boolean getAcceptLatin1() {
        return getOption(16);
    }

    public boolean getFixControlChars() {
        return getOption(8);
    }

    public boolean getOmitNormalization() {
        return getOption(32);
    }

    public boolean getRequireXMPMeta() {
        return getOption(1);
    }

    public boolean getStrictAliasing() {
        return getOption(4);
    }

    /* access modifiers changed from: protected */
    public int getValidOptions() {
        return 61;
    }
}
