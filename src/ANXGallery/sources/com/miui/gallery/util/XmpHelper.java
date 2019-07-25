package com.miui.gallery.util;

import android.text.TextUtils;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.keyczar.Keyczar;

public class XmpHelper {
    private static final String TAG = "XmpHelper";

    private static class Section {
        public byte[] data;
        public int length;
        public int marker;

        private Section() {
        }
    }

    static {
        try {
            XMPMetaFactory.getSchemaRegistry().registerNamespace("http://ns.google.com/photos/1.0/camera/", "GCamera");
            XMPMetaFactory.getSchemaRegistry().registerNamespace("http://ns.xiaomi.com/photos/1.0/camera/", "MiCamera");
        } catch (XMPException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to register ns http://ns.google.com/photos/1.0/camera/: ");
            sb.append(e);
            Log.d(str, sb.toString());
        }
    }

    private XmpHelper() {
    }

    public static XMPMeta extractXMPMeta(InputStream inputStream) {
        List<Section> parse = parse(inputStream, true);
        if (parse == null) {
            return null;
        }
        for (Section section : parse) {
            if (hasXMPHeader(section.data)) {
                byte[] bArr = new byte[(getXMPContentEnd(section.data) - 29)];
                System.arraycopy(section.data, 29, bArr, 0, bArr.length);
                try {
                    return XMPMetaFactory.parseFromBuffer(bArr);
                } catch (XMPException e) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("XMP parse error: ");
                    sb.append(e);
                    Log.d(str, sb.toString());
                    return null;
                }
            }
        }
        return null;
    }

    private static int getXMPContentEnd(byte[] bArr) {
        for (int length = bArr.length - 1; length >= 1; length--) {
            if (bArr[length] == 62 && bArr[length - 1] != 63) {
                return length + 1;
            }
        }
        return bArr.length;
    }

    private static boolean hasXMPHeader(byte[] bArr) {
        if (bArr.length < 29) {
            return false;
        }
        try {
            byte[] bArr2 = new byte[29];
            System.arraycopy(bArr, 0, bArr2, 0, 29);
            return new String(bArr2, Keyczar.DEFAULT_ENCODING).equals("http://ns.adobe.com/xap/1.0/\u0000");
        } catch (UnsupportedEncodingException unused) {
            return false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:28:0x003b, code lost:
        if (r9 != false) goto L_0x0059;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:?, code lost:
        r9 = new com.miui.gallery.util.XmpHelper.Section(null);
        r9.marker = r3;
        r9.length = -1;
        r9.data = new byte[r8.available()];
        r8.read(r9.data, 0, r9.data.length);
        r1.add(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x0059, code lost:
        if (r8 == null) goto L_0x005e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:?, code lost:
        r8.close();
     */
    private static List<Section> parse(InputStream inputStream, boolean z) {
        ArrayList arrayList;
        int read;
        try {
            if (inputStream.read() == 255) {
                if (inputStream.read() == 216) {
                    arrayList = new ArrayList();
                    while (true) {
                        int read2 = inputStream.read();
                        if (read2 == -1) {
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException unused) {
                                }
                            }
                            return arrayList;
                        } else if (read2 != 255) {
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException unused2) {
                                }
                            }
                            return null;
                        } else {
                            do {
                                read = inputStream.read();
                            } while (read == 255);
                            if (read == -1) {
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException unused3) {
                                    }
                                }
                                return null;
                            } else if (read == 218) {
                                break;
                            } else {
                                int read3 = inputStream.read();
                                int read4 = inputStream.read();
                                if (read3 == -1) {
                                    break;
                                } else if (read4 == -1) {
                                    break;
                                } else {
                                    int i = (read3 << 8) | read4;
                                    if (z) {
                                        if (read != 225) {
                                            inputStream.skip((long) (i - 2));
                                        }
                                    }
                                    Section section = new Section();
                                    section.marker = read;
                                    section.length = i;
                                    int i2 = i - 2;
                                    section.data = new byte[i2];
                                    inputStream.read(section.data, 0, i2);
                                    arrayList.add(section);
                                }
                            }
                        }
                    }
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException unused4) {
                        }
                    }
                    return null;
                }
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException unused5) {
                }
            }
            return null;
            return arrayList;
        } catch (IOException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Could not parse file: ");
            sb.append(e);
            Log.d(str, sb.toString());
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException unused6) {
                }
            }
            return null;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException unused7) {
                }
            }
        }
    }

    public static long readMicroVideoOffset(String str) {
        FileInputStream fileInputStream;
        Exception e;
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        long currentTimeMillis = System.currentTimeMillis();
        try {
            File file = new File(str);
            fileInputStream = new FileInputStream(file);
            try {
                XMPMeta extractXMPMeta = extractXMPMeta(fileInputStream);
                if (extractXMPMeta == null) {
                    MiscUtil.closeSilently(fileInputStream);
                    return 0;
                }
                Integer propertyInteger = extractXMPMeta.getPropertyInteger("http://ns.google.com/photos/1.0/camera/", "MicroVideo");
                if (propertyInteger != null) {
                    if (propertyInteger.intValue() == 1) {
                        Integer propertyInteger2 = extractXMPMeta.getPropertyInteger("http://ns.google.com/photos/1.0/camera/", "MicroVideoOffset");
                        if (propertyInteger2 != null) {
                            Log.d(TAG, "readMicroVideoOffset cost %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                            long length = file.length() - ((long) propertyInteger2.intValue());
                            MiscUtil.closeSilently(fileInputStream);
                            return length;
                        }
                        MiscUtil.closeSilently(fileInputStream);
                        return 0;
                    }
                }
                MiscUtil.closeSilently(fileInputStream);
                return 0;
            } catch (Exception e2) {
                e = e2;
                try {
                    e.printStackTrace();
                    MiscUtil.closeSilently(fileInputStream);
                    return 0;
                } catch (Throwable th) {
                    th = th;
                    MiscUtil.closeSilently(fileInputStream);
                    throw th;
                }
            }
        } catch (Exception e3) {
            e = e3;
            fileInputStream = null;
            e.printStackTrace();
            MiscUtil.closeSilently(fileInputStream);
            return 0;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream = null;
            MiscUtil.closeSilently(fileInputStream);
            throw th;
        }
    }
}
