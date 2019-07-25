package android.support.media;

import android.content.res.AssetManager.AssetInputStream;
import android.util.Log;
import android.util.Pair;
import com.meicam.sdk.NvsFxDescription.ParamInfoObject;
import com.nexstreaming.nexeditorsdk.nexClip;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ExifInterface {
    /* access modifiers changed from: private */
    public static final Charset ASCII = Charset.forName("US-ASCII");
    private static final int[] BITS_PER_SAMPLE_GREYSCALE_1 = {4};
    private static final int[] BITS_PER_SAMPLE_GREYSCALE_2 = {8};
    private static final int[] BITS_PER_SAMPLE_RGB = {8, 8, 8};
    /* access modifiers changed from: private */
    public static final byte[] EXIF_ASCII_PREFIX = {65, 83, 67, 73, 73, 0, 0, 0};
    private static final ExifTag[] EXIF_POINTER_TAGS = {new ExifTag("SubIFDPointer", 330, 4), new ExifTag("ExifIFDPointer", 34665, 4), new ExifTag("GPSInfoIFDPointer", 34853, 4), new ExifTag("InteroperabilityIFDPointer", 40965, 4), new ExifTag("CameraSettingsIFDPointer", 8224, 1), new ExifTag("ImageProcessingIFDPointer", 8256, 1)};
    private static final ExifTag[][] EXIF_TAGS = {IFD_TIFF_TAGS, IFD_EXIF_TAGS, IFD_GPS_TAGS, IFD_INTEROPERABILITY_TAGS, IFD_THUMBNAIL_TAGS, IFD_TIFF_TAGS, ORF_MAKER_NOTE_TAGS, ORF_CAMERA_SETTINGS_TAGS, ORF_IMAGE_PROCESSING_TAGS, PEF_TAGS};
    private static final byte[] IDENTIFIER_EXIF_APP1 = "Exif\u0000\u0000".getBytes(ASCII);
    private static final ExifTag[] IFD_EXIF_TAGS;
    /* access modifiers changed from: private */
    public static final int[] IFD_FORMAT_BYTES_PER_FORMAT = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8, 1};
    /* access modifiers changed from: private */
    public static final String[] IFD_FORMAT_NAMES = {"", "BYTE", ParamInfoObject.PARAM_TYPE_STRING, "USHORT", "ULONG", "URATIONAL", "SBYTE", "UNDEFINED", "SSHORT", "SLONG", "SRATIONAL", "SINGLE", "DOUBLE"};
    private static final ExifTag[] IFD_GPS_TAGS = {new ExifTag("GPSVersionID", 0, 1), new ExifTag("GPSLatitudeRef", 1, 2), new ExifTag("GPSLatitude", 2, 5), new ExifTag("GPSLongitudeRef", 3, 2), new ExifTag("GPSLongitude", 4, 5), new ExifTag("GPSAltitudeRef", 5, 1), new ExifTag("GPSAltitude", 6, 5), new ExifTag("GPSTimeStamp", 7, 5), new ExifTag("GPSSatellites", 8, 2), new ExifTag("GPSStatus", 9, 2), new ExifTag("GPSMeasureMode", 10, 2), new ExifTag("GPSDOP", 11, 5), new ExifTag("GPSSpeedRef", 12, 2), new ExifTag("GPSSpeed", 13, 5), new ExifTag("GPSTrackRef", 14, 2), new ExifTag("GPSTrack", 15, 5), new ExifTag("GPSImgDirectionRef", 16, 2), new ExifTag("GPSImgDirection", 17, 5), new ExifTag("GPSMapDatum", 18, 2), new ExifTag("GPSDestLatitudeRef", 19, 2), new ExifTag("GPSDestLatitude", 20, 5), new ExifTag("GPSDestLongitudeRef", 21, 2), new ExifTag("GPSDestLongitude", 22, 5), new ExifTag("GPSDestBearingRef", 23, 2), new ExifTag("GPSDestBearing", 24, 5), new ExifTag("GPSDestDistanceRef", 25, 2), new ExifTag("GPSDestDistance", 26, 5), new ExifTag("GPSProcessingMethod", 27, 7), new ExifTag("GPSAreaInformation", 28, 7), new ExifTag("GPSDateStamp", 29, 2), new ExifTag("GPSDifferential", 30, 3)};
    private static final ExifTag[] IFD_INTEROPERABILITY_TAGS = {new ExifTag("InteroperabilityIndex", 1, 2)};
    private static final ExifTag[] IFD_THUMBNAIL_TAGS;
    private static final ExifTag[] IFD_TIFF_TAGS;
    private static final ExifTag JPEG_INTERCHANGE_FORMAT_LENGTH_TAG = new ExifTag("JPEGInterchangeFormatLength", 514, 4);
    private static final ExifTag JPEG_INTERCHANGE_FORMAT_TAG = new ExifTag("JPEGInterchangeFormat", 513, 4);
    private static final byte[] JPEG_SIGNATURE = {-1, -40, -1};
    private static final ExifTag[] ORF_CAMERA_SETTINGS_TAGS = {new ExifTag("PreviewImageStart", 257, 4), new ExifTag("PreviewImageLength", 258, 4)};
    private static final ExifTag[] ORF_IMAGE_PROCESSING_TAGS = {new ExifTag("AspectFrame", 4371, 3)};
    private static final byte[] ORF_MAKER_NOTE_HEADER_1 = {79, 76, 89, 77, 80, 0};
    private static final byte[] ORF_MAKER_NOTE_HEADER_2 = {79, 76, 89, 77, 80, 85, 83, 0, 73, 73};
    private static final ExifTag[] ORF_MAKER_NOTE_TAGS = {new ExifTag("ThumbnailImage", 256, 7), new ExifTag("CameraSettingsIFDPointer", 8224, 4), new ExifTag("ImageProcessingIFDPointer", 8256, 4)};
    private static final ExifTag[] PEF_TAGS = {new ExifTag("ColorSpace", 55, 3)};
    private static final ExifTag TAG_RAF_IMAGE_SIZE = new ExifTag("StripOffsets", 273, 3);
    private static final HashMap sExifPointerTagMap = new HashMap();
    private static final HashMap[] sExifTagMapsForReading = new HashMap[EXIF_TAGS.length];
    private static final HashMap[] sExifTagMapsForWriting = new HashMap[EXIF_TAGS.length];
    private static SimpleDateFormat sFormatter = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
    private static final Pattern sGpsTimestampPattern = Pattern.compile("^([0-9][0-9]):([0-9][0-9]):([0-9][0-9])$");
    private static final Pattern sNonZeroTimePattern = Pattern.compile(".*[1-9].*");
    private static final HashSet<String> sTagSetForCompatibility = new HashSet<>(Arrays.asList(new String[]{"FNumber", "DigitalZoomRatio", "ExposureTime", "SubjectDistance", "GPSTimeStamp"}));
    private final AssetInputStream mAssetInputStream;
    private final HashMap[] mAttributes = new HashMap[EXIF_TAGS.length];
    private ByteOrder mExifByteOrder = ByteOrder.BIG_ENDIAN;
    private int mExifOffset;
    private final String mFilename;
    private boolean mHasThumbnail;
    private boolean mIsSupportedFile;
    private int mMimeType;
    private int mOrfMakerNoteOffset;
    private int mOrfThumbnailLength;
    private int mOrfThumbnailOffset;
    private int mRw2JpgFromRawOffset;
    private byte[] mThumbnailBytes;
    private int mThumbnailCompression;
    private int mThumbnailLength;
    private int mThumbnailOffset;

    private static class ByteOrderedDataInputStream extends InputStream implements DataInput {
        private static final ByteOrder BIG_ENDIAN = ByteOrder.BIG_ENDIAN;
        private static final ByteOrder LITTLE_ENDIAN = ByteOrder.LITTLE_ENDIAN;
        private ByteOrder mByteOrder;
        private DataInputStream mDataInputStream;
        private InputStream mInputStream;
        /* access modifiers changed from: private */
        public final int mLength;
        /* access modifiers changed from: private */
        public int mPosition;

        public ByteOrderedDataInputStream(InputStream inputStream) throws IOException {
            this.mByteOrder = ByteOrder.BIG_ENDIAN;
            this.mInputStream = inputStream;
            this.mDataInputStream = new DataInputStream(inputStream);
            this.mLength = this.mDataInputStream.available();
            this.mPosition = 0;
            this.mDataInputStream.mark(this.mLength);
        }

        public ByteOrderedDataInputStream(byte[] bArr) throws IOException {
            this((InputStream) new ByteArrayInputStream(bArr));
        }

        public int available() throws IOException {
            return this.mDataInputStream.available();
        }

        public int peek() {
            return this.mPosition;
        }

        public int read() throws IOException {
            this.mPosition++;
            return this.mDataInputStream.read();
        }

        public boolean readBoolean() throws IOException {
            this.mPosition++;
            return this.mDataInputStream.readBoolean();
        }

        public byte readByte() throws IOException {
            this.mPosition++;
            if (this.mPosition <= this.mLength) {
                int read = this.mDataInputStream.read();
                if (read >= 0) {
                    return (byte) read;
                }
                throw new EOFException();
            }
            throw new EOFException();
        }

        public char readChar() throws IOException {
            this.mPosition += 2;
            return this.mDataInputStream.readChar();
        }

        public double readDouble() throws IOException {
            return Double.longBitsToDouble(readLong());
        }

        public float readFloat() throws IOException {
            return Float.intBitsToFloat(readInt());
        }

        public void readFully(byte[] bArr) throws IOException {
            this.mPosition += bArr.length;
            if (this.mPosition > this.mLength) {
                throw new EOFException();
            } else if (this.mDataInputStream.read(bArr, 0, bArr.length) != bArr.length) {
                throw new IOException("Couldn't read up to the length of buffer");
            }
        }

        public void readFully(byte[] bArr, int i, int i2) throws IOException {
            this.mPosition += i2;
            if (this.mPosition > this.mLength) {
                throw new EOFException();
            } else if (this.mDataInputStream.read(bArr, i, i2) != i2) {
                throw new IOException("Couldn't read up to the length of buffer");
            }
        }

        public int readInt() throws IOException {
            this.mPosition += 4;
            if (this.mPosition <= this.mLength) {
                int read = this.mDataInputStream.read();
                int read2 = this.mDataInputStream.read();
                int read3 = this.mDataInputStream.read();
                int read4 = this.mDataInputStream.read();
                if ((read | read2 | read3 | read4) < 0) {
                    throw new EOFException();
                } else if (this.mByteOrder == LITTLE_ENDIAN) {
                    return (read4 << 24) + (read3 << 16) + (read2 << 8) + read;
                } else {
                    if (this.mByteOrder == BIG_ENDIAN) {
                        return (read << 24) + (read2 << 16) + (read3 << 8) + read4;
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid byte order: ");
                    sb.append(this.mByteOrder);
                    throw new IOException(sb.toString());
                }
            } else {
                throw new EOFException();
            }
        }

        public String readLine() throws IOException {
            Log.d("ExifInterface", "Currently unsupported");
            return null;
        }

        public long readLong() throws IOException {
            this.mPosition += 8;
            if (this.mPosition <= this.mLength) {
                int read = this.mDataInputStream.read();
                int read2 = this.mDataInputStream.read();
                int read3 = this.mDataInputStream.read();
                int read4 = this.mDataInputStream.read();
                int read5 = this.mDataInputStream.read();
                int read6 = this.mDataInputStream.read();
                int read7 = this.mDataInputStream.read();
                int read8 = this.mDataInputStream.read();
                if ((read | read2 | read3 | read4 | read5 | read6 | read7 | read8) < 0) {
                    throw new EOFException();
                } else if (this.mByteOrder == LITTLE_ENDIAN) {
                    return (((long) read8) << 56) + (((long) read7) << 48) + (((long) read6) << 40) + (((long) read5) << 32) + (((long) read4) << 24) + (((long) read3) << 16) + (((long) read2) << 8) + ((long) read);
                } else {
                    int i = read2;
                    if (this.mByteOrder == BIG_ENDIAN) {
                        return (((long) read) << 56) + (((long) i) << 48) + (((long) read3) << 40) + (((long) read4) << 32) + (((long) read5) << 24) + (((long) read6) << 16) + (((long) read7) << 8) + ((long) read8);
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid byte order: ");
                    sb.append(this.mByteOrder);
                    throw new IOException(sb.toString());
                }
            } else {
                throw new EOFException();
            }
        }

        public short readShort() throws IOException {
            this.mPosition += 2;
            if (this.mPosition <= this.mLength) {
                int read = this.mDataInputStream.read();
                int read2 = this.mDataInputStream.read();
                if ((read | read2) < 0) {
                    throw new EOFException();
                } else if (this.mByteOrder == LITTLE_ENDIAN) {
                    return (short) ((read2 << 8) + read);
                } else {
                    if (this.mByteOrder == BIG_ENDIAN) {
                        return (short) ((read << 8) + read2);
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid byte order: ");
                    sb.append(this.mByteOrder);
                    throw new IOException(sb.toString());
                }
            } else {
                throw new EOFException();
            }
        }

        public String readUTF() throws IOException {
            this.mPosition += 2;
            return this.mDataInputStream.readUTF();
        }

        public int readUnsignedByte() throws IOException {
            this.mPosition++;
            return this.mDataInputStream.readUnsignedByte();
        }

        public long readUnsignedInt() throws IOException {
            return ((long) readInt()) & 4294967295L;
        }

        public int readUnsignedShort() throws IOException {
            this.mPosition += 2;
            if (this.mPosition <= this.mLength) {
                int read = this.mDataInputStream.read();
                int read2 = this.mDataInputStream.read();
                if ((read | read2) < 0) {
                    throw new EOFException();
                } else if (this.mByteOrder == LITTLE_ENDIAN) {
                    return (read2 << 8) + read;
                } else {
                    if (this.mByteOrder == BIG_ENDIAN) {
                        return (read << 8) + read2;
                    }
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid byte order: ");
                    sb.append(this.mByteOrder);
                    throw new IOException(sb.toString());
                }
            } else {
                throw new EOFException();
            }
        }

        public void seek(long j) throws IOException {
            if (((long) this.mPosition) > j) {
                this.mPosition = 0;
                this.mDataInputStream.reset();
                this.mDataInputStream.mark(this.mLength);
            } else {
                j -= (long) this.mPosition;
            }
            int i = (int) j;
            if (skipBytes(i) != i) {
                throw new IOException("Couldn't seek up to the byteCount");
            }
        }

        public void setByteOrder(ByteOrder byteOrder) {
            this.mByteOrder = byteOrder;
        }

        public int skipBytes(int i) throws IOException {
            int min = Math.min(i, this.mLength - this.mPosition);
            int i2 = 0;
            while (i2 < min) {
                i2 += this.mDataInputStream.skipBytes(min - i2);
            }
            this.mPosition += i2;
            return i2;
        }
    }

    private static class ExifAttribute {
        public final byte[] bytes;
        public final int format;
        public final int numberOfComponents;

        private ExifAttribute(int i, int i2, byte[] bArr) {
            this.format = i;
            this.numberOfComponents = i2;
            this.bytes = bArr;
        }

        public static ExifAttribute createByte(String str) {
            if (str.length() != 1 || str.charAt(0) < '0' || str.charAt(0) > '1') {
                byte[] bytes2 = str.getBytes(ExifInterface.ASCII);
                return new ExifAttribute(1, bytes2.length, bytes2);
            }
            byte[] bArr = {(byte) (str.charAt(0) - '0')};
            return new ExifAttribute(1, bArr.length, bArr);
        }

        public static ExifAttribute createDouble(double[] dArr, ByteOrder byteOrder) {
            ByteBuffer wrap = ByteBuffer.wrap(new byte[(ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[12] * dArr.length)]);
            wrap.order(byteOrder);
            for (double putDouble : dArr) {
                wrap.putDouble(putDouble);
            }
            return new ExifAttribute(12, dArr.length, wrap.array());
        }

        public static ExifAttribute createSLong(int[] iArr, ByteOrder byteOrder) {
            ByteBuffer wrap = ByteBuffer.wrap(new byte[(ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[9] * iArr.length)]);
            wrap.order(byteOrder);
            for (int putInt : iArr) {
                wrap.putInt(putInt);
            }
            return new ExifAttribute(9, iArr.length, wrap.array());
        }

        public static ExifAttribute createSRational(Rational[] rationalArr, ByteOrder byteOrder) {
            ByteBuffer wrap = ByteBuffer.wrap(new byte[(ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[10] * rationalArr.length)]);
            wrap.order(byteOrder);
            for (Rational rational : rationalArr) {
                wrap.putInt((int) rational.numerator);
                wrap.putInt((int) rational.denominator);
            }
            return new ExifAttribute(10, rationalArr.length, wrap.array());
        }

        public static ExifAttribute createString(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(0);
            byte[] bytes2 = sb.toString().getBytes(ExifInterface.ASCII);
            return new ExifAttribute(2, bytes2.length, bytes2);
        }

        public static ExifAttribute createULong(long j, ByteOrder byteOrder) {
            return createULong(new long[]{j}, byteOrder);
        }

        public static ExifAttribute createULong(long[] jArr, ByteOrder byteOrder) {
            ByteBuffer wrap = ByteBuffer.wrap(new byte[(ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[4] * jArr.length)]);
            wrap.order(byteOrder);
            for (long j : jArr) {
                wrap.putInt((int) j);
            }
            return new ExifAttribute(4, jArr.length, wrap.array());
        }

        public static ExifAttribute createURational(Rational rational, ByteOrder byteOrder) {
            return createURational(new Rational[]{rational}, byteOrder);
        }

        public static ExifAttribute createURational(Rational[] rationalArr, ByteOrder byteOrder) {
            ByteBuffer wrap = ByteBuffer.wrap(new byte[(ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[5] * rationalArr.length)]);
            wrap.order(byteOrder);
            for (Rational rational : rationalArr) {
                wrap.putInt((int) rational.numerator);
                wrap.putInt((int) rational.denominator);
            }
            return new ExifAttribute(5, rationalArr.length, wrap.array());
        }

        public static ExifAttribute createUShort(int i, ByteOrder byteOrder) {
            return createUShort(new int[]{i}, byteOrder);
        }

        public static ExifAttribute createUShort(int[] iArr, ByteOrder byteOrder) {
            ByteBuffer wrap = ByteBuffer.wrap(new byte[(ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[3] * iArr.length)]);
            wrap.order(byteOrder);
            for (int i : iArr) {
                wrap.putShort((short) i);
            }
            return new ExifAttribute(3, iArr.length, wrap.array());
        }

        /* access modifiers changed from: private */
        /* JADX WARNING: Removed duplicated region for block: B:164:0x01eb A[SYNTHETIC, Splitter:B:164:0x01eb] */
        public Object getValue(ByteOrder byteOrder) {
            ByteOrderedDataInputStream byteOrderedDataInputStream;
            try {
                byteOrderedDataInputStream = new ByteOrderedDataInputStream(this.bytes);
                try {
                    byteOrderedDataInputStream.setByteOrder(byteOrder);
                    boolean z = true;
                    int i = 0;
                    switch (this.format) {
                        case 1:
                        case 6:
                            if (this.bytes.length != 1 || this.bytes[0] < 0 || this.bytes[0] > 1) {
                                String str = new String(this.bytes, ExifInterface.ASCII);
                                try {
                                    byteOrderedDataInputStream.close();
                                } catch (IOException e) {
                                    Log.e("ExifInterface", "IOException occurred while closing InputStream", e);
                                }
                                return str;
                            }
                            String str2 = new String(new char[]{(char) (this.bytes[0] + 48)});
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e2) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e2);
                            }
                            return str2;
                        case 2:
                        case 7:
                            if (this.numberOfComponents >= ExifInterface.EXIF_ASCII_PREFIX.length) {
                                int i2 = 0;
                                while (true) {
                                    if (i2 < ExifInterface.EXIF_ASCII_PREFIX.length) {
                                        if (this.bytes[i2] != ExifInterface.EXIF_ASCII_PREFIX[i2]) {
                                            z = false;
                                        } else {
                                            i2++;
                                        }
                                    }
                                }
                                if (z) {
                                    i = ExifInterface.EXIF_ASCII_PREFIX.length;
                                }
                            }
                            StringBuilder sb = new StringBuilder();
                            while (true) {
                                if (i < this.numberOfComponents) {
                                    byte b = this.bytes[i];
                                    if (b != 0) {
                                        if (b >= 32) {
                                            sb.append((char) b);
                                        } else {
                                            sb.append('?');
                                        }
                                        i++;
                                    }
                                }
                            }
                            String sb2 = sb.toString();
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e3) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e3);
                            }
                            return sb2;
                        case 3:
                            int[] iArr = new int[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                iArr[i] = byteOrderedDataInputStream.readUnsignedShort();
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e4) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e4);
                            }
                            return iArr;
                        case 4:
                            long[] jArr = new long[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                jArr[i] = byteOrderedDataInputStream.readUnsignedInt();
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e5) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e5);
                            }
                            return jArr;
                        case 5:
                            Rational[] rationalArr = new Rational[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                Rational rational = new Rational(byteOrderedDataInputStream.readUnsignedInt(), byteOrderedDataInputStream.readUnsignedInt());
                                rationalArr[i] = rational;
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e6) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e6);
                            }
                            return rationalArr;
                        case 8:
                            int[] iArr2 = new int[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                iArr2[i] = byteOrderedDataInputStream.readShort();
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e7) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e7);
                            }
                            return iArr2;
                        case 9:
                            int[] iArr3 = new int[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                iArr3[i] = byteOrderedDataInputStream.readInt();
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e8) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e8);
                            }
                            return iArr3;
                        case 10:
                            Rational[] rationalArr2 = new Rational[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                Rational rational2 = new Rational((long) byteOrderedDataInputStream.readInt(), (long) byteOrderedDataInputStream.readInt());
                                rationalArr2[i] = rational2;
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e9) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e9);
                            }
                            return rationalArr2;
                        case 11:
                            double[] dArr = new double[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                dArr[i] = (double) byteOrderedDataInputStream.readFloat();
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e10) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e10);
                            }
                            return dArr;
                        case 12:
                            double[] dArr2 = new double[this.numberOfComponents];
                            while (i < this.numberOfComponents) {
                                dArr2[i] = byteOrderedDataInputStream.readDouble();
                                i++;
                            }
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e11) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e11);
                            }
                            return dArr2;
                        default:
                            try {
                                byteOrderedDataInputStream.close();
                            } catch (IOException e12) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e12);
                            }
                            return null;
                    }
                } catch (IOException e13) {
                    e = e13;
                }
                e = e13;
            } catch (IOException e14) {
                e = e14;
                byteOrderedDataInputStream = null;
            } catch (Throwable th) {
                th = th;
                byteOrderedDataInputStream = null;
                if (byteOrderedDataInputStream != null) {
                }
                throw th;
            }
            try {
                Log.w("ExifInterface", "IOException occurred during reading a value", e);
                if (byteOrderedDataInputStream != null) {
                    try {
                        byteOrderedDataInputStream.close();
                    } catch (IOException e15) {
                        Log.e("ExifInterface", "IOException occurred while closing InputStream", e15);
                    }
                }
                return null;
            } catch (Throwable th2) {
                th = th2;
                if (byteOrderedDataInputStream != null) {
                    try {
                        byteOrderedDataInputStream.close();
                    } catch (IOException e16) {
                        Log.e("ExifInterface", "IOException occurred while closing InputStream", e16);
                    }
                }
                throw th;
            }
        }

        public double getDoubleValue(ByteOrder byteOrder) {
            Object value = getValue(byteOrder);
            if (value == null) {
                throw new NumberFormatException("NULL can't be converted to a double value");
            } else if (value instanceof String) {
                return Double.parseDouble((String) value);
            } else {
                if (value instanceof long[]) {
                    long[] jArr = (long[]) value;
                    if (jArr.length == 1) {
                        return (double) jArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof int[]) {
                    int[] iArr = (int[]) value;
                    if (iArr.length == 1) {
                        return (double) iArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof double[]) {
                    double[] dArr = (double[]) value;
                    if (dArr.length == 1) {
                        return dArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof Rational[]) {
                    Rational[] rationalArr = (Rational[]) value;
                    if (rationalArr.length == 1) {
                        return rationalArr[0].calculate();
                    }
                    throw new NumberFormatException("There are more than one component");
                } else {
                    throw new NumberFormatException("Couldn't find a double value");
                }
            }
        }

        public int getIntValue(ByteOrder byteOrder) {
            Object value = getValue(byteOrder);
            if (value == null) {
                throw new NumberFormatException("NULL can't be converted to a integer value");
            } else if (value instanceof String) {
                return Integer.parseInt((String) value);
            } else {
                if (value instanceof long[]) {
                    long[] jArr = (long[]) value;
                    if (jArr.length == 1) {
                        return (int) jArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof int[]) {
                    int[] iArr = (int[]) value;
                    if (iArr.length == 1) {
                        return iArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else {
                    throw new NumberFormatException("Couldn't find a integer value");
                }
            }
        }

        public String getStringValue(ByteOrder byteOrder) {
            Object value = getValue(byteOrder);
            if (value == null) {
                return null;
            }
            if (value instanceof String) {
                return (String) value;
            }
            StringBuilder sb = new StringBuilder();
            int i = 0;
            if (value instanceof long[]) {
                long[] jArr = (long[]) value;
                while (i < jArr.length) {
                    sb.append(jArr[i]);
                    i++;
                    if (i != jArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            } else if (value instanceof int[]) {
                int[] iArr = (int[]) value;
                while (i < iArr.length) {
                    sb.append(iArr[i]);
                    i++;
                    if (i != iArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            } else if (value instanceof double[]) {
                double[] dArr = (double[]) value;
                while (i < dArr.length) {
                    sb.append(dArr[i]);
                    i++;
                    if (i != dArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            } else if (!(value instanceof Rational[])) {
                return null;
            } else {
                Rational[] rationalArr = (Rational[]) value;
                while (i < rationalArr.length) {
                    sb.append(rationalArr[i].numerator);
                    sb.append('/');
                    sb.append(rationalArr[i].denominator);
                    i++;
                    if (i != rationalArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            }
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("(");
            sb.append(ExifInterface.IFD_FORMAT_NAMES[this.format]);
            sb.append(", data length:");
            sb.append(this.bytes.length);
            sb.append(")");
            return sb.toString();
        }
    }

    private static class ExifTag {
        public final String name;
        public final int number;
        public final int primaryFormat;
        public final int secondaryFormat;

        private ExifTag(String str, int i, int i2) {
            this.name = str;
            this.number = i;
            this.primaryFormat = i2;
            this.secondaryFormat = -1;
        }

        private ExifTag(String str, int i, int i2, int i3) {
            this.name = str;
            this.number = i;
            this.primaryFormat = i2;
            this.secondaryFormat = i3;
        }
    }

    private static class Rational {
        public final long denominator;
        public final long numerator;

        private Rational(long j, long j2) {
            if (j2 == 0) {
                this.numerator = 0;
                this.denominator = 1;
                return;
            }
            this.numerator = j;
            this.denominator = j2;
        }

        public double calculate() {
            double d = (double) this.numerator;
            double d2 = (double) this.denominator;
            Double.isNaN(d);
            Double.isNaN(d2);
            return d / d2;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.numerator);
            sb.append("/");
            sb.append(this.denominator);
            return sb.toString();
        }
    }

    static {
        ExifTag[] exifTagArr;
        ExifTag exifTag = new ExifTag("ImageWidth", 256, 3, 4);
        ExifTag exifTag2 = new ExifTag("ImageLength", 257, 3, 4);
        ExifTag exifTag3 = new ExifTag("StripOffsets", 273, 3, 4);
        ExifTag exifTag4 = new ExifTag("RowsPerStrip", 278, 3, 4);
        ExifTag exifTag5 = new ExifTag("StripByteCounts", 279, 3, 4);
        IFD_TIFF_TAGS = new ExifTag[]{new ExifTag("NewSubfileType", 254, 4), new ExifTag("SubfileType", 255, 4), exifTag, exifTag2, new ExifTag("BitsPerSample", 258, 3), new ExifTag("Compression", 259, 3), new ExifTag("PhotometricInterpretation", 262, 3), new ExifTag("ImageDescription", (int) nexClip.kClip_Rotate_270, 2), new ExifTag("Make", 271, 2), new ExifTag("Model", 272, 2), exifTag3, new ExifTag("Orientation", 274, 3), new ExifTag("SamplesPerPixel", 277, 3), exifTag4, exifTag5, new ExifTag("XResolution", 282, 5), new ExifTag("YResolution", 283, 5), new ExifTag("PlanarConfiguration", 284, 3), new ExifTag("ResolutionUnit", 296, 3), new ExifTag("TransferFunction", 301, 3), new ExifTag("Software", 305, 2), new ExifTag("DateTime", 306, 2), new ExifTag("Artist", 315, 2), new ExifTag("WhitePoint", 318, 5), new ExifTag("PrimaryChromaticities", 319, 5), new ExifTag("SubIFDPointer", 330, 4), new ExifTag("JPEGInterchangeFormat", 513, 4), new ExifTag("JPEGInterchangeFormatLength", 514, 4), new ExifTag("YCbCrCoefficients", 529, 5), new ExifTag("YCbCrSubSampling", 530, 3), new ExifTag("YCbCrPositioning", 531, 3), new ExifTag("ReferenceBlackWhite", 532, 5), new ExifTag("Copyright", 33432, 2), new ExifTag("ExifIFDPointer", 34665, 4), new ExifTag("GPSInfoIFDPointer", 34853, 4), new ExifTag("SensorTopBorder", 4, 4), new ExifTag("SensorLeftBorder", 5, 4), new ExifTag("SensorBottomBorder", 6, 4), new ExifTag("SensorRightBorder", 7, 4), new ExifTag("ISO", 23, 3), new ExifTag("JpgFromRaw", 46, 7)};
        ExifTag exifTag6 = new ExifTag("PixelXDimension", 40962, 3, 4);
        ExifTag exifTag7 = new ExifTag("PixelYDimension", 40963, 3, 4);
        ExifTag exifTag8 = new ExifTag("DefaultCropSize", 50720, 3, 4);
        IFD_EXIF_TAGS = new ExifTag[]{new ExifTag("ExposureTime", 33434, 5), new ExifTag("FNumber", 33437, 5), new ExifTag("ExposureProgram", 34850, 3), new ExifTag("SpectralSensitivity", 34852, 2), new ExifTag("ISOSpeedRatings", 34855, 3), new ExifTag("OECF", 34856, 7), new ExifTag("ExifVersion", 36864, 2), new ExifTag("DateTimeOriginal", 36867, 2), new ExifTag("DateTimeDigitized", 36868, 2), new ExifTag("ComponentsConfiguration", 37121, 7), new ExifTag("CompressedBitsPerPixel", 37122, 5), new ExifTag("ShutterSpeedValue", 37377, 10), new ExifTag("ApertureValue", 37378, 5), new ExifTag("BrightnessValue", 37379, 10), new ExifTag("ExposureBiasValue", 37380, 10), new ExifTag("MaxApertureValue", 37381, 5), new ExifTag("SubjectDistance", 37382, 5), new ExifTag("MeteringMode", 37383, 3), new ExifTag("LightSource", 37384, 3), new ExifTag("Flash", 37385, 3), new ExifTag("FocalLength", 37386, 5), new ExifTag("SubjectArea", 37396, 3), new ExifTag("MakerNote", 37500, 7), new ExifTag("UserComment", 37510, 7), new ExifTag("SubSecTime", 37520, 2), new ExifTag("SubSecTimeOriginal", 37521, 2), new ExifTag("SubSecTimeDigitized", 37522, 2), new ExifTag("FlashpixVersion", 40960, 7), new ExifTag("ColorSpace", 40961, 3), exifTag6, exifTag7, new ExifTag("RelatedSoundFile", 40964, 2), new ExifTag("InteroperabilityIFDPointer", 40965, 4), new ExifTag("FlashEnergy", 41483, 5), new ExifTag("SpatialFrequencyResponse", 41484, 7), new ExifTag("FocalPlaneXResolution", 41486, 5), new ExifTag("FocalPlaneYResolution", 41487, 5), new ExifTag("FocalPlaneResolutionUnit", 41488, 3), new ExifTag("SubjectLocation", 41492, 3), new ExifTag("ExposureIndex", 41493, 5), new ExifTag("SensingMethod", 41495, 3), new ExifTag("FileSource", 41728, 7), new ExifTag("SceneType", 41729, 7), new ExifTag("CFAPattern", 41730, 7), new ExifTag("CustomRendered", 41985, 3), new ExifTag("ExposureMode", 41986, 3), new ExifTag("WhiteBalance", 41987, 3), new ExifTag("DigitalZoomRatio", 41988, 5), new ExifTag("FocalLengthIn35mmFilm", 41989, 3), new ExifTag("SceneCaptureType", 41990, 3), new ExifTag("GainControl", 41991, 3), new ExifTag("Contrast", 41992, 3), new ExifTag("Saturation", 41993, 3), new ExifTag("Sharpness", 41994, 3), new ExifTag("DeviceSettingDescription", 41995, 7), new ExifTag("SubjectDistanceRange", 41996, 3), new ExifTag("ImageUniqueID", 42016, 2), new ExifTag("DNGVersion", 50706, 1), exifTag8};
        ExifTag exifTag9 = new ExifTag("ThumbnailImageWidth", 256, 3, 4);
        ExifTag exifTag10 = new ExifTag("ThumbnailImageLength", 257, 3, 4);
        ExifTag exifTag11 = new ExifTag("StripOffsets", 273, 3, 4);
        ExifTag exifTag12 = new ExifTag("RowsPerStrip", 278, 3, 4);
        ExifTag exifTag13 = new ExifTag("StripByteCounts", 279, 3, 4);
        ExifTag exifTag14 = new ExifTag("DefaultCropSize", 50720, 3, 4);
        IFD_THUMBNAIL_TAGS = new ExifTag[]{new ExifTag("NewSubfileType", 254, 4), new ExifTag("SubfileType", 255, 4), exifTag9, exifTag10, new ExifTag("BitsPerSample", 258, 3), new ExifTag("Compression", 259, 3), new ExifTag("PhotometricInterpretation", 262, 3), new ExifTag("ImageDescription", (int) nexClip.kClip_Rotate_270, 2), new ExifTag("Make", 271, 2), new ExifTag("Model", 272, 2), exifTag11, new ExifTag("Orientation", 274, 3), new ExifTag("SamplesPerPixel", 277, 3), exifTag12, exifTag13, new ExifTag("XResolution", 282, 5), new ExifTag("YResolution", 283, 5), new ExifTag("PlanarConfiguration", 284, 3), new ExifTag("ResolutionUnit", 296, 3), new ExifTag("TransferFunction", 301, 3), new ExifTag("Software", 305, 2), new ExifTag("DateTime", 306, 2), new ExifTag("Artist", 315, 2), new ExifTag("WhitePoint", 318, 5), new ExifTag("PrimaryChromaticities", 319, 5), new ExifTag("SubIFDPointer", 330, 4), new ExifTag("JPEGInterchangeFormat", 513, 4), new ExifTag("JPEGInterchangeFormatLength", 514, 4), new ExifTag("YCbCrCoefficients", 529, 5), new ExifTag("YCbCrSubSampling", 530, 3), new ExifTag("YCbCrPositioning", 531, 3), new ExifTag("ReferenceBlackWhite", 532, 5), new ExifTag("Copyright", 33432, 2), new ExifTag("ExifIFDPointer", 34665, 4), new ExifTag("GPSInfoIFDPointer", 34853, 4), new ExifTag("DNGVersion", 50706, 1), exifTag14};
        sFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));
        for (int i = 0; i < EXIF_TAGS.length; i++) {
            sExifTagMapsForReading[i] = new HashMap();
            sExifTagMapsForWriting[i] = new HashMap();
            for (ExifTag exifTag15 : EXIF_TAGS[i]) {
                sExifTagMapsForReading[i].put(Integer.valueOf(exifTag15.number), exifTag15);
                sExifTagMapsForWriting[i].put(exifTag15.name, exifTag15);
            }
        }
        sExifPointerTagMap.put(Integer.valueOf(EXIF_POINTER_TAGS[0].number), Integer.valueOf(5));
        sExifPointerTagMap.put(Integer.valueOf(EXIF_POINTER_TAGS[1].number), Integer.valueOf(1));
        sExifPointerTagMap.put(Integer.valueOf(EXIF_POINTER_TAGS[2].number), Integer.valueOf(2));
        sExifPointerTagMap.put(Integer.valueOf(EXIF_POINTER_TAGS[3].number), Integer.valueOf(3));
        sExifPointerTagMap.put(Integer.valueOf(EXIF_POINTER_TAGS[4].number), Integer.valueOf(7));
        sExifPointerTagMap.put(Integer.valueOf(EXIF_POINTER_TAGS[5].number), Integer.valueOf(8));
    }

    public ExifInterface(InputStream inputStream) throws IOException {
        if (inputStream != null) {
            this.mFilename = null;
            if (inputStream instanceof AssetInputStream) {
                this.mAssetInputStream = (AssetInputStream) inputStream;
            } else {
                this.mAssetInputStream = null;
            }
            loadAttributes(inputStream);
            return;
        }
        throw new IllegalArgumentException("inputStream cannot be null");
    }

    public ExifInterface(String str) throws IOException {
        if (str != null) {
            FileInputStream fileInputStream = null;
            this.mAssetInputStream = null;
            this.mFilename = str;
            try {
                FileInputStream fileInputStream2 = new FileInputStream(str);
                try {
                    loadAttributes(fileInputStream2);
                    closeQuietly(fileInputStream2);
                } catch (Throwable th) {
                    th = th;
                    fileInputStream = fileInputStream2;
                    closeQuietly(fileInputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                closeQuietly(fileInputStream);
                throw th;
            }
        } else {
            throw new IllegalArgumentException("filename cannot be null");
        }
    }

    private void addDefaultValuesForCompatibility() {
        String attribute = getAttribute("DateTimeOriginal");
        if (attribute != null) {
            this.mAttributes[0].put("DateTime", ExifAttribute.createString(attribute));
        }
        if (getAttribute("ImageWidth") == null) {
            this.mAttributes[0].put("ImageWidth", ExifAttribute.createULong(0, this.mExifByteOrder));
        }
        if (getAttribute("ImageLength") == null) {
            this.mAttributes[0].put("ImageLength", ExifAttribute.createULong(0, this.mExifByteOrder));
        }
        if (getAttribute("Orientation") == null) {
            this.mAttributes[0].put("Orientation", ExifAttribute.createULong(0, this.mExifByteOrder));
        }
        if (getAttribute("LightSource") == null) {
            this.mAttributes[1].put("LightSource", ExifAttribute.createULong(0, this.mExifByteOrder));
        }
    }

    private static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception unused) {
            }
        }
    }

    private static double convertRationalLatLonToDouble(String str, String str2) {
        try {
            String[] split = str.split(",");
            String[] split2 = split[0].split("/");
            double parseDouble = Double.parseDouble(split2[0].trim()) / Double.parseDouble(split2[1].trim());
            String[] split3 = split[1].split("/");
            double parseDouble2 = Double.parseDouble(split3[0].trim()) / Double.parseDouble(split3[1].trim());
            String[] split4 = split[2].split("/");
            double parseDouble3 = parseDouble + (parseDouble2 / 60.0d) + ((Double.parseDouble(split4[0].trim()) / Double.parseDouble(split4[1].trim())) / 3600.0d);
            if (!str2.equals("S")) {
                if (!str2.equals("W")) {
                    if (!str2.equals("N")) {
                        if (!str2.equals("E")) {
                            throw new IllegalArgumentException();
                        }
                    }
                    return parseDouble3;
                }
            }
            return -parseDouble3;
        } catch (ArrayIndexOutOfBoundsException | NumberFormatException unused) {
            throw new IllegalArgumentException();
        }
    }

    private static long[] convertToLongArray(Object obj) {
        if (obj instanceof int[]) {
            int[] iArr = (int[]) obj;
            long[] jArr = new long[iArr.length];
            for (int i = 0; i < iArr.length; i++) {
                jArr[i] = (long) iArr[i];
            }
            return jArr;
        } else if (obj instanceof long[]) {
            return (long[]) obj;
        } else {
            return null;
        }
    }

    private ExifAttribute getExifAttribute(String str) {
        for (int i = 0; i < EXIF_TAGS.length; i++) {
            Object obj = this.mAttributes[i].get(str);
            if (obj != null) {
                return (ExifAttribute) obj;
            }
        }
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0057  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00e4  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x0082 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x00f5 A[SYNTHETIC] */
    private void getJpegAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream, int i, int i2) throws IOException {
        byteOrderedDataInputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
        byteOrderedDataInputStream.seek((long) i);
        byte readByte = byteOrderedDataInputStream.readByte();
        if (readByte == -1) {
            int i3 = i + 1;
            if (byteOrderedDataInputStream.readByte() == -40) {
                int i4 = i3 + 1;
                while (true) {
                    byte readByte2 = byteOrderedDataInputStream.readByte();
                    if (readByte2 == -1) {
                        int i5 = i4 + 1;
                        byte readByte3 = byteOrderedDataInputStream.readByte();
                        int i6 = i5 + 1;
                        if (readByte3 == -39 || readByte3 == -38) {
                            byteOrderedDataInputStream.setByteOrder(this.mExifByteOrder);
                        } else {
                            int readUnsignedShort = byteOrderedDataInputStream.readUnsignedShort() - 2;
                            int i7 = i6 + 2;
                            if (readUnsignedShort >= 0) {
                                if (readByte3 == -31) {
                                    if (readUnsignedShort >= 6) {
                                        byte[] bArr = new byte[6];
                                        if (byteOrderedDataInputStream.read(bArr) == 6) {
                                            i7 += 6;
                                            readUnsignedShort -= 6;
                                            if (Arrays.equals(bArr, IDENTIFIER_EXIF_APP1)) {
                                                if (readUnsignedShort > 0) {
                                                    this.mExifOffset = i7;
                                                    byte[] bArr2 = new byte[readUnsignedShort];
                                                    if (byteOrderedDataInputStream.read(bArr2) == readUnsignedShort) {
                                                        i7 += readUnsignedShort;
                                                        readExifSegment(bArr2, i2);
                                                    } else {
                                                        throw new IOException("Invalid exif");
                                                    }
                                                } else {
                                                    throw new IOException("Invalid exif");
                                                }
                                            }
                                        } else {
                                            throw new IOException("Invalid exif");
                                        }
                                    }
                                    if (readUnsignedShort < 0) {
                                    }
                                } else if (readByte3 != -2) {
                                    switch (readByte3) {
                                        case -64:
                                        case -63:
                                        case -62:
                                        case -61:
                                            if (byteOrderedDataInputStream.skipBytes(1) != 1) {
                                            }
                                            break;
                                        default:
                                            switch (readByte3) {
                                                case -59:
                                                case -58:
                                                case -57:
                                                    break;
                                                default:
                                                    switch (readByte3) {
                                                        case -55:
                                                        case -54:
                                                        case -53:
                                                            break;
                                                        default:
                                                            switch (readByte3) {
                                                                case -51:
                                                                case -50:
                                                                case -49:
                                                                    break;
                                                            }
                                                    }
                                            }
                                            if (byteOrderedDataInputStream.skipBytes(1) != 1) {
                                                this.mAttributes[i2].put("ImageLength", ExifAttribute.createULong((long) byteOrderedDataInputStream.readUnsignedShort(), this.mExifByteOrder));
                                                this.mAttributes[i2].put("ImageWidth", ExifAttribute.createULong((long) byteOrderedDataInputStream.readUnsignedShort(), this.mExifByteOrder));
                                                readUnsignedShort -= 5;
                                                break;
                                            } else {
                                                throw new IOException("Invalid SOFx");
                                            }
                                    }
                                    if (readUnsignedShort < 0) {
                                        throw new IOException("Invalid length");
                                    } else if (byteOrderedDataInputStream.skipBytes(readUnsignedShort) == readUnsignedShort) {
                                        i4 = i7 + readUnsignedShort;
                                    } else {
                                        throw new IOException("Invalid JPEG segment");
                                    }
                                } else {
                                    byte[] bArr3 = new byte[readUnsignedShort];
                                    if (byteOrderedDataInputStream.read(bArr3) != readUnsignedShort) {
                                        throw new IOException("Invalid exif");
                                    } else if (getAttribute("UserComment") == null) {
                                        this.mAttributes[1].put("UserComment", ExifAttribute.createString(new String(bArr3, ASCII)));
                                    }
                                }
                                readUnsignedShort = 0;
                                if (readUnsignedShort < 0) {
                                }
                            } else {
                                throw new IOException("Invalid length");
                            }
                        }
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Invalid marker:");
                        sb.append(Integer.toHexString(readByte2 & 255));
                        throw new IOException(sb.toString());
                    }
                }
                byteOrderedDataInputStream.setByteOrder(this.mExifByteOrder);
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Invalid marker: ");
            sb2.append(Integer.toHexString(readByte & 255));
            throw new IOException(sb2.toString());
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("Invalid marker: ");
        sb3.append(Integer.toHexString(readByte & 255));
        throw new IOException(sb3.toString());
    }

    private int getMimeType(BufferedInputStream bufferedInputStream) throws IOException {
        bufferedInputStream.mark(5000);
        byte[] bArr = new byte[5000];
        if (bufferedInputStream.read(bArr) == 5000) {
            bufferedInputStream.reset();
            if (isJpegFormat(bArr)) {
                return 4;
            }
            if (isRafFormat(bArr)) {
                return 9;
            }
            if (isOrfFormat(bArr)) {
                return 7;
            }
            return isRw2Format(bArr) ? 10 : 0;
        }
        throw new EOFException();
    }

    private void getOrfAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        getRawAttributes(byteOrderedDataInputStream);
        ExifAttribute exifAttribute = (ExifAttribute) this.mAttributes[1].get("MakerNote");
        if (exifAttribute != null) {
            ByteOrderedDataInputStream byteOrderedDataInputStream2 = new ByteOrderedDataInputStream(exifAttribute.bytes);
            byteOrderedDataInputStream2.setByteOrder(this.mExifByteOrder);
            byte[] bArr = new byte[ORF_MAKER_NOTE_HEADER_1.length];
            byteOrderedDataInputStream2.readFully(bArr);
            byteOrderedDataInputStream2.seek(0);
            byte[] bArr2 = new byte[ORF_MAKER_NOTE_HEADER_2.length];
            byteOrderedDataInputStream2.readFully(bArr2);
            if (Arrays.equals(bArr, ORF_MAKER_NOTE_HEADER_1)) {
                byteOrderedDataInputStream2.seek(8);
            } else if (Arrays.equals(bArr2, ORF_MAKER_NOTE_HEADER_2)) {
                byteOrderedDataInputStream2.seek(12);
            }
            readImageFileDirectory(byteOrderedDataInputStream2, 6);
            ExifAttribute exifAttribute2 = (ExifAttribute) this.mAttributes[7].get("PreviewImageStart");
            ExifAttribute exifAttribute3 = (ExifAttribute) this.mAttributes[7].get("PreviewImageLength");
            if (!(exifAttribute2 == null || exifAttribute3 == null)) {
                this.mAttributes[5].put("JPEGInterchangeFormat", exifAttribute2);
                this.mAttributes[5].put("JPEGInterchangeFormatLength", exifAttribute3);
            }
            ExifAttribute exifAttribute4 = (ExifAttribute) this.mAttributes[8].get("AspectFrame");
            if (exifAttribute4 != null) {
                int[] iArr = (int[]) exifAttribute4.getValue(this.mExifByteOrder);
                if (iArr == null || iArr.length != 4) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid aspect frame values. frame=");
                    sb.append(Arrays.toString(iArr));
                    Log.w("ExifInterface", sb.toString());
                } else if (iArr[2] > iArr[0] && iArr[3] > iArr[1]) {
                    int i = (iArr[2] - iArr[0]) + 1;
                    int i2 = (iArr[3] - iArr[1]) + 1;
                    if (i < i2) {
                        int i3 = i + i2;
                        i2 = i3 - i2;
                        i = i3 - i2;
                    }
                    ExifAttribute createUShort = ExifAttribute.createUShort(i, this.mExifByteOrder);
                    ExifAttribute createUShort2 = ExifAttribute.createUShort(i2, this.mExifByteOrder);
                    this.mAttributes[0].put("ImageWidth", createUShort);
                    this.mAttributes[0].put("ImageLength", createUShort2);
                }
            }
        }
    }

    private void getRafAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        byteOrderedDataInputStream.skipBytes(84);
        byte[] bArr = new byte[4];
        byte[] bArr2 = new byte[4];
        byteOrderedDataInputStream.read(bArr);
        byteOrderedDataInputStream.skipBytes(4);
        byteOrderedDataInputStream.read(bArr2);
        int i = ByteBuffer.wrap(bArr).getInt();
        int i2 = ByteBuffer.wrap(bArr2).getInt();
        getJpegAttributes(byteOrderedDataInputStream, i, 5);
        byteOrderedDataInputStream.seek((long) i2);
        byteOrderedDataInputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
        int readInt = byteOrderedDataInputStream.readInt();
        for (int i3 = 0; i3 < readInt; i3++) {
            int readUnsignedShort = byteOrderedDataInputStream.readUnsignedShort();
            int readUnsignedShort2 = byteOrderedDataInputStream.readUnsignedShort();
            if (readUnsignedShort == TAG_RAF_IMAGE_SIZE.number) {
                short readShort = byteOrderedDataInputStream.readShort();
                short readShort2 = byteOrderedDataInputStream.readShort();
                ExifAttribute createUShort = ExifAttribute.createUShort((int) readShort, this.mExifByteOrder);
                ExifAttribute createUShort2 = ExifAttribute.createUShort((int) readShort2, this.mExifByteOrder);
                this.mAttributes[0].put("ImageLength", createUShort);
                this.mAttributes[0].put("ImageWidth", createUShort2);
                return;
            }
            byteOrderedDataInputStream.skipBytes(readUnsignedShort2);
        }
    }

    private void getRawAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        parseTiffHeaders(byteOrderedDataInputStream, byteOrderedDataInputStream.available());
        readImageFileDirectory(byteOrderedDataInputStream, 0);
        updateImageSizeValues(byteOrderedDataInputStream, 0);
        updateImageSizeValues(byteOrderedDataInputStream, 5);
        updateImageSizeValues(byteOrderedDataInputStream, 4);
        validateImages(byteOrderedDataInputStream);
        if (this.mMimeType == 8) {
            ExifAttribute exifAttribute = (ExifAttribute) this.mAttributes[1].get("MakerNote");
            if (exifAttribute != null) {
                ByteOrderedDataInputStream byteOrderedDataInputStream2 = new ByteOrderedDataInputStream(exifAttribute.bytes);
                byteOrderedDataInputStream2.setByteOrder(this.mExifByteOrder);
                byteOrderedDataInputStream2.seek(6);
                readImageFileDirectory(byteOrderedDataInputStream2, 9);
                ExifAttribute exifAttribute2 = (ExifAttribute) this.mAttributes[9].get("ColorSpace");
                if (exifAttribute2 != null) {
                    this.mAttributes[1].put("ColorSpace", exifAttribute2);
                }
            }
        }
    }

    private void getRw2Attributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        getRawAttributes(byteOrderedDataInputStream);
        if (((ExifAttribute) this.mAttributes[0].get("JpgFromRaw")) != null) {
            getJpegAttributes(byteOrderedDataInputStream, this.mRw2JpgFromRawOffset, 5);
        }
        ExifAttribute exifAttribute = (ExifAttribute) this.mAttributes[0].get("ISO");
        ExifAttribute exifAttribute2 = (ExifAttribute) this.mAttributes[1].get("ISOSpeedRatings");
        if (exifAttribute != null && exifAttribute2 == null) {
            this.mAttributes[1].put("ISOSpeedRatings", exifAttribute);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:69:?, code lost:
        java.lang.Double.parseDouble(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x016c, code lost:
        return new android.util.Pair<>(java.lang.Integer.valueOf(12), java.lang.Integer.valueOf(-1));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x017a, code lost:
        return new android.util.Pair<>(java.lang.Integer.valueOf(2), java.lang.Integer.valueOf(-1));
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:68:0x015a */
    private static Pair<Integer, Integer> guessDataFormat(String str) {
        if (str.contains(",")) {
            String[] split = str.split(",");
            Pair<Integer, Integer> guessDataFormat = guessDataFormat(split[0]);
            if (((Integer) guessDataFormat.first).intValue() == 2) {
                return guessDataFormat;
            }
            for (int i = 1; i < split.length; i++) {
                Pair guessDataFormat2 = guessDataFormat(split[i]);
                int intValue = (guessDataFormat2.first == guessDataFormat.first || guessDataFormat2.second == guessDataFormat.first) ? ((Integer) guessDataFormat.first).intValue() : -1;
                int intValue2 = (((Integer) guessDataFormat.second).intValue() == -1 || !(guessDataFormat2.first == guessDataFormat.second || guessDataFormat2.second == guessDataFormat.second)) ? -1 : ((Integer) guessDataFormat.second).intValue();
                if (intValue == -1 && intValue2 == -1) {
                    return new Pair<>(Integer.valueOf(2), Integer.valueOf(-1));
                }
                if (intValue == -1) {
                    guessDataFormat = new Pair<>(Integer.valueOf(intValue2), Integer.valueOf(-1));
                } else if (intValue2 == -1) {
                    guessDataFormat = new Pair<>(Integer.valueOf(intValue), Integer.valueOf(-1));
                }
            }
            return guessDataFormat;
        } else if (str.contains("/")) {
            String[] split2 = str.split("/");
            if (split2.length == 2) {
                try {
                    long parseDouble = (long) Double.parseDouble(split2[0]);
                    long parseDouble2 = (long) Double.parseDouble(split2[1]);
                    if (parseDouble >= 0) {
                        if (parseDouble2 >= 0) {
                            if (parseDouble <= 2147483647L) {
                                if (parseDouble2 <= 2147483647L) {
                                    return new Pair<>(Integer.valueOf(10), Integer.valueOf(5));
                                }
                            }
                            return new Pair<>(Integer.valueOf(5), Integer.valueOf(-1));
                        }
                    }
                    return new Pair<>(Integer.valueOf(10), Integer.valueOf(-1));
                } catch (NumberFormatException unused) {
                }
            }
            return new Pair<>(Integer.valueOf(2), Integer.valueOf(-1));
        } else {
            Long valueOf = Long.valueOf(Long.parseLong(str));
            return (valueOf.longValue() < 0 || valueOf.longValue() > 65535) ? valueOf.longValue() < 0 ? new Pair<>(Integer.valueOf(9), Integer.valueOf(-1)) : new Pair<>(Integer.valueOf(4), Integer.valueOf(-1)) : new Pair<>(Integer.valueOf(3), Integer.valueOf(4));
        }
    }

    private void handleThumbnailFromJfif(ByteOrderedDataInputStream byteOrderedDataInputStream, HashMap hashMap) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("JPEGInterchangeFormat");
        ExifAttribute exifAttribute2 = (ExifAttribute) hashMap.get("JPEGInterchangeFormatLength");
        if (exifAttribute != null && exifAttribute2 != null) {
            int intValue = exifAttribute.getIntValue(this.mExifByteOrder);
            int min = Math.min(exifAttribute2.getIntValue(this.mExifByteOrder), byteOrderedDataInputStream.available() - intValue);
            if (this.mMimeType == 4 || this.mMimeType == 9 || this.mMimeType == 10) {
                intValue += this.mExifOffset;
            } else if (this.mMimeType == 7) {
                intValue += this.mOrfMakerNoteOffset;
            }
            if (intValue > 0 && min > 0) {
                this.mHasThumbnail = true;
                this.mThumbnailOffset = intValue;
                this.mThumbnailLength = min;
                if (this.mFilename == null && this.mAssetInputStream == null) {
                    byte[] bArr = new byte[min];
                    byteOrderedDataInputStream.seek((long) intValue);
                    byteOrderedDataInputStream.readFully(bArr);
                    this.mThumbnailBytes = bArr;
                }
            }
        }
    }

    private void handleThumbnailFromStrips(ByteOrderedDataInputStream byteOrderedDataInputStream, HashMap hashMap) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("StripOffsets");
        ExifAttribute exifAttribute2 = (ExifAttribute) hashMap.get("StripByteCounts");
        if (!(exifAttribute == null || exifAttribute2 == null)) {
            long[] convertToLongArray = convertToLongArray(exifAttribute.getValue(this.mExifByteOrder));
            long[] convertToLongArray2 = convertToLongArray(exifAttribute2.getValue(this.mExifByteOrder));
            if (convertToLongArray == null) {
                Log.w("ExifInterface", "stripOffsets should not be null.");
            } else if (convertToLongArray2 == null) {
                Log.w("ExifInterface", "stripByteCounts should not be null.");
            } else {
                long j = 0;
                for (long j2 : convertToLongArray2) {
                    j += j2;
                }
                byte[] bArr = new byte[((int) j)];
                int i = 0;
                int i2 = 0;
                for (int i3 = 0; i3 < convertToLongArray.length; i3++) {
                    int i4 = (int) convertToLongArray2[i3];
                    int i5 = ((int) convertToLongArray[i3]) - i;
                    if (i5 < 0) {
                        Log.d("ExifInterface", "Invalid strip offset value");
                    }
                    byteOrderedDataInputStream.seek((long) i5);
                    int i6 = i + i5;
                    byte[] bArr2 = new byte[i4];
                    byteOrderedDataInputStream.read(bArr2);
                    i = i6 + i4;
                    System.arraycopy(bArr2, 0, bArr, i2, bArr2.length);
                    i2 += bArr2.length;
                }
                this.mHasThumbnail = true;
                this.mThumbnailBytes = bArr;
                this.mThumbnailLength = bArr.length;
            }
        }
    }

    private static boolean isJpegFormat(byte[] bArr) throws IOException {
        for (int i = 0; i < JPEG_SIGNATURE.length; i++) {
            if (bArr[i] != JPEG_SIGNATURE[i]) {
                return false;
            }
        }
        return true;
    }

    private boolean isOrfFormat(byte[] bArr) throws IOException {
        ByteOrderedDataInputStream byteOrderedDataInputStream = new ByteOrderedDataInputStream(bArr);
        this.mExifByteOrder = readByteOrder(byteOrderedDataInputStream);
        byteOrderedDataInputStream.setByteOrder(this.mExifByteOrder);
        short readShort = byteOrderedDataInputStream.readShort();
        byteOrderedDataInputStream.close();
        return readShort == 20306 || readShort == 21330;
    }

    private boolean isRafFormat(byte[] bArr) throws IOException {
        byte[] bytes = "FUJIFILMCCD-RAW".getBytes();
        for (int i = 0; i < bytes.length; i++) {
            if (bArr[i] != bytes[i]) {
                return false;
            }
        }
        return true;
    }

    private boolean isRw2Format(byte[] bArr) throws IOException {
        ByteOrderedDataInputStream byteOrderedDataInputStream = new ByteOrderedDataInputStream(bArr);
        this.mExifByteOrder = readByteOrder(byteOrderedDataInputStream);
        byteOrderedDataInputStream.setByteOrder(this.mExifByteOrder);
        short readShort = byteOrderedDataInputStream.readShort();
        byteOrderedDataInputStream.close();
        return readShort == 85;
    }

    private boolean isSupportedDataType(HashMap hashMap) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("BitsPerSample");
        if (exifAttribute != null) {
            int[] iArr = (int[]) exifAttribute.getValue(this.mExifByteOrder);
            if (Arrays.equals(BITS_PER_SAMPLE_RGB, iArr)) {
                return true;
            }
            if (this.mMimeType == 3) {
                ExifAttribute exifAttribute2 = (ExifAttribute) hashMap.get("PhotometricInterpretation");
                if (exifAttribute2 != null) {
                    int intValue = exifAttribute2.getIntValue(this.mExifByteOrder);
                    if ((intValue == 1 && Arrays.equals(iArr, BITS_PER_SAMPLE_GREYSCALE_2)) || (intValue == 6 && Arrays.equals(iArr, BITS_PER_SAMPLE_RGB))) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private boolean isThumbnail(HashMap hashMap) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("ImageLength");
        ExifAttribute exifAttribute2 = (ExifAttribute) hashMap.get("ImageWidth");
        if (!(exifAttribute == null || exifAttribute2 == null)) {
            int intValue = exifAttribute.getIntValue(this.mExifByteOrder);
            int intValue2 = exifAttribute2.getIntValue(this.mExifByteOrder);
            if (intValue <= 512 && intValue2 <= 512) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0048, code lost:
        r5 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:?, code lost:
        r4.mIsSupportedFile = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0050, code lost:
        addDefaultValuesForCompatibility();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0053, code lost:
        throw r5;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:15:0x004a */
    private void loadAttributes(InputStream inputStream) throws IOException {
        int i = 0;
        while (true) {
            if (i < EXIF_TAGS.length) {
                this.mAttributes[i] = new HashMap();
                i++;
            } else {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 5000);
                this.mMimeType = getMimeType(bufferedInputStream);
                ByteOrderedDataInputStream byteOrderedDataInputStream = new ByteOrderedDataInputStream((InputStream) bufferedInputStream);
                switch (this.mMimeType) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                    case 11:
                        getRawAttributes(byteOrderedDataInputStream);
                        break;
                    case 4:
                        getJpegAttributes(byteOrderedDataInputStream, 0, 0);
                        break;
                    case 7:
                        getOrfAttributes(byteOrderedDataInputStream);
                        break;
                    case 9:
                        getRafAttributes(byteOrderedDataInputStream);
                        break;
                    case 10:
                        getRw2Attributes(byteOrderedDataInputStream);
                        break;
                }
                setThumbnailData(byteOrderedDataInputStream);
                this.mIsSupportedFile = true;
            }
        }
        addDefaultValuesForCompatibility();
    }

    private void parseTiffHeaders(ByteOrderedDataInputStream byteOrderedDataInputStream, int i) throws IOException {
        this.mExifByteOrder = readByteOrder(byteOrderedDataInputStream);
        byteOrderedDataInputStream.setByteOrder(this.mExifByteOrder);
        int readUnsignedShort = byteOrderedDataInputStream.readUnsignedShort();
        if (this.mMimeType == 7 || this.mMimeType == 10 || readUnsignedShort == 42) {
            int readInt = byteOrderedDataInputStream.readInt();
            if (readInt < 8 || readInt >= i) {
                StringBuilder sb = new StringBuilder();
                sb.append("Invalid first Ifd offset: ");
                sb.append(readInt);
                throw new IOException(sb.toString());
            }
            int i2 = readInt - 8;
            if (i2 > 0 && byteOrderedDataInputStream.skipBytes(i2) != i2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Couldn't jump to first Ifd: ");
                sb2.append(i2);
                throw new IOException(sb2.toString());
            }
            return;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("Invalid start code: ");
        sb3.append(Integer.toHexString(readUnsignedShort));
        throw new IOException(sb3.toString());
    }

    private ByteOrder readByteOrder(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        short readShort = byteOrderedDataInputStream.readShort();
        if (readShort == 18761) {
            return ByteOrder.LITTLE_ENDIAN;
        }
        if (readShort == 19789) {
            return ByteOrder.BIG_ENDIAN;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Invalid byte order: ");
        sb.append(Integer.toHexString(readShort));
        throw new IOException(sb.toString());
    }

    private void readExifSegment(byte[] bArr, int i) throws IOException {
        ByteOrderedDataInputStream byteOrderedDataInputStream = new ByteOrderedDataInputStream(bArr);
        parseTiffHeaders(byteOrderedDataInputStream, bArr.length);
        readImageFileDirectory(byteOrderedDataInputStream, i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x00ba  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x00c2  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0170  */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x01c3  */
    private void readImageFileDirectory(ByteOrderedDataInputStream byteOrderedDataInputStream, int i) throws IOException {
        short s;
        boolean z;
        long j;
        short s2;
        int i2;
        long j2;
        Object obj;
        ByteOrderedDataInputStream byteOrderedDataInputStream2 = byteOrderedDataInputStream;
        int i3 = i;
        if (byteOrderedDataInputStream.mPosition + 2 <= byteOrderedDataInputStream.mLength) {
            short readShort = byteOrderedDataInputStream.readShort();
            if (byteOrderedDataInputStream.mPosition + (readShort * 12) <= byteOrderedDataInputStream.mLength) {
                short s3 = 0;
                while (s3 < readShort) {
                    int readUnsignedShort = byteOrderedDataInputStream.readUnsignedShort();
                    int readUnsignedShort2 = byteOrderedDataInputStream.readUnsignedShort();
                    int readInt = byteOrderedDataInputStream.readInt();
                    long peek = (long) (byteOrderedDataInputStream.peek() + 4);
                    ExifTag exifTag = (ExifTag) sExifTagMapsForReading[i3].get(Integer.valueOf(readUnsignedShort));
                    if (exifTag == null) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Skip the tag entry since tag number is not defined: ");
                        sb.append(readUnsignedShort);
                        Log.w("ExifInterface", sb.toString());
                        s = readShort;
                    } else if (readUnsignedShort2 <= 0 || readUnsignedShort2 >= IFD_FORMAT_BYTES_PER_FORMAT.length) {
                        s = readShort;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Skip the tag entry since data format is invalid: ");
                        sb2.append(readUnsignedShort2);
                        Log.w("ExifInterface", sb2.toString());
                    } else {
                        s = readShort;
                        j = ((long) IFD_FORMAT_BYTES_PER_FORMAT[readUnsignedShort2]) * ((long) readInt);
                        if (j < 0 || j > 2147483647L) {
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Skip the tag entry since the number of components is invalid: ");
                            sb3.append(readInt);
                            Log.w("ExifInterface", sb3.toString());
                            z = false;
                            if (!z) {
                                byteOrderedDataInputStream2.seek(peek);
                                i2 = i3;
                                s2 = s3;
                            } else {
                                if (j > 4) {
                                    int readInt2 = byteOrderedDataInputStream.readInt();
                                    if (this.mMimeType == 7) {
                                        if (exifTag.name == "MakerNote") {
                                            this.mOrfMakerNoteOffset = readInt2;
                                        } else if (i3 == 6 && exifTag.name == "ThumbnailImage") {
                                            this.mOrfThumbnailOffset = readInt2;
                                            this.mOrfThumbnailLength = readInt;
                                            ExifAttribute createUShort = ExifAttribute.createUShort(6, this.mExifByteOrder);
                                            s2 = s3;
                                            ExifAttribute createULong = ExifAttribute.createULong((long) this.mOrfThumbnailOffset, this.mExifByteOrder);
                                            ExifAttribute createULong2 = ExifAttribute.createULong((long) this.mOrfThumbnailLength, this.mExifByteOrder);
                                            this.mAttributes[4].put("Compression", createUShort);
                                            this.mAttributes[4].put("JPEGInterchangeFormat", createULong);
                                            this.mAttributes[4].put("JPEGInterchangeFormatLength", createULong2);
                                        }
                                        s2 = s3;
                                    } else {
                                        s2 = s3;
                                        if (this.mMimeType == 10 && exifTag.name == "JpgFromRaw") {
                                            this.mRw2JpgFromRawOffset = readInt2;
                                        }
                                    }
                                    long j3 = (long) readInt2;
                                    j2 = j;
                                    if (j3 + j <= ((long) byteOrderedDataInputStream.mLength)) {
                                        byteOrderedDataInputStream2.seek(j3);
                                        obj = sExifPointerTagMap.get(Integer.valueOf(readUnsignedShort));
                                        if (obj == null) {
                                            long j4 = -1;
                                            switch (readUnsignedShort2) {
                                                case 3:
                                                    j4 = (long) byteOrderedDataInputStream.readUnsignedShort();
                                                    break;
                                                case 4:
                                                    j4 = byteOrderedDataInputStream.readUnsignedInt();
                                                    break;
                                                case 8:
                                                    j4 = (long) byteOrderedDataInputStream.readShort();
                                                    break;
                                                case 9:
                                                case 13:
                                                    j4 = (long) byteOrderedDataInputStream.readInt();
                                                    break;
                                            }
                                            if (j4 <= 0 || j4 >= ((long) byteOrderedDataInputStream.mLength)) {
                                                StringBuilder sb4 = new StringBuilder();
                                                sb4.append("Skip jump into the IFD since its offset is invalid: ");
                                                sb4.append(j4);
                                                Log.w("ExifInterface", sb4.toString());
                                            } else {
                                                byteOrderedDataInputStream2.seek(j4);
                                                readImageFileDirectory(byteOrderedDataInputStream2, ((Integer) obj).intValue());
                                            }
                                            byteOrderedDataInputStream2.seek(peek);
                                        } else {
                                            byte[] bArr = new byte[((int) j2)];
                                            byteOrderedDataInputStream2.readFully(bArr);
                                            ExifAttribute exifAttribute = new ExifAttribute(readUnsignedShort2, readInt, bArr);
                                            i2 = i;
                                            this.mAttributes[i2].put(exifTag.name, exifAttribute);
                                            if (exifTag.name == "DNGVersion") {
                                                this.mMimeType = 3;
                                            }
                                            if (((exifTag.name == "Make" || exifTag.name == "Model") && exifAttribute.getStringValue(this.mExifByteOrder).contains("PENTAX")) || (exifTag.name == "Compression" && exifAttribute.getIntValue(this.mExifByteOrder) == 65535)) {
                                                this.mMimeType = 8;
                                            }
                                            if (((long) byteOrderedDataInputStream.peek()) != peek) {
                                                byteOrderedDataInputStream2.seek(peek);
                                            }
                                        }
                                    } else {
                                        StringBuilder sb5 = new StringBuilder();
                                        sb5.append("Skip the tag entry since data offset is invalid: ");
                                        sb5.append(readInt2);
                                        Log.w("ExifInterface", sb5.toString());
                                        byteOrderedDataInputStream2.seek(peek);
                                    }
                                } else {
                                    j2 = j;
                                    s2 = s3;
                                    obj = sExifPointerTagMap.get(Integer.valueOf(readUnsignedShort));
                                    if (obj == null) {
                                    }
                                }
                                i2 = i;
                            }
                            s3 = (short) (s2 + 1);
                            i3 = i2;
                            readShort = s;
                        } else {
                            z = true;
                            if (!z) {
                            }
                            s3 = (short) (s2 + 1);
                            i3 = i2;
                            readShort = s;
                        }
                    }
                    j = 0;
                    z = false;
                    if (!z) {
                    }
                    s3 = (short) (s2 + 1);
                    i3 = i2;
                    readShort = s;
                }
                if (byteOrderedDataInputStream.peek() + 4 <= byteOrderedDataInputStream.mLength) {
                    int readInt3 = byteOrderedDataInputStream.readInt();
                    if (readInt3 > 8 && readInt3 < byteOrderedDataInputStream.mLength) {
                        byteOrderedDataInputStream2.seek((long) readInt3);
                        if (this.mAttributes[4].isEmpty()) {
                            readImageFileDirectory(byteOrderedDataInputStream2, 4);
                        } else if (this.mAttributes[5].isEmpty()) {
                            readImageFileDirectory(byteOrderedDataInputStream2, 5);
                        }
                    }
                }
            }
        }
    }

    private void retrieveJpegImageSize(ByteOrderedDataInputStream byteOrderedDataInputStream, int i) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) this.mAttributes[i].get("ImageWidth");
        if (((ExifAttribute) this.mAttributes[i].get("ImageLength")) == null || exifAttribute == null) {
            ExifAttribute exifAttribute2 = (ExifAttribute) this.mAttributes[i].get("JPEGInterchangeFormat");
            if (exifAttribute2 != null) {
                getJpegAttributes(byteOrderedDataInputStream, exifAttribute2.getIntValue(this.mExifByteOrder), i);
            }
        }
    }

    private void setThumbnailData(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        HashMap hashMap = this.mAttributes[4];
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("Compression");
        if (exifAttribute != null) {
            this.mThumbnailCompression = exifAttribute.getIntValue(this.mExifByteOrder);
            int i = this.mThumbnailCompression;
            if (i != 1) {
                switch (i) {
                    case 6:
                        handleThumbnailFromJfif(byteOrderedDataInputStream, hashMap);
                        return;
                    case 7:
                        break;
                    default:
                        return;
                }
            }
            if (isSupportedDataType(hashMap)) {
                handleThumbnailFromStrips(byteOrderedDataInputStream, hashMap);
                return;
            }
            return;
        }
        this.mThumbnailCompression = 6;
        handleThumbnailFromJfif(byteOrderedDataInputStream, hashMap);
    }

    private void swapBasedOnImageSize(int i, int i2) throws IOException {
        if (!this.mAttributes[i].isEmpty() && !this.mAttributes[i2].isEmpty()) {
            ExifAttribute exifAttribute = (ExifAttribute) this.mAttributes[i].get("ImageLength");
            ExifAttribute exifAttribute2 = (ExifAttribute) this.mAttributes[i].get("ImageWidth");
            ExifAttribute exifAttribute3 = (ExifAttribute) this.mAttributes[i2].get("ImageLength");
            ExifAttribute exifAttribute4 = (ExifAttribute) this.mAttributes[i2].get("ImageWidth");
            if (!(exifAttribute == null || exifAttribute2 == null || exifAttribute3 == null || exifAttribute4 == null)) {
                int intValue = exifAttribute.getIntValue(this.mExifByteOrder);
                int intValue2 = exifAttribute2.getIntValue(this.mExifByteOrder);
                int intValue3 = exifAttribute3.getIntValue(this.mExifByteOrder);
                int intValue4 = exifAttribute4.getIntValue(this.mExifByteOrder);
                if (intValue < intValue3 && intValue2 < intValue4) {
                    HashMap hashMap = this.mAttributes[i];
                    this.mAttributes[i] = this.mAttributes[i2];
                    this.mAttributes[i2] = hashMap;
                }
            }
        }
    }

    private void updateImageSizeValues(ByteOrderedDataInputStream byteOrderedDataInputStream, int i) throws IOException {
        ExifAttribute exifAttribute;
        ExifAttribute exifAttribute2;
        ExifAttribute exifAttribute3 = (ExifAttribute) this.mAttributes[i].get("DefaultCropSize");
        ExifAttribute exifAttribute4 = (ExifAttribute) this.mAttributes[i].get("SensorTopBorder");
        ExifAttribute exifAttribute5 = (ExifAttribute) this.mAttributes[i].get("SensorLeftBorder");
        ExifAttribute exifAttribute6 = (ExifAttribute) this.mAttributes[i].get("SensorBottomBorder");
        ExifAttribute exifAttribute7 = (ExifAttribute) this.mAttributes[i].get("SensorRightBorder");
        if (exifAttribute3 != null) {
            if (exifAttribute3.format == 5) {
                Rational[] rationalArr = (Rational[]) exifAttribute3.getValue(this.mExifByteOrder);
                if (rationalArr == null || rationalArr.length != 2) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid crop size values. cropSize=");
                    sb.append(Arrays.toString(rationalArr));
                    Log.w("ExifInterface", sb.toString());
                    return;
                }
                exifAttribute2 = ExifAttribute.createURational(rationalArr[0], this.mExifByteOrder);
                exifAttribute = ExifAttribute.createURational(rationalArr[1], this.mExifByteOrder);
            } else {
                int[] iArr = (int[]) exifAttribute3.getValue(this.mExifByteOrder);
                if (iArr == null || iArr.length != 2) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Invalid crop size values. cropSize=");
                    sb2.append(Arrays.toString(iArr));
                    Log.w("ExifInterface", sb2.toString());
                    return;
                }
                exifAttribute2 = ExifAttribute.createUShort(iArr[0], this.mExifByteOrder);
                exifAttribute = ExifAttribute.createUShort(iArr[1], this.mExifByteOrder);
            }
            this.mAttributes[i].put("ImageWidth", exifAttribute2);
            this.mAttributes[i].put("ImageLength", exifAttribute);
        } else if (exifAttribute4 == null || exifAttribute5 == null || exifAttribute6 == null || exifAttribute7 == null) {
            retrieveJpegImageSize(byteOrderedDataInputStream, i);
        } else {
            int intValue = exifAttribute4.getIntValue(this.mExifByteOrder);
            int intValue2 = exifAttribute6.getIntValue(this.mExifByteOrder);
            int intValue3 = exifAttribute7.getIntValue(this.mExifByteOrder);
            int intValue4 = exifAttribute5.getIntValue(this.mExifByteOrder);
            if (intValue2 > intValue && intValue3 > intValue4) {
                int i2 = intValue3 - intValue4;
                ExifAttribute createUShort = ExifAttribute.createUShort(intValue2 - intValue, this.mExifByteOrder);
                ExifAttribute createUShort2 = ExifAttribute.createUShort(i2, this.mExifByteOrder);
                this.mAttributes[i].put("ImageLength", createUShort);
                this.mAttributes[i].put("ImageWidth", createUShort2);
            }
        }
    }

    private void validateImages(InputStream inputStream) throws IOException {
        swapBasedOnImageSize(0, 5);
        swapBasedOnImageSize(0, 4);
        swapBasedOnImageSize(5, 4);
        ExifAttribute exifAttribute = (ExifAttribute) this.mAttributes[1].get("PixelXDimension");
        ExifAttribute exifAttribute2 = (ExifAttribute) this.mAttributes[1].get("PixelYDimension");
        if (!(exifAttribute == null || exifAttribute2 == null)) {
            this.mAttributes[0].put("ImageWidth", exifAttribute);
            this.mAttributes[0].put("ImageLength", exifAttribute2);
        }
        if (this.mAttributes[4].isEmpty() && isThumbnail(this.mAttributes[5])) {
            this.mAttributes[4] = this.mAttributes[5];
            this.mAttributes[5] = new HashMap();
        }
        if (!isThumbnail(this.mAttributes[4])) {
            Log.d("ExifInterface", "No image meets the size requirements of a thumbnail image.");
        }
    }

    public String getAttribute(String str) {
        ExifAttribute exifAttribute = getExifAttribute(str);
        if (exifAttribute == null) {
            return null;
        }
        if (!sTagSetForCompatibility.contains(str)) {
            return exifAttribute.getStringValue(this.mExifByteOrder);
        }
        if (!str.equals("GPSTimeStamp")) {
            try {
                return Double.toString(exifAttribute.getDoubleValue(this.mExifByteOrder));
            } catch (NumberFormatException unused) {
                return null;
            }
        } else if (exifAttribute.format == 5 || exifAttribute.format == 10) {
            Rational[] rationalArr = (Rational[]) exifAttribute.getValue(this.mExifByteOrder);
            if (rationalArr == null || rationalArr.length != 3) {
                StringBuilder sb = new StringBuilder();
                sb.append("Invalid GPS Timestamp array. array=");
                sb.append(Arrays.toString(rationalArr));
                Log.w("ExifInterface", sb.toString());
                return null;
            }
            return String.format("%02d:%02d:%02d", new Object[]{Integer.valueOf((int) (((float) rationalArr[0].numerator) / ((float) rationalArr[0].denominator))), Integer.valueOf((int) (((float) rationalArr[1].numerator) / ((float) rationalArr[1].denominator))), Integer.valueOf((int) (((float) rationalArr[2].numerator) / ((float) rationalArr[2].denominator)))});
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("GPS Timestamp format is not rational. format=");
            sb2.append(exifAttribute.format);
            Log.w("ExifInterface", sb2.toString());
            return null;
        }
    }

    public int getAttributeInt(String str, int i) {
        ExifAttribute exifAttribute = getExifAttribute(str);
        if (exifAttribute == null) {
            return i;
        }
        try {
            return exifAttribute.getIntValue(this.mExifByteOrder);
        } catch (NumberFormatException unused) {
            return i;
        }
    }

    public long getDateTime() {
        String attribute = getAttribute("DateTime");
        if (attribute == null || !sNonZeroTimePattern.matcher(attribute).matches()) {
            return -1;
        }
        try {
            Date parse = sFormatter.parse(attribute, new ParsePosition(0));
            if (parse == null) {
                return -1;
            }
            long time = parse.getTime();
            String attribute2 = getAttribute("SubSecTime");
            if (attribute2 != null) {
                try {
                    long parseLong = Long.parseLong(attribute2);
                    while (parseLong > 1000) {
                        parseLong /= 10;
                    }
                    time += parseLong;
                } catch (NumberFormatException unused) {
                }
            }
            return time;
        } catch (IllegalArgumentException unused2) {
            return -1;
        }
    }

    public long getGpsDateTime() {
        String attribute = getAttribute("GPSDateStamp");
        String attribute2 = getAttribute("GPSTimeStamp");
        if (attribute == null || attribute2 == null || (!sNonZeroTimePattern.matcher(attribute).matches() && !sNonZeroTimePattern.matcher(attribute2).matches())) {
            return -1;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(attribute);
        sb.append(' ');
        sb.append(attribute2);
        try {
            Date parse = sFormatter.parse(sb.toString(), new ParsePosition(0));
            if (parse == null) {
                return -1;
            }
            return parse.getTime();
        } catch (IllegalArgumentException unused) {
            return -1;
        }
    }

    public double[] getLatLong() {
        String attribute = getAttribute("GPSLatitude");
        String attribute2 = getAttribute("GPSLatitudeRef");
        String attribute3 = getAttribute("GPSLongitude");
        String attribute4 = getAttribute("GPSLongitudeRef");
        if (!(attribute == null || attribute2 == null || attribute3 == null || attribute4 == null)) {
            try {
                return new double[]{convertRationalLatLonToDouble(attribute, attribute2), convertRationalLatLonToDouble(attribute3, attribute4)};
            } catch (IllegalArgumentException unused) {
                StringBuilder sb = new StringBuilder();
                sb.append("Latitude/longitude values are not parseable. ");
                sb.append(String.format("latValue=%s, latRef=%s, lngValue=%s, lngRef=%s", new Object[]{attribute, attribute2, attribute3, attribute4}));
                Log.w("ExifInterface", sb.toString());
            }
        }
        return null;
    }

    public void setAttribute(String str, String str2) {
        int i;
        String str3;
        String str4;
        String str5 = str;
        String str6 = str2;
        if (str6 != null && sTagSetForCompatibility.contains(str5)) {
            if (str5.equals("GPSTimeStamp")) {
                Matcher matcher = sGpsTimestampPattern.matcher(str6);
                if (!matcher.find()) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid value for ");
                    sb.append(str5);
                    sb.append(" : ");
                    sb.append(str6);
                    Log.w("ExifInterface", sb.toString());
                    return;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append(Integer.parseInt(matcher.group(1)));
                sb2.append("/1,");
                sb2.append(Integer.parseInt(matcher.group(2)));
                sb2.append("/1,");
                sb2.append(Integer.parseInt(matcher.group(3)));
                sb2.append("/1");
                str6 = sb2.toString();
            } else {
                try {
                    double parseDouble = Double.parseDouble(str2);
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append((long) (parseDouble * 10000.0d));
                    sb3.append("/10000");
                    str6 = sb3.toString();
                } catch (NumberFormatException unused) {
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("Invalid value for ");
                    sb4.append(str5);
                    sb4.append(" : ");
                    sb4.append(str6);
                    Log.w("ExifInterface", sb4.toString());
                    return;
                }
            }
        }
        for (int i2 = 0; i2 < EXIF_TAGS.length; i2++) {
            if (i2 != 4 || this.mHasThumbnail) {
                Object obj = sExifTagMapsForWriting[i2].get(str5);
                if (obj != null) {
                    if (str6 != null) {
                        ExifTag exifTag = (ExifTag) obj;
                        Pair guessDataFormat = guessDataFormat(str6);
                        if (exifTag.primaryFormat == ((Integer) guessDataFormat.first).intValue() || exifTag.primaryFormat == ((Integer) guessDataFormat.second).intValue()) {
                            i = exifTag.primaryFormat;
                        } else if (exifTag.secondaryFormat != -1 && (exifTag.secondaryFormat == ((Integer) guessDataFormat.first).intValue() || exifTag.secondaryFormat == ((Integer) guessDataFormat.second).intValue())) {
                            i = exifTag.secondaryFormat;
                        } else if (exifTag.primaryFormat == 1 || exifTag.primaryFormat == 7 || exifTag.primaryFormat == 2) {
                            i = exifTag.primaryFormat;
                        } else {
                            String str7 = "ExifInterface";
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("Given tag (");
                            sb5.append(str5);
                            sb5.append(") value didn't match with one of expected ");
                            sb5.append("formats: ");
                            sb5.append(IFD_FORMAT_NAMES[exifTag.primaryFormat]);
                            if (exifTag.secondaryFormat == -1) {
                                str3 = "";
                            } else {
                                StringBuilder sb6 = new StringBuilder();
                                sb6.append(", ");
                                sb6.append(IFD_FORMAT_NAMES[exifTag.secondaryFormat]);
                                str3 = sb6.toString();
                            }
                            sb5.append(str3);
                            sb5.append(" (guess: ");
                            sb5.append(IFD_FORMAT_NAMES[((Integer) guessDataFormat.first).intValue()]);
                            if (((Integer) guessDataFormat.second).intValue() == -1) {
                                str4 = "";
                            } else {
                                StringBuilder sb7 = new StringBuilder();
                                sb7.append(", ");
                                sb7.append(IFD_FORMAT_NAMES[((Integer) guessDataFormat.second).intValue()]);
                                str4 = sb7.toString();
                            }
                            sb5.append(str4);
                            sb5.append(")");
                            Log.w(str7, sb5.toString());
                        }
                        switch (i) {
                            case 1:
                                this.mAttributes[i2].put(str5, ExifAttribute.createByte(str6));
                                break;
                            case 2:
                            case 7:
                                this.mAttributes[i2].put(str5, ExifAttribute.createString(str6));
                                break;
                            case 3:
                                String[] split = str6.split(",");
                                int[] iArr = new int[split.length];
                                for (int i3 = 0; i3 < split.length; i3++) {
                                    iArr[i3] = Integer.parseInt(split[i3]);
                                }
                                this.mAttributes[i2].put(str5, ExifAttribute.createUShort(iArr, this.mExifByteOrder));
                                break;
                            case 4:
                                String[] split2 = str6.split(",");
                                long[] jArr = new long[split2.length];
                                for (int i4 = 0; i4 < split2.length; i4++) {
                                    jArr[i4] = Long.parseLong(split2[i4]);
                                }
                                this.mAttributes[i2].put(str5, ExifAttribute.createULong(jArr, this.mExifByteOrder));
                                break;
                            case 5:
                                String[] split3 = str6.split(",");
                                Rational[] rationalArr = new Rational[split3.length];
                                for (int i5 = 0; i5 < split3.length; i5++) {
                                    String[] split4 = split3[i5].split("/");
                                    Rational rational = new Rational((long) Double.parseDouble(split4[0]), (long) Double.parseDouble(split4[1]));
                                    rationalArr[i5] = rational;
                                }
                                this.mAttributes[i2].put(str5, ExifAttribute.createURational(rationalArr, this.mExifByteOrder));
                                break;
                            case 9:
                                String[] split5 = str6.split(",");
                                int[] iArr2 = new int[split5.length];
                                for (int i6 = 0; i6 < split5.length; i6++) {
                                    iArr2[i6] = Integer.parseInt(split5[i6]);
                                }
                                this.mAttributes[i2].put(str5, ExifAttribute.createSLong(iArr2, this.mExifByteOrder));
                                break;
                            case 10:
                                String[] split6 = str6.split(",");
                                Rational[] rationalArr2 = new Rational[split6.length];
                                for (int i7 = 0; i7 < split6.length; i7++) {
                                    String[] split7 = split6[i7].split("/");
                                    Rational rational2 = new Rational((long) Double.parseDouble(split7[0]), (long) Double.parseDouble(split7[1]));
                                    rationalArr2[i7] = rational2;
                                }
                                this.mAttributes[i2].put(str5, ExifAttribute.createSRational(rationalArr2, this.mExifByteOrder));
                                break;
                            case 12:
                                String[] split8 = str6.split(",");
                                double[] dArr = new double[split8.length];
                                for (int i8 = 0; i8 < split8.length; i8++) {
                                    dArr[i8] = Double.parseDouble(split8[i8]);
                                }
                                this.mAttributes[i2].put(str5, ExifAttribute.createDouble(dArr, this.mExifByteOrder));
                                break;
                            default:
                                StringBuilder sb8 = new StringBuilder();
                                sb8.append("Data format isn't one of expected formats: ");
                                sb8.append(i);
                                Log.w("ExifInterface", sb8.toString());
                                break;
                        }
                    } else {
                        this.mAttributes[i2].remove(str5);
                    }
                }
            }
        }
    }
}
