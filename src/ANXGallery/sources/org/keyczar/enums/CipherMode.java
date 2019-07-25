package org.keyczar.enums;

import com.google.gson_nex.annotations.Expose;

public enum CipherMode {
    CBC(0, "AES/CBC/PKCS5Padding", true),
    CTR(1, "AES/CTR/NoPadding", true),
    ECB(2, "AES/ECB/NoPadding", false),
    DET_CBC(3, "AES/CBC/PKCS5Padding", false);
    
    private String jceMode;
    @Expose
    private int value;

    private CipherMode(int i, String str, boolean z) {
        this.value = i;
        this.jceMode = str;
    }

    static CipherMode getMode(int i) {
        switch (i) {
            case 0:
                return CBC;
            case 1:
                return CTR;
            case 2:
                return ECB;
            case 3:
                return DET_CBC;
            default:
                return null;
        }
    }

    public String getMode() {
        return this.jceMode;
    }

    public int getOutputSize(int i, int i2) {
        if (this == CBC) {
            return ((i2 / i) + 2) * i;
        }
        if (this == ECB) {
            return i;
        }
        if (this == CTR) {
            return i2 + (i / 2);
        }
        if (this == DET_CBC) {
            return ((i2 / i) + 1) * i;
        }
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public int getValue() {
        return this.value;
    }
}
