package com.miui.gallery3d.exif;

import android.util.Log;
import com.nexstreaming.nexeditorsdk.nexCrop;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.TreeMap;

class ExifParser {
    private static final short TAG_EXIF_IFD = ExifInterface.getTrueTagKey(ExifInterface.TAG_EXIF_IFD);
    private static final short TAG_GPS_IFD = ExifInterface.getTrueTagKey(ExifInterface.TAG_GPS_IFD);
    private static final short TAG_INTEROPERABILITY_IFD = ExifInterface.getTrueTagKey(ExifInterface.TAG_INTEROPERABILITY_IFD);
    private static final short TAG_JPEG_INTERCHANGE_FORMAT = ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
    private static final short TAG_JPEG_INTERCHANGE_FORMAT_LENGTH = ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
    private static final short TAG_STRIP_BYTE_COUNTS = ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS);
    private static final short TAG_STRIP_OFFSETS = ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS);
    private static final Charset US_ASCII = Charset.forName("US-ASCII");
    private int mApp1End;
    private boolean mContainExifData = false;
    private final TreeMap<Integer, Object> mCorrespondingEvent = new TreeMap<>();
    private byte[] mDataAboveIfd0;
    private int mIfd0Position;
    private int mIfdStartOffset = 0;
    private int mIfdType;
    private ImageEvent mImageEvent;
    private final ExifInterface mInterface;
    private ExifTag mJpegSizeTag;
    private boolean mNeedToParseOffsetsInCurrentIfd;
    private int mNumOfTagInIfd = 0;
    private int mOffsetToApp1EndFromSOF = 0;
    private final int mOptions;
    private ExifTag mStripSizeTag;
    private ExifTag mTag;
    private int mTiffStartPosition;
    private final CountedDataInputStream mTiffStream;

    private static class ExifTagEvent {
        boolean isRequested;
        ExifTag tag;

        ExifTagEvent(ExifTag exifTag, boolean z) {
            this.tag = exifTag;
            this.isRequested = z;
        }
    }

    private static class IfdEvent {
        int ifd;
        boolean isRequested;

        IfdEvent(int i, boolean z) {
            this.ifd = i;
            this.isRequested = z;
        }
    }

    private static class ImageEvent {
        int stripIndex;
        int type;

        ImageEvent(int i) {
            this.stripIndex = 0;
            this.type = i;
        }

        ImageEvent(int i, int i2) {
            this.type = i;
            this.stripIndex = i2;
        }
    }

    private ExifParser(InputStream inputStream, int i, ExifInterface exifInterface) throws IOException, ExifInvalidFormatException {
        if (inputStream != null) {
            this.mInterface = exifInterface;
            this.mContainExifData = seekTiffData(inputStream);
            this.mTiffStream = new CountedDataInputStream(inputStream);
            this.mOptions = i;
            if (this.mContainExifData) {
                parseTiffHeader();
                long readUnsignedInt = this.mTiffStream.readUnsignedInt();
                if (readUnsignedInt <= 2147483647L) {
                    int i2 = (int) readUnsignedInt;
                    this.mIfd0Position = i2;
                    this.mIfdType = 0;
                    if (isIfdRequested(0) || needToParseOffsetsInCurrentIfd()) {
                        registerIfd(0, readUnsignedInt);
                        if (readUnsignedInt != 8) {
                            this.mDataAboveIfd0 = new byte[(i2 - 8)];
                            read(this.mDataAboveIfd0);
                        }
                    }
                    return;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Invalid offset ");
                sb.append(readUnsignedInt);
                throw new ExifInvalidFormatException(sb.toString());
            }
            return;
        }
        throw new IOException("Null argument inputStream to ExifParser");
    }

    private boolean checkAllowed(int i, int i2) {
        int i3 = this.mInterface.getTagInfo().get(i2);
        if (i3 == 0) {
            return false;
        }
        return ExifInterface.isIfdAllowed(i3, i);
    }

    private void checkOffsetOrImageTag(ExifTag exifTag) {
        if (exifTag.getComponentCount() != 0) {
            short tagId = exifTag.getTagId();
            int ifd = exifTag.getIfd();
            if (tagId != TAG_EXIF_IFD || !checkAllowed(ifd, ExifInterface.TAG_EXIF_IFD)) {
                if (tagId != TAG_GPS_IFD || !checkAllowed(ifd, ExifInterface.TAG_GPS_IFD)) {
                    if (tagId != TAG_INTEROPERABILITY_IFD || !checkAllowed(ifd, ExifInterface.TAG_INTEROPERABILITY_IFD)) {
                        if (tagId != TAG_JPEG_INTERCHANGE_FORMAT || !checkAllowed(ifd, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT)) {
                            if (tagId != TAG_JPEG_INTERCHANGE_FORMAT_LENGTH || !checkAllowed(ifd, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH)) {
                                if (tagId != TAG_STRIP_OFFSETS || !checkAllowed(ifd, ExifInterface.TAG_STRIP_OFFSETS)) {
                                    if (tagId == TAG_STRIP_BYTE_COUNTS && checkAllowed(ifd, ExifInterface.TAG_STRIP_BYTE_COUNTS) && isThumbnailRequested() && exifTag.hasValue()) {
                                        this.mStripSizeTag = exifTag;
                                    }
                                } else if (isThumbnailRequested()) {
                                    if (exifTag.hasValue()) {
                                        for (int i = 0; i < exifTag.getComponentCount(); i++) {
                                            if (exifTag.getDataType() == 3) {
                                                registerUncompressedStrip(i, exifTag.getValueAt(i));
                                            } else {
                                                registerUncompressedStrip(i, exifTag.getValueAt(i));
                                            }
                                        }
                                    } else {
                                        this.mCorrespondingEvent.put(Integer.valueOf(exifTag.getOffset()), new ExifTagEvent(exifTag, false));
                                    }
                                }
                            } else if (isThumbnailRequested()) {
                                this.mJpegSizeTag = exifTag;
                            }
                        } else if (isThumbnailRequested()) {
                            registerCompressedImage(exifTag.getValueAt(0));
                        }
                    } else if (isIfdRequested(3)) {
                        registerIfd(3, exifTag.getValueAt(0));
                    }
                } else if (isIfdRequested(4)) {
                    registerIfd(4, exifTag.getValueAt(0));
                }
            } else if (isIfdRequested(2) || isIfdRequested(3)) {
                registerIfd(2, exifTag.getValueAt(0));
            }
        }
    }

    private boolean isIfdRequested(int i) {
        boolean z = true;
        switch (i) {
            case 0:
                if ((this.mOptions & 1) == 0) {
                    z = false;
                }
                return z;
            case 1:
                if ((this.mOptions & 2) == 0) {
                    z = false;
                }
                return z;
            case 2:
                if ((this.mOptions & 4) == 0) {
                    z = false;
                }
                return z;
            case 3:
                if ((this.mOptions & 16) == 0) {
                    z = false;
                }
                return z;
            case 4:
                if ((this.mOptions & 8) == 0) {
                    z = false;
                }
                return z;
            default:
                return false;
        }
    }

    private boolean isThumbnailRequested() {
        return (this.mOptions & 32) != 0;
    }

    private boolean needToParseOffsetsInCurrentIfd() {
        boolean z = false;
        switch (this.mIfdType) {
            case 0:
                if (isIfdRequested(2) || isIfdRequested(4) || isIfdRequested(3) || isIfdRequested(1)) {
                    z = true;
                }
                return z;
            case 1:
                return isThumbnailRequested();
            case 2:
                return isIfdRequested(3);
            default:
                return false;
        }
    }

    protected static ExifParser parse(InputStream inputStream, ExifInterface exifInterface) throws IOException, ExifInvalidFormatException {
        return new ExifParser(inputStream, 63, exifInterface);
    }

    private void parseTiffHeader() throws IOException, ExifInvalidFormatException {
        short readShort = this.mTiffStream.readShort();
        if (18761 == readShort) {
            this.mTiffStream.setByteOrder(ByteOrder.LITTLE_ENDIAN);
        } else if (19789 == readShort) {
            this.mTiffStream.setByteOrder(ByteOrder.BIG_ENDIAN);
        } else {
            throw new ExifInvalidFormatException("Invalid TIFF header");
        }
        if (this.mTiffStream.readShort() != 42) {
            throw new ExifInvalidFormatException("Invalid TIFF header");
        }
    }

    private ExifTag readTag() throws IOException, ExifInvalidFormatException {
        short readShort = this.mTiffStream.readShort();
        short readShort2 = this.mTiffStream.readShort();
        long readUnsignedInt = this.mTiffStream.readUnsignedInt();
        boolean z = true;
        if (readUnsignedInt > 100000) {
            throw new ExifInvalidFormatException(String.format(Locale.US, "Number of component of tag %d [%d] is larger than [%d]", new Object[]{Short.valueOf(readShort), Long.valueOf(readUnsignedInt), Integer.valueOf(nexCrop.ABSTRACT_DIMENSION)}));
        } else if (!ExifTag.isValidType(readShort2)) {
            Log.w("ExifParser", String.format(Locale.ENGLISH, "Tag %04x: Invalid data type %d", new Object[]{Short.valueOf(readShort), Short.valueOf(readShort2)}));
            this.mTiffStream.skip(4);
            return null;
        } else {
            int i = (int) readUnsignedInt;
            int i2 = this.mIfdType;
            if (i == 0) {
                z = false;
            }
            ExifTag exifTag = new ExifTag(readShort, readShort2, i, i2, z);
            int dataSize = exifTag.getDataSize();
            if (dataSize > 4) {
                long readUnsignedInt2 = this.mTiffStream.readUnsignedInt();
                if (readUnsignedInt2 > 2147483647L) {
                    throw new ExifInvalidFormatException("offset is larger then Integer.MAX_VALUE");
                } else if (readUnsignedInt2 >= ((long) this.mIfd0Position) || readShort2 != 7) {
                    exifTag.setOffset((int) readUnsignedInt2);
                } else {
                    byte[] bArr = new byte[i];
                    System.arraycopy(this.mDataAboveIfd0, ((int) readUnsignedInt2) - 8, bArr, 0, i);
                    exifTag.setValue(bArr);
                }
            } else {
                boolean hasDefinedCount = exifTag.hasDefinedCount();
                exifTag.setHasDefinedCount(false);
                readFullTagValue(exifTag);
                exifTag.setHasDefinedCount(hasDefinedCount);
                this.mTiffStream.skip((long) (4 - dataSize));
                exifTag.setOffset(this.mTiffStream.getReadByteCount() - 4);
            }
            return exifTag;
        }
    }

    private void registerCompressedImage(long j) {
        this.mCorrespondingEvent.put(Integer.valueOf((int) j), new ImageEvent(3));
    }

    private void registerIfd(int i, long j) {
        this.mCorrespondingEvent.put(Integer.valueOf((int) j), new IfdEvent(i, isIfdRequested(i)));
    }

    private void registerUncompressedStrip(int i, long j) {
        this.mCorrespondingEvent.put(Integer.valueOf((int) j), new ImageEvent(4, i));
    }

    private boolean seekTiffData(InputStream inputStream) throws IOException, ExifInvalidFormatException {
        CountedDataInputStream countedDataInputStream = new CountedDataInputStream(inputStream);
        if (countedDataInputStream.readShort() == -40) {
            short readShort = countedDataInputStream.readShort();
            while (readShort != -39 && !JpegHeader.isSofMarker(readShort)) {
                int readUnsignedShort = countedDataInputStream.readUnsignedShort();
                if (readShort == -31 && readUnsignedShort >= 8) {
                    int readInt = countedDataInputStream.readInt();
                    short readShort2 = countedDataInputStream.readShort();
                    readUnsignedShort -= 6;
                    if (readInt == 1165519206 && readShort2 == 0) {
                        this.mTiffStartPosition = countedDataInputStream.getReadByteCount();
                        this.mApp1End = readUnsignedShort;
                        this.mOffsetToApp1EndFromSOF = this.mTiffStartPosition + this.mApp1End;
                        return true;
                    }
                }
                if (readUnsignedShort >= 2) {
                    long j = (long) (readUnsignedShort - 2);
                    if (j == countedDataInputStream.skip(j)) {
                        readShort = countedDataInputStream.readShort();
                    }
                }
                Log.w("ExifParser", "Invalid JPEG format.");
                return false;
            }
            return false;
        }
        throw new ExifInvalidFormatException("Invalid JPEG format");
    }

    private void skipTo(int i) throws IOException {
        this.mTiffStream.skipTo((long) i);
        while (!this.mCorrespondingEvent.isEmpty() && ((Integer) this.mCorrespondingEvent.firstKey()).intValue() < i) {
            this.mCorrespondingEvent.pollFirstEntry();
        }
    }

    /* access modifiers changed from: protected */
    public ByteOrder getByteOrder() {
        return this.mTiffStream.getByteOrder();
    }

    /* access modifiers changed from: protected */
    public int getCompressedImageSize() {
        if (this.mJpegSizeTag == null) {
            return 0;
        }
        return (int) this.mJpegSizeTag.getValueAt(0);
    }

    /* access modifiers changed from: protected */
    public int getCurrentIfd() {
        return this.mIfdType;
    }

    /* access modifiers changed from: protected */
    public int getStripIndex() {
        return this.mImageEvent.stripIndex;
    }

    /* access modifiers changed from: protected */
    public int getStripSize() {
        if (this.mStripSizeTag == null) {
            return 0;
        }
        return (int) this.mStripSizeTag.getValueAt(0);
    }

    /* access modifiers changed from: protected */
    public ExifTag getTag() {
        return this.mTag;
    }

    /* access modifiers changed from: protected */
    public int next() throws IOException, ExifInvalidFormatException {
        if (!this.mContainExifData) {
            return 5;
        }
        int readByteCount = this.mTiffStream.getReadByteCount();
        int i = this.mIfdStartOffset + 2 + (this.mNumOfTagInIfd * 12);
        if (readByteCount < i) {
            this.mTag = readTag();
            if (this.mTag == null) {
                return next();
            }
            if (this.mNeedToParseOffsetsInCurrentIfd) {
                checkOffsetOrImageTag(this.mTag);
            }
            return 1;
        }
        if (readByteCount == i) {
            if (this.mIfdType == 0) {
                long readUnsignedLong = readUnsignedLong();
                if ((isIfdRequested(1) || isThumbnailRequested()) && readUnsignedLong != 0) {
                    registerIfd(1, readUnsignedLong);
                }
            } else {
                int intValue = this.mCorrespondingEvent.size() > 0 ? ((Integer) this.mCorrespondingEvent.firstEntry().getKey()).intValue() - this.mTiffStream.getReadByteCount() : 4;
                if (intValue < 4) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid size of link to next IFD: ");
                    sb.append(intValue);
                    Log.w("ExifParser", sb.toString());
                } else {
                    long readUnsignedLong2 = readUnsignedLong();
                    if (readUnsignedLong2 != 0) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Invalid link to next IFD: ");
                        sb2.append(readUnsignedLong2);
                        Log.w("ExifParser", sb2.toString());
                    }
                }
            }
        }
        while (this.mCorrespondingEvent.size() != 0) {
            Entry pollFirstEntry = this.mCorrespondingEvent.pollFirstEntry();
            Object value = pollFirstEntry.getValue();
            try {
                skipTo(((Integer) pollFirstEntry.getKey()).intValue());
                if (value instanceof IfdEvent) {
                    IfdEvent ifdEvent = (IfdEvent) value;
                    this.mIfdType = ifdEvent.ifd;
                    this.mNumOfTagInIfd = this.mTiffStream.readUnsignedShort();
                    this.mIfdStartOffset = ((Integer) pollFirstEntry.getKey()).intValue();
                    if ((this.mNumOfTagInIfd * 12) + this.mIfdStartOffset + 2 > this.mApp1End) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Invalid size of IFD ");
                        sb3.append(this.mIfdType);
                        Log.w("ExifParser", sb3.toString());
                        return 5;
                    }
                    this.mNeedToParseOffsetsInCurrentIfd = needToParseOffsetsInCurrentIfd();
                    if (ifdEvent.isRequested) {
                        return 0;
                    }
                    skipRemainingTagsInCurrentIfd();
                } else if (value instanceof ImageEvent) {
                    this.mImageEvent = (ImageEvent) value;
                    return this.mImageEvent.type;
                } else {
                    ExifTagEvent exifTagEvent = (ExifTagEvent) value;
                    this.mTag = exifTagEvent.tag;
                    if (this.mTag.getDataType() != 7) {
                        readFullTagValue(this.mTag);
                        checkOffsetOrImageTag(this.mTag);
                    }
                    if (exifTagEvent.isRequested) {
                        return 2;
                    }
                }
            } catch (IOException unused) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Failed to skip to data at: ");
                sb4.append(pollFirstEntry.getKey());
                sb4.append(" for ");
                sb4.append(value.getClass().getName());
                sb4.append(", the file may be broken.");
                Log.w("ExifParser", sb4.toString());
            }
        }
        return 5;
    }

    /* access modifiers changed from: protected */
    public int read(byte[] bArr) throws IOException {
        return this.mTiffStream.read(bArr);
    }

    /* access modifiers changed from: protected */
    public void readFullTagValue(ExifTag exifTag) throws IOException, ExifInvalidFormatException {
        short dataType = exifTag.getDataType();
        if (dataType == 2 || dataType == 7 || dataType == 1) {
            int componentCount = exifTag.getComponentCount();
            if (this.mCorrespondingEvent.size() > 0 && ((Integer) this.mCorrespondingEvent.firstEntry().getKey()).intValue() < this.mTiffStream.getReadByteCount() + componentCount) {
                Object value = this.mCorrespondingEvent.firstEntry().getValue();
                if (value instanceof ImageEvent) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Thumbnail overlaps value for tag: \n");
                    sb.append(exifTag.toString());
                    Log.w("ExifParser", sb.toString());
                    Entry pollFirstEntry = this.mCorrespondingEvent.pollFirstEntry();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Invalid thumbnail offset: ");
                    sb2.append(pollFirstEntry.getKey());
                    Log.w("ExifParser", sb2.toString());
                } else {
                    if (value instanceof IfdEvent) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Ifd ");
                        sb3.append(((IfdEvent) value).ifd);
                        sb3.append(" overlaps value for tag: \n");
                        sb3.append(exifTag.toString());
                        Log.w("ExifParser", sb3.toString());
                    } else if (value instanceof ExifTagEvent) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Tag value for tag: \n");
                        sb4.append(((ExifTagEvent) value).tag.toString());
                        sb4.append(" overlaps value for tag: \n");
                        sb4.append(exifTag.toString());
                        Log.w("ExifParser", sb4.toString());
                    }
                    int intValue = ((Integer) this.mCorrespondingEvent.firstEntry().getKey()).intValue() - this.mTiffStream.getReadByteCount();
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("Invalid size of tag: \n");
                    sb5.append(exifTag.toString());
                    sb5.append(" setting count to: ");
                    sb5.append(intValue);
                    Log.w("ExifParser", sb5.toString());
                    exifTag.forceSetComponentCount(intValue);
                }
            }
        }
        int componentCount2 = exifTag.getComponentCount();
        int i = 0;
        if (componentCount2 >= 0) {
            switch (exifTag.getDataType()) {
                case 1:
                case 7:
                    byte[] bArr = new byte[componentCount2];
                    read(bArr);
                    exifTag.setValue(bArr);
                    return;
                case 2:
                    exifTag.setValue(readString(componentCount2));
                    return;
                case 3:
                    int[] iArr = new int[componentCount2];
                    int length = iArr.length;
                    while (i < length) {
                        iArr[i] = readUnsignedShort();
                        i++;
                    }
                    exifTag.setValue(iArr);
                    return;
                case 4:
                    long[] jArr = new long[componentCount2];
                    int length2 = jArr.length;
                    while (i < length2) {
                        jArr[i] = readUnsignedLong();
                        i++;
                    }
                    exifTag.setValue(jArr);
                    return;
                case 5:
                    Rational[] rationalArr = new Rational[componentCount2];
                    int length3 = rationalArr.length;
                    while (i < length3) {
                        rationalArr[i] = readUnsignedRational();
                        i++;
                    }
                    exifTag.setValue(rationalArr);
                    return;
                case 9:
                    int[] iArr2 = new int[componentCount2];
                    int length4 = iArr2.length;
                    while (i < length4) {
                        iArr2[i] = readLong();
                        i++;
                    }
                    exifTag.setValue(iArr2);
                    return;
                case 10:
                    Rational[] rationalArr2 = new Rational[componentCount2];
                    int length5 = rationalArr2.length;
                    while (i < length5) {
                        rationalArr2[i] = readRational();
                        i++;
                    }
                    exifTag.setValue(rationalArr2);
                    return;
                default:
                    return;
            }
        } else {
            throw new ExifInvalidFormatException(String.format(Locale.US, "Invalid size [%d] of tag [%s]", new Object[]{Integer.valueOf(componentCount2), exifTag}));
        }
    }

    /* access modifiers changed from: protected */
    public int readLong() throws IOException {
        return this.mTiffStream.readInt();
    }

    /* access modifiers changed from: protected */
    public Rational readRational() throws IOException {
        return new Rational((long) readLong(), (long) readLong());
    }

    /* access modifiers changed from: protected */
    public String readString(int i) throws IOException {
        return readString(i, US_ASCII);
    }

    /* access modifiers changed from: protected */
    public String readString(int i, Charset charset) throws IOException {
        return i > 0 ? this.mTiffStream.readString(i, charset) : "";
    }

    /* access modifiers changed from: protected */
    public long readUnsignedLong() throws IOException {
        return ((long) readLong()) & 4294967295L;
    }

    /* access modifiers changed from: protected */
    public Rational readUnsignedRational() throws IOException {
        return new Rational(readUnsignedLong(), readUnsignedLong());
    }

    /* access modifiers changed from: protected */
    public int readUnsignedShort() throws IOException {
        return this.mTiffStream.readShort() & 65535;
    }

    /* access modifiers changed from: protected */
    public void registerForTagValue(ExifTag exifTag) {
        if (exifTag.getOffset() >= this.mTiffStream.getReadByteCount()) {
            this.mCorrespondingEvent.put(Integer.valueOf(exifTag.getOffset()), new ExifTagEvent(exifTag, true));
        }
    }

    /* access modifiers changed from: protected */
    public void skipRemainingTagsInCurrentIfd() throws IOException, ExifInvalidFormatException {
        int i = this.mIfdStartOffset + 2 + (this.mNumOfTagInIfd * 12);
        int readByteCount = this.mTiffStream.getReadByteCount();
        if (readByteCount <= i) {
            if (this.mNeedToParseOffsetsInCurrentIfd) {
                while (readByteCount < i) {
                    this.mTag = readTag();
                    readByteCount += 12;
                    if (this.mTag != null) {
                        checkOffsetOrImageTag(this.mTag);
                    }
                }
            } else {
                skipTo(i);
            }
            long readUnsignedLong = readUnsignedLong();
            if (this.mIfdType == 0 && ((isIfdRequested(1) || isThumbnailRequested()) && readUnsignedLong > 0)) {
                registerIfd(1, readUnsignedLong);
            }
        }
    }
}
