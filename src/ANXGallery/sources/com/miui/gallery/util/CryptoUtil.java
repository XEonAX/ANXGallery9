package com.miui.gallery.util;

import com.miui.gallery.util.BaseDocumentProviderUtils.WriteHandler;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CryptoUtil {
    private static final byte[] sAesIv = {17, 19, 33, 35, 49, 51, 65, 67, 81, 83, 97, 102, 103, 104, 113, 114};
    private static final byte[] sRandomKey = new byte[16];

    /* access modifiers changed from: private */
    public static byte[] decrypt(byte[] bArr, byte[] bArr2) {
        if (bArr == null || bArr2 == null || bArr2.length != 16) {
            throw new IllegalArgumentException("IllegalArgument or Key length should be 16.");
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
        try {
            Cipher instance = Cipher.getInstance("AES/CTR/NoPadding");
            instance.init(2, secretKeySpec, new IvParameterSpec(sAesIv));
            return instance.doFinal(bArr);
        } catch (NoSuchAlgorithmException e) {
            Log.e("CryptoUtil", (Throwable) e);
            return null;
        } catch (NoSuchPaddingException e2) {
            Log.e("CryptoUtil", (Throwable) e2);
            return null;
        } catch (InvalidKeyException e3) {
            Log.e("CryptoUtil", (Throwable) e3);
            return null;
        } catch (InvalidAlgorithmParameterException e4) {
            Log.e("CryptoUtil", (Throwable) e4);
            return null;
        } catch (IllegalBlockSizeException e5) {
            Log.e("CryptoUtil", (Throwable) e5);
            return null;
        } catch (BadPaddingException e6) {
            Log.e("CryptoUtil", (Throwable) e6);
            return null;
        }
    }

    public static boolean decryptFile(String str, String str2, byte[] bArr) {
        boolean z = false;
        if (bArr == null || bArr.length != 16) {
            return false;
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
        FileInputStream fileInputStream = null;
        try {
            final Cipher instance = Cipher.getInstance("AES/CTR/NoPadding");
            instance.init(2, secretKeySpec, new IvParameterSpec(sAesIv));
            final FileInputStream fileInputStream2 = new FileInputStream(str);
            try {
                Boolean bool = (Boolean) BaseDocumentProviderUtils.safeWriteFile(str2, new WriteHandler<Boolean>() {
                    public Boolean handle(FileOutputStream fileOutputStream) {
                        CipherOutputStream cipherOutputStream = null;
                        try {
                            CipherOutputStream cipherOutputStream2 = new CipherOutputStream(fileOutputStream, instance);
                            try {
                                byte[] bArr = new byte[1024];
                                while (true) {
                                    int read = fileInputStream2.read(bArr);
                                    if (read != -1) {
                                        cipherOutputStream2.write(bArr, 0, read);
                                    } else {
                                        Boolean valueOf = Boolean.valueOf(true);
                                        BaseMiscUtil.closeSilently(cipherOutputStream2);
                                        return valueOf;
                                    }
                                }
                            } catch (Exception e) {
                                e = e;
                                cipherOutputStream = cipherOutputStream2;
                                try {
                                    Log.e("CryptoUtil", (Throwable) e);
                                    Boolean valueOf2 = Boolean.valueOf(false);
                                    BaseMiscUtil.closeSilently(cipherOutputStream);
                                    return valueOf2;
                                } catch (Throwable th) {
                                    th = th;
                                    BaseMiscUtil.closeSilently(cipherOutputStream);
                                    throw th;
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                cipherOutputStream = cipherOutputStream2;
                                BaseMiscUtil.closeSilently(cipherOutputStream);
                                throw th;
                            }
                        } catch (Exception e2) {
                            e = e2;
                            Log.e("CryptoUtil", (Throwable) e);
                            Boolean valueOf22 = Boolean.valueOf(false);
                            BaseMiscUtil.closeSilently(cipherOutputStream);
                            return valueOf22;
                        }
                    }
                });
                if (bool != null && bool.booleanValue()) {
                    z = true;
                }
                BaseMiscUtil.closeSilently(fileInputStream2);
                return z;
            } catch (NoSuchAlgorithmException e) {
                e = e;
                fileInputStream = fileInputStream2;
                Log.e("CryptoUtil", (Throwable) e);
                BaseMiscUtil.closeSilently(fileInputStream);
                return false;
            } catch (NoSuchPaddingException e2) {
                e = e2;
                fileInputStream = fileInputStream2;
                Log.e("CryptoUtil", (Throwable) e);
                BaseMiscUtil.closeSilently(fileInputStream);
                return false;
            } catch (InvalidKeyException e3) {
                e = e3;
                fileInputStream = fileInputStream2;
                Log.e("CryptoUtil", (Throwable) e);
                BaseMiscUtil.closeSilently(fileInputStream);
                return false;
            } catch (InvalidAlgorithmParameterException e4) {
                e = e4;
                fileInputStream = fileInputStream2;
                Log.e("CryptoUtil", (Throwable) e);
                BaseMiscUtil.closeSilently(fileInputStream);
                return false;
            } catch (FileNotFoundException e5) {
                e = e5;
                fileInputStream = fileInputStream2;
                Log.e("CryptoUtil", (Throwable) e);
                BaseMiscUtil.closeSilently(fileInputStream);
                return false;
            } catch (Throwable th) {
                th = th;
                fileInputStream = fileInputStream2;
                BaseMiscUtil.closeSilently(fileInputStream);
                throw th;
            }
        } catch (NoSuchAlgorithmException e6) {
            e = e6;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        } catch (NoSuchPaddingException e7) {
            e = e7;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        } catch (InvalidKeyException e8) {
            e = e8;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        } catch (InvalidAlgorithmParameterException e9) {
            e = e9;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        } catch (FileNotFoundException e10) {
            e = e10;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        } catch (Throwable th2) {
            th = th2;
            BaseMiscUtil.closeSilently(fileInputStream);
            throw th;
        }
    }

    public static boolean decryptFileHeader(String str, String str2, final byte[] bArr) {
        File file;
        if (bArr == null || bArr.length != 16) {
            return false;
        }
        FileInputStream fileInputStream = null;
        try {
            if (ExtraTextUtils.equalsIgnoreCase(str, str2)) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(".");
                sb.append(System.currentTimeMillis());
                sb.append(".tmp");
                file = new File(sb.toString());
            } else {
                file = new File(str2);
            }
            final FileInputStream fileInputStream2 = new FileInputStream(str);
            try {
                Boolean bool = (Boolean) BaseDocumentProviderUtils.safeWriteFile(file.getAbsolutePath(), new WriteHandler<Boolean>() {
                    public Boolean handle(FileOutputStream fileOutputStream) {
                        FileChannel fileChannel;
                        FileChannel fileChannel2;
                        IOException e;
                        Boolean valueOf;
                        try {
                            fileChannel2 = fileInputStream2.getChannel();
                            try {
                                fileChannel = fileOutputStream.getChannel();
                                try {
                                    long size = fileChannel2.size();
                                    long transferTo = fileChannel2.transferTo(0, size, fileChannel);
                                    if (transferTo != size) {
                                        Log.e("CryptoUtil", "transfer error, expect count %s, actual count %s", Long.valueOf(size), Long.valueOf(transferTo));
                                        valueOf = Boolean.valueOf(false);
                                    } else {
                                        int max = Math.max((int) Math.min(1024, fileChannel2.size()), 16);
                                        byte[] bArr = new byte[max];
                                        if (((long) fileInputStream2.read(bArr)) != Math.min((long) max, size)) {
                                            Log.e("CryptoUtil", "read encrypted header bytes error");
                                            valueOf = Boolean.valueOf(false);
                                        } else {
                                            byte[] access$100 = CryptoUtil.decrypt(bArr, bArr);
                                            if (access$100 != null) {
                                                if (access$100.length == max) {
                                                    if (access$100.length == 16) {
                                                        int i = 15;
                                                        while (i >= 0 && access$100[i] == 0) {
                                                            i--;
                                                        }
                                                        if (i == -1) {
                                                            Log.e("CryptoUtil", "Encrypted file is malformed.");
                                                            valueOf = Boolean.valueOf(false);
                                                        } else if (i < 15) {
                                                            max = i + 1;
                                                            byte[] bArr2 = new byte[max];
                                                            System.arraycopy(access$100, 0, bArr2, 0, max);
                                                            access$100 = (byte[]) bArr2.clone();
                                                            fileChannel.truncate((long) max);
                                                        }
                                                    }
                                                    if (fileChannel.write(ByteBuffer.wrap(access$100), 0) != max) {
                                                        Log.e("CryptoUtil", "write decrypted header bytes error");
                                                        valueOf = Boolean.valueOf(false);
                                                    } else {
                                                        BaseMiscUtil.closeSilently(fileChannel2);
                                                        BaseMiscUtil.closeSilently(fileChannel);
                                                        return Boolean.valueOf(true);
                                                    }
                                                }
                                            }
                                            Log.e("CryptoUtil", "decrypt header bytes error");
                                            valueOf = Boolean.valueOf(false);
                                        }
                                    }
                                } catch (IOException e2) {
                                    e = e2;
                                    try {
                                        Log.e("CryptoUtil", (Throwable) e);
                                        valueOf = Boolean.valueOf(false);
                                        BaseMiscUtil.closeSilently(fileChannel2);
                                        BaseMiscUtil.closeSilently(fileChannel);
                                        return valueOf;
                                    } catch (Throwable th) {
                                        th = th;
                                        BaseMiscUtil.closeSilently(fileChannel2);
                                        BaseMiscUtil.closeSilently(fileChannel);
                                        throw th;
                                    }
                                }
                            } catch (IOException e3) {
                                e = e3;
                                fileChannel = null;
                                Log.e("CryptoUtil", (Throwable) e);
                                valueOf = Boolean.valueOf(false);
                                BaseMiscUtil.closeSilently(fileChannel2);
                                BaseMiscUtil.closeSilently(fileChannel);
                                return valueOf;
                            } catch (Throwable th2) {
                                th = th2;
                                fileChannel = null;
                                BaseMiscUtil.closeSilently(fileChannel2);
                                BaseMiscUtil.closeSilently(fileChannel);
                                throw th;
                            }
                        } catch (IOException e4) {
                            fileChannel2 = null;
                            e = e4;
                            fileChannel = null;
                            Log.e("CryptoUtil", (Throwable) e);
                            valueOf = Boolean.valueOf(false);
                            BaseMiscUtil.closeSilently(fileChannel2);
                            BaseMiscUtil.closeSilently(fileChannel);
                            return valueOf;
                        } catch (Throwable th3) {
                            fileChannel2 = null;
                            th = th3;
                            fileChannel = null;
                            BaseMiscUtil.closeSilently(fileChannel2);
                            BaseMiscUtil.closeSilently(fileChannel);
                            throw th;
                        }
                        BaseMiscUtil.closeSilently(fileChannel2);
                        BaseMiscUtil.closeSilently(fileChannel);
                        return valueOf;
                    }
                });
                if (bool != null) {
                    if (bool.booleanValue()) {
                        if (!ExtraTextUtils.equalsIgnoreCase(file.getAbsolutePath(), str2)) {
                            boolean renameFile = BaseFileUtils.renameFile(file, new File(str2));
                            BaseMiscUtil.closeSilently(fileInputStream2);
                            return renameFile;
                        }
                        BaseMiscUtil.closeSilently(fileInputStream2);
                        return true;
                    }
                }
                BaseFileUtils.deleteFile(file);
                BaseMiscUtil.closeSilently(fileInputStream2);
                return false;
            } catch (FileNotFoundException e) {
                e = e;
                fileInputStream = fileInputStream2;
                try {
                    Log.e("CryptoUtil", (Throwable) e);
                    BaseMiscUtil.closeSilently(fileInputStream);
                    return false;
                } catch (Throwable th) {
                    th = th;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileInputStream = fileInputStream2;
                BaseMiscUtil.closeSilently(fileInputStream);
                throw th;
            }
        } catch (FileNotFoundException e2) {
            e = e2;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        }
    }

    /* access modifiers changed from: private */
    public static byte[] encrypt(byte[] bArr, byte[] bArr2) {
        if (bArr == null || bArr2 == null || bArr2.length != 16) {
            return null;
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(sAesIv);
        try {
            Cipher instance = Cipher.getInstance("AES/CTR/NoPadding");
            instance.init(1, secretKeySpec, ivParameterSpec);
            return instance.doFinal(bArr);
        } catch (NoSuchAlgorithmException e) {
            Log.e("CryptoUtil", (Throwable) e);
            return null;
        } catch (NoSuchPaddingException e2) {
            Log.e("CryptoUtil", (Throwable) e2);
            return null;
        } catch (InvalidKeyException e3) {
            Log.e("CryptoUtil", (Throwable) e3);
            return null;
        } catch (InvalidAlgorithmParameterException e4) {
            Log.e("CryptoUtil", (Throwable) e4);
            return null;
        } catch (IllegalBlockSizeException e5) {
            Log.e("CryptoUtil", (Throwable) e5);
            return null;
        } catch (BadPaddingException e6) {
            Log.e("CryptoUtil", (Throwable) e6);
            return null;
        }
    }

    /* JADX WARNING: type inference failed for: r5v0, types: [java.lang.String] */
    /* JADX WARNING: type inference failed for: r5v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r5v2 */
    /* JADX WARNING: type inference failed for: r5v3 */
    /* JADX WARNING: type inference failed for: r5v4 */
    /* JADX WARNING: type inference failed for: r5v5 */
    /* JADX WARNING: type inference failed for: r5v6 */
    /* JADX WARNING: type inference failed for: r5v7 */
    /* JADX WARNING: type inference failed for: r5v8 */
    /* JADX WARNING: type inference failed for: r5v9 */
    /* JADX WARNING: type inference failed for: r5v10 */
    /* JADX WARNING: type inference failed for: r5v11 */
    /* JADX WARNING: type inference failed for: r5v12 */
    /* JADX WARNING: type inference failed for: r5v13 */
    /* JADX WARNING: type inference failed for: r5v14 */
    /* JADX WARNING: type inference failed for: r5v15, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r5v16 */
    /* JADX WARNING: type inference failed for: r5v17 */
    /* JADX WARNING: type inference failed for: r5v18 */
    /* JADX WARNING: type inference failed for: r5v19 */
    /* JADX WARNING: type inference failed for: r5v20 */
    /* JADX WARNING: type inference failed for: r5v21 */
    /* JADX WARNING: type inference failed for: r5v22 */
    /* JADX WARNING: type inference failed for: r5v23 */
    /* JADX WARNING: type inference failed for: r5v24 */
    /* JADX WARNING: type inference failed for: r5v25 */
    /* JADX WARNING: type inference failed for: r5v26 */
    /* JADX WARNING: type inference failed for: r5v27 */
    /* JADX WARNING: type inference failed for: r5v28, types: [javax.crypto.CipherInputStream] */
    /* JADX WARNING: type inference failed for: r5v29 */
    /* JADX WARNING: type inference failed for: r5v30 */
    /* JADX WARNING: type inference failed for: r5v31 */
    /* JADX WARNING: type inference failed for: r5v32 */
    /* JADX WARNING: type inference failed for: r5v33 */
    /* JADX WARNING: type inference failed for: r5v34 */
    /* JADX WARNING: type inference failed for: r5v35 */
    /* JADX WARNING: type inference failed for: r5v36 */
    /* JADX WARNING: type inference failed for: r5v37 */
    /* JADX WARNING: type inference failed for: r5v38 */
    /* JADX WARNING: type inference failed for: r5v39 */
    /* JADX WARNING: type inference failed for: r5v40 */
    /* JADX WARNING: type inference failed for: r5v41 */
    /* JADX WARNING: type inference failed for: r5v42 */
    /* JADX WARNING: type inference failed for: r5v43 */
    /* JADX WARNING: type inference failed for: r5v44 */
    /* JADX WARNING: type inference failed for: r5v45 */
    /* JADX WARNING: type inference failed for: r5v46 */
    /* JADX WARNING: type inference failed for: r5v47 */
    /* JADX WARNING: type inference failed for: r5v48 */
    /* JADX WARNING: type inference failed for: r5v49 */
    /* JADX WARNING: type inference failed for: r5v50 */
    /* JADX WARNING: type inference failed for: r5v51 */
    /* JADX WARNING: type inference failed for: r5v52 */
    /* JADX WARNING: Incorrect type for immutable var: ssa=java.lang.String, code=null, for r5v0, types: [java.lang.String] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v2
  assigns: []
  uses: []
  mth insns count: 104
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 17 */
    public static boolean encryptFile(String r5, String str, byte[] bArr) {
        boolean z = false;
        if (bArr == null || bArr.length != 16) {
            return false;
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(sAesIv);
        FileInputStream fileInputStream = null;
        try {
            r5 = r5;
            Cipher instance = Cipher.getInstance("AES/CTR/NoPadding");
            instance.init(1, secretKeySpec, ivParameterSpec);
            FileInputStream fileInputStream2 = new FileInputStream(r5);
            try {
                r5 = new CipherInputStream(fileInputStream2, instance);
                try {
                    Boolean bool = (Boolean) BaseDocumentProviderUtils.safeWriteFile(str, new WriteHandler<Boolean>() {
                        public Boolean handle(FileOutputStream fileOutputStream) {
                            try {
                                byte[] bArr = new byte[1024];
                                while (true) {
                                    int read = r5.read(bArr);
                                    if (read == -1) {
                                        return Boolean.valueOf(true);
                                    }
                                    fileOutputStream.write(bArr, 0, read);
                                }
                            } catch (Exception e) {
                                Log.e("CryptoUtil", (Throwable) e);
                                return Boolean.valueOf(false);
                            }
                        }
                    });
                    if (bool != null && bool.booleanValue()) {
                        z = true;
                    }
                    BaseMiscUtil.closeSilently(fileInputStream2);
                    r5 = r5;
                } catch (NoSuchAlgorithmException e) {
                    e = e;
                    r5 = r5;
                    fileInputStream = fileInputStream2;
                    r5 = r5;
                    Log.e("CryptoUtil", (Throwable) e);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(r5);
                    return z;
                } catch (NoSuchPaddingException e2) {
                    e = e2;
                    r5 = r5;
                    fileInputStream = fileInputStream2;
                    r5 = r5;
                    Log.e("CryptoUtil", (Throwable) e);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(r5);
                    return z;
                } catch (InvalidKeyException e3) {
                    e = e3;
                    r5 = r5;
                    fileInputStream = fileInputStream2;
                    r5 = r5;
                    Log.e("CryptoUtil", (Throwable) e);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(r5);
                    return z;
                } catch (InvalidAlgorithmParameterException e4) {
                    e = e4;
                    r5 = r5;
                    fileInputStream = fileInputStream2;
                    r5 = r5;
                    r5 = r5;
                    Log.e("CryptoUtil", (Throwable) e);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(r5);
                    return z;
                } catch (FileNotFoundException e5) {
                    e = e5;
                    r5 = r5;
                    fileInputStream = fileInputStream2;
                    r5 = r5;
                    r5 = r5;
                    Log.e("CryptoUtil", (Throwable) e);
                    r5 = r5;
                    r5 = r5;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    r5 = r5;
                    BaseMiscUtil.closeSilently(r5);
                    return z;
                } catch (Throwable th) {
                    th = th;
                    r5 = r5;
                    fileInputStream = fileInputStream2;
                    r5 = r5;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    BaseMiscUtil.closeSilently(r5);
                    throw th;
                }
            } catch (NoSuchAlgorithmException e6) {
                e = e6;
                r5 = 0;
                fileInputStream = fileInputStream2;
                r5 = r5;
                Log.e("CryptoUtil", (Throwable) e);
                r5 = r5;
                BaseMiscUtil.closeSilently(fileInputStream);
                r5 = r5;
                BaseMiscUtil.closeSilently(r5);
                return z;
            } catch (NoSuchPaddingException e7) {
                e = e7;
                r5 = 0;
                fileInputStream = fileInputStream2;
                r5 = r5;
                Log.e("CryptoUtil", (Throwable) e);
                r5 = r5;
                BaseMiscUtil.closeSilently(fileInputStream);
                r5 = r5;
                BaseMiscUtil.closeSilently(r5);
                return z;
            } catch (InvalidKeyException e8) {
                e = e8;
                r5 = 0;
                fileInputStream = fileInputStream2;
                r5 = r5;
                Log.e("CryptoUtil", (Throwable) e);
                r5 = r5;
                BaseMiscUtil.closeSilently(fileInputStream);
                r5 = r5;
                BaseMiscUtil.closeSilently(r5);
                return z;
            } catch (InvalidAlgorithmParameterException e9) {
                e = e9;
                r5 = 0;
                fileInputStream = fileInputStream2;
                r5 = r5;
                r5 = r5;
                Log.e("CryptoUtil", (Throwable) e);
                r5 = r5;
                BaseMiscUtil.closeSilently(fileInputStream);
                r5 = r5;
                BaseMiscUtil.closeSilently(r5);
                return z;
            } catch (FileNotFoundException e10) {
                e = e10;
                r5 = 0;
                fileInputStream = fileInputStream2;
                r5 = r5;
                r5 = r5;
                Log.e("CryptoUtil", (Throwable) e);
                r5 = r5;
                r5 = r5;
                BaseMiscUtil.closeSilently(fileInputStream);
                r5 = r5;
                BaseMiscUtil.closeSilently(r5);
                return z;
            } catch (Throwable th2) {
                th = th2;
                r5 = 0;
                fileInputStream = fileInputStream2;
                r5 = r5;
                BaseMiscUtil.closeSilently(fileInputStream);
                BaseMiscUtil.closeSilently(r5);
                throw th;
            }
        } catch (NoSuchAlgorithmException e11) {
            e = e11;
            r5 = 0;
            Log.e("CryptoUtil", (Throwable) e);
            r5 = r5;
            BaseMiscUtil.closeSilently(fileInputStream);
            r5 = r5;
            BaseMiscUtil.closeSilently(r5);
            return z;
        } catch (NoSuchPaddingException e12) {
            e = e12;
            r5 = 0;
            Log.e("CryptoUtil", (Throwable) e);
            r5 = r5;
            BaseMiscUtil.closeSilently(fileInputStream);
            r5 = r5;
            BaseMiscUtil.closeSilently(r5);
            return z;
        } catch (InvalidKeyException e13) {
            e = e13;
            r5 = 0;
            Log.e("CryptoUtil", (Throwable) e);
            r5 = r5;
            BaseMiscUtil.closeSilently(fileInputStream);
            r5 = r5;
            BaseMiscUtil.closeSilently(r5);
            return z;
        } catch (InvalidAlgorithmParameterException e14) {
            e = e14;
            r5 = 0;
            r5 = r5;
            Log.e("CryptoUtil", (Throwable) e);
            r5 = r5;
            BaseMiscUtil.closeSilently(fileInputStream);
            r5 = r5;
            BaseMiscUtil.closeSilently(r5);
            return z;
        } catch (FileNotFoundException e15) {
            e = e15;
            r5 = 0;
            r5 = r5;
            Log.e("CryptoUtil", (Throwable) e);
            r5 = r5;
            r5 = r5;
            BaseMiscUtil.closeSilently(fileInputStream);
            r5 = r5;
            BaseMiscUtil.closeSilently(r5);
            return z;
        } catch (Throwable th3) {
            th = th3;
            r5 = r5;
            BaseMiscUtil.closeSilently(fileInputStream);
            BaseMiscUtil.closeSilently(r5);
            throw th;
        }
        BaseMiscUtil.closeSilently(r5);
        return z;
    }

    public static boolean encryptFileHeader(String str, String str2, final byte[] bArr) {
        File file;
        if (bArr == null || bArr.length != 16) {
            return false;
        }
        FileInputStream fileInputStream = null;
        try {
            if (ExtraTextUtils.equalsIgnoreCase(str, str2)) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(".");
                sb.append(System.currentTimeMillis());
                sb.append(".tmp");
                file = new File(sb.toString());
            } else {
                file = new File(str2);
            }
            final FileInputStream fileInputStream2 = new FileInputStream(str);
            try {
                Boolean bool = (Boolean) BaseDocumentProviderUtils.safeWriteFile(file.getAbsolutePath(), new WriteHandler<Boolean>() {
                    public Boolean handle(FileOutputStream fileOutputStream) {
                        FileChannel fileChannel;
                        FileChannel fileChannel2;
                        IOException e;
                        Boolean valueOf;
                        try {
                            fileChannel2 = fileInputStream2.getChannel();
                            try {
                                fileChannel = fileOutputStream.getChannel();
                                try {
                                    long size = fileChannel2.size();
                                    long transferTo = fileChannel2.transferTo(0, size, fileChannel);
                                    if (transferTo != size) {
                                        Log.e("CryptoUtil", "transfer error, expect count %s, actual count %s", Long.valueOf(size), Long.valueOf(transferTo));
                                        valueOf = Boolean.valueOf(false);
                                    } else {
                                        int max = Math.max((int) Math.min(1024, size), 16);
                                        byte[] bArr = new byte[max];
                                        if (((long) fileInputStream2.read(bArr)) != Math.min((long) max, size)) {
                                            Log.e("CryptoUtil", "read header bytes error");
                                            valueOf = Boolean.valueOf(false);
                                        } else {
                                            byte[] access$000 = CryptoUtil.encrypt(bArr, bArr);
                                            if (access$000 != null) {
                                                if (access$000.length == max) {
                                                    if (fileChannel.write(ByteBuffer.wrap(access$000), 0) != max) {
                                                        Log.e("CryptoUtil", "write encrypted header bytes error");
                                                        valueOf = Boolean.valueOf(false);
                                                    } else {
                                                        BaseMiscUtil.closeSilently(fileChannel2);
                                                        BaseMiscUtil.closeSilently(fileChannel);
                                                        return Boolean.valueOf(true);
                                                    }
                                                }
                                            }
                                            Log.e("CryptoUtil", "encrypt header bytes error");
                                            valueOf = Boolean.valueOf(false);
                                        }
                                    }
                                } catch (IOException e2) {
                                    e = e2;
                                    try {
                                        Log.e("CryptoUtil", (Throwable) e);
                                        valueOf = Boolean.valueOf(false);
                                        BaseMiscUtil.closeSilently(fileChannel2);
                                        BaseMiscUtil.closeSilently(fileChannel);
                                        return valueOf;
                                    } catch (Throwable th) {
                                        th = th;
                                        BaseMiscUtil.closeSilently(fileChannel2);
                                        BaseMiscUtil.closeSilently(fileChannel);
                                        throw th;
                                    }
                                }
                            } catch (IOException e3) {
                                e = e3;
                                fileChannel = null;
                                Log.e("CryptoUtil", (Throwable) e);
                                valueOf = Boolean.valueOf(false);
                                BaseMiscUtil.closeSilently(fileChannel2);
                                BaseMiscUtil.closeSilently(fileChannel);
                                return valueOf;
                            } catch (Throwable th2) {
                                th = th2;
                                fileChannel = null;
                                BaseMiscUtil.closeSilently(fileChannel2);
                                BaseMiscUtil.closeSilently(fileChannel);
                                throw th;
                            }
                        } catch (IOException e4) {
                            fileChannel2 = null;
                            e = e4;
                            fileChannel = null;
                            Log.e("CryptoUtil", (Throwable) e);
                            valueOf = Boolean.valueOf(false);
                            BaseMiscUtil.closeSilently(fileChannel2);
                            BaseMiscUtil.closeSilently(fileChannel);
                            return valueOf;
                        } catch (Throwable th3) {
                            fileChannel2 = null;
                            th = th3;
                            fileChannel = null;
                            BaseMiscUtil.closeSilently(fileChannel2);
                            BaseMiscUtil.closeSilently(fileChannel);
                            throw th;
                        }
                        BaseMiscUtil.closeSilently(fileChannel2);
                        BaseMiscUtil.closeSilently(fileChannel);
                        return valueOf;
                    }
                });
                if (bool != null) {
                    if (bool.booleanValue()) {
                        if (!ExtraTextUtils.equalsIgnoreCase(file.getAbsolutePath(), str2)) {
                            boolean renameFile = BaseFileUtils.renameFile(file, new File(str2));
                            BaseMiscUtil.closeSilently(fileInputStream2);
                            return renameFile;
                        }
                        BaseMiscUtil.closeSilently(fileInputStream2);
                        return true;
                    }
                }
                BaseFileUtils.deleteFile(file);
                BaseMiscUtil.closeSilently(fileInputStream2);
                return false;
            } catch (FileNotFoundException e) {
                e = e;
                fileInputStream = fileInputStream2;
                try {
                    Log.e("CryptoUtil", (Throwable) e);
                    BaseMiscUtil.closeSilently(fileInputStream);
                    return false;
                } catch (Throwable th) {
                    th = th;
                    BaseMiscUtil.closeSilently(fileInputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileInputStream = fileInputStream2;
                BaseMiscUtil.closeSilently(fileInputStream);
                throw th;
            }
        } catch (FileNotFoundException e2) {
            e = e2;
            Log.e("CryptoUtil", (Throwable) e);
            BaseMiscUtil.closeSilently(fileInputStream);
            return false;
        }
    }

    private static byte[] generateEmptyKey() {
        return new byte[16];
    }

    public static synchronized byte[] generateRandomKey() {
        byte[] generateEmptyKey;
        synchronized (CryptoUtil.class) {
            generateEmptyKey = generateEmptyKey();
            new SecureRandom().nextBytes(sRandomKey);
            System.arraycopy(sRandomKey, 0, generateEmptyKey, 0, sRandomKey.length);
        }
        return generateEmptyKey;
    }

    private static Cipher getCipher(byte[] bArr, int i) {
        Cipher cipher;
        if (bArr == null || bArr.length != 16) {
            return null;
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(sAesIv);
        try {
            cipher = Cipher.getInstance("AES/CTR/NoPadding");
            try {
                cipher.init(i, secretKeySpec, ivParameterSpec);
            } catch (NoSuchAlgorithmException e) {
                e = e;
            } catch (NoSuchPaddingException e2) {
                e = e2;
                Log.e("CryptoUtil", (Throwable) e);
                return cipher;
            } catch (InvalidKeyException e3) {
                e = e3;
                Log.e("CryptoUtil", (Throwable) e);
                return cipher;
            } catch (InvalidAlgorithmParameterException e4) {
                e = e4;
                Log.e("CryptoUtil", (Throwable) e);
                return cipher;
            }
        } catch (NoSuchAlgorithmException e5) {
            e = e5;
            cipher = null;
            Log.e("CryptoUtil", (Throwable) e);
            return cipher;
        } catch (NoSuchPaddingException e6) {
            e = e6;
            cipher = null;
            Log.e("CryptoUtil", (Throwable) e);
            return cipher;
        } catch (InvalidKeyException e7) {
            e = e7;
            cipher = null;
            Log.e("CryptoUtil", (Throwable) e);
            return cipher;
        } catch (InvalidAlgorithmParameterException e8) {
            e = e8;
            cipher = null;
            Log.e("CryptoUtil", (Throwable) e);
            return cipher;
        }
        return cipher;
    }

    public static InputStream getDecryptCipherInputStream(String str, byte[] bArr) throws FileNotFoundException {
        FileInputStream fileInputStream = new FileInputStream(str);
        return bArr != null ? new CipherInputStream(fileInputStream, getCipher(bArr, 2)) : fileInputStream;
    }

    public static CipherInputStream getDecryptCipherInputStream(InputStream inputStream, byte[] bArr) {
        return new CipherInputStream(inputStream, getCipher(bArr, 2));
    }
}
