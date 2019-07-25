package com.nexstreaming.kminternal.nexvideoeditor;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Rect;
import android.media.Image;
import android.media.Image.Plane;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Build.VERSION;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.task.ResultTask;
import com.nexstreaming.app.common.task.ResultTask.OnResultAvailableListener;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.Event;
import com.nexstreaming.app.common.task.Task.OnFailListener;
import com.nexstreaming.app.common.task.Task.TaskError;
import com.nexstreaming.kminternal.kinemaster.codeccolorformat.ColorFormatChecker;
import com.nexstreaming.kminternal.kinemaster.codeccolorformat.ColorFormatChecker.ColorFormat;
import com.nexstreaming.kminternal.kinemaster.config.NexEditorDeviceProfile;
import com.nexstreaming.nexeditorsdk.BuildConfig;
import com.nexstreaming.nexeditorsdk.nexEngine;
import dalvik.system.BaseDexClassLoader;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Deque;
import java.util.EnumMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class NexEditor {
    private static File D = null;
    private static boolean O = false;
    private static int P = 1280;
    private static int Q = 720;
    private static int R;
    private static NexEditor W;
    private static final f aF = new f() {
        public void a(ErrorCode errorCode) {
        }
    };
    private static boolean ae;
    private static final ExecutorService at = Executors.newSingleThreadExecutor();
    private int A = 0;
    private int B = 0;
    private int C = 0;
    private int E;
    private int F;
    private int G;
    /* access modifiers changed from: private */
    public ColorFormat H = null;
    private int I = 0;
    private String J = null;
    private int K;
    /* access modifiers changed from: private */
    public Surface L;
    private int M = 1;
    private int N = 0;
    private int S = -1;
    private Thread T = null;
    private d U = null;
    /* access modifiers changed from: private */
    public Task V = null;
    private m X;
    private h Y;
    private r Z;
    private int a = 1;
    private int aA = 0;
    private int aB = 0;
    private boolean aC = false;
    private int aD = 0;
    private int aE = 0;
    private j aG;
    private float aH = 1.0f;
    private Task aa = null;
    private k ab;
    private l ac;
    private s ad;
    private boolean af = false;
    /* access modifiers changed from: private */
    public ResultTask<Rect> ag;
    private Callback ah = new Callback() {
        public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
            if (NexEditor.this.ag != null) {
                NexEditor.this.ag.sendResult(new Rect(0, 0, i2, i3));
                NexEditor.this.ag = null;
            }
        }

        public void surfaceCreated(SurfaceHolder surfaceHolder) {
        }

        public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        }
    };
    private boolean ai = false;
    /* access modifiers changed from: private */
    public boolean aj = false;
    /* access modifiers changed from: private */
    public boolean ak = false;
    /* access modifiers changed from: private */
    public int al;
    /* access modifiers changed from: private */
    public int am = 0;
    /* access modifiers changed from: private */
    public boolean an = false;
    /* access modifiers changed from: private */
    public boolean ao = false;
    private String ap;
    private Task aq = null;
    private int ar;
    /* access modifiers changed from: private */
    public ImageReader as = null;
    /* access modifiers changed from: private */
    public BlockingQueue<Integer> au = new ArrayBlockingQueue(3);
    /* access modifiers changed from: private */
    public boolean av = false;
    /* access modifiers changed from: private */
    public v aw = null;
    private Object ax = new Object();
    /* access modifiers changed from: private */
    public boolean ay = false;
    private boolean az = false;
    private boolean b = false;
    private boolean c = false;
    private NexEditorEventListener d = null;
    private NexThemeView e = null;
    private c f = null;
    private t[] g = null;
    private a[] h = null;
    private a[] i = null;
    private boolean j = false;
    private Deque<d> k = new LinkedList();
    private Deque<d> l = new LinkedList();
    private Deque<g> m = new LinkedList();
    private Deque<n> n = new LinkedList();
    private Deque<p> o = new LinkedList();
    private Deque<f> p = new LinkedList();
    /* access modifiers changed from: private */
    public Deque<o> q = new LinkedList();
    private Deque<o> r = new LinkedList();
    private Deque<f> s = new LinkedList();
    private Deque<f> t = new LinkedList();
    private Deque<Integer> u = new LinkedList();
    private Deque<e> v = new LinkedList();
    private Deque<i> w = new LinkedList();
    private q x = null;
    private int y = 1;
    private int z = 0;

    public static class EditorInitException extends Exception {
        private static final long serialVersionUID = 1;

        public EditorInitException() {
        }

        public EditorInitException(String str) {
            super(str);
        }

        public EditorInitException(String str, Throwable th) {
            super(str, th);
        }

        public EditorInitException(Throwable th) {
            super(th);
        }
    }

    public enum ErrorCode implements TaskError {
        NONE(0),
        GENERAL(1),
        UNKNOWN(2),
        NO_ACTION(3),
        INVALID_INFO(4),
        INVALID_STATE(5),
        VERSION_MISMATCH(6),
        CREATE_FAILED(7),
        MEMALLOC_FAILED(8, "Memory allocation failed", 0),
        ARGUMENT_FAILED(9),
        NOT_ENOUGH_NEMORY(10, "Insufficient memory", 0),
        EVENTHANDLER(11),
        FILE_IO_FAILED(12, "Error accessing file", 0),
        FILE_INVALID_SYNTAX(13),
        FILEREADER_CREATE_FAIL(14, "Could not open file", 0),
        FILEWRITER_CREATE_FAIL(15),
        AUDIORESAMPLER_CREATE_FAIL(16),
        UNSUPPORT_FORMAT(17, "Unsupported format", 0),
        FILEREADER_FAILED(18, "Error reading file format", 0),
        PLAYSTART_FAILED(19),
        PLAYSTOP_FAILED(20),
        PROJECT_NOT_CREATE(21),
        PROJECT_NOT_OPEN(22),
        CODEC_INIT(23, "Codec init failed", 0),
        RENDERER_INIT(24),
        THEMESET_CREATE_FAIL(25),
        ADD_CLIP_FAIL(26, "Unable to add clip", 0),
        ENCODE_VIDEO_FAIL(27),
        INPROGRESS_GETCLIPINFO(28),
        THUMBNAIL_BUSY(29),
        UNSUPPORT_MIN_DURATION(30),
        UNSUPPORT_MAX_RESOLUTION(31),
        UNSUPPORT_MIN_RESOLUTION(32),
        UNSUPPORT_VIDEIO_PROFILE(33),
        UNSUPPORT_VIDEO_LEVEL(34),
        UNSUPPORT_VIDEO_FPS(35),
        TRANSCODING_BUSY(36),
        TRANSCODING_NOT_SUPPORTED_FORMAT(37),
        TRANSCODING_USER_CANCEL(38),
        TRANSCODING_NOT_ENOUGHT_DISK_SPACE(39),
        TRANSCODING_CODEC_FAILED(40),
        EXPORT_WRITER_INVAILED_HANDLE(41),
        EXPORT_WRITER_INIT_FAIL(42),
        EXPORT_WRITER_START_FAIL(43),
        EXPORT_AUDIO_DEC_INIT_FAIL(44),
        EXPORT_VIDEO_DEC_INIT_FAIL(45),
        EXPORT_VIDEO_ENC_FAIL(46),
        EXPORT_VIDEO_RENDER_INIT_FAIL(47),
        EXPORT_NOT_ENOUGHT_DISK_SPACE(48, "Not enough space", 0),
        UNSUPPORT_AUDIO_PROFILE(49),
        THUMBNAIL_INIT_FAIL(50),
        UNSUPPORT_AUDIO_CODEC(51),
        UNSUPPORT_VIDEO_CODEC(52),
        HIGHLIGHT_FILEREADER_INIT_ERROR(53),
        HIGHLIGHT_TOO_SHORT_CONTENTS(54),
        HIGHLIGHT_CODEC_INIT_ERROR(55),
        HIGHLIGHT_CODEC_DECODE_ERROR(56),
        HIGHLIGHT_RENDER_INIT_ERROR(57),
        HIGHLIGHT_WRITER_INIT_ERROR(58),
        HIGHLIGHT_WRITER_WRITE_ERROR(59),
        HIGHLIGHT_GET_INDEX_ERROR(60),
        HIGHLIGHT_USER_CANCEL(61),
        GETCLIPINFO_USER_CANCEL(62),
        DIRECTEXPORT_CLIPLIST_ERROR(63),
        DIRECTEXPORT_CHECK_ERROR(64),
        DIRECTEXPORT_FILEREADER_INIT_ERROR(65),
        DIRECTEXPORT_FILEWRITER_INIT_ERROR(66),
        DIRECTEXPORT_DEC_INIT_ERROR(67),
        DIRECTEXPORT_DEC_INIT_SURFACE_ERROR(68),
        DIRECTEXPORT_DEC_DECODE_ERROR(69),
        DIRECTEXPORT_ENC_INIT_ERROR(70),
        DIRECTEXPORT_ENC_ENCODE_ERROR(71),
        DIRECTEXPORT_ENC_INPUT_SURFACE_ERROR(72),
        DIRECTEXPORT_ENC_FUNCTION_ERROR(73),
        DIRECTEXPORT_ENC_DSI_DIFF_ERROR(74),
        DIRECTEXPORT_ENC_FRAME_CONVERT_ERROR(75),
        DIRECTEXPORT_RENDER_INIT_ERROR(76),
        DIRECTEXPORT_WRITER_WRITE_ERROR(77),
        DIRECTEXPORT_WRITER_UNKNOWN_ERROR(78),
        FASTPREVIEW_USER_CANCEL(79),
        FASTPREVIEW_CLIPLIST_ERROR(80),
        FASTPREVIEW_FIND_CLIP_ERROR(81),
        FASTPREVIEW_FIND_READER_ERROR(82),
        FASTPREVIEW_VIDEO_RENDERER_ERROR(83),
        FASTPREVIEW_DEC_INIT_SURFACE_ERROR(84),
        HW_NOT_ENOUGH_MEMORY(85),
        EXPORT_USER_CANCEL(86),
        FASTPREVIEW_DEC_INIT_ERROR(87),
        FASTPREVIEW_FILEREADER_INIT_ERROR(88),
        FASTPREVIEW_TIME_ERROR(89),
        FASTPREVIEW_RENDER_INIT_ERROR(90),
        FASTPREVIEW_OUTPUTSURFACE_INIT_ERROR(91),
        FASTPREVIEW_BUSY(92),
        CODEC_DECODE(93, "Codec decode failed", 0),
        RENDERER_AUDIO(94),
        UNSUPPORT_AUDIO_SAMPLINGRATE(95),
        IMAGE_PROCESS(4097),
        SET_TIME_IGNORED("Set time ignored", 0),
        SET_TIME_CANCELED("Set time canceled", 0),
        CAPTURE_FAILED("Capture failed", 0),
        SOURCE_FILE_NOT_FOUND,
        TRANSCODING_ABORTED,
        DESTINATION_FILE_ALREADY_EXISTS,
        TEMP_FILE_ALREADY_EXISTS,
        NO_INSTANCE_AVAILABLE,
        EXPORT_NO_SUCCESS,
        PLAY_SUPERCEEDED,
        WRAPPER_BUSY,
        NOT_READY_TO_PLAY,
        SEEKING_LOCKED,
        NO_PROJECT_LOADED,
        ALREADY_EXPORTING,
        EMPTY_PROJECT,
        MISSING_RESOURCES,
        EXPORT_UNEXPECTED_STOP,
        RENAME_FAIL,
        CAPTURE_FAIL_ENOSPC("Not enough space", 0),
        CAPTURE_FAIL_OTHER("Capture failed", 0),
        CAPTURE_FAIL_SCANNING("Media scanner failed", 0),
        UNRECOGNIZED_ERROR_CODE("Unrecognized error code", 0),
        EDITOR_INSTANCE_DESTROYED,
        FILE_MISSING;
        
        private final String mDescription;
        private final int mDescriptionRsrcId;
        private final boolean mFromEngine;
        private final int mValue;

        private ErrorCode(int i) {
            this.mValue = i;
            this.mDescription = null;
            this.mDescriptionRsrcId = 0;
            this.mFromEngine = true;
        }

        private ErrorCode(int i, String str, int i2) {
            this.mValue = i;
            this.mDescription = str;
            this.mDescriptionRsrcId = i2;
            this.mFromEngine = true;
        }

        private ErrorCode(String str, int i) {
            this.mValue = 0;
            this.mDescription = str;
            this.mDescriptionRsrcId = i;
            this.mFromEngine = false;
        }

        public static ErrorCode fromValue(int i) {
            ErrorCode[] values;
            for (ErrorCode errorCode : values()) {
                if (errorCode.mFromEngine && errorCode.getValue() == i) {
                    return errorCode;
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Unrecognized error code : ");
            sb.append(i);
            Log.e("NexEditor.java", sb.toString());
            return UNRECOGNIZED_ERROR_CODE;
        }

        public String getDescription() {
            return this.mDescription == null ? name() : this.mDescription;
        }

        public Exception getException() {
            return null;
        }

        public String getLocalizedDescription(Context context) {
            return this.mDescriptionRsrcId != 0 ? context.getResources().getString(this.mDescriptionRsrcId) : this.mDescription == null ? name() : this.mDescription;
        }

        public String getLocalizedMessage(Context context) {
            return getLocalizedDescription(context);
        }

        public String getMessage() {
            return getDescription();
        }

        public int getValue() {
            return this.mValue;
        }

        public boolean isError() {
            return this != NONE;
        }

        public String toString() {
            if (this == NONE) {
                return "NONE(0)";
            }
            if (this.mValue == 0) {
                return name();
            }
            StringBuilder sb = new StringBuilder();
            sb.append(name());
            sb.append("(");
            sb.append(this.mValue);
            sb.append(")");
            return sb.toString();
        }
    }

    public enum FastPreviewOption {
        normal,
        brightness,
        contrast,
        saturation,
        adj_brightness,
        adj_contrast,
        adj_saturation,
        tintColor,
        left,
        top,
        right,
        bottom,
        nofx,
        cts,
        swapv,
        video360flag,
        video360_horizontal,
        video360_vertical,
        adj_vignette,
        adj_vignetteRange,
        adj_sharpness,
        customlut_clip,
        customlut_power
    }

    public enum PlayState {
        NONE(0),
        IDLE(1),
        RUN(2),
        RECORD(3),
        PAUSE(4),
        RESUME(5);
        
        private int mValue;

        private PlayState(int i) {
            this.mValue = i;
        }

        public static PlayState fromValue(int i) {
            PlayState[] values;
            for (PlayState playState : values()) {
                if (playState.getValue() == i) {
                    return playState;
                }
            }
            return null;
        }

        public int getValue() {
            return this.mValue;
        }
    }

    public static class a extends u {
    }

    public interface b {
        b a(int i);

        b a(int i, int i2);

        b a(Rect rect);

        b a(FastPreviewOption fastPreviewOption, int i);

        b a(boolean z);

        void a();
    }

    public interface c {
        void a(LayerRenderer layerRenderer);
    }

    public static abstract class d {
        int a;

        public abstract void a(int i, int i2, int i3);

        public abstract void a(ErrorCode errorCode);
    }

    public static abstract class e {
        public abstract void a(Bitmap bitmap);

        public abstract void a(ErrorCode errorCode);
    }

    public static abstract class f {
        /* access modifiers changed from: private */
        public int a;

        public abstract void a(ErrorCode errorCode);
    }

    public static abstract class g {
        public abstract void a();

        public abstract void a(ErrorCode errorCode);
    }

    public interface h {
        void a();
    }

    public static abstract class i {
        public abstract void a();

        public abstract void a(int i);

        public abstract void a(ErrorCode errorCode);
    }

    public interface j {
        void a(ErrorCode errorCode, int i);
    }

    public interface k {
        void a(int i, int i2, int i3, int i4, int i5, byte[] bArr, int i6, int i7, int i8);
    }

    public interface l {
        int a(int i);

        int a(int i, int[] iArr);
    }

    public interface m {
        void a();
    }

    public static abstract class n {
        public abstract void a(int i);

        public abstract void a(ErrorCode errorCode);
    }

    public static abstract class o {
        public abstract void a();

        public abstract void a(ErrorCode errorCode);
    }

    public static abstract class p {
        /* access modifiers changed from: private */
        public int a;
        /* access modifiers changed from: private */
        public int b;
        StackTraceElement[] e;

        public abstract String a();

        public abstract void a(int i, int i2);

        public abstract void a(ErrorCode errorCode);
    }

    public static abstract class q {
        public abstract void a();
    }

    public interface r {
        void a(int i, int i2, int i3);

        void a(ErrorCode errorCode, int i);
    }

    public interface s {
        int a(int i);

        int a(int i, int[] iArr, int[] iArr2);
    }

    public static class t extends u {
    }

    public static abstract class u {
    }

    public static abstract class v {
        public abstract void a();

        public abstract boolean a(int i);

        public abstract boolean a(byte[] bArr, int i);

        public abstract int b();

        public abstract void b(int i);
    }

    static {
        ThreadPolicy allowThreadDiskReads = StrictMode.allowThreadDiskReads();
        try {
            System.loadLibrary("nexeditorsdk");
        } catch (UnsatisfiedLinkError e2) {
            String str = "NexEditor.java";
            StringBuilder sb = new StringBuilder();
            sb.append("[NexEditor.java] nexeditor load failed : ");
            sb.append(e2);
            Log.e(str, sb.toString());
        } catch (Throwable th) {
            StrictMode.setThreadPolicy(allowThreadDiskReads);
            throw th;
        }
        StrictMode.setThreadPolicy(allowThreadDiskReads);
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0208  */
    public NexEditor(Context context, NexThemeView nexThemeView, String str, int i2, com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.d dVar, int[] iArr) throws EditorInitException {
        String str2;
        NexThemeView nexThemeView2 = nexThemeView;
        int[] iArr2 = iArr;
        boolean z2 = true;
        W = this;
        int i3 = i2 ^ 323655054;
        if (context.getFilesDir() != null) {
            String findLibrary = ((BaseDexClassLoader) context.getClassLoader()).findLibrary("nexcralbody_mc_jb");
            if (findLibrary != null) {
                int lastIndexOf = findLibrary.lastIndexOf(File.separator);
                StringBuilder sb = new StringBuilder();
                sb.append(findLibrary.substring(0, lastIndexOf));
                sb.append(File.separator);
                str2 = sb.toString();
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[nexlib] getApplicationInfo mc libarays in: ");
                sb2.append(str2);
                Log.d("NexEditor.java", sb2.toString());
            } else {
                String str3 = context.getApplicationInfo().nativeLibraryDir;
                if (!str3.endsWith(File.separator)) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(str3);
                    sb3.append(File.separator);
                    str3 = sb3.toString();
                }
                StringBuilder sb4 = new StringBuilder();
                sb4.append("[nexlib] getApplicationInfo says libs are in: ");
                sb4.append(str3);
                Log.d("NexEditor.java", sb4.toString());
                Log.d("NexEditor.java", "[nexlib] sdk lib name: libnexeditorsdk.so");
                if (new File(str3, "libnexeditorsdk.so").exists()) {
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("[nexlib] libs found in: ");
                    sb5.append(str3);
                    Log.d("NexEditor.java", sb5.toString());
                } else {
                    String property = System.getProperty("java.library.path");
                    if (property != null) {
                        String[] split = property.split(":");
                        int i4 = 0;
                        while (true) {
                            if (i4 >= split.length) {
                                break;
                            }
                            if (!split[i4].endsWith("/")) {
                                StringBuilder sb6 = new StringBuilder();
                                sb6.append(split[i4]);
                                sb6.append("/");
                                split[i4] = sb6.toString();
                            }
                            StringBuilder sb7 = new StringBuilder();
                            sb7.append("[nexlib] trying: ");
                            sb7.append(split[i4]);
                            Log.d("NexEditor.java", sb7.toString());
                            if (new File(split[i4], "libnexeditorsdk.so").exists()) {
                                StringBuilder sb8 = new StringBuilder();
                                sb8.append("[nexlib] libs found in: ");
                                sb8.append(split[i4]);
                                Log.d("NexEditor.java", sb8.toString());
                                str3 = split[i4];
                                break;
                            }
                            Log.d("NexEditor.java", "[nexlib] libs NOT FOUND!");
                            i4++;
                        }
                        if (!z2) {
                            str2 = str3.contains("/arm64") ? "/system/lib64/" : str3.contains("/x86_64") ? "/system/lib64/" : "/system/lib/";
                            StringBuilder sb9 = new StringBuilder();
                            sb9.append("[nexlib]2 trying: ");
                            sb9.append(str2);
                            Log.d("NexEditor.java", sb9.toString());
                            if (new File(str2, "libnexeditorsdk.so").exists()) {
                                StringBuilder sb10 = new StringBuilder();
                                sb10.append("[nexlib]2 libs found in: ");
                                sb10.append(str2);
                                Log.d("NexEditor.java", sb10.toString());
                            } else {
                                Log.d("NexEditor.java", "[nexlib]2 libs NOT FOUND!");
                            }
                        }
                    }
                    z2 = false;
                    if (!z2) {
                    }
                }
                str2 = str3;
            }
            c(context.getPackageName());
            int createEditor = createEditor(str2, str, VERSION.SDK_INT, initUserData() ^ i3, iArr2 == null ? null : Arrays.copyOf(iArr2, iArr2.length + 2));
            if (createEditor == 0) {
                if (NexEditorDeviceProfile.getDeviceProfile().getUserConfigSettings()) {
                    StringBuilder sb11 = new StringBuilder();
                    sb11.append("");
                    sb11.append(NexEditorDeviceProfile.getDeviceProfile().getHardwareCodecMemSize());
                    setProperty("HardWareCodecMemSize", sb11.toString());
                    StringBuilder sb12 = new StringBuilder();
                    sb12.append("");
                    sb12.append(NexEditorDeviceProfile.getDeviceProfile().getHardwareDecMaxCount());
                    setProperty("HardWareDecMaxCount", sb12.toString());
                    StringBuilder sb13 = new StringBuilder();
                    sb13.append("");
                    sb13.append(NexEditorDeviceProfile.getDeviceProfile().getHardwareEncMaxCount());
                    setProperty("HardWareEncMaxCount", sb13.toString());
                    setProperty("FeatureVersion", "3");
                    setProperty("useNexEditorSDK", "1");
                    setProperty("DeviceExtendMode", "1");
                    StringBuilder sb14 = new StringBuilder();
                    sb14.append("");
                    sb14.append(NexEditorDeviceProfile.getDeviceProfile().getForceDirectExport());
                    setProperty("forceDirectExport", sb14.toString());
                    StringBuilder sb15 = new StringBuilder();
                    sb15.append("");
                    sb15.append(NexEditorDeviceProfile.getDeviceProfile().getMaxSupportedFPS());
                    setProperty("SupportedMaxFPS", sb15.toString());
                    StringBuilder sb16 = new StringBuilder();
                    sb16.append("");
                    sb16.append(NexEditorDeviceProfile.getDeviceProfile().getMaxSupportedFPS());
                    setProperty("InputMaxFPS", sb16.toString());
                    StringBuilder sb17 = new StringBuilder();
                    sb17.append("");
                    sb17.append(NexEditorDeviceProfile.getDeviceProfile().getSupportedTimeCheker());
                    setProperty("SupportFrameTimeChecker", sb17.toString());
                    StringBuilder sb18 = new StringBuilder();
                    sb18.append("");
                    sb18.append(NexEditorDeviceProfile.getDeviceProfile().getDeviceMaxLightLevel());
                    setProperty("DeviceMaxLightLevel", sb18.toString());
                    StringBuilder sb19 = new StringBuilder();
                    sb19.append("");
                    sb19.append(NexEditorDeviceProfile.getDeviceProfile().getDeviceMaxGamma());
                    setProperty("DeviceMaxGamma", sb19.toString());
                } else {
                    setProperty("HardWareCodecMemSize", "8912896");
                    if (BuildConfig.KM_PROJECT.equals("Gionee")) {
                        setProperty("HardWareDecMaxCount", "2");
                    } else {
                        setProperty("HardWareDecMaxCount", "4");
                    }
                    setProperty("HardWareEncMaxCount", "1");
                    setProperty("FeatureVersion", "3");
                    setProperty("useNexEditorSDK", "1");
                    StringBuilder sb20 = new StringBuilder();
                    sb20.append("");
                    sb20.append(NexEditorDeviceProfile.getDeviceProfile().getForceDirectExport());
                    setProperty("forceDirectExport", sb20.toString());
                    setProperty("DeviceExtendMode", "1");
                    setProperty("InputMaxFPS", "120");
                    setProperty("SupportFrameTimeChecker", "1");
                }
                DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
                int max = Math.max(displayMetrics.widthPixels, displayMetrics.heightPixels);
                int i5 = 1024;
                while (true) {
                    int i6 = i5 * 2;
                    if (i6 >= max) {
                        break;
                    }
                    i5 = i6;
                }
                this.E = i5;
                this.F = i5;
                this.G = i5 * i5;
                StringBuilder sb21 = new StringBuilder();
                sb21.append("");
                sb21.append(this.E);
                setProperty("JpegMaxWidthFactor", sb21.toString());
                StringBuilder sb22 = new StringBuilder();
                sb22.append("");
                sb22.append(this.E);
                setProperty("JpegMaxHeightFactor", sb22.toString());
                StringBuilder sb23 = new StringBuilder();
                sb23.append("");
                sb23.append(this.G);
                setProperty("JpegMaxSizeFactor", sb23.toString());
                setProperty("UseAndroidJPEG", "1");
                setProperty("supportPeakMeter", MovieStatUtils.DOWNLOAD_SUCCESS);
                boolean equals = BuildConfig.KM_PROJECT.equals("Vivo");
                StringBuilder sb24 = new StringBuilder();
                sb24.append("");
                sb24.append(equals ? 1 : 0);
                setProperty("skipPrefetchEffect", sb24.toString());
                StringBuilder sb25 = new StringBuilder();
                sb25.append("largestDimension = ");
                sb25.append(max);
                sb25.append(" selectedSize=");
                sb25.append(i5);
                Log.d("NexEditor.java", sb25.toString());
                if (this.e != nexThemeView2) {
                    if (this.e != null) {
                        this.e.linkToEditor(null);
                    }
                    nexThemeView.linkToEditor(this);
                    this.e = nexThemeView2;
                }
                Context context2 = context;
                this.d = new NexEditorEventListener(this, context, com.nexstreaming.app.common.nexasset.assetpackage.c.a(context).e(), dVar);
                setEventHandler(this.d);
                try {
                    AssetFileDescriptor openFd = context.getAssets().openFd("nexasset.jpg");
                    this.S = setInputFile(openFd.getFileDescriptor(), 1, -1, -1);
                    openFd.close();
                    StringBuilder sb26 = new StringBuilder();
                    sb26.append("assetNativeFD is: ");
                    sb26.append(this.S);
                    Log.d("NexEditor.java", sb26.toString());
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                String[] a2 = AssetPackageReader.a();
                if (a2.length > 0) {
                    a(a2);
                    return;
                }
                return;
            }
            StringBuilder sb27 = new StringBuilder();
            sb27.append("Editor Initialization Failed (result=");
            sb27.append(createEditor);
            sb27.append(")");
            throw new EditorInitException(sb27.toString());
        }
        throw new IllegalStateException("No files directory - cannot play video - relates to Android issue: 8886!");
    }

    private String B() {
        StringBuilder sb = new StringBuilder();
        sb.append(" m_seekSerial=");
        sb.append(this.aE);
        sb.append("; m_isSeeking=");
        sb.append(this.ay);
        sb.append("; m_isPendingSeek=");
        sb.append(this.az);
        sb.append("; m_pendingSeekLocation=");
        sb.append(this.aA);
        sb.append("; m_setTimeDoneListeners.size()=");
        sb.append(this.o.size());
        return sb.toString();
    }

    private String C() {
        StackTraceElement[] stackTraceElementArr;
        String str = "";
        int i2 = 0;
        for (p pVar : this.o) {
            i2++;
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("\n     ");
            sb.append(i2);
            sb.append(": ");
            sb.append(pVar);
            sb.append(" m_reqTime=");
            sb.append(pVar.a);
            sb.append(" m_serialNumber=");
            sb.append(pVar.b);
            sb.append(" ");
            str = sb.toString();
            if (pVar.e != null) {
                String str2 = str;
                int i3 = 0;
                for (StackTraceElement stackTraceElement : pVar.e) {
                    String className = stackTraceElement.getClassName();
                    if (!className.equals("dalvik.system.VMStack") && !className.equals("java.lang.Thread") && !className.equals("dalvik.system.VMStack") && !className.equals("android.app.ActivityThread") && !className.equals("java.lang.reflect.Method") && !className.equals("com.android.internal.os.ZygoteInit") && !className.equals("com.android.internal.os.ZygoteInit$MethodAndArgsCaller:") && !className.equals("dalvik.system.NativeStart") && !className.equals("android.os.Looper")) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(str2);
                        sb2.append("\n          ");
                        sb2.append(i3);
                        sb2.append(": ");
                        sb2.append(className);
                        sb2.append("::");
                        sb2.append(stackTraceElement.getMethodName());
                        sb2.append("(");
                        sb2.append(stackTraceElement.getFileName());
                        sb2.append(" ");
                        sb2.append(stackTraceElement.getLineNumber());
                        sb2.append(")");
                        str2 = sb2.toString();
                    }
                    i3++;
                }
                str = str2;
            }
        }
        return str;
    }

    private void D() {
        int i2 = 0;
        for (p pVar : this.o) {
            StringBuilder sb = new StringBuilder();
            sb.append("     ");
            sb.append(i2);
            sb.append(": t=");
            sb.append(pVar.a);
            sb.append(" sn=");
            sb.append(pVar.b);
            sb.append(" ");
            sb.append(pVar.a());
            sb.append("    ");
            sb.append(pVar);
            Log.d("NexEditor.java", sb.toString());
            i2++;
        }
    }

    private void E() {
        if (this.ap != null && this.ap.contains("writefd://")) {
            closeOutputFile(Integer.parseInt(this.ap.substring("writefd://".length())));
            this.ap = null;
        }
    }

    public static int a() {
        return P;
    }

    public static void a(int i2, int i3, int i4) {
        P = i2;
        Q = i3;
        R = i4;
    }

    private void a(final int i2, final o oVar) {
        this.am++;
        this.an = true;
        this.j = false;
        final int i3 = this.am;
        b((f) new f() {
            public void a(ErrorCode errorCode) {
                if (NexEditor.this.an) {
                    NexEditor.this.an = false;
                    if (NexEditor.this.am == i3) {
                        NexEditor.this.ao = true;
                        int a2 = NexEditor.this.startPlay(i2);
                        if (a2 == 0) {
                            NexEditor.this.q.add(oVar);
                        } else {
                            oVar.a(ErrorCode.fromValue(a2));
                        }
                    }
                }
            }
        });
    }

    private void a(int i2, boolean z2, int i3, p pVar) {
        String str = "NexEditor.java";
        StringBuilder sb = new StringBuilder();
        sb.append("in seek(display=");
        sb.append(z2);
        sb.append(",");
        sb.append(i2);
        sb.append(",");
        sb.append(i3);
        sb.append(",");
        sb.append(pVar == 0 ? "null" : pVar);
        sb.append(") m_seekSerial=");
        sb.append(this.aE);
        sb.append(" seeking=");
        sb.append(this.ay);
        sb.append("; pendingSeek=");
        sb.append(this.az);
        sb.append("; pendingSeekLocation=");
        sb.append(this.aA);
        Log.d(str, sb.toString());
        if (pVar != 0) {
            pVar.a = i2;
            pVar.b = this.aE;
        }
        if (!this.ay) {
            this.j = true;
            f(true);
            int time = setTime(i2, z2, i3);
            if (time != 0) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("setTime ERROR RETURN: ");
                sb2.append(time);
                Log.d("NexEditor.java", sb2.toString());
                f(false);
                if (pVar != 0) {
                    pVar.a(ErrorCode.fromValue(time));
                }
                return;
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append("setTime SEEK STARTED: ");
            sb3.append(time);
            Log.d("NexEditor.java", sb3.toString());
            this.aA = i2;
            if (z2) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("seek_internal[display]: m_isPendingSeek=");
                sb4.append(this.az);
                sb4.append(" -> false");
                Log.d("NexEditor.java", sb4.toString());
                this.az = false;
            } else {
                this.aC = false;
            }
            this.aE++;
        } else if (z2) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("seek_internal: m_isPendingSeek=");
            sb5.append(this.az);
            sb5.append(" -> true, flag=");
            sb5.append(i3);
            Log.d("NexEditor.java", sb5.toString());
            this.az = true;
            this.aA = i2;
            this.aB = i3;
        } else {
            this.aC = true;
            this.aD = i2;
        }
        if (pVar != 0) {
            this.o.add(pVar);
            Log.d("NexEditor.java", "m_setTimeDoneListeners - Added listener");
            D();
        }
    }

    public static void a(String[] strArr) {
        setEncInfo(strArr);
    }

    private native int asyncLoadList(NexVisualClip[] nexVisualClipArr, NexAudioClip[] nexAudioClipArr, int i2);

    public static int b() {
        return Q;
    }

    /* access modifiers changed from: private */
    public int b(e eVar) {
        int captureCurrentFrame = captureCurrentFrame();
        if (captureCurrentFrame == 0) {
            this.v.add(eVar);
        }
        return captureCurrentFrame;
    }

    public static String b(String str) {
        try {
            return getSystemProperty(str);
        } catch (UnsatisfiedLinkError unused) {
            ae = true;
            return "";
        }
    }

    private void b(FastPreviewOption fastPreviewOption, int i2, boolean z2) {
        StringBuilder sb = new StringBuilder();
        sb.append(fastPreviewOption.name());
        sb.append("=");
        sb.append(i2);
        c(sb.toString(), z2 ? 1 : 0);
    }

    private void b(f fVar) {
        StringBuilder sb = new StringBuilder();
        sb.append("setTimeCancel m_isPendingSeek: ");
        sb.append(this.az);
        sb.append(" -> false");
        Log.d("NexEditor.java", sb.toString());
        this.az = false;
        this.aC = false;
        if (!this.ay) {
            fVar.a(ErrorCode.NONE);
            return;
        }
        if (fVar != null) {
            this.t.add(fVar);
        }
    }

    public static int c() {
        return R;
    }

    /* access modifiers changed from: private */
    public int c(String str, int i2) {
        if (this.I >= 2) {
            this.J = str;
            this.K = i2;
            return 0;
        }
        int fastOptionPreview = fastOptionPreview(str, i2);
        if (fastOptionPreview == 0) {
            this.I++;
        }
        return fastOptionPreview;
    }

    public static void c(String str) {
        setPacakgeName4Protection(str);
    }

    public static void c(boolean z2) {
        O = z2;
    }

    private native int captureCurrentFrame();

    private native int clearRenderItems(int i2);

    private native int clearScreen(int i2);

    private native int closeInputFile(int i2, int i3);

    private native void closeOutputFile(int i2);

    private native int createEditor(String str, String str2, int i2, int i3, int[] iArr);

    private native int createRenderItem(String str, int i2);

    private native int deleteClipID(int i2);

    private native int destroyEditor();

    private native int drawRenderItemOverlay(int i2, String str, int i3, int i4, int i5, int i6, float[] fArr, float f2, float f3, float f4, float f5, float f6);

    private native int encodeProject(String str, int i2, int i3, int i4, long j2, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14);

    private native int encodeProjectJpeg(Surface surface, String str, int i2, int i3, int i4, int i5);

    private void f(boolean z2) {
        if (z2 != this.ay) {
            this.ay = z2;
            if (this.f != null) {
                this.f.a(this.ay);
            }
        }
    }

    private native int fastOptionPreview(String str, int i2);

    private native int getAudioSessionID();

    private native int getClipAudioThumb(String str, String str2, int i2);

    private native int getClipInfoSync(String str, NexClipInfo nexClipInfo, int i2, int i3);

    private native int getClipStopThumb(int i2);

    private native int getClipVideoThumb(String str, String str2, int i2, int i3, int i4, int i5, int i6, int i7, int i8);

    private native int getClipVideoThumbWithTimeTable(String str, String str2, int i2, int i3, int i4, int[] iArr, int i5, int i6);

    private native int getNativeSDKInfoWM();

    private static native String getSystemProperty(String str);

    private native int getTexNameForClipID(int i2, int i3);

    private native int getTexNameForMask(int i2);

    private native byte[] getTimeThumbData(int i2);

    private native int highlightStart(String str, int i2, int i3, int i4, int i5, String str2, int i6, int i7, int i8, long j2, int i9, int i10, int i11);

    private native int highlightStop();

    private native int initUserData();

    private native int loadList(NexVisualClip[] nexVisualClipArr, NexAudioClip[] nexAudioClipArr, int i2);

    private native int loadRenderItem(String str, String str2, int i2);

    private native int loadTheme(String str, String str2, int i2);

    /* access modifiers changed from: private */
    public native int prepareSurface(Surface surface);

    private native int pushLoadedBitmap(String str, int[] iArr, int i2, int i3, int i4);

    private native int releaseLUTTexture(int i2);

    private native int releaseRenderItem(int i2, int i3);

    private native int removeBitmap(String str);

    private native int resetFaceDetectInfo(int i2);

    private native int set360VideoTrackPosition(int i2, int i3, int i4);

    private static native void setEncInfo(String[] strArr);

    private native int setEventHandler(NexEditorEventListener nexEditorEventListener);

    /* access modifiers changed from: private */
    public native int setGIFMode(int i2);

    private native int setInputFile(FileDescriptor fileDescriptor, int i2, long j2, long j3);

    private static native void setPacakgeName4Protection(String str);

    private native int setPreviewScaleFactor(float f2);

    private native int setRenderToDefault(int i2);

    private native int setRenderToMask(int i2);

    private native int setThumbnailRoutine(int i2);

    private native int setTime(int i2, int i3, int i4);

    private native int setVideoTrackUUID(int i2, byte[] bArr);

    /* access modifiers changed from: private */
    public native int startPlay(int i2);

    private native int stopPlay(int i2);

    private native int transcodingStart(String str, String str2, int i2, int i3, int i4, int i5, int i6, long j2, int i7, int i8, String str3);

    private native int transcodingStop();

    private native int updateRenderInfo(int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14, int i15);

    public boolean A() {
        set360VideoTrackPosition(0, 0, 0);
        return true;
    }

    public synchronized int a(int i2, int i3, Rect rect, Rect rect2, Rect rect3) {
        int updateRenderInfo;
        Rect rect4 = rect;
        Rect rect5 = rect2;
        Rect rect6 = rect3;
        synchronized (this) {
            updateRenderInfo = updateRenderInfo(i2, rect4.left, rect4.top, rect4.right, rect4.bottom, rect5.left, rect5.top, rect5.right, rect5.bottom, i3, rect6.left, rect6.top, rect6.right, rect6.bottom);
        }
        return updateRenderInfo;
    }

    public int a(int i2, g gVar) {
        if (gVar == null) {
            gVar = new g() {
                public void a() {
                }

                public void a(ErrorCode errorCode) {
                }
            };
        }
        int deleteClipID = deleteClipID(i2);
        if (deleteClipID == 0) {
            this.m.add(gVar);
        }
        return deleteClipID;
    }

    public int a(int i2, String str, int i3, int i4, int i5, int i6, float[] fArr, float f2, float f3, float f4, float f5, float f6) {
        return drawRenderItemOverlay(i2, str, i3, i4, i5, i6, fArr, f2, f3, f4, f5, f6);
    }

    public int a(String str) {
        return removeBitmap(str);
    }

    public int a(String str, int i2) {
        return createRenderItem(str, i2);
    }

    public int a(String str, int i2, int i3, int i4, int i5, int i6, int i7) {
        return highlightStart(str, i2, i3, i4, 0, "dummy", 0, 0, 0, Long.MAX_VALUE, i5, i6, i7);
    }

    public int a(String str, int[] iArr, int i2, int i3, int i4) {
        return pushLoadedBitmap(str, iArr, i2, i3, i4);
    }

    public int a(NexVisualClip[] nexVisualClipArr, NexAudioClip[] nexAudioClipArr, int i2) {
        int i3;
        if (nexVisualClipArr != null) {
            i3 = 0;
            for (NexVisualClip nexVisualClip : nexVisualClipArr) {
                if (nexVisualClip != null && nexVisualClip.mClipID > i3) {
                    i3 = nexVisualClip.mClipID;
                }
            }
        } else {
            i3 = 0;
        }
        if (nexAudioClipArr != null) {
            for (NexAudioClip nexAudioClip : nexAudioClipArr) {
                if (nexAudioClip != null && nexAudioClip.mClipID > i3) {
                    i3 = nexAudioClip.mClipID;
                }
            }
        }
        this.a = i3 + 1;
        return loadList(nexVisualClipArr, nexAudioClipArr, i2);
    }

    public Task a(Context context) {
        Log.d("NexEditor.java", "detectAndSetEditorColorFormat");
        if (this.V == null) {
            this.V = new Task();
            if (NexEditorDeviceProfile.getDeviceProfile().getNeedsColorFormatCheck()) {
                ColorFormatChecker.a(context).onResultAvailable(new OnResultAvailableListener<ColorFormat>() {
                    /* renamed from: a */
                    public void onResultAvailable(ResultTask<ColorFormat> resultTask, Event event, ColorFormat colorFormat) {
                        NexEditor.this.H = colorFormat;
                        if (colorFormat != ColorFormat.UNKNOWN) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Setting color format: ");
                            sb.append(colorFormat.name());
                            Log.d("NexEditor.java", sb.toString());
                            NexEditor.this.setProperty("setExportColorFormat", colorFormat.name());
                            NexEditor.this.V.signalEvent(Event.COMPLETE);
                            return;
                        }
                        NexEditor.this.V.signalEvent(Event.FAIL);
                    }
                }).onFailure((OnFailListener) new OnFailListener() {
                    public void onFail(Task task, Event event, TaskError taskError) {
                        NexEditor.this.V.sendFailure(taskError);
                    }
                });
            } else {
                Log.d("NexEditor.java", "Skip checking color format (not needed)");
                this.V.signalEvent(Event.COMPLETE);
            }
        }
        return this.V;
    }

    public Task a(String str, int i2, int i3, int i4, long j2, int i5, boolean z2, int i6, int i7) {
        Task task = new Task();
        if (this.aq != null) {
            task.sendFailure(ErrorCode.ALREADY_EXPORTING);
            return task;
        }
        int i8 = i5;
        this.ar = i8;
        Task task2 = task;
        int encodeProject = encodeProject(str, i2, i3, i4, j2, z2 ? i8 : 0, 3000, 1920, 1080, i6, nexEngine.ExportHEVCHighTierLevel51, 0, 0, nexEngine.ExportCodec_AVC, i7);
        if (encodeProject != 0) {
            Task task3 = task2;
            task3.sendFailure(ErrorCode.fromValue(encodeProject));
            return task3;
        }
        Task task4 = task2;
        this.ap = null;
        this.aq = task4;
        return this.aq;
    }

    public Task a(String str, int i2, int i3, int i4, long j2, int i5, boolean z2, int i6, int i7, int i8, int i9, int i10, int i11) {
        Task task = new Task();
        if (this.aq != null) {
            task.sendFailure(ErrorCode.ALREADY_EXPORTING);
            return task;
        }
        int i12 = i5;
        this.ar = i12;
        Task task2 = task;
        int encodeProject = encodeProject(str, i2, i3, i4, j2, z2 ? i12 : 0, i9, 1920, 1080, i6, nexEngine.ExportHEVCHighTierLevel51, i7, i8, i10, i11);
        if (encodeProject != 0) {
            Task task3 = task2;
            task3.sendFailure(ErrorCode.fromValue(encodeProject));
            return task3;
        }
        Task task4 = task2;
        this.ap = null;
        this.aq = task4;
        return this.aq;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0017, code lost:
        if (r10 != null) goto L_0x0025;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0019, code lost:
        android.util.Log.d("NexEditor.java", "exportImageFormat ExportImageCollback is null ");
        r4.aj = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0024, code lost:
        return com.nexstreaming.kminternal.nexvideoeditor.NexEditor.ErrorCode.INVALID_STATE;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0025, code lost:
        r4.aw = r10;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0029, code lost:
        if (r4.ak != false) goto L_0x003b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x002d, code lost:
        if (r4.az != false) goto L_0x0037;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0031, code lost:
        if (r4.ay == false) goto L_0x0034;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0034, code lost:
        r10 = r4.A;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0037, code lost:
        r10 = r4.aA;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0039, code lost:
        r4.al = r10;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x003b, code lost:
        r2 = new java.lang.StringBuilder();
        r2.append("  exportImageFormat mCaptureOriginalTime=");
        r2.append(r4.al);
        android.util.Log.d("NexEditor.java", r2.toString());
        r4.au.poll();
        r4.au.poll();
        r4.au.poll();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0064, code lost:
        if (r4.as != null) goto L_0x006d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0066, code lost:
        r4.as = android.media.ImageReader.newInstance(r5, r6, 1, 2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x006d, code lost:
        r5 = new android.os.HandlerThread("exportImageFormat");
        r5.start();
        r6 = new android.os.Handler(r5.getLooper());
        android.util.Log.d("NexEditor.java", "  exportImageFormat 1");
        r4.as.setOnImageAvailableListener(new com.nexstreaming.kminternal.nexvideoeditor.NexEditor.AnonymousClass6(r4), r6);
        android.util.Log.d("NexEditor.java", "  exportImageFormat 2");
        new com.nexstreaming.kminternal.nexvideoeditor.NexEditor.AnonymousClass7(r4).executeOnExecutor(at, new java.lang.Void[0]);
        android.util.Log.d("NexEditor.java", "  exportImageFormat 3");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x00ad, code lost:
        return com.nexstreaming.kminternal.nexvideoeditor.NexEditor.ErrorCode.NONE;
     */
    public ErrorCode a(int i2, int i3, final int i4, final int i5, final int i6, v vVar) {
        synchronized (this.ax) {
            if (this.aj) {
                Log.d("NexEditor.java", "exportImageFormat already exporting");
                ErrorCode errorCode = ErrorCode.INVALID_STATE;
                return errorCode;
            }
            this.aj = true;
        }
    }

    public ErrorCode a(int i2, int i3, int i4, final e eVar) {
        if (this.aj) {
            return ErrorCode.INVALID_STATE;
        }
        this.aj = true;
        if (!this.ak) {
            this.al = (this.az || this.ay) ? this.aA : this.A;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("image Capture mCaptureOriginalTime=");
        sb.append(this.al);
        Log.d("NexEditor.java", sb.toString());
        AnonymousClass4 r1 = new e() {
            public void a(Bitmap bitmap) {
                StringBuilder sb = new StringBuilder();
                sb.append("image Capture onCapture=");
                sb.append(bitmap);
                Log.d("NexEditor.java", sb.toString());
                a(ErrorCode.NONE, bitmap);
            }

            public void a(ErrorCode errorCode) {
                StringBuilder sb = new StringBuilder();
                sb.append("image Capture onCaptureFail=");
                sb.append(errorCode.name());
                Log.d("NexEditor.java", sb.toString());
                NexEditor.this.prepareSurface(NexEditor.this.L);
                if (NexEditor.this.as != null) {
                    NexEditor.this.as.close();
                    NexEditor.this.as = null;
                }
                a(errorCode, null);
            }

            /* access modifiers changed from: 0000 */
            public void a(ErrorCode errorCode, Bitmap bitmap) {
                if (NexEditor.this.as != null) {
                    NexEditor.this.as.close();
                    NexEditor.this.as = null;
                }
                NexEditor.this.ak = true;
                if (bitmap == null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("image Capture failed; error=");
                    sb.append(errorCode.getValue());
                    sb.append(" (");
                    sb.append(errorCode.name());
                    sb.append(")");
                    Log.e("NexEditor.java", sb.toString());
                    NexEditor.this.aj = false;
                    eVar.a(errorCode);
                } else {
                    Log.d("NexEditor.java", "image Capture success; notify listener");
                    NexEditor.this.aj = false;
                    eVar.a(bitmap);
                }
                NexEditor.this.ak = false;
            }
        };
        if (this.as == null) {
            Log.d("NexEditor", "image Capture create ImageReader");
            this.as = ImageReader.newInstance(i2, i3, 1, 2);
        }
        this.as.setOnImageAvailableListener(new OnImageAvailableListener() {
            /* JADX WARNING: Code restructure failed: missing block: B:19:0x0094, code lost:
                if (r1 != null) goto L_0x0096;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:20:0x0096, code lost:
                r1.close();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:21:0x0099, code lost:
                r11.close();
                com.nexstreaming.kminternal.nexvideoeditor.NexEditor.a(r10.a, (android.media.ImageReader) null);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:28:0x00d8, code lost:
                if (r1 != null) goto L_0x0096;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:29:0x00db, code lost:
                return;
             */
            /* JADX WARNING: Removed duplicated region for block: B:32:0x00df  */
            public void onImageAvailable(ImageReader imageReader) {
                Image image;
                Log.d("NexEditor", "image Capture setOnImageAvailableListener jpeg == ");
                try {
                    image = imageReader.acquireLatestImage();
                    if (image != null) {
                        try {
                            Plane[] planes = image.getPlanes();
                            int i = 0;
                            if (planes[0].getBuffer() == null) {
                                NexEditor.this.e(ErrorCode.UNKNOWN);
                                if (image != null) {
                                    image.close();
                                }
                                imageReader.close();
                                NexEditor.this.as = null;
                                return;
                            }
                            int width = image.getWidth();
                            int height = image.getHeight();
                            int rowStride = planes[0].getRowStride();
                            int i2 = width * 4;
                            byte[] bArr = new byte[(width * height * 4)];
                            ByteBuffer buffer = planes[0].getBuffer();
                            while (i < height) {
                                buffer.get(bArr, width * i * 4, i2);
                                i++;
                                buffer.position(rowStride * i);
                            }
                            StringBuilder sb = new StringBuilder();
                            sb.append("image Capture prepareSurface = ");
                            sb.append(NexEditor.this.L);
                            Log.d("NexEditor", sb.toString());
                            NexEditor.this.prepareSurface(NexEditor.this.L);
                            NexEditor.this.a(width, height, bArr.length, bArr, false);
                            image.close();
                            image = null;
                        } catch (Exception e) {
                            e = e;
                            try {
                                e.printStackTrace();
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("image Capture prepareSurface(exception) = ");
                                sb2.append(NexEditor.this.L);
                                Log.d("NexEditor", sb2.toString());
                                NexEditor.this.prepareSurface(NexEditor.this.L);
                                NexEditor.this.e(ErrorCode.UNKNOWN);
                            } catch (Throwable th) {
                                th = th;
                                if (image != null) {
                                }
                                imageReader.close();
                                NexEditor.this.as = null;
                                throw th;
                            }
                        }
                    }
                } catch (Exception e2) {
                    e = e2;
                    image = null;
                    e.printStackTrace();
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("image Capture prepareSurface(exception) = ");
                    sb22.append(NexEditor.this.L);
                    Log.d("NexEditor", sb22.toString());
                    NexEditor.this.prepareSurface(NexEditor.this.L);
                    NexEditor.this.e(ErrorCode.UNKNOWN);
                } catch (Throwable th2) {
                    th = th2;
                    image = null;
                    if (image != null) {
                        image.close();
                    }
                    imageReader.close();
                    NexEditor.this.as = null;
                    throw th;
                }
            }
        }, null);
        if (encodeProjectJpeg(this.as.getSurface(), " ", i2, i3, 0, i4) == 0) {
            this.v.add(r1);
        }
        return ErrorCode.NONE;
    }

    public ErrorCode a(final int i2, final e eVar) {
        if (i2 == 2147418113) {
            String str = "NexEditor.java";
            StringBuilder sb = new StringBuilder();
            sb.append("Capture request : captureTime=CAPTURE_CURRENT t=");
            sb.append(this.A);
            sb.append(" ");
            sb.append(this.aj ? "in-progress " : "ok ");
            sb.append(this.ak ? "completing " : "new ");
            Log.d(str, sb.toString());
            i2 = (this.az || this.ay) ? this.aA : this.A;
        } else if (i2 == 2147418114) {
            String str2 = "NexEditor.java";
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Capture request : captureTime=CAPTURE_CURRENT_NOFX ");
            sb2.append(this.aj ? "in-progress " : "ok ");
            sb2.append(this.ak ? "completing " : "new ");
            Log.d(str2, sb2.toString());
        } else {
            String str3 = "NexEditor.java";
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Capture request : captureTime=");
            sb3.append(i2);
            sb3.append(" ");
            sb3.append(this.aj ? "in-progress " : "ok ");
            sb3.append(this.ak ? "completing " : "new ");
            Log.d(str3, sb3.toString());
        }
        if (this.aj) {
            return ErrorCode.INVALID_STATE;
        }
        this.aj = true;
        if (!this.ak) {
            this.al = (this.az || this.ay) ? this.aA : this.A;
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append("  Capture mCaptureOriginalTime=");
        sb4.append(this.al);
        Log.d("NexEditor.java", sb4.toString());
        final AnonymousClass14 r2 = new e() {
            public void a(Bitmap bitmap) {
                StringBuilder sb = new StringBuilder();
                sb.append("  Capture onCapture=");
                sb.append(bitmap);
                Log.d("NexEditor.java", sb.toString());
                a(ErrorCode.NONE, bitmap);
            }

            public void a(ErrorCode errorCode) {
                StringBuilder sb = new StringBuilder();
                sb.append("  Capture onCaptureFail=");
                sb.append(errorCode.name());
                Log.d("NexEditor.java", sb.toString());
                a(errorCode, null);
            }

            /* access modifiers changed from: 0000 */
            public void a(ErrorCode errorCode, Bitmap bitmap) {
                NexEditor.this.ak = true;
                if (bitmap == null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("  Capture failed; error=");
                    sb.append(errorCode.getValue());
                    sb.append(" (");
                    sb.append(errorCode.name());
                    sb.append(")");
                    Log.e("NexEditor.java", sb.toString());
                    NexEditor.this.aj = false;
                    eVar.a(errorCode);
                } else {
                    Log.d("NexEditor.java", "  Capture success; notify listener");
                    NexEditor.this.aj = false;
                    eVar.a(bitmap);
                }
                NexEditor.this.ak = false;
                if (!NexEditor.this.aj) {
                    NexEditor.this.aj = true;
                    Log.d("NexEditor.java", "  Capture done; seek to original location");
                    NexEditor.this.a(NexEditor.this.al, false, (p) new p() {
                        public String a() {
                            return "seekToOriginalTimeAfterCapture";
                        }

                        public void a(int i, int i2) {
                            NexEditor.this.aj = false;
                        }

                        public void a(ErrorCode errorCode) {
                            NexEditor.this.aj = false;
                        }
                    });
                    return;
                }
                Log.d("NexEditor.java", "  Capture done; SKIP SEEK");
            }
        };
        if (i2 == 2147418114) {
            Log.d("NexEditor.java", "  Capture CAPTURE_CURRENT_NOFX fastPreview");
            b(FastPreviewOption.nofx, 1, false);
            Log.d("NexEditor.java", "  Capture CAPTURE_CURRENT_NOFX captureCurrentFrame");
            b((e) r2);
            Log.d("NexEditor.java", "  Capture CAPTURE_CURRENT_NOFX out");
        } else {
            a(i2, false, (p) new p() {
                public String a() {
                    StringBuilder sb = new StringBuilder();
                    sb.append("CAPTURE(");
                    sb.append(i2);
                    sb.append(")");
                    return sb.toString();
                }

                public void a(int i, int i2) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("  Capture onSetTimeDone=");
                    sb.append(i);
                    Log.d("NexEditor.java", sb.toString());
                    NexEditor.this.b(r2);
                }

                public void a(ErrorCode errorCode) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("  Capture onSetTimeFail=");
                    sb.append(errorCode.name());
                    Log.d("NexEditor.java", sb.toString());
                    NexEditor.this.aj = false;
                    eVar.a(errorCode);
                }
            });
        }
        return ErrorCode.NONE;
    }

    public ErrorCode a(e eVar) {
        return a(2147418113, eVar);
    }

    public ErrorCode a(String str, NexClipInfo nexClipInfo, int i2, int i3) {
        return ErrorCode.fromValue(getClipInfoSync(str, nexClipInfo, i2, i3));
    }

    public ErrorCode a(String str, NexClipInfo nexClipInfo, boolean z2, int i2) {
        return ErrorCode.fromValue(getClipInfoSync(str, nexClipInfo, z2 ? 1 : 0, i2));
    }

    public ErrorCode a(String str, File file, int i2) {
        return ErrorCode.fromValue(getClipAudioThumb(str, file.getAbsolutePath(), i2));
    }

    public ErrorCode a(String str, File file, int i2, int i3, int i4, int i5, int i6, int i7, int i8) throws IOException {
        return ErrorCode.fromValue(getClipVideoThumb(str, file.getAbsolutePath(), i2, i3, i4, i5, i6, i7, i8));
    }

    public ErrorCode a(String str, File file, int i2, int i3, int i4, int[] iArr, int i5, int i6) throws IOException {
        return ErrorCode.fromValue(getClipVideoThumbWithTimeTable(str, file.getAbsolutePath(), i2, i3, i4, iArr, i5, i6));
    }

    public ErrorCode a(String str, String str2, int i2, int i3, int i4, int i5, int i6, long j2, int i7, int i8, String str3) {
        if (this.af) {
            return ErrorCode.TRANSCODING_BUSY;
        }
        ErrorCode fromValue = ErrorCode.fromValue(transcodingStart(str, str2, i2, i3, i4, i5, i6, j2, i7, i8, str3));
        if (!fromValue.isError()) {
            this.af = true;
        }
        return fromValue;
    }

    public void a(int i2) {
        this.N = i2;
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int i3) {
        if (this.u.size() >= 1 && this.n.size() >= 1 && ((Integer) this.u.peek()).intValue() == i3) {
            this.u.remove();
            n nVar = (n) this.n.remove();
            if (i2 == 0) {
                nVar.a(i3);
            } else {
                nVar.a(ErrorCode.fromValue(i2));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int i3, int i4, int i5) {
        if (i5 == 1 || i5 == 4 || i5 == 0) {
            if (this.l == null || this.l.size() < 1) {
                Log.d("NexEditor.java", "Ignore onAddClipDone event -- no listeners");
                return;
            }
            for (d dVar : this.l) {
                if (dVar.a == i4) {
                    this.l.remove(dVar);
                    if (i2 == 0) {
                        dVar.a(i4, i3, i5);
                    } else {
                        dVar.a(ErrorCode.fromValue(i2));
                    }
                    return;
                }
            }
        }
        if (i5 == 3 || i5 == 0) {
            if (this.k == null || this.k.size() < 1) {
                Log.d("NexEditor.java", "Ignore onAddClipDone event -- no listeners");
                return;
            }
            for (d dVar2 : this.k) {
                if (dVar2.a == i4) {
                    this.k.remove(dVar2);
                    if (i2 == 0) {
                        dVar2.a(i4, i3, i5);
                    } else {
                        dVar2.a(ErrorCode.fromValue(i2));
                    }
                    return;
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int i3, int i4, int i5, int i6, byte[] bArr, int i7, int i8, int i9) {
        if (this.ab != null) {
            this.ab.a(i2, i3, i4, i5, i6, bArr, i7, i8, i9);
        }
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int i3, int i4, byte[] bArr, boolean z2) {
        if (this.v.size() >= 1) {
            if (i2 < 1 || i3 < 1 || i4 < 1 || bArr == null) {
                e(ErrorCode.CAPTURE_FAILED);
            }
            try {
                e eVar = (e) this.v.remove();
                if (z2) {
                    int i5 = i2 * 4;
                    byte[] bArr2 = new byte[i5];
                    for (int i6 = 0; i6 < i3 / 2; i6++) {
                        int i7 = i2 * i6 * 4;
                        System.arraycopy(bArr, i7, bArr2, 0, i5);
                        int i8 = ((i3 - 1) - i6) * i2 * 4;
                        System.arraycopy(bArr, i8, bArr, i7, i5);
                        System.arraycopy(bArr2, 0, bArr, i8, i5);
                    }
                }
                Bitmap createBitmap = Bitmap.createBitmap(i2, i3, Config.ARGB_8888);
                createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
                eVar.a(createBitmap);
            } catch (NoSuchElementException e2) {
                e2.printStackTrace();
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int i3, ErrorCode errorCode) {
        this.A = i2;
        this.B = i3;
        StringBuilder sb = new StringBuilder();
        sb.append("in onSetTimeDone(");
        sb.append(i2);
        sb.append(",");
        sb.append(i3);
        sb.append(") ");
        sb.append(B());
        sb.append(" ");
        sb.append(C());
        Log.d("NexEditor.java", sb.toString());
        LinkedList<p> linkedList = new LinkedList<>();
        for (p pVar : this.o) {
            if (pVar.b < this.aE) {
                linkedList.add(pVar);
            }
        }
        for (p pVar2 : linkedList) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("  - START notify listener : ");
            sb2.append(pVar2);
            sb2.append(pVar2.a());
            sb2.append(pVar2);
            Log.d("NexEditor.java", sb2.toString());
            if (errorCode == ErrorCode.NONE) {
                pVar2.a(i2, i3);
            } else {
                pVar2.a(errorCode);
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append("  - DONE notify listener : ");
            sb3.append(pVar2.a());
            sb3.append(" ");
            sb3.append(pVar2);
            Log.d("NexEditor.java", sb3.toString());
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append("(removing ");
        sb4.append(linkedList.size());
        sb4.append(" listeners)");
        Log.d("NexEditor.java", sb4.toString());
        this.o.removeAll(linkedList);
        D();
        f(false);
        Log.d("NexEditor.java", "(seek state set to FALSE)");
        if (this.t.size() > 0) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("onSetTimeDone [m_onSetTimeCancelListeners>0]: m_isPendingSeek=");
            sb5.append(this.az);
            sb5.append(" -> false");
            Log.d("NexEditor.java", sb5.toString());
            this.az = false;
            this.aC = false;
            while (this.t.size() > 0) {
                ((f) this.t.remove()).a(ErrorCode.NONE);
            }
        }
        if (this.aC) {
            StringBuilder sb6 = new StringBuilder();
            sb6.append("execute pending non-display seek : ");
            sb6.append(this.aD);
            Log.d("NexEditor.java", sb6.toString());
            this.aC = false;
            a(this.aD, false, 0, (p) null);
        } else if (this.az) {
            StringBuilder sb7 = new StringBuilder();
            sb7.append("execute pending seek : ");
            sb7.append(this.aA);
            sb7.append(", m_pendingSeekIDR=");
            sb7.append(this.aB);
            Log.d("NexEditor.java", sb7.toString());
            this.az = false;
            if (this.aB == 0) {
                j(this.aA);
            } else if (this.aB == 1) {
                d(this.aA, (p) null);
            } else if (this.aB == 4) {
                b(this.aA, (p) null);
            } else {
                e(this.aA, (p) null);
            }
        }
        StringBuilder sb8 = new StringBuilder();
        sb8.append("out onSetTimeDone(");
        sb8.append(i2);
        sb8.append(",");
        sb8.append(i3);
        sb8.append(") ");
        sb8.append(B());
        sb8.append(" ");
        sb8.append(this.o.size());
        Log.d("NexEditor.java", sb8.toString());
    }

    public void a(int i2, f fVar) {
        if (this.an) {
            for (f a2 : this.t) {
                a2.a(ErrorCode.PLAY_SUPERCEEDED);
            }
            this.t.clear();
        }
        this.an = false;
        this.ao = false;
        if (this.b || this.aq != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("stop flags(");
            sb.append(i2);
            sb.append(") : ");
            sb.append(fVar.toString());
            Log.d("NexEditor.java", sb.toString());
            this.r.clear();
            this.p.add(fVar);
            int stopPlay = stopPlay(i2);
            if (this.aq != null) {
                this.aq.signalEvent(Event.CANCEL);
                this.aq = null;
            }
            if (stopPlay != 0) {
                this.p.remove(fVar);
                fVar.a(ErrorCode.fromValue(stopPlay));
            }
            return;
        }
        stopPlay(i2);
        fVar.a(ErrorCode.NONE);
    }

    public void a(final int i2, final p pVar) {
        b((f) new f() {
            public void a(ErrorCode errorCode) {
                NexEditor.this.b(i2, pVar);
            }
        });
    }

    public void a(int i2, boolean z2, p pVar) {
        a(i2, z2, 0, pVar);
    }

    public void a(int i2, byte[] bArr) {
        setVideoTrackUUID(i2, bArr);
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int[] iArr) {
        if (this.ac != null) {
            this.ac.a(i2, iArr);
        }
    }

    /* access modifiers changed from: protected */
    public void a(int i2, int[] iArr, int[] iArr2) {
        if (this.ad != null) {
            this.ad.a(i2, iArr, iArr2);
        }
    }

    public void a(Surface surface) {
        this.L = surface;
        if (this.aj) {
            Log.d("NexEditor.java", "prepareSurface wait. image exporting...");
            return;
        }
        if (!this.ai) {
            if (O) {
                prepareSurface(null);
            }
            if (surface != null) {
                setPreviewScaleFactor(this.aH);
            }
            prepareSurface(surface);
        }
    }

    /* access modifiers changed from: protected */
    public void a(ErrorCode errorCode) {
        if (errorCode.isError()) {
            StringBuilder sb = new StringBuilder();
            sb.append("onFastOptionPreviewDone:");
            sb.append(errorCode.getMessage());
            Log.d("NexEditor.java", sb.toString());
        }
        this.I--;
        if (this.J == null || this.I >= 2) {
            if (this.I < 1 && this.aa != null) {
                this.aa.signalEvent(Event.SUCCESS, Event.COMPLETE);
                this.aa = null;
            }
        } else if (this.ay) {
            Log.d("NexEditor.java", "onFastOptionPreviewDone: stat is seeking");
            this.J = null;
        } else {
            int fastOptionPreview = fastOptionPreview(this.J, this.K);
            this.J = null;
            if (fastOptionPreview == 0) {
                this.I++;
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onFastOptionPreviewDone: pending result=");
                sb2.append(fastOptionPreview);
                Log.d("NexEditor.java", sb2.toString());
            }
        }
    }

    /* access modifiers changed from: protected */
    public void a(ErrorCode errorCode, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("-  onTranscodingDone() result : ");
        sb.append(errorCode);
        sb.append(" mTranscoding =");
        sb.append(this.af);
        Log.d("NexEditor.java", sb.toString());
        if (this.af) {
            this.af = false;
            if (this.Z != null) {
                this.Z.a(errorCode, i2);
            }
        }
    }

    public void a(FastPreviewOption fastPreviewOption, int i2) {
        a(fastPreviewOption, i2, true);
    }

    public void a(FastPreviewOption fastPreviewOption, int i2, boolean z2) {
        if (!this.aj) {
            StringBuilder sb = new StringBuilder();
            sb.append(fastPreviewOption.name());
            sb.append("=");
            sb.append(i2);
            c(sb.toString(), z2 ? 1 : 0);
        }
    }

    public void a(c cVar) {
        if (this.d != null) {
            this.d.setCustomRenderCallback(cVar);
        }
    }

    public void a(f fVar) {
        a(2, fVar);
    }

    public void a(h hVar) {
        this.Y = hVar;
    }

    public void a(i iVar) {
        if (iVar == null) {
            this.w.clear();
        } else {
            this.w.add(iVar);
        }
    }

    public void a(j jVar) {
        this.aG = jVar;
    }

    public void a(k kVar) {
        this.ab = kVar;
    }

    public void a(l lVar) {
        this.ac = lVar;
    }

    public void a(m mVar) {
        this.X = mVar;
    }

    public void a(q qVar) {
        this.x = qVar;
    }

    public void a(s sVar) {
        this.ad = sVar;
    }

    public void a(NexThemeView nexThemeView) {
        if (this.e != nexThemeView) {
            Context context = null;
            if (this.e != null) {
                this.e.linkToEditor(null);
            }
            if (nexThemeView != null) {
                nexThemeView.linkToEditor(this);
            }
            this.e = nexThemeView;
            if (this.d != null) {
                NexEditorEventListener nexEditorEventListener = this.d;
                if (this.e != null) {
                    context = this.e.getContext();
                }
                nexEditorEventListener.setContext(context);
            }
        }
    }

    public void a(c cVar) {
        this.f = cVar;
        if (this.d != null) {
            this.d.setUIListener(this.f);
        }
    }

    public void a(String str, String str2, boolean z2) {
        loadRenderItem(str, str2, !z2 ? 1 : 0);
    }

    public void a(Thread thread) {
        this.T = thread;
    }

    public void a(boolean z2) {
        clearRenderItems(!z2 ? 1 : 0);
    }

    public boolean a(float f2) {
        if (f2 <= 0.0f || f2 > 1.0f) {
            return false;
        }
        this.aH = f2;
        return true;
    }

    public boolean a(String str, boolean z2) {
        String property = getProperty(str);
        if (property == null) {
            return z2;
        }
        if (property.trim().equalsIgnoreCase("true")) {
            return true;
        }
        if (property.trim().equalsIgnoreCase("false")) {
            return false;
        }
        return z2;
    }

    public int[] a(byte[] bArr, int i2, int i3) {
        return createLGLUT(bArr);
    }

    public native int addUDTA(int i2, String str);

    public native int asyncDrawInfoList(NexDrawInfo[] nexDrawInfoArr, NexDrawInfo[] nexDrawInfoArr2);

    public int b(int i2) {
        return resetFaceDetectInfo(i2);
    }

    public int b(int i2, int i3) {
        return getTexNameForClipID(i2, i3);
    }

    public int b(String str, int i2) {
        String property = getProperty(str);
        if (property == null) {
            return i2;
        }
        try {
            return Integer.parseInt(property);
        } catch (NumberFormatException unused) {
            return i2;
        }
    }

    public int b(NexVisualClip[] nexVisualClipArr, NexAudioClip[] nexAudioClipArr, int i2) {
        int i3;
        if (nexVisualClipArr != null) {
            i3 = 0;
            for (NexVisualClip nexVisualClip : nexVisualClipArr) {
                if (nexVisualClip != null && nexVisualClip.mClipID > i3) {
                    i3 = nexVisualClip.mClipID;
                }
            }
        } else {
            i3 = 0;
        }
        if (nexAudioClipArr != null) {
            for (NexAudioClip nexAudioClip : nexAudioClipArr) {
                if (nexAudioClip != null && nexAudioClip.mClipID > i3) {
                    i3 = nexAudioClip.mClipID;
                }
            }
        }
        this.a = i3 + 1;
        return asyncLoadList(nexVisualClipArr, nexAudioClipArr, i2);
    }

    /* access modifiers changed from: protected */
    public void b(int i2, int i3, int i4) {
        if (this.Z != null) {
            this.Z.a(i2, i3, i4);
        }
    }

    public void b(int i2, p pVar) {
        a(i2, true, 4, pVar);
    }

    /* access modifiers changed from: protected */
    public void b(ErrorCode errorCode) {
        StringBuilder sb = new StringBuilder();
        sb.append("onPlay:");
        sb.append(errorCode);
        Log.d("NexEditor.java", sb.toString());
        this.b = true;
        if (this.q.size() >= 1) {
            o oVar = (o) this.q.remove();
            oVar.a(errorCode);
            if (errorCode == ErrorCode.NONE) {
                this.r.add(oVar);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void b(ErrorCode errorCode, int i2) {
        this.z = i2;
        StringBuilder sb = new StringBuilder();
        sb.append("REACHED MARKER ");
        sb.append(i2);
        Log.d("NexEditor.java", sb.toString());
        while (true) {
            f fVar = (f) this.s.peek();
            if (fVar == null) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("    - onCommandMarker(");
                sb2.append(errorCode);
                sb2.append(",");
                sb2.append(i2);
                sb2.append("): Skipping because listener is null");
                Log.d("NexEditor.java", sb2.toString());
                return;
            } else if (fVar.a > i2) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("    - onCommandMarker(");
                sb3.append(errorCode);
                sb3.append(",");
                sb3.append(i2);
                sb3.append("): Skipping because ");
                sb3.append(fVar.a);
                sb3.append(">");
                sb3.append(i2);
                Log.d("NexEditor.java", sb3.toString());
                return;
            } else {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("    - onCommandMarker(");
                sb4.append(errorCode);
                sb4.append(",");
                sb4.append(i2);
                sb4.append("): Notifying because ");
                sb4.append(fVar.a);
                sb4.append("<=");
                sb4.append(i2);
                Log.d("NexEditor.java", sb4.toString());
                ((f) this.s.remove()).a(errorCode);
            }
        }
    }

    public void b(String str, boolean z2) {
        loadTheme(String.format("", new Object[0]), str, !z2 ? 1 : 0);
    }

    public void b(boolean z2) {
        if (this.d != null) {
            this.d.setSyncMode(z2);
        }
    }

    public int[] b(byte[] bArr, int i2, int i3) {
        return createCubeLUT(bArr);
    }

    public int c(int i2, int i3) {
        return releaseRenderItem(i2, i3);
    }

    /* access modifiers changed from: protected */
    public void c(int i2) {
        if (this.ac != null) {
            this.ac.a(i2);
        }
    }

    public void c(int i2, p pVar) {
        a(i2, true, 0, pVar);
    }

    /* access modifiers changed from: protected */
    public void c(ErrorCode errorCode) {
        StringBuilder sb = new StringBuilder();
        sb.append("onStop : m_onStopListeners.size()=");
        sb.append(this.p.size());
        Log.d("NexEditor.java", sb.toString());
        this.b = false;
        if (this.aq != null && errorCode.isError()) {
            this.aq.sendFailure(errorCode);
            this.aq = null;
        }
        while (true) {
            f fVar = (f) this.p.poll();
            if (fVar != null) {
                fVar.a(errorCode);
            } else {
                return;
            }
        }
    }

    public void c(ErrorCode errorCode, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("onGetClipInfoDone onGetClipInfoDone=");
        sb.append(errorCode);
        sb.append(" tag=");
        sb.append(i2);
        Log.d("NexEditor.java", sb.toString());
        if (this.aG != null) {
            this.aG.a(errorCode, i2);
        }
    }

    public int[] c(byte[] bArr, int i2, int i3) {
        int i4 = i2;
        int i5 = i3;
        int i6 = i4 * i5;
        int[] iArr = new int[i6];
        int i7 = 0;
        int i8 = 0;
        while (i7 < i5) {
            int i9 = ((i7 >> 1) * i4) + i6;
            int i10 = 0;
            int i11 = 0;
            int i12 = i8;
            int i13 = 0;
            while (i13 < i4) {
                int i14 = (bArr[i12] & 255) - 16;
                if (i14 < 0) {
                    i14 = 0;
                }
                if ((i13 & 1) == 0) {
                    int i15 = i9 + 1;
                    int i16 = i15 + 1;
                    i10 = (bArr[i15] & 255) - 128;
                    int i17 = i16;
                    i11 = (bArr[i9] & 255) - 128;
                    i9 = i17;
                }
                int i18 = i14 * 1192;
                int i19 = (i10 * 1634) + i18;
                int i20 = (i18 - (i10 * 833)) - (i11 * 400);
                int i21 = i18 + (i11 * 2066);
                if (i19 < 0) {
                    i19 = 0;
                } else if (i19 > 262143) {
                    i19 = 262143;
                }
                if (i20 < 0) {
                    i20 = 0;
                } else if (i20 > 262143) {
                    i20 = 262143;
                }
                if (i21 < 0) {
                    i21 = 0;
                } else if (i21 > 262143) {
                    i21 = 262143;
                }
                iArr[i12] = ((i21 >> 10) & 255) | ((i19 << 6) & 16711680) | -16777216 | ((i20 >> 2) & 65280);
                i13++;
                i12++;
            }
            i7++;
            i8 = i12;
        }
        return iArr;
    }

    public native int checkDirectExport(int i2);

    public native int checkIDREnd();

    public native int checkIDRStart(String str);

    public native int checkIDRTime(int i2);

    public native int checkPFrameDirectExportSync(String str);

    public native int clearProject();

    public native int clearTrackCache();

    public native int clearUDTA();

    public native int closeProject();

    public native int[] createCubeLUT(byte[] bArr);

    public native int[] createLGLUT(byte[] bArr);

    public native int createProject();

    public int d() {
        return this.N;
    }

    public int d(boolean z2) {
        return getAudioSessionID();
    }

    /* access modifiers changed from: protected */
    public void d(int i2) {
        if (this.ad != null) {
            this.ad.a(i2);
        }
    }

    /* access modifiers changed from: protected */
    public void d(int i2, int i3) {
        a(i2, i3, ErrorCode.NONE);
    }

    public void d(int i2, p pVar) {
        a(i2, true, 1, pVar);
    }

    /* access modifiers changed from: protected */
    public void d(ErrorCode errorCode) {
        if (this.aq != null) {
            if (errorCode.isError()) {
                this.aq.sendFailure(errorCode);
            } else {
                this.aq.signalEvent(Event.SUCCESS, Event.COMPLETE);
            }
            this.aq = null;
            E();
        }
    }

    public native int directExport(String str, long j2, long j3, String str2, int i2);

    public void e() {
        if (this.T != null) {
            try {
                this.T.join();
            } catch (InterruptedException e2) {
                e2.printStackTrace();
            }
            this.T = null;
        }
    }

    public void e(int i2, p pVar) {
        a(i2, true, 2, pVar);
    }

    /* access modifiers changed from: protected */
    public void e(ErrorCode errorCode) {
        if (this.v.size() >= 1) {
            ((e) this.v.remove()).a(errorCode);
        }
    }

    public void e(boolean z2) {
        if (this.d != null) {
            this.d.setWatermark(z2);
        }
    }

    /* access modifiers changed from: protected */
    public boolean e(int i2) {
        if (this.w.size() < 1) {
            return false;
        }
        ((i) this.w.getFirst()).a(i2);
        return true;
    }

    public boolean e(int i2, int i3) {
        set360VideoTrackPosition(i2, i3, 1);
        return true;
    }

    public native int encodePause();

    public native int encodeResume();

    public int f() {
        return this.E;
    }

    /* access modifiers changed from: protected */
    public void f(int i2) {
        g gVar = (g) this.m.remove();
        if (i2 == 0) {
            gVar.a();
        } else {
            gVar.a(ErrorCode.fromValue(i2));
        }
    }

    /* access modifiers changed from: protected */
    public boolean f(ErrorCode errorCode) {
        if (this.w.size() < 1) {
            return false;
        }
        ((i) this.w.remove()).a(errorCode);
        this.aq = null;
        return true;
    }

    public native int fastPreviewStart(int i2, int i3, int i4, int i5);

    public native int fastPreviewStop();

    public native int fastPreviewTime(int i2);

    public int g() {
        return this.F;
    }

    public int g(int i2) {
        return getTexNameForMask(i2);
    }

    public native int getBrightness();

    public native int getContrast();

    public native int getDuration();

    public native String getProperty(String str);

    public native int getSaturation();

    public native int getSharpness();

    public native int getVignette();

    public native int getVignetteRange();

    public int h() {
        return this.G;
    }

    public int h(int i2) {
        return setRenderToMask(i2);
    }

    public int i(int i2) {
        return setRenderToDefault(i2);
    }

    public void i() {
        if (W == this) {
            Log.d("NexEditor.java", "destroy editor instance");
            m();
            destroyEditor();
        } else {
            Log.d("NexEditor.java", "skip destroying editor instance (not latest instance)");
        }
        if (this.S >= 0) {
            closeInputFile(1, this.S);
        }
        this.d = null;
        if (this.e != null) {
            this.e.linkToEditor(null);
            this.e = null;
        }
        if (this.ac != null) {
            this.ac = null;
        }
    }

    public d j() {
        if (this.U == null) {
            this.U = new d(this);
        }
        return this.U;
    }

    public void j(int i2) {
        c(i2, (p) null);
    }

    public NexThemeView k() {
        return this.e;
    }

    /* access modifiers changed from: protected */
    public void k(int i2) {
        if (this.aq != null) {
            this.aq.setProgress(Math.min(this.ar, i2), this.ar);
        }
        this.A = i2;
    }

    public ErrorCode l(int i2) {
        return ErrorCode.fromValue(getClipStopThumb(i2));
    }

    /* access modifiers changed from: protected */
    public void l() {
        if (this.X != null) {
            this.X.a();
        }
    }

    public int m(int i2) {
        return releaseLUTTexture(i2);
    }

    /* access modifiers changed from: protected */
    public void m() {
        if (this.Y != null) {
            this.Y.a();
        }
    }

    public Bitmap n(int i2) {
        byte[] timeThumbData = getTimeThumbData(i2);
        if (timeThumbData == null || timeThumbData.length == 0) {
            return null;
        }
        return Bitmap.createBitmap(c(timeThumbData, 320, 240), 320, 240, Config.ARGB_8888);
    }

    /* access modifiers changed from: protected */
    public void n() {
        this.ao = false;
        if (this.r.size() >= 1) {
            ((o) this.r.remove()).a();
        }
    }

    public int o(int i2) {
        return setThumbnailRoutine(i2);
    }

    /* access modifiers changed from: protected */
    public boolean o() {
        if (this.w.size() < 1) {
            return false;
        }
        ((i) this.w.remove()).a();
        this.aq = null;
        return true;
    }

    public ErrorCode p() {
        if (!this.af) {
            return ErrorCode.NO_ACTION;
        }
        ErrorCode fromValue = ErrorCode.fromValue(transcodingStop());
        fromValue.isError();
        return fromValue;
    }

    public b q() {
        return new b() {
            private Map<FastPreviewOption, Integer> b = new EnumMap(FastPreviewOption.class);

            private void b(boolean z) {
                StringBuilder sb = new StringBuilder();
                for (Entry entry : this.b.entrySet()) {
                    if (sb.length() > 0) {
                        sb.append(' ');
                    }
                    sb.append(((FastPreviewOption) entry.getKey()).name());
                    sb.append('=');
                    sb.append(entry.getValue());
                }
                NexEditor.this.c(sb.toString(), z ? 1 : 0);
            }

            public b a(int i) {
                return a(FastPreviewOption.cts, i);
            }

            public b a(int i, int i2) {
                return a(FastPreviewOption.video360flag, 1).a(FastPreviewOption.video360_horizontal, i).a(FastPreviewOption.video360_vertical, i2);
            }

            public b a(Rect rect) {
                return a(FastPreviewOption.left, rect.left).a(FastPreviewOption.top, rect.bottom).a(FastPreviewOption.right, rect.right).a(FastPreviewOption.bottom, rect.top);
            }

            public b a(FastPreviewOption fastPreviewOption, int i) {
                this.b.put(fastPreviewOption, Integer.valueOf(i));
                return this;
            }

            public b a(boolean z) {
                return a(FastPreviewOption.swapv, z ? 1 : 0);
            }

            public void a() {
                b(true);
            }
        };
    }

    public int r() {
        return clearScreen(1);
    }

    public native int reverseStart(String str, String str2, String str3, int i2, int i3, int i4, long j2, int i5, int i6, int i7);

    public native int reverseStop();

    public void s() {
        a((f) new f() {
            public void a(ErrorCode errorCode) {
            }
        });
    }

    public native int setBaseFilterRenderItem(String str);

    public native int setBrightness(int i2);

    public native int setContrast(int i2);

    public native int setDeviceGamma(float f2);

    public native int setDeviceLightLevel(int i2);

    public native int setProjectEffect(String str);

    public native int setProjectManualVolumeControl(int i2);

    public native int setProjectVolume(int i2);

    public native int setProjectVolumeFade(int i2, int i3);

    public native int setProperty(String str, String str2);

    public native int setSaturation(int i2);

    public native void setSharpness(int i2);

    public native int setTaskSleep(int i2);

    public native void setVignette(int i2);

    public native void setVignetteRange(int i2);

    public native int setVolumeWhilePlay(int i2, int i3);

    public void t() {
        a(0, (o) new o() {
            public void a() {
            }

            public void a(ErrorCode errorCode) {
            }
        });
    }

    public void u() {
        if (this.aj && !this.av) {
            this.av = true;
            Log.d("NexEditor.java", "  exportImageFormatCancel...");
        }
    }

    public native int updateDrawInfo(NexDrawInfo nexDrawInfo);

    /* access modifiers changed from: protected */
    public void v() {
        a(0, 0, ErrorCode.SET_TIME_IGNORED);
    }

    public void w() {
        if (this.x != null) {
            this.x.a();
        }
    }

    public boolean x() {
        return this.ay;
    }

    public int y() {
        return getNativeSDKInfoWM();
    }

    public int z() {
        return highlightStop();
    }
}
