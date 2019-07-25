package com.miui.gallery3d.exif;

import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class ExifData {
    private static final byte[] USER_COMMENT_ASCII = {65, 83, 67, 73, 73, 0, 0, 0};
    private static final byte[] USER_COMMENT_JIS = {74, 73, 83, 0, 0, 0, 0, 0};
    private static final byte[] USER_COMMENT_UNICODE = {85, 78, 73, 67, 79, 68, 69, 0};
    private final ByteOrder mByteOrder;
    private final IfdData[] mIfdDatas = new IfdData[5];
    private ArrayList<byte[]> mStripBytes = new ArrayList<>();
    private byte[] mThumbnail;

    ExifData(ByteOrder byteOrder) {
        this.mByteOrder = byteOrder;
    }

    /* access modifiers changed from: protected */
    public void addIfdData(IfdData ifdData) {
        this.mIfdDatas[ifdData.getId()] = ifdData;
    }

    /* access modifiers changed from: protected */
    public ExifTag addTag(ExifTag exifTag) {
        if (exifTag != null) {
            return addTag(exifTag, exifTag.getIfd());
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public ExifTag addTag(ExifTag exifTag, int i) {
        if (exifTag == null || !ExifTag.isValidIfd(i)) {
            return null;
        }
        return getOrCreateIfdData(i).setTag(exifTag);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof ExifData)) {
            return false;
        }
        ExifData exifData = (ExifData) obj;
        if (exifData.mByteOrder != this.mByteOrder || exifData.mStripBytes.size() != this.mStripBytes.size() || !Arrays.equals(exifData.mThumbnail, this.mThumbnail)) {
            return false;
        }
        for (int i = 0; i < this.mStripBytes.size(); i++) {
            if (!Arrays.equals((byte[]) exifData.mStripBytes.get(i), (byte[]) this.mStripBytes.get(i))) {
                return false;
            }
        }
        for (int i2 = 0; i2 < 5; i2++) {
            IfdData ifdData = exifData.getIfdData(i2);
            IfdData ifdData2 = getIfdData(i2);
            if (ifdData != ifdData2 && ifdData != null && !ifdData.equals(ifdData2)) {
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public List<ExifTag> getAllTags() {
        IfdData[] ifdDataArr;
        ArrayList arrayList = new ArrayList();
        for (IfdData ifdData : this.mIfdDatas) {
            if (ifdData != null) {
                ExifTag[] allTags = ifdData.getAllTags();
                if (allTags != null) {
                    for (ExifTag add : allTags) {
                        arrayList.add(add);
                    }
                }
            }
        }
        if (arrayList.size() == 0) {
            return null;
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public ByteOrder getByteOrder() {
        return this.mByteOrder;
    }

    /* access modifiers changed from: protected */
    public byte[] getCompressedThumbnail() {
        return this.mThumbnail;
    }

    /* access modifiers changed from: protected */
    public IfdData getIfdData(int i) {
        if (ExifTag.isValidIfd(i)) {
            return this.mIfdDatas[i];
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public IfdData getOrCreateIfdData(int i) {
        IfdData ifdData = this.mIfdDatas[i];
        if (ifdData != null) {
            return ifdData;
        }
        IfdData ifdData2 = new IfdData(i);
        this.mIfdDatas[i] = ifdData2;
        return ifdData2;
    }

    /* access modifiers changed from: protected */
    public byte[] getStrip(int i) {
        return (byte[]) this.mStripBytes.get(i);
    }

    /* access modifiers changed from: protected */
    public int getStripCount() {
        return this.mStripBytes.size();
    }

    /* access modifiers changed from: protected */
    public ExifTag getTag(short s, int i) {
        IfdData ifdData = this.mIfdDatas[i];
        if (ifdData == null) {
            return null;
        }
        return ifdData.getTag(s);
    }

    /* access modifiers changed from: protected */
    public String getUserCommentAsASCII() {
        IfdData ifdData = this.mIfdDatas[0];
        if (ifdData == null) {
            return null;
        }
        ExifTag tag = ifdData.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_USER_COMMENT));
        if (tag == null) {
            return null;
        }
        byte[] stringByte = tag.getStringByte();
        if (stringByte != null && stringByte.length > 0) {
            try {
                return stringByte[stringByte.length + -1] == 0 ? new String(stringByte, 0, stringByte.length - 1, "US-ASCII") : new String(stringByte, "US-ASCII");
            } catch (UnsupportedEncodingException unused) {
                Log.w("ExifData", "Failed to decode the usercomment");
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public String getXiaomiComment() {
        IfdData ifdData = this.mIfdDatas[2];
        if (ifdData == null) {
            return null;
        }
        ExifTag tag = ifdData.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_XIAOMI_COMMENT));
        if (tag == null || tag.getComponentCount() < 1) {
            return null;
        }
        byte[] stringByte = tag.getStringByte();
        try {
            return stringByte[stringByte.length - 1] == 0 ? new String(stringByte, 0, stringByte.length - 1, "US-ASCII") : new String(stringByte, "US-ASCII");
        } catch (UnsupportedEncodingException unused) {
            Log.w("ExifData", "Failed to decode the xiaomicomment");
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public boolean hasCompressedThumbnail() {
        return this.mThumbnail != null;
    }

    /* access modifiers changed from: protected */
    public boolean hasUncompressedStrip() {
        return this.mStripBytes.size() != 0;
    }

    /* access modifiers changed from: protected */
    public void removeTag(short s, int i) {
        IfdData ifdData = this.mIfdDatas[i];
        if (ifdData != null) {
            ifdData.removeTag(s);
        }
    }

    /* access modifiers changed from: protected */
    public void setCompressedThumbnail(byte[] bArr) {
        this.mThumbnail = bArr;
    }

    /* access modifiers changed from: protected */
    public void setStripBytes(int i, byte[] bArr) {
        if (i < this.mStripBytes.size()) {
            this.mStripBytes.set(i, bArr);
            return;
        }
        for (int size = this.mStripBytes.size(); size < i; size++) {
            this.mStripBytes.add(null);
        }
        this.mStripBytes.add(bArr);
    }
}
