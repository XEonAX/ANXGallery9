package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecInfo.CodecProfileLevel;
import android.media.MediaCodecList;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.Event;
import com.nexstreaming.app.common.task.Task.OnFailListener;
import com.nexstreaming.app.common.task.Task.OnTaskEventListener;
import com.nexstreaming.app.common.task.Task.TaskError;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.kminternal.kinemaster.mediainfo.MediaInfo;
import com.nexstreaming.kminternal.nexvideoeditor.LayerRenderer;
import com.nexstreaming.kminternal.nexvideoeditor.NexAudioClip;
import com.nexstreaming.kminternal.nexvideoeditor.NexDrawInfo;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.ErrorCode;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.PlayState;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.e;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.f;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.g;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.i;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.l;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.p;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.q;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.s;
import com.nexstreaming.kminternal.nexvideoeditor.NexEditor.v;
import com.nexstreaming.kminternal.nexvideoeditor.NexRectangle;
import com.nexstreaming.kminternal.nexvideoeditor.NexThemeView;
import com.nexstreaming.kminternal.nexvideoeditor.NexVisualClip;
import com.nexstreaming.kminternal.nexvideoeditor.b;
import com.nexstreaming.kminternal.nexvideoeditor.c;
import com.nexstreaming.nexeditorsdk.exception.InvalidRangeException;
import com.nexstreaming.nexeditorsdk.exception.ProjectNotAttachedException;
import com.nexstreaming.nexeditorsdk.module.nexExternalExportProvider;
import com.nexstreaming.nexeditorsdk.module.nexFaceDetectionProvider;
import com.nexstreaming.nexeditorsdk.nexOverlayItem.HitPoint;
import com.nexstreaming.nexeditorsdk.nexTranscode.Option;
import com.nexstreaming.nexeditorsdk.nexTranscode.Rotate;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.keyczar.Keyczar;

public final class nexEngine implements Callback {
    public static final int DirectExportOption_AudioEncode = 1;
    public static final int DirectExportOption_None = 0;
    public static final int ExportAVCLevel1 = 1;
    public static final int ExportAVCLevel11 = 4;
    public static final int ExportAVCLevel12 = 8;
    public static final int ExportAVCLevel13 = 16;
    public static final int ExportAVCLevel1b = 2;
    public static final int ExportAVCLevel2 = 32;
    public static final int ExportAVCLevel21 = 64;
    public static final int ExportAVCLevel22 = 128;
    public static final int ExportAVCLevel3 = 256;
    public static final int ExportAVCLevel31 = 512;
    public static final int ExportAVCLevel32 = 1024;
    public static final int ExportAVCLevel4 = 2048;
    public static final int ExportAVCLevel41 = 4096;
    public static final int ExportAVCLevel42 = 8192;
    public static final int ExportAVCLevel5 = 16384;
    public static final int ExportAVCLevel51 = 32768;
    public static final int ExportAVCLevel52 = 65536;
    public static final int ExportCodec_AVC = 268501760;
    public static final int ExportCodec_HEVC = 268502016;
    public static final int ExportCodec_MPEG4V = 268566784;
    public static final int ExportCropMode_Enhanced = 1;
    public static final int ExportCropMode_Fill = 2;
    public static final int ExportCropMode_None = 0;
    public static final int ExportHEVCHighTierLevel1 = 2;
    public static final int ExportHEVCHighTierLevel2 = 8;
    public static final int ExportHEVCHighTierLevel21 = 32;
    public static final int ExportHEVCHighTierLevel3 = 128;
    public static final int ExportHEVCHighTierLevel31 = 512;
    public static final int ExportHEVCHighTierLevel4 = 2048;
    public static final int ExportHEVCHighTierLevel41 = 8192;
    public static final int ExportHEVCHighTierLevel5 = 32768;
    public static final int ExportHEVCHighTierLevel51 = 131072;
    public static final int ExportHEVCHighTierLevel52 = 524288;
    public static final int ExportHEVCHighTierLevel6 = 2097152;
    public static final int ExportHEVCHighTierLevel61 = 8388608;
    public static final int ExportHEVCHighTierLevel62 = 33554432;
    public static final int ExportHEVCMainTierLevel1 = 1;
    public static final int ExportHEVCMainTierLevel2 = 4;
    public static final int ExportHEVCMainTierLevel21 = 16;
    public static final int ExportHEVCMainTierLevel3 = 64;
    public static final int ExportHEVCMainTierLevel31 = 256;
    public static final int ExportHEVCMainTierLevel4 = 1024;
    public static final int ExportHEVCMainTierLevel41 = 4096;
    public static final int ExportHEVCMainTierLevel5 = 16384;
    public static final int ExportHEVCMainTierLevel51 = 65536;
    public static final int ExportHEVCMainTierLevel52 = 262144;
    public static final int ExportHEVCMainTierLevel6 = 1048576;
    public static final int ExportHEVCMainTierLevel61 = 4194304;
    public static final int ExportHEVCMainTierLevel62 = 16777216;
    public static final int ExportMPEG4Level0 = 1;
    public static final int ExportMPEG4Level0b = 2;
    public static final int ExportMPEG4Level1 = 4;
    public static final int ExportMPEG4Level2 = 8;
    public static final int ExportMPEG4Level3 = 16;
    public static final int ExportMPEG4Level4 = 32;
    public static final int ExportMPEG4Level4a = 64;
    public static final int ExportMPEG4Level5 = 128;
    public static final int ExportProfile_AVCBaseline = 1;
    public static final int ExportProfile_AVCExtended = 3;
    public static final int ExportProfile_AVCHigh = 4;
    public static final int ExportProfile_AVCHigh10 = 5;
    public static final int ExportProfile_AVCHigh422 = 6;
    public static final int ExportProfile_AVCHigh444 = 7;
    public static final int ExportProfile_AVCMain = 2;
    public static final int ExportProfile_HEVCMain = 1;
    public static final int ExportProfile_HEVCMain10 = 2;
    public static final int ExportProfile_MPEG4VASP = 32768;
    public static final int ExportProfile_MPEG4VSimple = 1;
    private static final int PERSIST_INTERVAL = 500;
    private static final int PREWAKE_INTERVAL = 2000;
    private static final String TAG = "nexEngine";
    private static final int export_audio_sampling_rate = 44100;
    private static final int export_fps = 3000;
    private static final int kState_export = 2;
    private static final int kState_idle = 0;
    private static final int kState_load = 1;
    /* access modifiers changed from: private */
    public static Comparator<nexOverlayItem> layerZOrderComparator = new Comparator<nexOverlayItem>() {
        /* renamed from: a */
        public int compare(nexOverlayItem nexoverlayitem, nexOverlayItem nexoverlayitem2) {
            int zOrder = nexoverlayitem.getZOrder() - nexoverlayitem2.getZOrder();
            if (zOrder < 0) {
                return -1;
            }
            return zOrder > 0 ? 1 : 0;
        }
    };
    public static final int retCheckDirectExport_ClipCountZero = 3;
    public static final int retCheckDirectExport_EncoderDSIMismatch = 11;
    public static final int retCheckDirectExport_FilterApplied = 15;
    public static final int retCheckDirectExport_HasImageClip = 7;
    public static final int retCheckDirectExport_HasSpeedControl = 12;
    public static final int retCheckDirectExport_HasVideoLayer = 8;
    public static final int retCheckDirectExport_InvalidClipList = 2;
    public static final int retCheckDirectExport_InvalidHandle = 1;
    public static final int retCheckDirectExport_InvalidRotate = 14;
    public static final int retCheckDirectExport_InvalidVideoInfo = 4;
    public static final int retCheckDirectExport_NotStartIFrame = 6;
    public static final int retCheckDirectExport_OK = 0;
    public static final int retCheckDirectExport_SetClipEffect = 10;
    public static final int retCheckDirectExport_SetTransitionEffect = 9;
    public static final int retCheckDirectExport_UnmatchedVideoCodec = 5;
    public static final int retCheckDirectExport_UnsupportedCodec = 13;
    /* access modifiers changed from: private */
    public static int sExportVideoTrackUUIDMode = 0;
    private static boolean sLoadListAsync = true;
    private static int sNextId = 1;
    /* access modifiers changed from: private */
    public static nexEngineListener sTranscodeListener;
    /* access modifiers changed from: private */
    public static boolean sTranscodeMode;
    /* access modifiers changed from: private */
    public static nexProject sTranscodeProject;
    private static ExportProfile[] s_exportProfiles;
    ArrayList<AsyncTask<String, Void, com.nexstreaming.kminternal.kinemaster.utils.facedetect.a>> async_facedetect_worker_list_ = new ArrayList<>();
    private boolean bLetterBox = false;
    boolean bNeedScaling = false;
    /* access modifiers changed from: private */
    public boolean cacheSeekMode = false;
    /* access modifiers changed from: private */
    public boolean externalImageExportProcessing = false;
    private boolean facedetect_asyncmode = true;
    private int facedetect_syncclip_count = 1;
    private int facedetect_undetected_clip_cropping_mode = 0;
    private int lastCheckDirectExportOption = 0;
    private int lastSeekTime = 0;
    /* access modifiers changed from: private */
    public Set<nexOverlayItem> mActiveRenderLayers = new HashSet();
    private Context mAppContext;
    private List<NexAudioClip> mCachedNexAudioClips;
    private List<NexVisualClip> mCachedNexVisualClips;
    /* access modifiers changed from: private */
    public int mCurrentPlayTime;
    /* access modifiers changed from: private */
    public c mEditorListener = null;
    /* access modifiers changed from: private */
    public int mEncodeBitrate;
    /* access modifiers changed from: private */
    public int mEncodeHeight;
    /* access modifiers changed from: private */
    public long mEncodeMaxFileSize;
    /* access modifiers changed from: private */
    public int mEncodeWidth;
    private int mEnhancedCropMode;
    private int mEnhancedCropOutputHeight;
    private int mEnhancedCropOutputWidth;
    /* access modifiers changed from: private */
    public nexEngineListener mEventListener = null;
    /* access modifiers changed from: private */
    public String mExportFilePath;
    /* access modifiers changed from: private */
    public int mExportTotalTime;
    /* access modifiers changed from: private */
    public boolean mForceMixExportMode;
    /* access modifiers changed from: private */
    public int mId;
    private int mLastManualVolCtl = -1;
    private int mLastProjectFadeIn = -1;
    private int mLastProjectFadeOut = -1;
    private int mLastProjectVolume = -1;
    /* access modifiers changed from: private */
    public PlayState mPlayState = PlayState.IDLE;
    /* access modifiers changed from: private */
    public nexProject mProject = null;
    /* access modifiers changed from: private */
    public List<nexOverlayItem> mRenderInCurrentPass = new ArrayList();
    /* access modifiers changed from: private */
    public int mState = 0;
    private Surface mSurface;
    private SurfaceView mSurfaceView;
    /* access modifiers changed from: private */
    public NexEditor mVideoEditor;
    /* access modifiers changed from: private */
    public boolean m_layerLock = false;
    private NexEditor.c m_layerRenderCallback = new NexEditor.c() {
        public void a(LayerRenderer layerRenderer) {
            synchronized (nexEngine.this.m_layerRenderLock) {
                if (!nexEngine.this.m_layerLock) {
                    nexEngine.this.mRenderInCurrentPass.clear();
                    if (nexEngine.this.mProject != null) {
                        if (nexEngine.this.mProject.getOverlayItems() != null) {
                            if (nexEngine.this.mProject.getOverlayItems().size() > 0) {
                                int g = layerRenderer.g();
                                for (nexOverlayItem nexoverlayitem : nexEngine.this.mProject.getOverlayItems()) {
                                    int startTime = nexoverlayitem.getStartTime();
                                    int endTime = nexoverlayitem.getEndTime();
                                    boolean contains = nexEngine.this.mActiveRenderLayers.contains(nexoverlayitem);
                                    if (startTime <= g && endTime > g) {
                                        if (!contains) {
                                            nexEngine.this.mActiveRenderLayers.add(nexoverlayitem);
                                            nexoverlayitem.onRenderAwake(layerRenderer);
                                        }
                                        nexEngine.this.mRenderInCurrentPass.add(nexoverlayitem);
                                    } else if (contains) {
                                        nexEngine.this.mActiveRenderLayers.remove(nexoverlayitem);
                                        nexoverlayitem.onRenderAsleep(layerRenderer);
                                    }
                                }
                            }
                            Collections.sort(nexEngine.this.mRenderInCurrentPass, nexEngine.layerZOrderComparator);
                            int size = nexEngine.this.mRenderInCurrentPass.size();
                            for (int i = 0; i < size; i++) {
                                ((nexOverlayItem) nexEngine.this.mRenderInCurrentPass.get(i)).onRender(layerRenderer);
                            }
                        }
                    }
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public Object m_layerRenderLock = new Object();
    /* access modifiers changed from: private */
    public OnSurfaceChangeListener m_onSurfaceChangeListener = null;

    public static class ExportProfile {
        /* access modifiers changed from: private */
        public int mimeType;
        /* access modifiers changed from: private */
        public ProfileAndLevel[] proFileAndLevel;

        public int getMimeType() {
            return this.mimeType;
        }

        public ProfileAndLevel[] getProFileAndLevel() {
            return (ProfileAndLevel[]) this.proFileAndLevel.clone();
        }

        public boolean isSupported(int i, int i2) {
            ProfileAndLevel[] profileAndLevelArr;
            for (ProfileAndLevel profileAndLevel : this.proFileAndLevel) {
                if (profileAndLevel.getProfile() == i && profileAndLevel.getLevel() <= i2) {
                    return true;
                }
            }
            return false;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("ExportProfile{mimeType=");
            sb.append(this.mimeType);
            sb.append(", proFileAndLevel=");
            sb.append(Arrays.toString(this.proFileAndLevel));
            sb.append('}');
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
        cts,
        adj_vignette,
        adj_vignetteRange,
        adj_sharpness,
        customlut_clip,
        customlut_power
    }

    public static abstract class OnAutoTrimRatioResultListener {
        public abstract void onAutoTrimRatioResult(int i, int[] iArr, int[] iArr2);
    }

    public static abstract class OnAutoTrimResultListener {
        public abstract void onAutoTrimResult(int i, int[] iArr);
    }

    public static abstract class OnCaptureListener {
        public abstract void onCapture(Bitmap bitmap);

        public abstract void onCaptureFail(nexErrorCode nexerrorcode);
    }

    public static abstract class OnCompletionListener {
        public abstract void onComplete(int i);
    }

    public static abstract class OnSeekCompletionListener {
        public abstract void onSeekComplete(int i, int i2, int i3);
    }

    public static abstract class OnSurfaceChangeListener {
        public abstract void onSurfaceChanged();
    }

    private enum OverlayCommand {
        clear,
        upload,
        lock,
        unlock
    }

    public class OverlayPreviewBuilder {
        private nexOverlayItem mItem;

        private OverlayPreviewBuilder(int i) {
            for (nexOverlayItem nexoverlayitem : nexEngine.this.mProject.getOverlayItems()) {
                if (nexoverlayitem.getId() == i) {
                    this.mItem = nexoverlayitem;
                }
            }
        }

        public void clear() {
            if (this.mItem != null) {
                this.mItem = null;
            }
        }

        public void display() {
            if (this.mItem != null) {
                nexEngine.this.fastPreview(FastPreviewOption.normal, 0);
            }
        }

        public OverlayPreviewBuilder setAlpha(float f) {
            if (this.mItem != null) {
                this.mItem.setAlpha(f);
            }
            return this;
        }

        public OverlayPreviewBuilder setOutline(boolean z) {
            if (this.mItem != null) {
                this.mItem.showOutline(z);
            }
            return this;
        }

        public OverlayPreviewBuilder setPositionX(int i) {
            if (this.mItem != null) {
                this.mItem.setPosition(i, this.mItem.getPositionY());
            }
            return this;
        }

        public OverlayPreviewBuilder setPositionY(int i) {
            if (this.mItem != null) {
                this.mItem.setPosition(this.mItem.getPositionX(), i);
            }
            return this;
        }

        public OverlayPreviewBuilder setRotateX(int i) {
            if (this.mItem != null) {
                this.mItem.setRotate(i, this.mItem.getRotateY(), this.mItem.getRotateZ());
            }
            return this;
        }

        public OverlayPreviewBuilder setRotateY(int i) {
            if (this.mItem != null) {
                this.mItem.setRotate(this.mItem.getRotateX(), i, this.mItem.getRotateZ());
            }
            return this;
        }

        public OverlayPreviewBuilder setRotateZ(int i) {
            if (this.mItem != null) {
                this.mItem.setRotate(this.mItem.getRotateX(), this.mItem.getRotateY(), i);
            }
            return this;
        }

        public OverlayPreviewBuilder setScaleX(float f) {
            if (this.mItem != null) {
                this.mItem.setScale(f, this.mItem.getScaledY());
            }
            return this;
        }

        public OverlayPreviewBuilder setScaleY(float f) {
            if (this.mItem != null) {
                this.mItem.setScale(this.mItem.getScaledX(), f);
            }
            return this;
        }
    }

    public static class ProfileAndLevel implements Cloneable {
        private int level;
        private int profile;

        private ProfileAndLevel(int i, int i2) {
            this.profile = i;
            this.level = i2;
        }

        /* access modifiers changed from: protected */
        public Object clone() throws CloneNotSupportedException {
            return super.clone();
        }

        public int getLevel() {
            return this.level;
        }

        public int getProfile() {
            return this.profile;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("ProfileAndLevel{level=");
            sb.append(this.level);
            sb.append(", profile=");
            sb.append(this.profile);
            sb.append('}');
            return sb.toString();
        }
    }

    private class a extends v {
        private nexExternalExportProvider b;
        private nexExportListener c;

        public a(nexExternalExportProvider nexexternalexportprovider, nexExportListener nexexportlistener) {
            this.b = nexexternalexportprovider;
            this.c = nexexportlistener;
        }

        public void a() {
            this.b.OnLastProcess();
        }

        public boolean a(int i) {
            nexErrorCode nexerrorcode = nexErrorCode.EXPORT_WRITER_START_FAIL;
            switch (i) {
                case -3:
                    nexerrorcode = nexErrorCode.EXPORT_WRITER_INIT_FAIL;
                    break;
                case -2:
                    nexerrorcode = nexErrorCode.EXPORT_USER_CANCEL;
                    break;
                case -1:
                    nexerrorcode = nexErrorCode.INVALID_STATE;
                    break;
                case 0:
                    nexerrorcode = nexErrorCode.NONE;
                    break;
            }
            boolean OnEnd = this.b.OnEnd(i);
            if (i < 0 && this.c != null) {
                this.c.onExportFail(nexerrorcode);
            }
            if (this.c != null) {
                this.c.onExportDone(null);
            } else if (nexEngine.this.mEventListener != null) {
                nexEngine.this.mEventListener.onEncodingDone(i != 0, nexerrorcode.getValue());
            }
            nexEngine.this.externalImageExportProcessing = false;
            nexEngine.this.mState = 1;
            return OnEnd;
        }

        public boolean a(byte[] bArr, int i) {
            return this.b.OnPushData(i, bArr);
        }

        public int b() {
            return nexEngine.this.async_facedetect_worker_list_.size();
        }

        public void b(int i) {
            if (this.c != null) {
                this.c.onExportProgress(i);
            } else if (nexEngine.this.mEventListener != null) {
                nexEngine.this.mEventListener.onEncodingProgress(i);
            }
        }
    }

    public enum nexErrorCode {
        NONE(0),
        GENERAL(1),
        UNKNOWN(2),
        NO_ACTION(3),
        INVALID_INFO(4),
        INVALID_STATE(5),
        VERSION_MISMATCH(6),
        CREATE_FAILED(7),
        MEMALLOC_FAILED(8),
        ARGUMENT_FAILED(9),
        NOT_ENOUGH_NEMORY(10),
        EVENTHANDLER(11),
        FILE_IO_FAILED(12),
        FILE_INVALID_SYNTAX(13),
        FILEREADER_CREATE_FAIL(14),
        FILEWRITER_CREATE_FAIL(15),
        AUDIORESAMPLER_CREATE_FAIL(16),
        UNSUPPORT_FORMAT(17),
        FILEREADER_FAILED(18),
        PLAYSTART_FAILED(19),
        PLAYSTOP_FAILED(20),
        PROJECT_NOT_CREATE(21),
        PROJECT_NOT_OPEN(22),
        CODEC_INIT(23),
        RENDERER_INIT(24),
        THEMESET_CREATE_FAIL(25),
        ADD_CLIP_FAIL(26),
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
        EXPORT_NOT_ENOUGHT_DISK_SPACE(48),
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
        CODEC_DECODE(93),
        RENDERER_AUDIO(94);
        
        private final int errno;

        private nexErrorCode(int i) {
            this.errno = i;
        }

        public static nexErrorCode fromValue(int i) {
            nexErrorCode[] values;
            for (nexErrorCode nexerrorcode : values()) {
                if (nexerrorcode.getValue() == i) {
                    return nexerrorcode;
                }
            }
            return null;
        }

        public int getValue() {
            return this.errno;
        }
    }

    public enum nexPlayState {
        NONE(0),
        IDLE(1),
        RUN(2),
        RECORD(3);
        
        private int mValue;

        private nexPlayState(int i) {
            this.mValue = i;
        }

        public static nexPlayState fromValue(int i) {
            nexPlayState[] values;
            for (nexPlayState nexplaystate : values()) {
                if (nexplaystate.getValue() == i) {
                    return nexplaystate;
                }
            }
            return null;
        }

        public int getValue() {
            return this.mValue;
        }
    }

    public enum nexUndetectedFaceCrop {
        NONE(0),
        ZOOM(1);
        
        private int mValue;

        private nexUndetectedFaceCrop(int i) {
            this.mValue = i;
        }

        public static nexUndetectedFaceCrop fromValue(int i) {
            nexUndetectedFaceCrop[] values;
            for (nexUndetectedFaceCrop nexundetectedfacecrop : values()) {
                if (nexundetectedfacecrop.getValue() == i) {
                    return nexundetectedfacecrop;
                }
            }
            return null;
        }

        public int getValue() {
            return this.mValue;
        }
    }

    public nexEngine(Context context) {
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] nexEngine create");
        Log.d(str, sb.toString());
        this.mAppContext = context;
        this.mVideoEditor = EditorGlobal.a();
        NexEditor.a(nexApplicationConfig.getAspectProfile().getWidth(), nexApplicationConfig.getAspectProfile().getHeight(), nexApplicationConfig.getOverlayCoordinateMode());
        this.mVideoEditor.a(nexApplicationConfig.getScreenMode());
        this.mVideoEditor.a(this.m_layerRenderCallback);
        if (this.mVideoEditor.y() == 1) {
            this.mVideoEditor.e(true);
        } else {
            this.mVideoEditor.e(false);
        }
    }

    nexEngine(Context context, boolean z) {
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] nexEngine create internal");
        Log.d(str, sb.toString());
        this.mAppContext = context;
        this.mVideoEditor = EditorGlobal.a();
        NexEditor.a(nexApplicationConfig.getAspectProfile().getWidth(), nexApplicationConfig.getAspectProfile().getHeight(), nexApplicationConfig.getOverlayCoordinateMode());
        this.mVideoEditor.a(nexApplicationConfig.getScreenMode());
        this.mVideoEditor.a(this.m_layerRenderCallback);
        if (z) {
            setMark();
        }
    }

    private void applyCropSpeed() {
    }

    private static int bsearch(int[] iArr, int i) {
        int i2 = 0;
        int length = iArr.length - 1;
        int i3 = 0;
        while (i3 <= length) {
            int i4 = (i3 + length) / 2;
            if (iArr[i4] == i) {
                return i4;
            }
            if (iArr[i4] < i) {
                i3 = i4 + 1;
            } else {
                length = i4 - 1;
            }
        }
        if (i3 > 0) {
            i2 = i3 - 1;
        }
        return i2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0043, code lost:
        if (r7.size() > 0) goto L_0x003d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0088, code lost:
        if (r8.size() > 0) goto L_0x008c;
     */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0049  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x008e  */
    private boolean checkUpdateProject(List<NexVisualClip> list, List<NexAudioClip> list2) {
        boolean z;
        int i = 0;
        boolean z2 = true;
        if (this.mCachedNexVisualClips != null) {
            if (this.mCachedNexVisualClips.size() == list.size()) {
                int size = list.size();
                int i2 = 0;
                while (i2 < size) {
                    if (!((NexVisualClip) this.mCachedNexVisualClips.get(i2)).equals(list.get(i2))) {
                        Log.d(TAG, "checkUpdateProject video not equals");
                    } else {
                        i2++;
                    }
                }
                z = false;
                if (!z) {
                    if (this.mCachedNexAudioClips != null) {
                        if (this.mCachedNexAudioClips.size() == list2.size()) {
                            int size2 = list2.size();
                            while (true) {
                                if (i >= size2) {
                                    break;
                                } else if (!((NexAudioClip) this.mCachedNexAudioClips.get(i)).equals(list2.get(i))) {
                                    Log.d(TAG, "checkUpdateProject audio not equals");
                                    break;
                                } else {
                                    i++;
                                }
                            }
                        } else {
                            Log.d(TAG, "checkUpdateProject audio diff size");
                        }
                        if (z2) {
                            this.mCachedNexVisualClips = list;
                            this.mCachedNexAudioClips = list2;
                        }
                        return z2;
                    }
                }
                z2 = z;
                if (z2) {
                }
                return z2;
            }
            Log.d(TAG, "checkUpdateProject video diff size");
        }
        z = true;
        if (!z) {
        }
        z2 = z;
        if (z2) {
        }
        return z2;
    }

    private void clearList() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("]clearList()");
        Log.i(str, sb.toString());
        if (sLoadListAsync) {
            this.mVideoEditor.b((NexVisualClip[]) null, (NexAudioClip[]) null, 0);
            this.mVideoEditor.asyncDrawInfoList(null, null);
            return;
        }
        this.mVideoEditor.a((NexVisualClip[]) null, (NexAudioClip[]) null, 0);
        this.mVideoEditor.asyncDrawInfoList(null, null);
    }

    private void defaultFaceDetectSetting() {
        this.facedetect_asyncmode = true;
        this.facedetect_syncclip_count = 1;
        this.facedetect_undetected_clip_cropping_mode = 0;
    }

    private void encodeEffectOptions(StringBuilder sb, Map<String, String> map) {
        try {
            boolean z = true;
            for (Entry entry : map.entrySet()) {
                if (z) {
                    z = false;
                } else {
                    sb.append('&');
                }
                sb.append(URLEncoder.encode((String) entry.getKey(), Keyczar.DEFAULT_ENCODING));
                sb.append("=");
                sb.append(URLEncoder.encode((String) entry.getValue(), Keyczar.DEFAULT_ENCODING));
            }
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    @Deprecated
    private boolean fastPreviewStart(int i, int i2, int i3, int i4) {
        this.mVideoEditor.fastPreviewStart(i, i2, i3, i4);
        return true;
    }

    @Deprecated
    private boolean fastPreviewStop() {
        this.mVideoEditor.fastPreviewStop();
        return true;
    }

    @Deprecated
    private boolean fastPreviewTime(int i) {
        this.mVideoEditor.fastPreviewTime(i);
        return true;
    }

    public static ExportProfile[] getExportProfile() {
        MediaCodecInfo[] mediaCodecInfoArr;
        int i;
        if (VERSION.SDK_INT < 21) {
            return new ExportProfile[0];
        }
        if (s_exportProfiles == null) {
            MediaCodecList mediaCodecList = new MediaCodecList(0);
            ArrayList arrayList = new ArrayList();
            MediaCodecInfo[] codecInfos = mediaCodecList.getCodecInfos();
            int length = codecInfos.length;
            int i2 = 0;
            while (i2 < length) {
                MediaCodecInfo mediaCodecInfo = codecInfos[i2];
                if (mediaCodecInfo.isEncoder()) {
                    String[] supportedTypes = mediaCodecInfo.getSupportedTypes();
                    int i3 = 0;
                    while (i3 < supportedTypes.length) {
                        if (supportedTypes[i3].equalsIgnoreCase("video/avc") || supportedTypes[i3].equalsIgnoreCase("video/hevc") || supportedTypes[i3].equalsIgnoreCase("video/mp4v-es")) {
                            ExportProfile exportProfile = new ExportProfile();
                            boolean equalsIgnoreCase = supportedTypes[i3].equalsIgnoreCase("video/avc");
                            int i4 = ExportCodec_AVC;
                            if (equalsIgnoreCase) {
                                exportProfile.mimeType = ExportCodec_AVC;
                            } else if (supportedTypes[i3].equalsIgnoreCase("video/hevc")) {
                                exportProfile.mimeType = ExportCodec_HEVC;
                            } else if (supportedTypes[i3].equalsIgnoreCase("video/mp4v-es")) {
                                exportProfile.mimeType = ExportCodec_MPEG4V;
                            }
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("codec name=");
                            sb.append(mediaCodecInfo.getName());
                            Log.d(str, sb.toString());
                            try {
                                CodecCapabilities capabilitiesForType = mediaCodecInfo.getCapabilitiesForType(supportedTypes[i3]);
                                SparseIntArray sparseIntArray = new SparseIntArray();
                                CodecProfileLevel[] codecProfileLevelArr = capabilitiesForType.profileLevels;
                                int length2 = codecProfileLevelArr.length;
                                int i5 = 0;
                                while (i5 < length2) {
                                    CodecProfileLevel codecProfileLevel = codecProfileLevelArr[i5];
                                    if (exportProfile.mimeType == i4) {
                                        int i6 = codecProfileLevel.profile;
                                        if (i6 != 8 && i6 != 16 && i6 != 32 && i6 != 64) {
                                            switch (i6) {
                                                case 1:
                                                    i = 1;
                                                    break;
                                                case 2:
                                                    i = 2;
                                                    break;
                                                default:
                                                    i = 0;
                                                    break;
                                            }
                                        } else {
                                            i = 4;
                                        }
                                        if (i == 0) {
                                            mediaCodecInfoArr = codecInfos;
                                        } else {
                                            String str2 = TAG;
                                            StringBuilder sb2 = new StringBuilder();
                                            mediaCodecInfoArr = codecInfos;
                                            try {
                                                sb2.append("codec profile=");
                                                sb2.append(i);
                                                sb2.append(", level=");
                                                sb2.append(codecProfileLevel.level);
                                                Log.d(str2, sb2.toString());
                                                if (sparseIntArray.get(i) < codecProfileLevel.level) {
                                                    sparseIntArray.put(i, codecProfileLevel.level);
                                                }
                                            } catch (Exception e) {
                                                e = e;
                                                Log.wtf(TAG, e);
                                                i3++;
                                                codecInfos = mediaCodecInfoArr;
                                            }
                                        }
                                    } else {
                                        mediaCodecInfoArr = codecInfos;
                                        if (exportProfile.mimeType == 268502016) {
                                            int i7 = codecProfileLevel.profile;
                                            if (i7 != 0) {
                                                String str3 = TAG;
                                                StringBuilder sb3 = new StringBuilder();
                                                sb3.append("codec profile=");
                                                sb3.append(i7);
                                                sb3.append(", level=");
                                                sb3.append(codecProfileLevel.level);
                                                Log.d(str3, sb3.toString());
                                                if (sparseIntArray.get(i7) < codecProfileLevel.level) {
                                                    sparseIntArray.put(i7, codecProfileLevel.level);
                                                }
                                            }
                                        } else if (exportProfile.mimeType == 268566784) {
                                            int i8 = codecProfileLevel.profile;
                                            if (i8 != 0) {
                                                String str4 = TAG;
                                                StringBuilder sb4 = new StringBuilder();
                                                sb4.append("codec profile=");
                                                sb4.append(i8);
                                                sb4.append(", level=");
                                                sb4.append(codecProfileLevel.level);
                                                Log.d(str4, sb4.toString());
                                                if (sparseIntArray.get(i8) < codecProfileLevel.level) {
                                                    sparseIntArray.put(i8, codecProfileLevel.level);
                                                }
                                            }
                                        }
                                    }
                                    i5++;
                                    codecInfos = mediaCodecInfoArr;
                                    i4 = ExportCodec_AVC;
                                }
                                mediaCodecInfoArr = codecInfos;
                                exportProfile.proFileAndLevel = new ProfileAndLevel[sparseIntArray.size()];
                                for (int i9 = 0; i9 < sparseIntArray.size(); i9++) {
                                    exportProfile.proFileAndLevel[i9] = new ProfileAndLevel(sparseIntArray.keyAt(i9), sparseIntArray.valueAt(i9));
                                }
                                arrayList.add(exportProfile);
                            } catch (Exception e2) {
                                e = e2;
                                mediaCodecInfoArr = codecInfos;
                                Log.wtf(TAG, e);
                                i3++;
                                codecInfos = mediaCodecInfoArr;
                            }
                        } else {
                            mediaCodecInfoArr = codecInfos;
                        }
                        i3++;
                        codecInfos = mediaCodecInfoArr;
                    }
                }
                i2++;
                codecInfos = codecInfos;
            }
            s_exportProfiles = new ExportProfile[arrayList.size()];
            for (int i10 = 0; i10 < arrayList.size(); i10++) {
                s_exportProfiles[i10] = (ExportProfile) arrayList.get(i10);
            }
        }
        return s_exportProfiles;
    }

    private v getExternalExport(nexExportFormat nexexportformat, String str, String str2, nexExportListener nexexportlistener) {
        if (str2 != null) {
            Object module = nexExternalModuleManager.getInstance().getModule(str2);
            if (module != null && nexExternalExportProvider.class.isInstance(module)) {
                nexExternalExportProvider nexexternalexportprovider = (nexExternalExportProvider) module;
                if (nexexternalexportprovider.OnPrepare(nexexportformat)) {
                    return new a(nexexternalexportprovider, nexexportlistener);
                }
            }
            return null;
        }
        nexExternalExportProvider nexexternalexportprovider2 = (nexExternalExportProvider) nexExternalModuleManager.getInstance().getModule(str, nexExternalExportProvider.class);
        if (nexexternalexportprovider2 == null || !nexexternalexportprovider2.OnPrepare(nexexportformat)) {
            return null;
        }
        return new a(nexexternalexportprovider2, nexexportlistener);
    }

    private int getOverlayVideoCount() {
        int i = 0;
        if (this.mProject == null) {
            return 0;
        }
        for (nexOverlayItem isVideo : this.mProject.getOverlayItems()) {
            if (isVideo.isVideo()) {
                i++;
            }
        }
        return i;
    }

    private boolean isSetProject(boolean z) {
        if (this.mProject != null && this.mProject.getTotalClipCount(true) > 0) {
            return true;
        }
        if (sTranscodeMode && sTranscodeProject != null && sTranscodeProject.getTotalClipCount(true) > 0) {
            return true;
        }
        if (!z) {
            return false;
        }
        throw new ProjectNotAttachedException();
    }

    private boolean loadClipToEngine(List<NexVisualClip> list, List<NexAudioClip> list2, boolean z, boolean z2, int i) {
        boolean z3 = true;
        if (z2) {
            this.mCachedNexVisualClips = list;
            this.mCachedNexAudioClips = list2;
            Log.d(TAG, "loadClipToEngine update force");
        } else if (checkUpdateProject(list, list2)) {
            Log.d(TAG, "loadClipToEngine update loadlist call");
        } else {
            Log.d(TAG, "loadClipToEngine No update");
            z3 = false;
        }
        if (z3) {
            NexVisualClip[] nexVisualClipArr = new NexVisualClip[this.mCachedNexVisualClips.size()];
            int size = this.mCachedNexAudioClips.size();
            if (size != 0) {
                NexAudioClip[] nexAudioClipArr = new NexAudioClip[size];
                if (z) {
                    this.mVideoEditor.b((NexVisualClip[]) this.mCachedNexVisualClips.toArray(nexVisualClipArr), (NexAudioClip[]) this.mCachedNexAudioClips.toArray(nexAudioClipArr), i);
                } else {
                    this.mVideoEditor.a((NexVisualClip[]) this.mCachedNexVisualClips.toArray(nexVisualClipArr), (NexAudioClip[]) this.mCachedNexAudioClips.toArray(nexAudioClipArr), i);
                }
            } else if (z) {
                this.mVideoEditor.b((NexVisualClip[]) this.mCachedNexVisualClips.toArray(nexVisualClipArr), (NexAudioClip[]) null, i);
            } else {
                this.mVideoEditor.a((NexVisualClip[]) this.mCachedNexVisualClips.toArray(nexVisualClipArr), (NexAudioClip[]) null, i);
            }
        } else {
            this.mVideoEditor.clearProject();
        }
        return z3;
    }

    /* access modifiers changed from: private */
    public void loadEffectsInEditor(boolean z) {
        loadEffectsInEditor_usingAssetPackageManager(z);
    }

    /* JADX WARNING: type inference failed for: r2v2 */
    /* JADX WARNING: type inference failed for: r2v3, types: [boolean] */
    /* JADX WARNING: type inference failed for: r1v7, types: [boolean] */
    /* JADX WARNING: type inference failed for: r2v5, types: [int] */
    /* JADX WARNING: type inference failed for: r2v6 */
    /* JADX WARNING: type inference failed for: r2v7, types: [int] */
    /* JADX WARNING: type inference failed for: r2v8 */
    /* JADX WARNING: type inference failed for: r2v9 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v6
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], int]
  uses: [boolean, ?[int, byte, short, char], int]
  mth insns count: 68
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
    /* JADX WARNING: Unknown variable types count: 4 */
    private void loadEffectsInEditor_usingAssetPackageManager(boolean z) {
        HashSet hashSet = new HashSet();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("TranscoderMode =");
        sb.append(sTranscodeMode);
        Log.d(str, sb.toString());
        ? r2 = 0;
        if (sTranscodeMode) {
            nexProject nexproject = this.mProject;
        } else if (this.mProject.getTemplateApplyMode() == 3) {
            List<nexDrawInfo> topDrawInfo = this.mProject.getTopDrawInfo();
            if (topDrawInfo != null && topDrawInfo.size() > 0) {
                for (nexDrawInfo effectID : topDrawInfo) {
                    hashSet.add(effectID.getEffectID());
                }
            }
        } else {
            ? templageOverlappedTransitionMode = this.mProject.getTemplageOverlappedTransitionMode();
            List primaryItems = this.mProject.getPrimaryItems();
            for (? r22 = r2; r22 < this.mProject.getTotalClipCount(true); r22++) {
                String id = ((nexClip) primaryItems.get(r22)).getClipEffect(true).getId();
                if (!(id == null || id.compareToIgnoreCase("none") == 0 || hashSet.contains(id))) {
                    hashSet.add(id);
                }
                String id2 = ((nexClip) primaryItems.get(r22)).getTransitionEffect(true).getId();
                if (!(id2 == null || id2.compareToIgnoreCase("none") == 0 || hashSet.contains(id2))) {
                    hashSet.add(id2);
                }
            }
            r2 = templageOverlappedTransitionMode;
        }
        com.nexstreaming.app.common.nexasset.assetpackage.c.a().a((Iterable<String>) hashSet, this.mVideoEditor, z, (boolean) r2);
        com.nexstreaming.app.common.nexasset.assetpackage.c.a().a((Iterable<String>) hashSet, this.mVideoEditor, z);
    }

    @Deprecated
    public static void prepareSurfaceSetToNull(boolean z) {
        NexEditor.c(z);
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:179:0x04be A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0190  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x01a2  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0260  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0294  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x02f6  */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x03e3  */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x03ee  */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0408  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0413  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x042a  */
    public int resolveProject(boolean z, boolean z2) {
        int i;
        int i2;
        NexDrawInfo[] nexDrawInfoArr;
        NexDrawInfo[] nexDrawInfoArr2;
        String str;
        char c;
        boolean z3;
        int clipType;
        ArrayList arrayList;
        int i3;
        int i4;
        int i5;
        int aVSyncTime;
        int i6;
        nexProject nexproject = this.mProject;
        if (sTranscodeMode) {
            nexproject = sTranscodeProject;
        }
        nexProject nexproject2 = nexproject;
        if (this.mForceMixExportMode) {
            this.mForceMixExportMode = false;
        }
        if (nexproject2 == null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("]resolveProject() Project is null");
            Log.i(str2, sb.toString());
            clearList();
            this.mCachedNexVisualClips = null;
            this.mCachedNexAudioClips = null;
            return 0;
        }
        nexproject2.updateProject();
        this.mVideoEditor.setBaseFilterRenderItem(nexproject2.getLetterboxEffect());
        List primaryItems = nexproject2.getPrimaryItems();
        int size = primaryItems.size();
        if (size == 0) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[");
            sb2.append(this.mId);
            sb2.append("]resolveProject() Project[");
            sb2.append(nexproject2.getId());
            sb2.append("] clip is zero");
            Log.i(str3, sb2.toString());
            clearList();
            this.mCachedNexVisualClips = null;
            this.mCachedNexAudioClips = null;
            return 0;
        }
        String str4 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("[");
        sb3.append(this.mId);
        sb3.append("]resolveProject() Project[");
        sb3.append(nexproject2.getId());
        sb3.append("]");
        Log.i(str4, sb3.toString());
        int overlayVideoCount = getOverlayVideoCount();
        ArrayList<NexAudioClip> arrayList2 = new ArrayList<>();
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        ArrayList arrayList5 = new ArrayList();
        int i7 = 0;
        int i8 = 1;
        int i9 = 0;
        int i10 = 30001;
        while (i7 < size) {
            nexClip nexclip = (nexClip) primaryItems.get(i7);
            if (i7 == 0) {
                str = nexproject2.getOpeningTitle();
                c = 1;
            } else if (i7 == size - 1) {
                str = nexproject2.getEndingTitle();
                c = 2;
            } else {
                c = 0;
                str = null;
            }
            NexVisualClip nexVisualClip = new NexVisualClip();
            for (nexDrawInfo nexdrawinfo : nexclip.getDrawInfos()) {
                nexdrawinfo.setClipID(i8);
                arrayList5.add(nexdrawinfo);
            }
            nexVisualClip.mClipPath = nexclip.getRealPath();
            nexVisualClip.mClipID = i8;
            nexVisualClip.mWidth = nexclip.getWidth();
            nexVisualClip.mHeight = nexclip.getHeight();
            nexVisualClip.mAudioOnOff = nexclip.getAudioOnOff() ? 1 : 0;
            nexVisualClip.mBGMVolume = nexclip.getBGMVolume();
            nexVisualClip.mClipEffectID = nexclip.getTransitionEffect(true).getId();
            if (c == 2) {
                nexVisualClip.mClipEffectID = "none";
                nexVisualClip.mEffectDuration = 0;
            } else {
                nexVisualClip.mClipEffectID = nexclip.getTransitionEffect(true).getId();
                if (nexVisualClip.mClipEffectID.compareTo("none") == 0) {
                    nexVisualClip.mEffectDuration = 0;
                } else {
                    z3 = true;
                    nexVisualClip.mEffectDuration = nexclip.getTransitionEffect(true).getDuration();
                    nexVisualClip.mEffectOffset = nexclip.getTransitionEffect(z3).getOffset();
                    nexVisualClip.mEffectOverlap = nexclip.getTransitionEffect(z3).getOverlap();
                    nexVisualClip.mTitleEffectID = nexclip.getClipEffect(z3).getId();
                    if (nexVisualClip.mTitleEffectID.compareTo("none") == 0) {
                        nexVisualClip.mTitleEffectID = null;
                    }
                    nexVisualClip.mTitleStartTime = nexclip.mTitleEffectStartTime;
                    nexVisualClip.mTitleEndTime = nexclip.mTitleEffectEndTime;
                    clipType = nexclip.getClipType();
                    if (clipType != 1) {
                        nexVisualClip.mStartTime = nexclip.mStartTime;
                        nexVisualClip.mEndTime = nexclip.mEndTime;
                        nexVisualClip.mClipType = 1;
                        nexVisualClip.mTotalTime = nexclip.getImageClipDuration();
                        nexVisualClip.mSpeedControl = 100;
                    } else if (clipType == 4) {
                        nexVisualClip.mClipType = 4;
                        nexVisualClip.mExistAudio = nexclip.hasAudio() ? 1 : 0;
                        nexVisualClip.mExistVideo = nexclip.hasVideo() ? 1 : 0;
                        nexVisualClip.mTotalTime = nexclip.getTotalTime();
                        nexVisualClip.mTotalVideoTime = nexclip.getTotalTime();
                        nexVisualClip.mClipVolume = nexclip.getClipVolume();
                        if (!(nexclip.getVideoClipEdit().mTrimStartDuration == 0 && nexclip.getVideoClipEdit().mTrimEndDuration == 0)) {
                            nexVisualClip.mStartTrimTime = nexclip.getVideoClipEdit().mTrimStartDuration;
                            nexVisualClip.mEndTrimTime = nexclip.getVideoClipEdit().mTrimEndDuration;
                        }
                        nexVisualClip.mFreezeDuration = nexclip.getVideoClipEdit().mFreezeDuration;
                        nexVisualClip.mStartTime = nexclip.mStartTime;
                        nexVisualClip.mEndTime = nexclip.mEndTime;
                        nexVisualClip.mSpeedControl = nexclip.getVideoClipEdit().getSpeedControl();
                        nexVisualClip.mVoiceChanger = nexclip.getAudioEdit().getVoiceChangerFactor();
                        nexVisualClip.mCompressor = nexclip.getAudioEdit().getCompressor();
                        nexVisualClip.mPitchFactor = nexclip.getAudioEdit().getPitch();
                        nexVisualClip.mMusicEffector = nexclip.getAudioEdit().getMusicEffect();
                        nexVisualClip.mPanLeft = nexclip.getAudioEdit().getPanLeft();
                        nexVisualClip.mPanRight = nexclip.getAudioEdit().getPanRight();
                        nexVisualClip.mProcessorStrength = nexclip.getAudioEdit().getProcessorStrength();
                        nexVisualClip.mBassStrength = nexclip.getAudioEdit().getBassStrength();
                        nexVisualClip.mEnhancedAudioFilter = nexclip.getAudioEdit().getEnhancedAudioFilter();
                        nexVisualClip.mSlowMotion = nexclip.mPropertySlowVideoMode ? 1 : 0;
                    }
                    int i11 = i8 + 1;
                    int i12 = nexVisualClip.mEndTime;
                    nexVisualClip.mRotateState = nexclip.getRotateDegree();
                    nexVisualClip.mTitle = getEncodedEffectOptions(nexclip, str);
                    nexVisualClip.mVignette = nexclip.getVignetteEffect() ? 1 : 0;
                    List list = primaryItems;
                    if (this.mEnhancedCropMode != 1) {
                        Rect rect = new Rect();
                        Rect rect2 = new Rect();
                        i5 = size;
                        nexclip.getCrop().getStartPositionRaw(rect);
                        nexclip.getCrop().getEndPositionRaw(rect2);
                        i4 = i12;
                        i3 = i11;
                        arrayList = arrayList5;
                        nexCrop.enhancedCrop(rect, nexclip.getWidth(), nexclip.getHeight(), (float) this.mEnhancedCropOutputWidth, (float) this.mEnhancedCropOutputHeight);
                        nexCrop.enhancedCrop(rect2, nexclip.getWidth(), nexclip.getHeight(), (float) this.mEnhancedCropOutputWidth, (float) this.mEnhancedCropOutputHeight);
                        nexVisualClip.mStartRect = new NexRectangle(rect.left, rect.top, rect.right, rect.bottom);
                        nexVisualClip.mEndRect = new NexRectangle(rect2.left, rect2.top, rect2.right, rect2.bottom);
                    } else {
                        i5 = size;
                        i4 = i12;
                        arrayList = arrayList5;
                        i3 = i11;
                        if (this.mEnhancedCropMode == 2) {
                            nexVisualClip.mStartRect = new NexRectangle(0, 0, nexCrop.ABSTRACT_DIMENSION, nexCrop.ABSTRACT_DIMENSION);
                            nexVisualClip.mEndRect = new NexRectangle(0, 0, nexCrop.ABSTRACT_DIMENSION, nexCrop.ABSTRACT_DIMENSION);
                        } else if (nexclip.getCrop().m_rotation == 90 || nexclip.getCrop().m_rotation == 270) {
                            nexVisualClip.mStartRect = new NexRectangle(nexclip.getCrop().m_rotatedStartPositionLeft, nexclip.getCrop().m_rotatedStartPositionTop, nexclip.getCrop().m_rotatedStartPositionRight, nexclip.getCrop().m_rotatedStartPositionBottom);
                            nexVisualClip.mEndRect = new NexRectangle(nexclip.getCrop().m_rotatedEndPositionLeft, nexclip.getCrop().m_rotatedEndPositionTop, nexclip.getCrop().m_rotatedEndPositionRight, nexclip.getCrop().m_rotatedEndPositionBottom);
                        } else {
                            nexVisualClip.mStartRect = new NexRectangle(nexclip.getCrop().m_startPositionLeft, nexclip.getCrop().m_startPositionTop, nexclip.getCrop().m_startPositionRight, nexclip.getCrop().m_startPositionBottom);
                            nexVisualClip.mEndRect = new NexRectangle(nexclip.getCrop().m_endPositionLeft, nexclip.getCrop().m_endPositionTop, nexclip.getCrop().m_endPositionRight, nexclip.getCrop().m_endPositionBottom);
                        }
                    }
                    nexVisualClip.mBrightness = nexclip.getCombinedBrightness();
                    nexVisualClip.mSaturation = nexclip.getCombinedSaturation();
                    nexVisualClip.mContrast = nexclip.getCombinedContrast();
                    nexVisualClip.mTintcolor = nexclip.getTintColor();
                    nexVisualClip.mLUT = nexclip.getLUTId();
                    nexVisualClip.mCustomLUT_A = nexclip.getCustomLUTA();
                    nexVisualClip.mCustomLUT_B = nexclip.getCustomLUTB();
                    nexVisualClip.mCustomLUT_Power = nexclip.getCustomLUTPower();
                    if (nexclip.getAudioEnvelop().getVolumeEnvelopeTimeList() == null) {
                        nexVisualClip.mVolumeEnvelopeTime = nexclip.getAudioEnvelop().getVolumeEnvelopeTimeList();
                    } else {
                        nexVisualClip.mVolumeEnvelopeTime = new int[]{0, nexVisualClip.mEndTime - nexVisualClip.mStartTime};
                    }
                    if (nexclip.getAudioEnvelop().getVolumeEnvelopeLevelList() == null) {
                        nexVisualClip.mVolumeEnvelopeLevel = nexclip.getAudioEnvelop().getVolumeEnvelopeLevelList();
                    } else {
                        nexVisualClip.mVolumeEnvelopeLevel = new int[]{100, 100};
                    }
                    nexVisualClip.mMotionTracked = nexclip.isMotionTrackedVideo() ? 1 : 0;
                    arrayList4.add(nexVisualClip);
                    aVSyncTime = nexclip.getAVSyncTime();
                    if (aVSyncTime == 0) {
                        NexAudioClip nexAudioClip = new NexAudioClip();
                        int i13 = i10 + 1;
                        nexAudioClip.mClipID = i10;
                        nexAudioClip.mVisualClipID = nexVisualClip.mClipID;
                        nexAudioClip.mTotalTime = nexVisualClip.mTotalTime;
                        nexAudioClip.mClipPath = nexVisualClip.mClipPath;
                        nexAudioClip.mAudioOnOff = nexVisualClip.mAudioOnOff;
                        nexVisualClip.mAudioOnOff = 0;
                        nexAudioClip.mClipType = 3;
                        nexAudioClip.mClipVolume = nexVisualClip.mClipVolume;
                        nexVisualClip.mClipVolume = 0;
                        nexAudioClip.mAutoEnvelop = 0;
                        nexAudioClip.mSpeedControl = nexVisualClip.mSpeedControl;
                        int i14 = (int) ((((float) aVSyncTime) * ((float) nexAudioClip.mSpeedControl)) / 100.0f);
                        if (aVSyncTime <= 0) {
                            i6 = 0;
                            nexAudioClip.mStartTime = nexVisualClip.mStartTime;
                            nexAudioClip.mStartTrimTime = nexVisualClip.mStartTrimTime - aVSyncTime;
                        } else if (nexVisualClip.mStartTime == 0) {
                            nexAudioClip.mStartTime = nexVisualClip.mStartTime + i14;
                            nexAudioClip.mStartTrimTime = nexVisualClip.mStartTrimTime;
                            i6 = 0;
                        } else {
                            nexAudioClip.mStartTime = nexVisualClip.mStartTime;
                            if (nexVisualClip.mStartTrimTime == 0) {
                                nexAudioClip.mStartTime = nexVisualClip.mStartTime + i14;
                                i6 = 0;
                                nexAudioClip.mStartTrimTime = 0;
                            } else {
                                i6 = 0;
                                nexAudioClip.mStartTrimTime = nexVisualClip.mStartTrimTime - aVSyncTime;
                                if (nexAudioClip.mStartTrimTime < 0) {
                                    nexAudioClip.mStartTrimTime = 0;
                                }
                            }
                        }
                        nexAudioClip.mEndTrimTime = i6;
                        nexAudioClip.mEndTime = nexVisualClip.mEndTime;
                        nexAudioClip.mEndTrimTime = nexAudioClip.mTotalTime - (nexAudioClip.mStartTrimTime + ((int) ((((float) (nexAudioClip.mEndTime - nexAudioClip.mStartTime)) * ((float) nexVisualClip.mSpeedControl)) / 100.0f)));
                        if (nexAudioClip.mEndTrimTime < 0) {
                            nexAudioClip.mEndTrimTime = 0;
                        }
                        arrayList2.add(nexAudioClip);
                        i10 = i13;
                    }
                    i7++;
                    primaryItems = list;
                    size = i5;
                    i9 = i4;
                    i8 = i3;
                    arrayList5 = arrayList;
                }
            }
            z3 = true;
            nexVisualClip.mEffectOffset = nexclip.getTransitionEffect(z3).getOffset();
            nexVisualClip.mEffectOverlap = nexclip.getTransitionEffect(z3).getOverlap();
            nexVisualClip.mTitleEffectID = nexclip.getClipEffect(z3).getId();
            if (nexVisualClip.mTitleEffectID.compareTo("none") == 0) {
            }
            nexVisualClip.mTitleStartTime = nexclip.mTitleEffectStartTime;
            nexVisualClip.mTitleEndTime = nexclip.mTitleEffectEndTime;
            clipType = nexclip.getClipType();
            if (clipType != 1) {
            }
            int i112 = i8 + 1;
            int i122 = nexVisualClip.mEndTime;
            nexVisualClip.mRotateState = nexclip.getRotateDegree();
            nexVisualClip.mTitle = getEncodedEffectOptions(nexclip, str);
            nexVisualClip.mVignette = nexclip.getVignetteEffect() ? 1 : 0;
            List list2 = primaryItems;
            if (this.mEnhancedCropMode != 1) {
            }
            nexVisualClip.mBrightness = nexclip.getCombinedBrightness();
            nexVisualClip.mSaturation = nexclip.getCombinedSaturation();
            nexVisualClip.mContrast = nexclip.getCombinedContrast();
            nexVisualClip.mTintcolor = nexclip.getTintColor();
            nexVisualClip.mLUT = nexclip.getLUTId();
            nexVisualClip.mCustomLUT_A = nexclip.getCustomLUTA();
            nexVisualClip.mCustomLUT_B = nexclip.getCustomLUTB();
            nexVisualClip.mCustomLUT_Power = nexclip.getCustomLUTPower();
            if (nexclip.getAudioEnvelop().getVolumeEnvelopeTimeList() == null) {
            }
            if (nexclip.getAudioEnvelop().getVolumeEnvelopeLevelList() == null) {
            }
            nexVisualClip.mMotionTracked = nexclip.isMotionTrackedVideo() ? 1 : 0;
            arrayList4.add(nexVisualClip);
            aVSyncTime = nexclip.getAVSyncTime();
            if (aVSyncTime == 0) {
            }
            i7++;
            primaryItems = list2;
            size = i5;
            i9 = i4;
            i8 = i3;
            arrayList5 = arrayList;
        }
        ArrayList<nexDrawInfo> arrayList6 = arrayList5;
        if (!sTranscodeMode) {
            if (overlayVideoCount > 0 && this.mProject != null) {
                for (nexOverlayItem nexoverlayitem : this.mProject.getOverlayItems()) {
                    if (nexoverlayitem.isVideo()) {
                        NexVisualClip nexVisualClip2 = new NexVisualClip();
                        nexVisualClip2.mClipID = i8;
                        nexoverlayitem.mVideoEngineId = i8;
                        nexVisualClip2.mClipType = 7;
                        nexVisualClip2.mTotalTime = nexoverlayitem.getOverlayImage().getVideoClipInfo().getTotalTime();
                        nexVisualClip2.mStartTime = nexoverlayitem.getStartTime();
                        nexVisualClip2.mEndTime = nexoverlayitem.getEndTime();
                        if (nexoverlayitem.getStartTrimTime() == 0 && nexoverlayitem.getEndTrimTime() == 0) {
                            nexVisualClip2.mStartTrimTime = 0;
                            nexVisualClip2.mEndTrimTime = 0;
                        } else {
                            nexVisualClip2.mStartTrimTime = nexoverlayitem.getStartTrimTime();
                            nexVisualClip2.mEndTrimTime = nexoverlayitem.getEndTrimTime();
                        }
                        nexVisualClip2.mWidth = nexoverlayitem.getOverlayImage().getVideoClipInfo().getWidth();
                        nexVisualClip2.mHeight = nexoverlayitem.getOverlayImage().getVideoClipInfo().getHeight();
                        nexVisualClip2.mExistVideo = nexoverlayitem.getOverlayImage().getVideoClipInfo().hasVideo() ? 1 : 0;
                        nexVisualClip2.mExistAudio = nexoverlayitem.getOverlayImage().getVideoClipInfo().hasAudio() ? 1 : 0;
                        nexVisualClip2.mTitleStartTime = nexoverlayitem.getStartTime();
                        nexVisualClip2.mTitleEndTime = nexoverlayitem.getEndTime();
                        nexVisualClip2.mBGMVolume = 100;
                        nexVisualClip2.mAudioOnOff = nexoverlayitem.getAudioOnOff() ? 1 : 0;
                        nexVisualClip2.mClipVolume = nexoverlayitem.getVolume();
                        nexVisualClip2.mEffectDuration = 0;
                        nexVisualClip2.mClipEffectID = "none";
                        nexVisualClip2.mTitleEffectID = null;
                        nexVisualClip2.mStartRect = new NexRectangle(0, 0, nexCrop.ABSTRACT_DIMENSION, nexCrop.ABSTRACT_DIMENSION);
                        nexVisualClip2.mEndRect = new NexRectangle(0, 0, nexCrop.ABSTRACT_DIMENSION, nexCrop.ABSTRACT_DIMENSION);
                        nexVisualClip2.mClipPath = nexoverlayitem.getOverlayImage().getVideoClipInfo().getPath();
                        nexVisualClip2.mThumbnailPath = null;
                        nexVisualClip2.mRotateState = 0;
                        nexVisualClip2.mEffectOffset = 0;
                        nexVisualClip2.mEffectOverlap = 0;
                        nexVisualClip2.mSpeedControl = nexoverlayitem.getSpeedControl();
                        arrayList4.add(nexVisualClip2);
                        i8++;
                    }
                }
            }
            int i15 = 10001;
            nexClip backgroundMusic = nexproject2.getBackgroundMusic();
            if (backgroundMusic != null) {
                NexAudioClip nexAudioClip2 = new NexAudioClip();
                nexAudioClip2.mClipID = 10001;
                nexAudioClip2.mTotalTime = backgroundMusic.getTotalTime();
                nexAudioClip2.mClipPath = backgroundMusic.getRealPath();
                nexAudioClip2.mAudioOnOff = backgroundMusic.getAudioOnOff() ? 1 : 0;
                nexAudioClip2.mClipType = 3;
                nexAudioClip2.mClipVolume = (int) (nexproject2.getBGMMasterVolumeScale() * 200.0f);
                nexAudioClip2.mAutoEnvelop = 1;
                nexAudioClip2.mStartTime = nexproject2.mStartTimeBGM;
                nexAudioClip2.mStartTrimTime = nexproject2.mBGMTrimStartTime;
                if (nexproject2.mBGMTrimEndTime == 0) {
                    nexAudioClip2.mEndTrimTime = 0;
                } else {
                    nexAudioClip2.mEndTrimTime = nexAudioClip2.mTotalTime - nexproject2.mBGMTrimEndTime;
                    if (nexAudioClip2.mEndTrimTime < 0) {
                        nexAudioClip2.mEndTrimTime = 0;
                    }
                }
                int i16 = nexproject2.mBGMTrimEndTime - nexproject2.mBGMTrimStartTime;
                if (i16 <= 0) {
                    i16 = backgroundMusic.getTotalTime();
                }
                if (nexproject2.mLoopBGM) {
                    i16 = nexproject2.getTotalTime();
                }
                nexAudioClip2.mEndTime = i16 + nexAudioClip2.mStartTime;
                nexAudioClip2.mVolumeEnvelopeTime = backgroundMusic.getAudioEnvelop().getVolumeEnvelopeTimeList();
                nexAudioClip2.mVolumeEnvelopeLevel = backgroundMusic.getAudioEnvelop().getVolumeEnvelopeLevelList();
                arrayList3.add(nexAudioClip2);
                i15 = 10002;
            }
            for (NexAudioClip add : arrayList2) {
                arrayList3.add(add);
            }
            for (nexAudioItem nexaudioitem : nexproject2.getAudioItems()) {
                NexAudioClip nexAudioClip3 = new NexAudioClip();
                nexClip nexclip2 = nexaudioitem.mClip;
                nexAudioClip3.mClipID = i15;
                nexAudioClip3.mTotalTime = nexclip2.getTotalTime();
                nexAudioClip3.mClipPath = nexclip2.getRealPath();
                nexAudioClip3.mAudioOnOff = nexclip2.getAudioOnOff() ? 1 : 0;
                nexAudioClip3.mClipType = 3;
                nexAudioClip3.mClipVolume = nexclip2.getClipVolume();
                nexAudioClip3.mStartTime = nexclip2.mStartTime;
                nexAudioClip3.mEndTime = nexclip2.mEndTime;
                nexAudioClip3.mStartTrimTime = nexaudioitem.mTrimStartDuration;
                nexAudioClip3.mEndTrimTime = nexaudioitem.mTrimEndDuration;
                nexAudioClip3.mSpeedControl = nexaudioitem.getSpeedControl();
                nexAudioClip3.mVolumeEnvelopeTime = nexclip2.getAudioEnvelop().getVolumeEnvelopeTimeList();
                nexAudioClip3.mVolumeEnvelopeLevel = nexclip2.getAudioEnvelop().getVolumeEnvelopeLevelList();
                nexAudioClip3.mVoiceChanger = nexclip2.getAudioEdit().getVoiceChangerFactor();
                nexAudioClip3.mCompressor = nexclip2.getAudioEdit().getCompressor();
                nexAudioClip3.mPitchFactor = nexclip2.getAudioEdit().getPitch();
                nexAudioClip3.mMusicEffector = nexclip2.getAudioEdit().getMusicEffect();
                nexAudioClip3.mPanLeft = nexclip2.getAudioEdit().getPanLeft();
                nexAudioClip3.mPanRight = nexclip2.getAudioEdit().getPanRight();
                nexAudioClip3.mProcessorStrength = nexclip2.getAudioEdit().getProcessorStrength();
                nexAudioClip3.mBassStrength = nexclip2.getAudioEdit().getBassStrength();
                nexAudioClip3.mEnhancedAudioFilter = nexclip2.getAudioEdit().getEnhancedAudioFilter();
                arrayList3.add(nexAudioClip3);
                i15++;
            }
            i = (nexproject2.getTemplateApplyMode() != 3 ? !loadClipToEngine(arrayList4, arrayList3, z, z2, 0) : !loadClipToEngine(arrayList4, arrayList3, z, true, 257)) ? 0 : 1;
            List<nexDrawInfo> topDrawInfo = nexproject2.getTopDrawInfo();
            if (topDrawInfo == null || topDrawInfo.size() <= 0) {
                nexDrawInfoArr = null;
            } else {
                Log.d(TAG, String.format("resolve Project for top drawInfo(%d) ++++++++++++++++++++", new Object[]{Integer.valueOf(topDrawInfo.size())}));
                nexDrawInfoArr = new NexDrawInfo[topDrawInfo.size()];
                int i17 = 0;
                for (nexDrawInfo nexdrawinfo2 : topDrawInfo) {
                    NexDrawInfo nexDrawInfo = new NexDrawInfo();
                    nexDrawInfo.mID = nexdrawinfo2.getID();
                    nexDrawInfo.mTrackID = nexdrawinfo2.getClipID();
                    nexDrawInfo.mSubEffectID = nexdrawinfo2.getSubEffectID();
                    nexDrawInfo.mEffectID = nexdrawinfo2.getEffectID();
                    nexDrawInfo.mTitle = nexdrawinfo2.getTitle();
                    nexDrawInfo.mIsTransition = nexdrawinfo2.getIsTransition();
                    nexDrawInfo.mStartTime = nexdrawinfo2.getStartTime();
                    nexDrawInfo.mEndTime = nexdrawinfo2.getEndTime();
                    nexDrawInfoArr[i17] = nexDrawInfo;
                    i17++;
                    i9 = nexdrawinfo2.getEndTime();
                }
                Log.d(TAG, String.format("resolve Project for top drawInfo(%d) --------------------", new Object[]{Integer.valueOf(topDrawInfo.size())}));
            }
            if (nexDrawInfoArr == null || arrayList6.size() <= 0) {
                nexDrawInfoArr2 = null;
            } else {
                Log.d(TAG, String.format("resolve Project for sub drawInfo(%d) ++++++++++++++++++++", new Object[]{Integer.valueOf(arrayList6.size())}));
                nexDrawInfoArr2 = new NexDrawInfo[arrayList6.size()];
                int i18 = 0;
                for (nexDrawInfo nexdrawinfo3 : arrayList6) {
                    NexDrawInfo nexDrawInfo2 = new NexDrawInfo();
                    nexDrawInfo2.mID = nexdrawinfo3.getID();
                    nexDrawInfo2.mTrackID = nexdrawinfo3.getClipID();
                    nexDrawInfo2.mSubEffectID = nexdrawinfo3.getSubEffectID();
                    nexDrawInfo2.mEffectID = nexdrawinfo3.getEffectID();
                    nexDrawInfo2.mTitle = nexdrawinfo3.getTitle();
                    nexDrawInfo2.mStartTime = nexdrawinfo3.getStartTime();
                    nexDrawInfo2.mEndTime = nexdrawinfo3.getEndTime();
                    nexDrawInfo2.mRotateState = nexdrawinfo3.getRotateState();
                    nexDrawInfo2.mUserRotateState = nexdrawinfo3.getUserRotateState();
                    nexDrawInfo2.mTranslateX = nexdrawinfo3.getUserTranslateX();
                    nexDrawInfo2.mTranslateY = nexdrawinfo3.getUserTranslateY();
                    nexDrawInfo2.mBrightness = nexdrawinfo3.getBrightness();
                    nexDrawInfo2.mContrast = nexdrawinfo3.getContrast();
                    nexDrawInfo2.mSaturation = nexdrawinfo3.getSaturation();
                    nexDrawInfo2.mTintcolor = nexdrawinfo3.getTintcolor();
                    nexDrawInfo2.mLUT = nexdrawinfo3.getLUT();
                    nexDrawInfo2.mCustomLUT_A = nexdrawinfo3.getCustomLUTA();
                    nexDrawInfo2.mCustomLUT_B = nexdrawinfo3.getCustomLUTB();
                    nexDrawInfo2.mCustomLUT_Power = nexdrawinfo3.getCustomLUTPower();
                    nexDrawInfo2.mStartRect.setRect(nexdrawinfo3.getStartRect().left, nexdrawinfo3.getStartRect().top, nexdrawinfo3.getStartRect().right, nexdrawinfo3.getStartRect().bottom);
                    nexDrawInfo2.mEndRect.setRect(nexdrawinfo3.getEndRect().left, nexdrawinfo3.getEndRect().top, nexdrawinfo3.getEndRect().right, nexdrawinfo3.getEndRect().bottom);
                    nexDrawInfo2.mFaceRect.setRect(nexdrawinfo3.getFaceRect().left, nexdrawinfo3.getFaceRect().top, nexdrawinfo3.getFaceRect().right, nexdrawinfo3.getFaceRect().bottom);
                    nexDrawInfoArr2[i18] = nexDrawInfo2;
                    i18++;
                }
                Log.d(TAG, String.format("resolve Project for sub drawInfo(%d) --------------------", new Object[]{Integer.valueOf(arrayList6.size())}));
            }
            this.mVideoEditor.asyncDrawInfoList(nexDrawInfoArr, nexDrawInfoArr2);
            long projectAudioFadeInTime = (long) nexproject2.getProjectAudioFadeInTime();
            long projectAudioFadeOutTime = (long) nexproject2.getProjectAudioFadeOutTime();
            long j = projectAudioFadeInTime + projectAudioFadeOutTime;
            long j2 = (long) i9;
            if (j > j2) {
                projectAudioFadeInTime = (projectAudioFadeInTime * j2) / j;
                projectAudioFadeOutTime = j2 - projectAudioFadeInTime;
            }
            if (!(((long) this.mLastProjectFadeIn) == projectAudioFadeInTime && ((long) this.mLastProjectFadeOut) == projectAudioFadeOutTime)) {
                int i19 = (int) projectAudioFadeInTime;
                this.mLastProjectFadeIn = i19;
                int i20 = (int) projectAudioFadeOutTime;
                this.mLastProjectFadeOut = i20;
                this.mVideoEditor.setProjectVolumeFade(i19, i20);
            }
            int projectVolume = nexproject2.getProjectVolume();
            if (this.mLastProjectVolume != projectVolume) {
                this.mLastProjectVolume = projectVolume;
                this.mVideoEditor.setProjectVolume(projectVolume);
            }
            int manualVolumeControl = nexproject2.getManualVolumeControl();
            if (this.mLastManualVolCtl != manualVolumeControl) {
                this.mLastManualVolCtl = manualVolumeControl;
                this.mVideoEditor.setProjectManualVolumeControl(manualVolumeControl);
            }
            i2 = 1;
        } else if (loadClipToEngine(arrayList4, arrayList3, z, z2, 0)) {
            i2 = 1;
            i = 1;
        } else {
            i2 = 1;
            i = 0;
        }
        this.mState = i2;
        return i;
    }

    /* access modifiers changed from: private */
    public void setEditorListener() {
        if (this.mEditorListener == null) {
            this.mEditorListener = new c() {
                public void a() {
                    if (!nexEngine.this.externalImageExportProcessing && nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onSetTimeIgnored();
                    }
                }

                public void a(int i) {
                    if (!nexEngine.this.externalImageExportProcessing) {
                        if (!nexEngine.sTranscodeMode) {
                            nexEngine.this.mCurrentPlayTime = i;
                            if (nexEngine.this.mEventListener != null) {
                                if (nexEngine.this.mState == 2 || nexEngine.this.mPlayState == PlayState.RECORD) {
                                    int access$800 = nexEngine.this.mExportTotalTime;
                                    if (access$800 <= 0) {
                                        access$800 = nexEngine.this.mProject.getTotalTime();
                                    }
                                    int i2 = access$800 <= 0 ? 0 : (i * 100) / access$800;
                                    String str = nexEngine.TAG;
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("[");
                                    sb.append(nexEngine.this.mId);
                                    sb.append("]export progress = ");
                                    sb.append(i2);
                                    sb.append(", duration=");
                                    sb.append(access$800);
                                    sb.append(", currentTime=");
                                    sb.append(i);
                                    Log.d(str, sb.toString());
                                    if (i2 >= 0 && i2 <= 100) {
                                        nexEngine.this.mEventListener.onEncodingProgress(i2);
                                    }
                                } else {
                                    nexEngine.this.mEventListener.onTimeChange(i);
                                }
                            }
                        } else if (nexEngine.sTranscodeListener != null) {
                            int access$8002 = nexEngine.this.mExportTotalTime;
                            if (access$8002 <= 0) {
                                access$8002 = nexEngine.sTranscodeProject.getTotalTime();
                            }
                            int i3 = access$8002 <= 0 ? i / 10 : (i * 100) / access$8002;
                            if (i3 >= 0 && i3 <= 100) {
                                nexEngine.sTranscodeListener.onEncodingProgress(i3);
                            }
                        }
                    }
                }

                public void a(int i, int i2) {
                    if (nexEngine.this.mEventListener != null) {
                        if (i > i2) {
                            i = 100;
                        }
                        nexEngine.this.mEventListener.onProgressThumbnailCaching(i, i2);
                    }
                }

                public void a(ErrorCode errorCode) {
                    if (!nexEngine.this.externalImageExportProcessing && nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onSetTimeFail(errorCode.getValue());
                    }
                }

                public void a(ErrorCode errorCode, int i) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onPlayFail(errorCode.getValue(), i);
                    }
                }

                public void a(ErrorCode errorCode, int i, int i2) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onFastPreviewStartDone(errorCode.getValue(), i, i2);
                    }
                }

                public void a(PlayState playState, PlayState playState2) {
                    String str = nexEngine.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("[");
                    sb.append(nexEngine.this.mId);
                    sb.append("]onStateChange() oldState=");
                    sb.append(playState);
                    sb.append(", newState=");
                    sb.append(playState2);
                    sb.append(",curState=");
                    sb.append(nexEngine.this.mState);
                    sb.append(", trans=");
                    sb.append(nexEngine.sTranscodeMode);
                    Log.i(str, sb.toString());
                    if (playState == PlayState.NONE && playState2 == PlayState.IDLE) {
                        nexEngine.this.mState = 1;
                    } else {
                        nexEngine.this.cacheSeekMode = false;
                    }
                    if (!nexEngine.sTranscodeMode) {
                        nexEngine.this.mPlayState = playState2;
                        if (nexEngine.this.mState == 2 && playState == PlayState.RECORD && playState2 != PlayState.RECORD) {
                            if (playState2 == PlayState.PAUSE) {
                                String str2 = nexEngine.TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("[");
                                sb2.append(nexEngine.this.mId);
                                sb2.append("]new State is ");
                                sb2.append(playState2);
                                Log.d(str2, sb2.toString());
                            } else if (playState2 == PlayState.RESUME) {
                                String str3 = nexEngine.TAG;
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("[");
                                sb3.append(nexEngine.this.mId);
                                sb3.append("]new State is ");
                                sb3.append(playState2);
                                Log.d(str3, sb3.toString());
                            } else {
                                nexEngine.this.mState = 1;
                            }
                        }
                        if (nexEngine.this.mEventListener != null) {
                            nexEngine.this.mEventListener.onStateChange(playState.getValue(), playState2.getValue());
                        }
                    } else if (nexEngine.this.mState == 2 && playState == PlayState.RECORD && playState2 != PlayState.RECORD && nexEngine.sTranscodeListener != null) {
                        nexEngine.sTranscodeListener.onStateChange(playState.getValue(), playState2.getValue());
                    }
                }

                public void a(boolean z) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onSeekStateChanged(z);
                    }
                }

                public void b() {
                    nexEngine.this.mState = 1;
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onPlayEnd();
                    }
                }

                public void b(int i) {
                    if (!nexEngine.this.externalImageExportProcessing) {
                        if (!(nexEngine.this.mState == 2 || nexEngine.this.mEventListener == null)) {
                            nexEngine.this.mEventListener.onSetTimeDone(i);
                        }
                        nexEngine.this.mCurrentPlayTime = i;
                    }
                }

                public void b(int i, int i2) {
                    if (nexEngine.this.mEventListener != null) {
                        if (i > i2) {
                            i = 100;
                        }
                        nexEngine.this.mEventListener.onEncodingProgress(i);
                    }
                }

                public void b(ErrorCode errorCode) {
                    nexEngine.this.mState = 1;
                    String str = nexEngine.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("[");
                    sb.append(nexEngine.this.mId);
                    sb.append("]onEncodingDone() =");
                    sb.append(errorCode);
                    sb.append(", trans=");
                    sb.append(nexEngine.sTranscodeMode);
                    sb.append(", forceMix=");
                    sb.append(nexEngine.this.mForceMixExportMode);
                    Log.i(str, sb.toString());
                    if (nexEngine.sTranscodeMode) {
                        if (nexEngine.sTranscodeListener != null) {
                            if (!errorCode.isError()) {
                                nexEngine.sTranscodeListener.onEncodingProgress(100);
                            }
                            nexEngine.sTranscodeListener.onEncodingDone(errorCode.isError(), errorCode.getValue());
                        }
                        nexEngine.sTranscodeMode = false;
                        nexEngine.this.resolveProject(true, true);
                    } else if (nexEngine.this.mEventListener != null) {
                        if (!errorCode.isError()) {
                            nexEngine.this.mEventListener.onEncodingProgress(100);
                        }
                        nexEngine.this.mEventListener.onEncodingDone(errorCode.isError(), errorCode.getValue());
                    }
                    nexEngine.this.mExportTotalTime = 0;
                }

                public void b(ErrorCode errorCode, int i) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onCheckDirectExport(i);
                    }
                }

                public void c() {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onPlayStart();
                    }
                }

                public void c(int i, int i2) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onPreviewPeakMeter(i, i2);
                    }
                }

                public void c(ErrorCode errorCode) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onEncodingDone(errorCode.isError(), errorCode.getValue());
                    }
                }

                public void d() {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onClipInfoDone();
                    }
                }

                public void d(ErrorCode errorCode) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onFastPreviewStopDone(errorCode.getValue());
                    }
                }

                public void e(ErrorCode errorCode) {
                    if (nexEngine.this.mEventListener != null) {
                        nexEngine.this.mEventListener.onFastPreviewTimeDone(errorCode.getValue());
                    }
                }
            };
            this.mVideoEditor.a(this.mEditorListener);
        }
    }

    public static void setExportVideoTrackUUID(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setExportVideoTrackUUID()=");
        sb.append(z);
        Log.i(str, sb.toString());
        if (z) {
            sExportVideoTrackUUIDMode = 1;
        } else {
            sExportVideoTrackUUIDMode = 0;
        }
    }

    public static void setLoadListAsync(boolean z) {
        sLoadListAsync = z;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0030, code lost:
        return;
     */
    private void setOverlays(OverlayCommand overlayCommand) {
        synchronized (this.m_layerRenderLock) {
            switch (overlayCommand) {
                case clear:
                    this.mActiveRenderLayers.clear();
                    b.a().b();
                    break;
                case upload:
                    if (this.mProject != null) {
                        this.mActiveRenderLayers.clear();
                        break;
                    } else {
                        return;
                    }
                case lock:
                    this.m_layerLock = true;
                    break;
                case unlock:
                    this.m_layerLock = false;
                    break;
            }
        }
    }

    private int transcode(String str, int i, int i2, int i3, long j, final int i4, final int i5) {
        if (this.mState == 2) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("]already export state");
            Log.w(str2, sb.toString());
            return -1;
        } else if (!isSetProject(true)) {
            return -1;
        } else {
            setOverlays(OverlayCommand.upload);
            resolveProject(sLoadListAsync, true);
            this.mState = 2;
            this.mExportTotalTime = sTranscodeProject.getTotalTime();
            this.mExportFilePath = str;
            this.mEncodeWidth = i;
            this.mEncodeHeight = i2;
            this.mEncodeBitrate = i3;
            this.mEncodeMaxFileSize = j;
            this.mVideoEditor.a(this.mAppContext).onComplete(new OnTaskEventListener() {
                public void onTaskEvent(Task task, Event event) {
                    nexEngine.this.loadEffectsInEditor(true);
                    nexEngine.this.setEditorListener();
                    int i = i5;
                    int i2 = i != 90 ? i != 180 ? i != 270 ? 0 : 64 : 32 : 16;
                    if (nexEngine.this.bNeedScaling) {
                        nexEngine.this.bNeedScaling = false;
                        i2 |= nexEngine.ExportHEVCMainTierLevel6;
                    }
                    int i3 = i2 | 4096;
                    nexEngine.this.mVideoEditor.a(nexEngine.sExportVideoTrackUUIDMode, (byte[]) null);
                    nexEngine.this.mVideoEditor.a(nexEngine.this.mExportFilePath, nexEngine.this.mEncodeWidth, nexEngine.this.mEncodeHeight, nexEngine.this.mEncodeBitrate, nexEngine.this.mEncodeMaxFileSize, 0, false, i4, i3).onFailure((OnFailListener) new OnFailListener() {
                        public void onFail(Task task, Event event, TaskError taskError) {
                            String str = nexEngine.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("[");
                            sb.append(nexEngine.this.mId);
                            sb.append("]transcode fail!=");
                            sb.append(taskError);
                            Log.e(str, sb.toString());
                        }
                    });
                }
            });
            return 0;
        }
    }

    private void undoForceMixProject() {
        if (this.mForceMixExportMode) {
            if (isSetProject(false)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("[");
                sb.append(this.mId);
                sb.append("]undoForceMixProject");
                Log.d(str, sb.toString());
                resolveProject(true, true);
            }
            this.mForceMixExportMode = false;
        }
    }

    /* access modifiers changed from: private */
    public void updateFaceInfo2Clip(nexClip nexclip, int i, RectF rectF, int i2) {
        boolean z;
        Rect rect;
        nexDrawInfo nexdrawinfo;
        nexClip nexclip2 = nexclip;
        RectF rectF2 = rectF;
        int i3 = i2;
        Rect rect2 = new Rect();
        Rect rect3 = new Rect();
        Rect rect4 = new Rect();
        int width = nexclip.getCrop().getWidth();
        int height = nexclip.getCrop().getHeight();
        int faceDetectSpeed = nexclip.getCrop().getFaceDetectSpeed();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Face Detection speed: ");
        sb.append(faceDetectSpeed);
        Log.d(str, sb.toString());
        rect4.set(0, 0, width, height);
        float f = (float) width;
        float f2 = (float) height;
        rect3.set((int) (rectF2.left * f), (int) (rectF2.top * f2), (int) (rectF2.right * f), (int) (rectF2.bottom * f2));
        rect2.set((int) (rectF2.left * f), (int) (rectF2.top * f2), (int) (rectF2.right * f), (int) (rectF2.bottom * f2));
        if (rect3.isEmpty()) {
            rect3.set(0, 0, width, height);
            double d = (double) width;
            double random = Math.random();
            Double.isNaN(d);
            int i4 = (int) ((d * random) / 4.0d);
            double d2 = (double) height;
            double random2 = Math.random();
            Double.isNaN(d2);
            rect3.offset(i4, (int) ((d2 * random2) / 4.0d));
            Log.d(TAG, "Face Detection Empty ");
            z = false;
        } else {
            int width2 = width - rect3.width();
            if (width2 >= 2) {
                int i5 = width2 / 8;
                rect3.left -= i5;
                rect3.right += i5;
                Log.d(TAG, "Face Detection width addSpace > 0");
            }
            int height2 = height - rect3.height();
            if (height2 >= 2) {
                int i6 = height2 / 8;
                rect3.top -= i6;
                rect3.bottom += i6;
                Log.d(TAG, "Face Detection height addSpace>0");
            }
            z = true;
        }
        if (nexclip.getDrawInfos() == null || nexclip.getDrawInfos().size() <= 0) {
            rect = rect2;
            Rect rect5 = new Rect(rect);
            Rect rect6 = new Rect(rect3);
            Rect rect7 = new Rect(rect4);
            if (rectF.isEmpty() || nexclip.getCrop().getEndPosionLock()) {
                nexclip.getCrop().getStartPositionRaw(rect3);
                nexclip.getCrop().getEndPositionRaw(rect4);
                this.mVideoEditor.a(i, nexclip.isFaceDetected() ? 1 : 0, rect3, rect4, rect4);
                nexclip2.setFaceDetectProcessed(false, rect4);
                return;
            }
            nexclip.getCrop().growToAspect(rect6, nexApplicationConfig.getAspectRatio());
            Rect rect8 = rect7;
            Rect rect9 = rect6;
            Rect rect10 = rect5;
            nexclip.getCrop().applyCropSpeed(rect7, rect6, width, height, faceDetectSpeed, nexclip.getProjectDuration());
            if (z) {
                nexclip.getCrop().shrinkToAspect(rect9, nexApplicationConfig.getAspectRatio());
                nexclip.getCrop().shrinkToAspect(rect8, nexApplicationConfig.getAspectRatio());
                Log.d(TAG, "Face Detection true");
                if (rect10.top < rect8.top) {
                    int i7 = rect8.top - rect10.top;
                    rect8.top -= i7;
                    rect8.bottom -= i7;
                }
                if (this.bLetterBox) {
                    int i8 = (rect9.right - rect9.left) / 4;
                    rect9.left -= i8;
                    rect9.right += i8;
                    int i9 = (rect9.bottom - rect9.top) / 4;
                    rect9.top -= i9;
                    rect9.bottom += i9;
                    nexclip.getCrop().growToAspect(rect9, nexApplicationConfig.getAspectRatio());
                }
                nexclip.getCrop().setStartPosition(rect8);
                nexclip.getCrop().setEndPosition(rect9);
                nexclip.getCrop().setFacePosition(rect10);
                nexclip.getCrop().getStartPositionRaw(rect8);
                nexclip.getCrop().getEndPositionRaw(rect9);
                nexclip.getCrop().getFacePositionRaw(rect10);
            } else {
                if (i3 == 2) {
                    nexclip.getCrop().shrinkToAspect(rect9, nexApplicationConfig.getAspectRatio());
                    nexclip.getCrop().growToAspect(rect8, nexApplicationConfig.getAspectRatio());
                    nexclip.getCrop().setStartPosition(rect8);
                    nexclip.getCrop().setEndPosition(rect9);
                    nexclip.getCrop().setFacePosition(rect10);
                    nexclip.getCrop().getStartPositionRaw(rect8);
                    nexclip.getCrop().getEndPositionRaw(rect9);
                    nexclip.getCrop().getFacePositionRaw(rect10);
                } else {
                    nexclip.getCrop().shrinkToAspect(rect9, nexApplicationConfig.getAspectRatio());
                    nexclip.getCrop().shrinkToAspect(rect8, nexApplicationConfig.getAspectRatio());
                    nexclip.getCrop().setStartPosition(rect9);
                    nexclip.getCrop().setEndPosition(rect8);
                    nexclip.getCrop().setFacePosition(rect10);
                    nexclip.getCrop().getStartPositionRaw(rect9);
                    nexclip.getCrop().getEndPositionRaw(rect8);
                    nexclip.getCrop().getFacePositionRaw(rect10);
                }
                Log.d(TAG, "Face Detection false  ");
            }
            this.mVideoEditor.a(i, z ? 1 : 0, rect8, rect9, rect10);
        } else {
            for (nexDrawInfo nexdrawinfo2 : nexclip.getDrawInfos()) {
                if (nexdrawinfo2.getFaceRect().isEmpty()) {
                    Rect rect11 = new Rect(rect2);
                    Rect rect12 = new Rect(rect3);
                    Rect rect13 = new Rect(rect4);
                    if (rectF.isEmpty() || nexclip.getCrop().getEndPosionLock()) {
                        Rect rect14 = rect2;
                        nexDrawInfo nexdrawinfo3 = nexdrawinfo2;
                        nexclip.getCrop().getStartPositionRaw(rect3);
                        nexclip.getCrop().getEndPositionRaw(rect4);
                        nexdrawinfo3.setStartRect(rect3);
                        nexdrawinfo3.setEndRect(rect4);
                        nexdrawinfo3.setFaceRect(rect4);
                        updateDrawInfo(nexdrawinfo3);
                        nexclip2 = nexclip;
                        nexclip2.setFaceDetectProcessed(false, rect4);
                        rect2 = rect14;
                    } else {
                        nexclip.getCrop().growToAspect(rect12, nexdrawinfo2.getRatio());
                        Rect rect15 = rect12;
                        nexCrop crop = nexclip.getCrop();
                        Rect rect16 = rect11;
                        nexDrawInfo nexdrawinfo4 = nexdrawinfo2;
                        Rect rect17 = rect2;
                        Rect rect18 = rect15;
                        crop.applyCropSpeed(rect13, rect15, width, height, faceDetectSpeed, nexclip.getProjectDuration());
                        if (z) {
                            nexclip.getCrop().shrinkToAspect(rect18, nexdrawinfo4.getRatio());
                            nexclip.getCrop().shrinkToAspect(rect13, nexdrawinfo4.getRatio());
                            Log.d(TAG, "Face Detection true");
                            if (rect16.top < rect13.top) {
                                int i10 = rect13.top - rect16.top;
                                rect13.top -= i10;
                                rect13.bottom -= i10;
                            }
                            if (this.bLetterBox) {
                                int i11 = (rect18.right - rect18.left) / 4;
                                rect18.left -= i11;
                                rect18.right += i11;
                                int i12 = (rect18.bottom - rect18.top) / 4;
                                rect18.top -= i12;
                                rect18.bottom += i12;
                                nexclip.getCrop().growToAspect(rect18, nexdrawinfo4.getRatio());
                            }
                            nexclip.getCrop().setStartPosition(rect13);
                            nexclip.getCrop().setEndPosition(rect18);
                            nexclip.getCrop().setFacePosition(rect16);
                            nexclip.getCrop().getStartPositionRaw(rect13);
                            nexclip.getCrop().getEndPositionRaw(rect18);
                            nexclip.getCrop().getFacePositionRaw(rect16);
                            nexdrawinfo = nexdrawinfo4;
                        } else {
                            if (i3 == 2) {
                                nexclip.getCrop().shrinkToAspect(rect18, nexdrawinfo4.getRatio());
                                nexclip.getCrop().growToAspect(rect13, nexdrawinfo4.getRatio());
                                nexclip.getCrop().setStartPosition(rect13);
                                nexclip.getCrop().setEndPosition(rect18);
                                nexclip.getCrop().setFacePosition(rect16);
                                nexclip.getCrop().getStartPositionRaw(rect13);
                                nexclip.getCrop().getEndPositionRaw(rect18);
                                nexclip.getCrop().getFacePositionRaw(rect16);
                            } else {
                                nexclip.getCrop().shrinkToAspect(rect18, nexdrawinfo4.getRatio());
                                nexclip.getCrop().shrinkToAspect(rect13, nexdrawinfo4.getRatio());
                                nexclip.getCrop().setStartPosition(rect18);
                                nexclip.getCrop().setEndPosition(rect13);
                                nexclip.getCrop().setFacePosition(rect16);
                                nexclip.getCrop().getStartPositionRaw(rect18);
                                nexclip.getCrop().getEndPositionRaw(rect13);
                                nexclip.getCrop().getFacePositionRaw(rect16);
                            }
                            rect16.set(0, 0, 1, 1);
                            Log.d(TAG, "Face Detection false  ");
                            nexdrawinfo = nexdrawinfo4;
                        }
                        nexdrawinfo.setStartRect(rect18);
                        nexdrawinfo.setEndRect(rect13);
                        nexdrawinfo.setFaceRect(rect16);
                        updateDrawInfo(nexdrawinfo);
                        rect2 = rect17;
                        nexclip2 = nexclip;
                    }
                    RectF rectF3 = rectF;
                }
            }
            rect = rect2;
            nexclip.getCrop().setFacePosition(rect);
            nexclip.getCrop().getFacePositionRaw(rect);
        }
        nexclip2.setFaceDetectProcessed(z, rect);
    }

    @Deprecated
    public boolean KineMixExport(String str) {
        return false;
    }

    public int addUdta(int i, String str) {
        return this.mVideoEditor.addUDTA(i, str);
    }

    public int autoTrim(String str, int i, int i2, final OnAutoTrimRatioResultListener onAutoTrimRatioResultListener) {
        if (onAutoTrimRatioResultListener != null) {
            this.mVideoEditor.a((s) new s() {
                public int a(int i) {
                    onAutoTrimRatioResultListener.onAutoTrimRatioResult(i, null, null);
                    return 0;
                }

                public int a(int i, int[] iArr, int[] iArr2) {
                    onAutoTrimRatioResultListener.onAutoTrimRatioResult(0, iArr, iArr2);
                    return 0;
                }
            });
        }
        this.mVideoEditor.a(str, 1, i, 1, 0, i2, 1);
        return 0;
    }

    public int autoTrim(String str, boolean z, int i, int i2, int i3, OnAutoTrimResultListener onAutoTrimResultListener) {
        final OnAutoTrimResultListener onAutoTrimResultListener2 = onAutoTrimResultListener;
        if (onAutoTrimResultListener2 != null) {
            this.mVideoEditor.a((l) new l() {
                public int a(int i) {
                    onAutoTrimResultListener2.onAutoTrimResult(i, null);
                    return 0;
                }

                public int a(int i, int[] iArr) {
                    onAutoTrimResultListener2.onAutoTrimResult(0, iArr);
                    return 0;
                }
            });
        }
        this.mVideoEditor.a(str, z ? 1 : 0, i, i2, i3, 0, 0);
        return 0;
    }

    public int autoTrimStop() {
        return this.mVideoEditor.z();
    }

    public OverlayPreviewBuilder buildOverlayPreview(int i) {
        return new OverlayPreviewBuilder(i);
    }

    @Deprecated
    public void cancelKineMixExport() {
    }

    public nexErrorCode captureCurrentFrame(final OnCaptureListener onCaptureListener) {
        return onCaptureListener == null ? nexErrorCode.ARGUMENT_FAILED : this.mVideoEditor.x() ? nexErrorCode.fromValue(this.mVideoEditor.a(this.lastSeekTime, (e) new e() {
            public void a(Bitmap bitmap) {
                onCaptureListener.onCapture(bitmap);
            }

            public void a(ErrorCode errorCode) {
                onCaptureListener.onCaptureFail(nexErrorCode.fromValue(errorCode.getValue()));
            }
        }).getValue()) : nexErrorCode.fromValue(this.mVideoEditor.a((e) new e() {
            public void a(Bitmap bitmap) {
                onCaptureListener.onCapture(bitmap);
            }

            public void a(ErrorCode errorCode) {
                onCaptureListener.onCaptureFail(nexErrorCode.fromValue(errorCode.getValue()));
            }
        }).getValue());
    }

    public int checkDirectExport() {
        return checkDirectExport(0);
    }

    public int checkDirectExport(int i) {
        if (!this.mProject.getOverlayItems().isEmpty()) {
            return 8;
        }
        setEditorListener();
        this.lastCheckDirectExportOption = i;
        return this.mVideoEditor.checkDirectExport(i);
    }

    @Deprecated
    public int checkKineMixExport(boolean z) {
        return 2;
    }

    @Deprecated
    public boolean checkKineMixExport() {
        return false;
    }

    @Deprecated
    public boolean checkKineMixExport(String str, String str2) {
        return false;
    }

    public boolean checkPFrameDirectExportSync(String str) {
        return this.mVideoEditor.checkPFrameDirectExportSync(str) == 0;
    }

    public void clearFaceDetectInfo() {
        if (this.mProject != null) {
            this.mProject.clearFaceDetectInfo();
        }
    }

    public void clearOverlayCache() {
        setOverlays(OverlayCommand.clear);
    }

    public void clearProject() {
        clearList();
        this.mProject = null;
    }

    public int clearScreen() {
        if (this.mVideoEditor == null) {
            return 1;
        }
        this.mVideoEditor.r();
        return 0;
    }

    public void clearTrackCache() {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.clearTrackCache();
            setOverlays(OverlayCommand.clear);
        }
    }

    public int clearUdta() {
        return this.mVideoEditor.clearUDTA();
    }

    public boolean directExport(String str, long j, long j2) {
        return directExport(str, j, j2, this.lastCheckDirectExportOption);
    }

    public boolean directExport(String str, long j, long j2, int i) {
        if (!isSetProject(true)) {
            return false;
        }
        this.mState = 2;
        if (str == null) {
            return false;
        }
        this.mExportTotalTime = this.mProject.getTotalTime();
        this.mExportFilePath = str;
        this.mEncodeMaxFileSize = j;
        setEditorListener();
        this.mVideoEditor.a(sExportVideoTrackUUIDMode, (byte[]) null);
        this.mVideoEditor.directExport(this.mExportFilePath, this.mEncodeMaxFileSize, j2, EditorGlobal.b("up"), i);
        return true;
    }

    public int export(String str, int i, int i2, int i3, long j, int i4) {
        return export(str, i, i2, i3, j, i4, export_audio_sampling_rate, 0, 0, export_fps, ExportCodec_AVC);
    }

    public int export(String str, int i, int i2, int i3, long j, int i4, int i5) {
        return export(str, i, i2, i3, j, i4, i5, 0, 0, export_fps, ExportCodec_AVC);
    }

    public int export(String str, int i, int i2, int i3, long j, int i4, int i5, int i6) {
        return export(str, i, i2, i3, j, i4, i5, 0, 0, i6, ExportCodec_AVC);
    }

    public int export(String str, int i, int i2, int i3, long j, int i4, int i5, int i6, int i7, int i8, int i9) {
        if (this.mState == 2) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("]already export state");
            Log.w(str2, sb.toString());
            return -1;
        } else if (!isSetProject(true)) {
            return -1;
        } else {
            stopAsyncFaceDetect();
            setOverlays(OverlayCommand.upload);
            resolveProject(sLoadListAsync, true);
            faceDetect_internal(this.facedetect_asyncmode, this.facedetect_syncclip_count, this.facedetect_undetected_clip_cropping_mode);
            this.mState = 2;
            setThumbnailRoutine(2);
            this.mExportTotalTime = this.mProject.getTotalTime();
            this.mExportFilePath = str;
            this.mEncodeWidth = i;
            this.mEncodeHeight = i2;
            this.mEncodeBitrate = i3;
            this.mEncodeMaxFileSize = j;
            Task a2 = this.mVideoEditor.a(this.mAppContext);
            final int i10 = i4;
            final int i11 = i5;
            final int i12 = i6;
            final int i13 = i7;
            final int i14 = i8;
            final int i15 = i9;
            AnonymousClass18 r0 = new OnTaskEventListener() {
                public void onTaskEvent(Task task, Event event) {
                    nexEngine.this.loadEffectsInEditor(true);
                    nexEngine.this.setEditorListener();
                    int i = i10;
                    int i2 = i != 90 ? i != 180 ? i != 270 ? 0 : 64 : 32 : 16;
                    if (nexEngine.this.bNeedScaling) {
                        nexEngine.this.bNeedScaling = false;
                        i2 |= nexEngine.ExportHEVCMainTierLevel6;
                    }
                    int i3 = i2;
                    nexEngine.this.mVideoEditor.a((i) null);
                    nexEngine.this.mVideoEditor.a(nexEngine.sExportVideoTrackUUIDMode, (byte[]) null);
                    nexEngine.this.mVideoEditor.a(nexEngine.this.mExportFilePath, nexEngine.this.mEncodeWidth, nexEngine.this.mEncodeHeight, nexEngine.this.mEncodeBitrate, nexEngine.this.mEncodeMaxFileSize, 0, false, i11, i12, i13, i14, i15, i3).onFailure((OnFailListener) new OnFailListener() {
                        public void onFail(Task task, Event event, TaskError taskError) {
                            String str = nexEngine.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("[");
                            sb.append(nexEngine.this.mId);
                            sb.append("]export fail!=");
                            sb.append(taskError);
                            Log.e(str, sb.toString());
                        }
                    });
                }
            };
            a2.onComplete(r0);
            return 0;
        }
    }

    public nexErrorCode export(nexExportFormat nexexportformat, nexExportListener nexexportlistener) {
        nexExportFormat nexexportformat2 = nexexportformat;
        final nexExportListener nexexportlistener2 = nexexportlistener;
        String string = nexexportformat2.getString(nexExportFormat.TAG_FORMAT_TYPE);
        if (string == null) {
            return nexErrorCode.ARGUMENT_FAILED;
        }
        if (string.startsWith("external-")) {
            if (this.mState == 2) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("[");
                sb.append(this.mId);
                sb.append("]already external export state");
                Log.w(str, sb.toString());
                return nexErrorCode.INVALID_STATE;
            }
            int parseInt = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_WIDTH));
            int parseInt2 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_HEIGHT));
            int parseInt3 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_INTERVAL_TIME));
            int parseInt4 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_START_TIME));
            int parseInt5 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_END_TIME));
            if (parseInt5 > this.mProject.getTotalTime()) {
                parseInt5 = this.mProject.getTotalTime();
            }
            int i = parseInt5;
            if (parseInt4 > i) {
                return nexErrorCode.ARGUMENT_FAILED;
            }
            v externalExport = getExternalExport(nexexportformat2, string.substring(9), (String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_UUID), nexexportlistener2);
            if (externalExport == null) {
                return nexErrorCode.DIRECTEXPORT_ENC_ENCODE_ERROR;
            }
            this.externalImageExportProcessing = true;
            if (ErrorCode.NONE == this.mVideoEditor.a(parseInt, parseInt2, parseInt3, parseInt4, i, externalExport)) {
                this.mState = 2;
                return nexErrorCode.NONE;
            }
            this.externalImageExportProcessing = false;
            externalExport.a();
            externalExport.a(-1);
            if (nexexportlistener2 != null) {
                nexexportlistener2.onExportFail(nexErrorCode.INVALID_STATE);
            }
        }
        if (string.compareTo("bitmap") == 0) {
            return nexexportlistener2 == null ? nexErrorCode.ARGUMENT_FAILED : nexErrorCode.fromValue(this.mVideoEditor.a(Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_WIDTH)), Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_HEIGHT)), Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_TAG)), (e) new e() {
                public void a(Bitmap bitmap) {
                    nexexportlistener2.onExportDone(bitmap);
                }

                public void a(ErrorCode errorCode) {
                    nexexportlistener2.onExportFail(nexErrorCode.fromValue(errorCode.getValue()));
                }
            }).getValue());
        } else if (string.compareTo("jpeg") == 0) {
            final String str2 = (String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_PATH);
            int parseInt6 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_WIDTH));
            int parseInt7 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_HEIGHT));
            final int parseInt8 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_QUALITY));
            return (str2 == null || str2.length() <= 0 || parseInt6 <= 0 || parseInt7 <= 0 || parseInt8 <= 0 || parseInt8 > 100) ? nexErrorCode.ARGUMENT_FAILED : nexErrorCode.fromValue(this.mVideoEditor.a(parseInt6, parseInt7, 0, (e) new e() {
                public void a(Bitmap bitmap) {
                    ErrorCode errorCode = ErrorCode.NONE;
                    File file = new File(str2);
                    if (file.exists()) {
                        file.delete();
                    }
                    try {
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        bitmap.compress(CompressFormat.JPEG, parseInt8, fileOutputStream);
                        fileOutputStream.flush();
                        fileOutputStream.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        errorCode = ErrorCode.EXPORT_WRITER_INIT_FAIL;
                    }
                    if (nexexportlistener2 != null) {
                        nexexportlistener2.onExportDone(null);
                    } else if (nexEngine.this.mEditorListener != null) {
                        nexEngine.this.mEditorListener.b(errorCode);
                    }
                }

                public void a(ErrorCode errorCode) {
                    if (nexexportlistener2 != null) {
                        nexexportlistener2.onExportFail(nexErrorCode.fromValue(errorCode.getValue()));
                    } else if (nexEngine.this.mEditorListener != null) {
                        nexEngine.this.mEditorListener.b(errorCode);
                    }
                }
            }).getValue());
        } else if (string.compareTo("mp4") != 0) {
            return nexErrorCode.UNSUPPORT_FORMAT;
        } else {
            try {
                String str3 = (String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_PATH);
                int parseInt9 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_WIDTH));
                int parseInt10 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_HEIGHT));
                int parseInt11 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_VIDEO_CODEC));
                int parseInt12 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_VIDEO_BITRATE));
                int parseInt13 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_VIDEO_PROFILE));
                int parseInt14 = Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_VIDEO_LEVEL));
                try {
                    if (export(str3, parseInt9, parseInt10, parseInt12, Long.parseLong((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_MAX_FILESIZE)), Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_VIDEO_ROTATE)), Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_AUDIO_SAMPLERATE)), parseInt13, parseInt14, Integer.parseInt((String) nexexportformat2.formats.get(nexExportFormat.TAG_FORMAT_VIDEO_FPS)), parseInt11) != 0) {
                        return nexErrorCode.UNKNOWN;
                    }
                    this.mVideoEditor.a((i) new i() {
                        public void a() {
                            nexexportlistener2.onExportDone(null);
                        }

                        public void a(int i) {
                            nexexportlistener2.onExportProgress((i * 100) / nexEngine.this.mProject.getTotalTime());
                        }

                        public void a(ErrorCode errorCode) {
                            nexexportlistener2.onExportFail(nexErrorCode.fromValue(errorCode.getValue()));
                        }
                    });
                    return nexErrorCode.NONE;
                } catch (Exception unused) {
                    return nexErrorCode.UNKNOWN;
                }
            } catch (Exception unused2) {
                return nexErrorCode.ARGUMENT_FAILED;
            }
        }
    }

    public nexErrorCode exportJpeg(String str, int i, int i2, int i3, final OnCaptureListener onCaptureListener) {
        return onCaptureListener == null ? nexErrorCode.ARGUMENT_FAILED : nexErrorCode.fromValue(this.mVideoEditor.a(i, i2, 0, (e) new e() {
            public void a(Bitmap bitmap) {
                onCaptureListener.onCapture(bitmap);
            }

            public void a(ErrorCode errorCode) {
                onCaptureListener.onCaptureFail(nexErrorCode.fromValue(errorCode.getValue()));
            }
        }).getValue());
    }

    public int exportNoException(String str, int i, int i2, int i3, long j, int i4, int i5, int i6, int i7, int i8) {
        try {
            return export(str, i, i2, i3, j, i4, i5, i6, i7, i8, ExportCodec_AVC);
        } catch (Exception unused) {
            return -2;
        }
    }

    public int exportNoException(String str, int i, int i2, int i3, long j, int i4, int i5, int i6, int i7, int i8, int i9) {
        try {
            return export(str, i, i2, i3, j, i4, i5, i6, i7, i8, i9);
        } catch (Exception unused) {
            return -2;
        }
    }

    public int exportPause() {
        if (this.externalImageExportProcessing) {
            return -1;
        }
        return this.mVideoEditor.encodePause();
    }

    public int exportResume() {
        if (this.externalImageExportProcessing) {
            return -1;
        }
        return this.mVideoEditor.encodeResume();
    }

    public void exportSaveStop(final OnCompletionListener onCompletionListener) {
        if (!this.externalImageExportProcessing) {
            if (isSetProject(false)) {
                this.mState = 1;
                this.mVideoEditor.a(1, (f) new f() {
                    public void a(ErrorCode errorCode) {
                        onCompletionListener.onComplete(errorCode.getValue());
                        nexEngine.this.mState = 1;
                    }
                });
            } else {
                onCompletionListener.onComplete(21);
            }
        }
    }

    @Deprecated
    public int faceDetect(boolean z, int i, nexUndetectedFaceCrop nexundetectedfacecrop) {
        this.facedetect_asyncmode = true;
        this.facedetect_syncclip_count = 0;
        this.facedetect_undetected_clip_cropping_mode = nexundetectedfacecrop.getValue();
        return (com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a() == null || this.facedetect_undetected_clip_cropping_mode == 0) ? 0 : 1;
    }

    public int faceDetect_for_seek(int i, int i2) {
        Log.d(TAG, String.format("Face Detection Mode = %d", new Object[]{Integer.valueOf(i2)}));
        if (i2 == 0) {
            return -1;
        }
        int totalClipCount = this.mProject.getTotalClipCount(true);
        for (int i3 = 0; i3 < totalClipCount; i3++) {
            nexClip clip = this.mProject.getClip(i3, true);
            if (clip.getClipType() == 1 && clip.mStartTime <= i && i <= clip.mEndTime && !clip.isAssetResource()) {
                com.nexstreaming.kminternal.kinemaster.utils.facedetect.a a2 = com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(clip.getPath());
                if (a2 == null) {
                    a2 = new com.nexstreaming.kminternal.kinemaster.utils.facedetect.a(new File(clip.getPath()), true, getAppContext());
                    com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(clip.getPath(), a2);
                }
                RectF rectF = new RectF();
                a2.a(rectF);
                updateFaceInfo2Clip(clip, i3 + 1, rectF, i2);
            }
        }
        return 0;
    }

    public int faceDetect_internal(boolean z, int i, int i2) {
        int i3;
        final int i4 = i2;
        Log.d(TAG, String.format("Face Detection Mode = %d", new Object[]{Integer.valueOf(i2)}));
        if (i4 == 0) {
            return -1;
        }
        int totalClipCount = this.mProject.getTotalClipCount(true);
        int i5 = 0;
        for (int i6 = 0; i6 < totalClipCount; i6++) {
            if (this.mProject.getClip(i6, true).getClipType() == 1) {
                i5++;
            }
        }
        if (true == z) {
            i5 = i;
        }
        int i7 = 0;
        while (i7 < totalClipCount) {
            int i8 = i7 + 1;
            Log.d(TAG, String.format("Face Detection ResetInfo clip ID = %d", new Object[]{Integer.valueOf(i8)}));
            if (this.mProject.getClip(i7, true).getClipType() == 1) {
                this.mVideoEditor.b(i8);
            }
            i7 = i8;
        }
        int i9 = 0;
        final int i10 = 0;
        while (i9 < totalClipCount) {
            RectF rectF = new RectF();
            int i11 = i9 + 1;
            Log.d(TAG, String.format("Face Detection sync clip ID = %d", new Object[]{Integer.valueOf(i11)}));
            nexClip clip = this.mProject.getClip(i9, true);
            if (clip.getClipType() == 1 && !clip.isFaceDetectProcessed() && !clip.isAssetResource()) {
                com.nexstreaming.kminternal.kinemaster.utils.facedetect.a a2 = com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(clip.getPath());
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Face Detection sync total num =");
                sb.append(i5);
                sb.append(" continueClip num= ");
                sb.append(i10);
                Log.d(str, sb.toString());
                if (a2 == null) {
                    if (i9 > i5 - 1) {
                        break;
                    }
                    a2 = new com.nexstreaming.kminternal.kinemaster.utils.facedetect.a(new File(clip.getPath()), true, getAppContext());
                    com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(clip.getPath(), a2);
                }
                a2.a(rectF);
                updateFaceInfo2Clip(clip, i11, rectF, i4);
                i10++;
            } else if (clip.getClipType() == 1) {
                Rect rect = new Rect();
                Rect rect2 = new Rect();
                Rect rect3 = new Rect();
                Log.d(TAG, String.format("Face Detection skip clip ID = %d", new Object[]{Integer.valueOf(i11)}));
                if (clip.getDrawInfos() == null || clip.getDrawInfos().size() <= 0) {
                    clip.getCrop().getStartPositionRaw(rect);
                    clip.getCrop().getEndPositionRaw(rect3);
                    clip.getCrop().getFacePositionRaw(rect2);
                    NexEditor nexEditor = this.mVideoEditor;
                    boolean isFaceDetected = clip.isFaceDetected();
                    i3 = i11;
                    nexEditor.a(i11, isFaceDetected ? 1 : 0, rect, rect3, rect2);
                } else {
                    for (nexDrawInfo nexdrawinfo : clip.getDrawInfos()) {
                        if (nexdrawinfo.getFaceRect().isEmpty()) {
                            clip.getCrop().getStartPositionRaw(rect);
                            clip.getCrop().getEndPositionRaw(rect3);
                            clip.getCrop().getFacePositionRaw(rect2);
                            nexdrawinfo.setStartRect(rect);
                            nexdrawinfo.setEndRect(rect3);
                            nexdrawinfo.setFaceRect(rect2);
                            updateDrawInfo(nexdrawinfo);
                            Log.d(TAG, String.format("Face Detection info update for draw info(clip ID = %d)", new Object[]{Integer.valueOf(i11)}));
                        }
                    }
                    i3 = i11;
                }
                i10++;
                i9 = i3;
            }
            i3 = i11;
            i9 = i3;
        }
        while (i10 < totalClipCount) {
            final nexClip clip2 = this.mProject.getClip(i10, true);
            if (clip2.getClipType() == 1 && !clip2.isFaceDetectProcessed() && !clip2.isAssetResource()) {
                Log.d(TAG, String.format("Face Detection async clip ID = %d", new Object[]{Integer.valueOf(i10 + 1)}));
                AnonymousClass11 r5 = new AsyncTask<String, Void, com.nexstreaming.kminternal.kinemaster.utils.facedetect.a>() {
                    TaskError a = null;

                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public com.nexstreaming.kminternal.kinemaster.utils.facedetect.a doInBackground(String... strArr) {
                        String str = nexEngine.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Face Detection async thread start =");
                        sb.append(strArr[0]);
                        Log.d(str, sb.toString());
                        if (i10 == 0) {
                            nexEngine.this.mVideoEditor.e();
                        }
                        com.nexstreaming.kminternal.kinemaster.utils.facedetect.a a2 = com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(strArr[0]);
                        if (a2 != null) {
                            return a2;
                        }
                        com.nexstreaming.kminternal.kinemaster.utils.facedetect.a aVar = new com.nexstreaming.kminternal.kinemaster.utils.facedetect.a(new File(strArr[0]), 1, nexEngine.this.getAppContext());
                        com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a(strArr[0], aVar);
                        return aVar;
                    }

                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void onPostExecute(com.nexstreaming.kminternal.kinemaster.utils.facedetect.a aVar) {
                        nexEngine.this.async_facedetect_worker_list_.remove(this);
                        String str = nexEngine.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Face Detection worker list size:");
                        sb.append(nexEngine.this.async_facedetect_worker_list_.size());
                        Log.d(str, sb.toString());
                        RectF rectF = new RectF();
                        aVar.a(rectF);
                        nexEngine.this.updateFaceInfo2Clip(clip2, i10 + 1, rectF, i4);
                        String str2 = nexEngine.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Face Detection aync thread end =");
                        sb2.append(clip2.getPath());
                        Log.d(str2, sb2.toString());
                    }

                    /* access modifiers changed from: protected */
                    public void onCancelled() {
                        Log.d(nexEngine.TAG, "Face Detection was cancelled");
                    }
                };
                this.async_facedetect_worker_list_.add(r5);
                r5.executeOnExecutor(AsyncTask.SERIAL_EXECUTOR, new String[]{clip2.getPath()});
            } else if (clip2.getClipType() == 1) {
                Rect rect4 = new Rect();
                Rect rect5 = new Rect();
                Rect rect6 = new Rect();
                int i12 = i10 + 1;
                Log.d(TAG, String.format("Face Detection skip clip ID = %d", new Object[]{Integer.valueOf(i12)}));
                if (clip2.getDrawInfos() == null || clip2.getDrawInfos().size() <= 0) {
                    clip2.getCrop().getStartPositionRaw(rect4);
                    clip2.getCrop().getEndPositionRaw(rect5);
                    clip2.getCrop().getFacePositionRaw(rect6);
                    this.mVideoEditor.a(i12, clip2.isFaceDetected() ? 1 : 0, rect4, rect5, rect6);
                } else {
                    for (nexDrawInfo nexdrawinfo2 : clip2.getDrawInfos()) {
                        if (nexdrawinfo2.getFaceRect().isEmpty()) {
                            clip2.getCrop().getStartPositionRaw(rect4);
                            clip2.getCrop().getEndPositionRaw(rect5);
                            clip2.getCrop().getFacePositionRaw(rect6);
                            nexdrawinfo2.setStartRect(rect4);
                            nexdrawinfo2.setEndRect(rect5);
                            nexdrawinfo2.setFaceRect(rect6);
                            updateDrawInfo(nexdrawinfo2);
                        }
                    }
                }
            }
            i10++;
        }
        return 0;
    }

    public void fastPreview(FastPreviewOption fastPreviewOption, int i) {
        com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.normal;
        switch (fastPreviewOption) {
            case normal:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.normal;
                break;
            case brightness:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.brightness;
                break;
            case contrast:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.contrast;
                break;
            case saturation:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.saturation;
                break;
            case adj_brightness:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.adj_brightness;
                break;
            case adj_contrast:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.adj_contrast;
                break;
            case adj_saturation:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.adj_saturation;
                break;
            case tintColor:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.tintColor;
                break;
            case cts:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.cts;
                break;
            case adj_vignette:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.adj_vignette;
                break;
            case adj_vignetteRange:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.adj_vignetteRange;
                break;
            case adj_sharpness:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.adj_sharpness;
                break;
            case customlut_clip:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.customlut_clip;
                break;
            case customlut_power:
                fastPreviewOption2 = com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.customlut_power;
                break;
        }
        this.mVideoEditor.a(fastPreviewOption2, i);
    }

    public void fastPreviewCrop(Rect rect) {
        this.mVideoEditor.q().a(com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.nofx, 1).a(rect).a();
    }

    public void fastPreviewCustomlut(int i) {
        if (this.mProject != null) {
            fastPreviewCustomlut(this.mProject.getClipPosition(this.mCurrentPlayTime) + 1, i);
        }
    }

    public void fastPreviewCustomlut(int i, int i2) {
        this.mVideoEditor.q().a(com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.customlut_clip, i).a(com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.customlut_power, i2).a();
    }

    public void fastPreviewEffect(int i, boolean z) {
        this.mVideoEditor.q().a(i).a(z).a();
    }

    public boolean forceMixExport(String str) {
        if (!isSetProject(true)) {
            return false;
        }
        if (this.mProject.getClip(0, true).getClipType() != 4) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("]forceMixExport: no video clip.");
            Log.d(str2, sb.toString());
            return false;
        }
        nexProject nexproject = new nexProject();
        if (!this.mProject.getClip(0, true).hasAudio() || this.mProject.getClip(0, true).getAudioCodecType().contains("aac")) {
            String realPath = this.mProject.getClip(0, true).getRealPath();
            if (this.mVideoEditor.checkIDRStart(realPath) != 0) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[");
                sb2.append(this.mId);
                sb2.append("]forceMixExport: idr finder start fail!");
                Log.d(str3, sb2.toString());
                return false;
            }
            int i = 0;
            int i2 = 0;
            while (i < this.mProject.getTotalClipCount(true)) {
                if (realPath.compareTo(this.mProject.getClip(i, true).getRealPath()) == 0) {
                    nexproject.add(nexClip.dup(this.mProject.getClip(i, true)));
                    int startTrimTime = this.mProject.getClip(i, true).getVideoClipEdit().getStartTrimTime();
                    int endTrimTime = this.mProject.getClip(i, true).getVideoClipEdit().getEndTrimTime();
                    if (this.mProject.getClip(i, true).getVideoClipEdit().getSpeedControl() != 100) {
                        String str4 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("[");
                        sb3.append(this.mId);
                        sb3.append("]forceMixExport: set speed clip index=");
                        sb3.append(i);
                        Log.d(str4, sb3.toString());
                        i2 = 1;
                    }
                    int checkIDRTime = this.mVideoEditor.checkIDRTime(startTrimTime);
                    if (checkIDRTime == -1) {
                        String str5 = TAG;
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("[");
                        sb4.append(this.mId);
                        sb4.append("]forceMixExport: idr finder fail startTrimTime=");
                        sb4.append(startTrimTime);
                        Log.d(str5, sb4.toString());
                        this.mVideoEditor.checkIDREnd();
                        return false;
                    }
                    String str6 = TAG;
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("[");
                    sb5.append(this.mId);
                    sb5.append("]forceMixExport: startTrimTime=");
                    sb5.append(startTrimTime);
                    sb5.append(", endTrimTime=");
                    sb5.append(endTrimTime);
                    sb5.append(", new idrTime=");
                    sb5.append(checkIDRTime);
                    Log.d(str6, sb5.toString());
                    nexproject.getClip(i, true).getVideoClipEdit().setTrim(checkIDRTime, endTrimTime);
                    i++;
                } else {
                    String str7 = TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("[");
                    sb6.append(this.mId);
                    sb6.append("]forceMixExport: [");
                    sb6.append(i);
                    sb6.append("] clip invaild path=");
                    sb6.append(realPath);
                    Log.d(str7, sb6.toString());
                    this.mVideoEditor.checkIDREnd();
                    return false;
                }
            }
            this.mVideoEditor.checkIDREnd();
            nexProject nexproject2 = this.mProject;
            this.mProject = nexproject;
            try {
                resolveProject(sLoadListAsync, true);
                this.mForceMixExportMode = true;
                this.mExportTotalTime = nexproject.getTotalTime();
                this.mState = 2;
                this.mExportFilePath = str;
                this.mEncodeMaxFileSize = Long.MAX_VALUE;
                setEditorListener();
                this.mVideoEditor.a(sExportVideoTrackUUIDMode, (byte[]) null);
                this.mVideoEditor.directExport(this.mExportFilePath, this.mEncodeMaxFileSize, (long) this.mProject.getTotalTime(), EditorGlobal.b("up"), i2);
                this.mProject = nexproject2;
                return true;
            } catch (Exception unused) {
                this.mProject = nexproject2;
                return false;
            }
        } else {
            String str8 = TAG;
            StringBuilder sb7 = new StringBuilder();
            sb7.append("[");
            sb7.append(this.mId);
            sb7.append("]forceMixExport: audio is not aac");
            Log.d(str8, sb7.toString());
            return false;
        }
    }

    /* access modifiers changed from: 0000 */
    public Context getAppContext() {
        return this.mAppContext;
    }

    @Deprecated
    public int getAudioSessionID() {
        return this.mVideoEditor.d(true);
    }

    public int getBrightness() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.getBrightness();
        }
        return 0;
    }

    public int getContrast() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.getContrast();
        }
        return 0;
    }

    public int getCurrentPlayTimeTime() {
        return this.mCurrentPlayTime;
    }

    public int getDuration() {
        if (isSetProject(false)) {
            return this.mVideoEditor.getDuration() * 1000;
        }
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public String getEncodedEffectOptions(nexClip nexclip, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(nexclip.getClipEffect(true).getShowStartTime());
        sb.append(',');
        sb.append(nexclip.getClipEffect(true).getShowEndTime());
        sb.append('?');
        encodeEffectOptions(sb, nexclip.getTransitionEffect(true).getEffectOptions(str));
        sb.append('?');
        encodeEffectOptions(sb, nexclip.getClipEffect(true).getEffectOptions(str));
        return sb.toString();
    }

    public int[] getIDRSeekTabSync(nexClip nexclip) {
        ArrayList arrayList = new ArrayList();
        MediaInfo mediaInfo = nexclip.getMediaInfo();
        if (mediaInfo == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("]getIDRSeekTabSync() getinfo fail!");
            Log.d(str, sb.toString());
            return null;
        }
        int[] d = mediaInfo.d();
        if (this.mVideoEditor.checkIDRStart(nexclip.getRealPath()) != 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[");
            sb2.append(this.mId);
            sb2.append("]getIDRSeekTabSync() checkIDRStart fail!");
            Log.d(str2, sb2.toString());
            return null;
        }
        int i = -1;
        for (int i2 = 0; i2 < d.length; i2++) {
            int checkIDRTime = this.mVideoEditor.checkIDRTime(d[i2]);
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("[");
            sb3.append(this.mId);
            sb3.append("]getIDRSeekTabSync() : seektab=");
            sb3.append(d[i2]);
            sb3.append(", idrTime=");
            sb3.append(checkIDRTime);
            Log.d(str3, sb3.toString());
            if (checkIDRTime < 0) {
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("[");
                sb4.append(this.mId);
                sb4.append("]getIDRSeekTabSync() idrTime fail! seekTime=");
                sb4.append(d[i2]);
                Log.d(str4, sb4.toString());
                this.mVideoEditor.checkIDREnd();
                return null;
            }
            if (i != checkIDRTime) {
                arrayList.add(Integer.valueOf(checkIDRTime));
                i = checkIDRTime;
            }
        }
        this.mVideoEditor.checkIDREnd();
        int[] iArr = new int[arrayList.size()];
        for (int i3 = 0; i3 < arrayList.size(); i3++) {
            iArr[i3] = ((Integer) arrayList.get(i3)).intValue();
            String str5 = TAG;
            StringBuilder sb5 = new StringBuilder();
            sb5.append("[");
            sb5.append(this.mId);
            sb5.append("]getIDRSeekTabSync() : new seektab=");
            sb5.append(iArr[i3]);
            Log.d(str5, sb5.toString());
        }
        return iArr;
    }

    public int getLayerHeight() {
        return nexApplicationConfig.getAspectProfile().getHeight();
    }

    public int getLayerWidth() {
        return nexApplicationConfig.getAspectProfile().getWidth();
    }

    public boolean getLetterBox() {
        return this.bLetterBox;
    }

    public boolean getOverlayHitPoint(HitPoint hitPoint) {
        for (nexOverlayItem nexoverlayitem : this.mProject.getOverlayItems()) {
            if (nexoverlayitem.getStartTime() <= hitPoint.mTime && nexoverlayitem.getEndTime() > hitPoint.mTime) {
                return nexoverlayitem.isPointInOverlayItem(hitPoint);
            }
        }
        return false;
    }

    public nexProject getProject() {
        return this.mProject;
    }

    public int getSaturation() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.getSaturation();
        }
        return 0;
    }

    public int getSharpness() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.getSharpness();
        }
        return 0;
    }

    public Bitmap getThumbnailCache(int i, int i2) {
        if (!this.cacheSeekMode) {
            return null;
        }
        Bitmap n = this.mVideoEditor.n(i);
        if (n == null) {
            return null;
        }
        int width = n.getWidth();
        int height = n.getHeight();
        Rect rect = new Rect(0, 0, width, height);
        if (i2 == 180) {
            Bitmap createBitmap = Bitmap.createBitmap(width, height, Config.RGB_565);
            Canvas canvas = new Canvas(createBitmap);
            canvas.rotate(180.0f, (float) (width / 2), (float) (height / 2));
            canvas.drawBitmap(n, rect, new Rect(0, 0, width, height), null);
            return createBitmap;
        } else if (i2 == 0) {
            Bitmap createBitmap2 = Bitmap.createBitmap(width, height, Config.RGB_565);
            new Canvas(createBitmap2).drawBitmap(n, rect, new Rect(0, 0, width, height), null);
            return createBitmap2;
        } else if (i2 == 270) {
            Bitmap createBitmap3 = Bitmap.createBitmap(height, width, Config.RGB_565);
            Canvas canvas2 = new Canvas(createBitmap3);
            canvas2.rotate(90.0f, 0.0f, 0.0f);
            canvas2.drawBitmap(n, rect, new Rect(0, -height, width, 0), null);
            return createBitmap3;
        } else if (i2 != 90) {
            return null;
        } else {
            Bitmap createBitmap4 = Bitmap.createBitmap(height, width, Config.RGB_565);
            Canvas canvas3 = new Canvas(createBitmap4);
            canvas3.rotate(270.0f, 0.0f, 0.0f);
            canvas3.drawBitmap(n, rect, new Rect(-width, 0, 0, height), null);
            return createBitmap4;
        }
    }

    public nexEngineView getView() {
        return (nexEngineView) this.mVideoEditor.k();
    }

    public int getVignette() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.getVignette();
        }
        return 0;
    }

    public int getVignetteRange() {
        if (this.mVideoEditor != null) {
            return this.mVideoEditor.getVignetteRange();
        }
        return 0;
    }

    public boolean isCacheSeekMode() {
        return this.cacheSeekMode;
    }

    public void overlayLock(boolean z) {
        if (z) {
            setOverlays(OverlayCommand.lock);
        } else {
            setOverlays(OverlayCommand.unlock);
        }
    }

    public void pause() {
        if (isSetProject(false)) {
            this.mVideoEditor.s();
        }
    }

    public void play() {
        this.cacheSeekMode = false;
        if (isSetProject(false)) {
            if (this.mState == 2) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("[");
                sb.append(this.mId);
                sb.append("]export state");
                Log.w(str, sb.toString());
                return;
            }
            stopAsyncFaceDetect();
            setOverlays(OverlayCommand.upload);
            resolveProject(sLoadListAsync, true);
            faceDetect_internal(this.facedetect_asyncmode, this.facedetect_syncclip_count, this.facedetect_undetected_clip_cropping_mode);
            loadEffectsInEditor(false);
            setEditorListener();
            this.mVideoEditor.t();
        }
    }

    public boolean play(boolean z) {
        this.cacheSeekMode = false;
        if (z) {
            try {
                play();
            } catch (Exception unused) {
                return false;
            }
        } else {
            play();
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void removeClip(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.a(i, (g) null);
        }
    }

    public void removeEditorListener() {
        if (this.mEditorListener != null) {
            this.mEditorListener = null;
        }
    }

    public void resume() {
        this.cacheSeekMode = false;
        if (isSetProject(false)) {
            undoForceMixProject();
            setEditorListener();
            setOverlays(OverlayCommand.upload);
            faceDetect_internal(this.facedetect_asyncmode, this.facedetect_syncclip_count, this.facedetect_undetected_clip_cropping_mode);
            this.mVideoEditor.t();
        }
    }

    public boolean reverseStart(String str, String str2, String str3, int i, int i2, int i3, long j, int i4, int i5, int i6) {
        int i7 = i5 - i4;
        if (i7 >= PERSIST_INTERVAL) {
            return this.mVideoEditor.reverseStart(str, str2, str3, i, i2, i3, j, i4, i5, i6) == 0;
        }
        throw new InvalidRangeException((int) PERSIST_INTERVAL, i7, true);
    }

    public boolean reverseStop() {
        return this.mVideoEditor.reverseStop() == 0;
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0069  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0076  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0084  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x009e  */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x00ab  */
    public void runTranscodeMode(Option option, String str, nexEngineListener nexenginelistener) {
        int i;
        if (sTranscodeMode) {
            nexenginelistener.onEncodingDone(true, nexErrorCode.TRANSCODING_BUSY.getValue());
        } else if (this.mState == 2) {
            nexenginelistener.onEncodingDone(true, nexErrorCode.TRANSCODING_BUSY.getValue());
        } else {
            nexClip supportedClip = nexClip.getSupportedClip(str);
            if (supportedClip == null) {
                nexenginelistener.onEncodingDone(true, nexErrorCode.TRANSCODING_NOT_SUPPORTED_FORMAT.getValue());
                return;
            }
            sTranscodeMode = true;
            sTranscodeProject = new nexProject();
            sTranscodeProject.add(supportedClip);
            sTranscodeListener = nexenginelistener;
            int i2 = 0;
            if (option.outputRotate != Rotate.CW_0) {
                if (option.outputRotate == Rotate.CW_90) {
                    i = nexClip.kClip_Rotate_270;
                } else if (option.outputRotate == Rotate.CW_180) {
                    i = nexClip.kClip_Rotate_180;
                } else if (option.outputRotate == Rotate.CW_270) {
                    i = 90;
                }
                if (i != 0) {
                    sTranscodeProject.getClip(0, true).setRotateDegree(i);
                }
                if (option.outputFitMode != 0) {
                    sTranscodeProject.getClip(0, true).getCrop().resetStartEndPosition();
                } else {
                    sTranscodeProject.getClip(0, true).getCrop().fitStartEndPosition(option.outputWidth, option.outputHeight);
                }
                resolveProject(true, true);
                if (option.outputRotateMeta != Rotate.BYPASS) {
                    int rotateInMeta = 360 - supportedClip.getRotateInMeta();
                    if (rotateInMeta != 360) {
                        i2 = rotateInMeta;
                    }
                } else if (option.outputRotateMeta != Rotate.CW_0) {
                    if (option.outputRotateMeta == Rotate.CW_90) {
                        i2 = 90;
                    } else if (option.outputRotateMeta == Rotate.CW_180) {
                        i2 = nexClip.kClip_Rotate_180;
                    } else if (option.outputRotateMeta == Rotate.CW_270) {
                        i2 = nexClip.kClip_Rotate_270;
                    }
                }
                transcode(option.outputFile.getAbsolutePath(), option.outputWidth, option.outputHeight, option.outputBitRate, Long.MAX_VALUE, option.outputSamplingRate, i2);
            }
            i = 0;
            if (i != 0) {
            }
            if (option.outputFitMode != 0) {
            }
            resolveProject(true, true);
            if (option.outputRotateMeta != Rotate.BYPASS) {
            }
            transcode(option.outputFile.getAbsolutePath(), option.outputWidth, option.outputHeight, option.outputBitRate, Long.MAX_VALUE, option.outputSamplingRate, i2);
        }
    }

    public void seek(int i) {
        if (this.cacheSeekMode) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("] seek fail! cacheSeekMode");
            Log.d(str, sb.toString());
            return;
        }
        if (isSetProject(false)) {
            undoForceMixProject();
            setEditorListener();
            setOverlays(OverlayCommand.upload);
            stopAsyncFaceDetect();
            faceDetect_for_seek(i, this.facedetect_undetected_clip_cropping_mode);
            this.lastSeekTime = i;
            this.mVideoEditor.j(i);
        }
    }

    public boolean seekFromCache(int i) {
        if (!this.cacheSeekMode || !isSetProject(false)) {
            return false;
        }
        undoForceMixProject();
        setEditorListener();
        setOverlays(OverlayCommand.upload);
        this.mVideoEditor.b(i, (p) null);
        return true;
    }

    public void seekIDROnly(int i) {
        if (this.cacheSeekMode) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("] seekIDROnly fail! cacheSeekMode");
            Log.d(str, sb.toString());
            return;
        }
        if (isSetProject(false)) {
            undoForceMixProject();
            setEditorListener();
            setOverlays(OverlayCommand.upload);
            this.lastSeekTime = i;
            this.mVideoEditor.e(i, (p) null);
        }
    }

    public void seekIDROnly(int i, final OnSeekCompletionListener onSeekCompletionListener) {
        if (this.cacheSeekMode) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("] seekIDROnly fail! cacheSeekMode");
            Log.d(str, sb.toString());
            return;
        }
        if (isSetProject(false)) {
            undoForceMixProject();
            setEditorListener();
            setOverlays(OverlayCommand.upload);
            this.lastSeekTime = i;
            this.mVideoEditor.e(i, (p) new p() {
                public String a() {
                    return "seekIDROnly";
                }

                public void a(int i, int i2) {
                    if (onSeekCompletionListener != null) {
                        onSeekCompletionListener.onSeekComplete(0, i, i2);
                    }
                }

                public void a(ErrorCode errorCode) {
                    if (onSeekCompletionListener != null) {
                        onSeekCompletionListener.onSeekComplete(errorCode.getValue(), 0, 0);
                    }
                }
            });
        }
    }

    public void seekIDRorI(int i) {
        if (this.cacheSeekMode) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("] seekIDRorI fail! cacheSeekMode");
            Log.d(str, sb.toString());
            return;
        }
        if (isSetProject(false)) {
            undoForceMixProject();
            setEditorListener();
            setOverlays(OverlayCommand.upload);
            this.lastSeekTime = i;
            this.mVideoEditor.d(i, (p) null);
        }
    }

    public void set360VideoForceNormalView() {
        this.mVideoEditor.A();
    }

    public boolean set360VideoViewPosition(int i, int i2) {
        return this.mVideoEditor.e(i, i2);
    }

    public void set360VideoViewStopPosition(int i, int i2) {
        this.mVideoEditor.q().a(com.nexstreaming.kminternal.nexvideoeditor.NexEditor.FastPreviewOption.nofx, 1).a(i, i2).a();
    }

    public void setBrightness(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setBrightness(i);
        }
    }

    public void setContrast(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setContrast(i);
        }
    }

    public void setDeviceGamma(float f) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setDeviceGamma(f);
        }
    }

    public void setDeviceLightLevel(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setDeviceLightLevel(i);
        }
    }

    public void setEventHandler(nexEngineListener nexenginelistener) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] setEventHandler =");
        sb.append(nexenginelistener);
        Log.d(str, sb.toString());
        this.mEventListener = nexenginelistener;
        setEditorListener();
    }

    public void setExportCrop(int i, int i2, int i3) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] setExportCrop mode=");
        sb.append(i);
        sb.append(", (");
        sb.append(i2);
        sb.append("X");
        sb.append(i3);
        sb.append(")");
        Log.d(str, sb.toString());
        this.mEnhancedCropMode = i;
        this.mEnhancedCropOutputWidth = i2;
        this.mEnhancedCropOutputHeight = i3;
    }

    public void setFaceModule(String str) {
        stopAsyncFaceDetect();
        if (str == null) {
            com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a((nexFaceDetectionProvider) null);
            return;
        }
        nexFaceDetectionProvider a2 = com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a();
        if (a2 == null || a2.uuid().compareTo(str) != 0) {
            if (this.mProject != null) {
                for (int i = 0; i < this.mProject.getTotalClipCount(true); i++) {
                    nexClip clip = this.mProject.getClip(i, true);
                    if (clip.getClipType() == 1) {
                        clip.resetFaceDetectProcessed();
                    }
                }
            }
            Object module = nexApplicationConfig.getExternalModuleManager().getModule(str);
            if (module == null) {
                com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a((nexFaceDetectionProvider) null);
                return;
            }
            if (nexFaceDetectionProvider.class.isInstance(module)) {
                com.nexstreaming.kminternal.kinemaster.utils.facedetect.a.a((nexFaceDetectionProvider) module);
            }
        }
    }

    public void setHDRtoSDR(boolean z) {
        this.mVideoEditor.setProperty("HDR2SDR", z ? "1" : MovieStatUtils.DOWNLOAD_SUCCESS);
    }

    public void setLetterBox(boolean z) {
        this.bLetterBox = z;
    }

    /* access modifiers changed from: 0000 */
    public void setMark() {
        if (this.mVideoEditor.y() == 1) {
            this.mVideoEditor.e(true);
        } else {
            this.mVideoEditor.e(false);
        }
    }

    public void setOnSurfaceChangeListener(OnSurfaceChangeListener onSurfaceChangeListener) {
        this.m_onSurfaceChangeListener = onSurfaceChangeListener;
        this.mVideoEditor.a((q) new q() {
            public void a() {
                if (nexEngine.this.m_onSurfaceChangeListener != null) {
                    nexEngine.this.m_onSurfaceChangeListener.onSurfaceChanged();
                }
            }
        });
    }

    public boolean setPreviewScaleFactor(float f) {
        return this.mVideoEditor.a(f);
    }

    public void setProject(nexProject nexproject) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] setProject");
        Log.d(str, sb.toString());
        this.mProject = nexproject;
        defaultFaceDetectSetting();
    }

    public void setProperty(String str, String str2) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setProperty(str, str2);
        }
    }

    public void setSaturation(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setSaturation(i);
        }
    }

    public void setScalingFlag2Export(boolean z) {
        this.bNeedScaling = z;
    }

    public void setSharpness(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setSharpness(i);
        }
    }

    public void setTaskSleep(boolean z) {
        this.mVideoEditor.setTaskSleep(z ? 1 : 0);
    }

    public void setThumbnailRoutine(int i) {
        this.mVideoEditor.o(i);
    }

    public void setTotalAudioVolumeProject(int i, int i2) {
        for (nexClip clipVolume : this.mProject.getPrimaryItems()) {
            clipVolume.setClipVolume(i);
        }
        for (nexAudioItem clip : this.mProject.getAudioItems()) {
            clip.getClip().setClipVolume(i2);
        }
        this.mProject.setBGMMasterVolumeScale(((float) i2) / 200.0f);
    }

    public boolean setTotalAudioVolumeResetWhilePlay() {
        return this.mVideoEditor.setVolumeWhilePlay(100, 100) == 0;
    }

    public boolean setTotalAudioVolumeWhilePlay(int i, int i2) {
        if (i == 100) {
            i = BaiduSceneResult.SHOOTING;
        }
        if (i2 == 100) {
            i2 = BaiduSceneResult.SHOOTING;
        }
        return i >= 0 && i <= 200 && i2 >= 0 && i2 <= 200 && this.mVideoEditor.setVolumeWhilePlay(i, i2) == 0;
    }

    public int setView(SurfaceView surfaceView) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] setView SurfaceView=");
        sb.append(surfaceView);
        Log.d(str, sb.toString());
        this.mVideoEditor.a((NexThemeView) null);
        if (!(surfaceView == this.mSurfaceView || this.mSurfaceView == null)) {
            this.mSurfaceView.getHolder().removeCallback(this);
        }
        this.mSurfaceView = surfaceView;
        if (this.mSurfaceView != null) {
            this.mSurfaceView.getHolder().addCallback(this);
        }
        return 0;
    }

    public int setView(nexEngineView nexengineview) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] setView nexEngineView=");
        sb.append(nexengineview);
        Log.d(str, sb.toString());
        if (this.mSurfaceView != null) {
            this.mSurfaceView.getHolder().removeCallback(this);
            this.mSurfaceView = null;
        }
        this.mVideoEditor.a((NexThemeView) nexengineview);
        return 0;
    }

    public void setVignette(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setVignette(i);
        }
    }

    public void setVignetteRange(int i) {
        if (this.mVideoEditor != null) {
            this.mVideoEditor.setVignetteRange(i);
        }
    }

    public boolean startCollectCache(int i, final OnCompletionListener onCompletionListener) {
        if (!isSetProject(false)) {
            return false;
        }
        if (MediaInfo.k()) {
            if (onCompletionListener != null) {
                onCompletionListener.onComplete(ErrorCode.THUMBNAIL_BUSY.getValue());
            }
            return false;
        }
        this.cacheSeekMode = true;
        undoForceMixProject();
        setEditorListener();
        setOverlays(OverlayCommand.upload);
        this.mVideoEditor.a(i, (p) new p() {
            public String a() {
                return null;
            }

            public void a(int i, int i2) {
                if (onCompletionListener != null) {
                    onCompletionListener.onComplete(0);
                }
            }

            public void a(ErrorCode errorCode) {
                nexEngine.this.cacheSeekMode = false;
                if (onCompletionListener != null) {
                    onCompletionListener.onComplete(errorCode.getValue());
                }
            }
        });
        return true;
    }

    public void stop() {
        if (this.externalImageExportProcessing) {
            this.mVideoEditor.u();
            this.mState = 1;
            return;
        }
        this.cacheSeekMode = false;
        if (isSetProject(false)) {
            if (this.mState == 2) {
                this.mState = 1;
                this.mVideoEditor.s();
            } else {
                this.mState = 1;
                this.mVideoEditor.s();
            }
        }
    }

    public void stop(final OnCompletionListener onCompletionListener) {
        if (this.externalImageExportProcessing) {
            this.mVideoEditor.u();
            if (onCompletionListener != null) {
                onCompletionListener.onComplete(0);
            }
            this.mState = 1;
            return;
        }
        this.cacheSeekMode = false;
        if (isSetProject(false)) {
            this.mState = 1;
            this.mVideoEditor.a((f) new f() {
                public void a(ErrorCode errorCode) {
                    onCompletionListener.onComplete(errorCode.getValue());
                }
            });
        } else {
            onCompletionListener.onComplete(21);
        }
    }

    public void stopAsyncFaceDetect() {
        Iterator it = this.async_facedetect_worker_list_.iterator();
        while (it.hasNext()) {
            ((AsyncTask) it.next()).cancel(true);
        }
        this.async_facedetect_worker_list_.clear();
    }

    public void stopCollectCache(int i) {
        this.cacheSeekMode = false;
        seek(i);
    }

    @Deprecated
    public void stopSync() {
        if (isSetProject(false)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(this.mId);
            sb.append("]stopSync start");
            Log.i(str, sb.toString());
            if (this.mPlayState == PlayState.NONE || this.mPlayState == PlayState.IDLE) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[");
                sb2.append(this.mId);
                sb2.append("]stopSync IDLE state");
                Log.i(str2, sb2.toString());
                this.mState = 1;
                return;
            }
            this.mVideoEditor.b(true);
            this.mVideoEditor.s();
            while (this.mPlayState != PlayState.IDLE) {
                try {
                    Thread.sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            this.mState = 1;
            this.mVideoEditor.b(false);
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("[");
            sb3.append(this.mId);
            sb3.append("]stopSync End!");
            Log.i(str3, sb3.toString());
        }
    }

    /* access modifiers changed from: 0000 */
    public void stopTranscode() {
        if (!sTranscodeMode) {
            return;
        }
        if (this.mState == 2) {
            stop();
            return;
        }
        sTranscodeMode = false;
        resolveProject(true, true);
    }

    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        int i4;
        int i5;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("surfaceChanged called(");
        sb.append(i2);
        sb.append(",");
        sb.append(i3);
        sb.append(")");
        Log.v(str, sb.toString());
        if (i2 == 0 || i3 == 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("invalid video width(");
            sb2.append(i2);
            sb2.append(") or height(");
            sb2.append(i3);
            sb2.append(")");
            Log.e(str2, sb2.toString());
            return;
        }
        float aspectRatio = nexApplicationConfig.getAspectRatio();
        if (aspectRatio > 0.0f) {
            float f = ((float) i3) * aspectRatio;
            float f2 = (float) i2;
            if (f > f2) {
                i5 = Math.round(f2 / aspectRatio);
                i4 = i2;
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("surfaceChanged aspect view size ");
                sb3.append(i4);
                sb3.append("x");
                sb3.append(i5);
                Log.d(str3, sb3.toString());
                if (i4 == i2 || i5 != i3) {
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("surfaceChanged new view size ");
                    sb4.append(i4);
                    sb4.append("x");
                    sb4.append(i5);
                    Log.d(str4, sb4.toString());
                    surfaceHolder.setFixedSize(i4, i5);
                }
                this.mSurface = surfaceHolder.getSurface();
                if (this.mVideoEditor != null) {
                    this.mVideoEditor.a(this.mSurface);
                    this.mVideoEditor.w();
                }
                return;
            }
            i4 = Math.round(f);
        } else {
            i4 = i2;
        }
        i5 = i3;
        String str32 = TAG;
        StringBuilder sb32 = new StringBuilder();
        sb32.append("surfaceChanged aspect view size ");
        sb32.append(i4);
        sb32.append("x");
        sb32.append(i5);
        Log.d(str32, sb32.toString());
        if (i4 == i2) {
        }
        String str42 = TAG;
        StringBuilder sb42 = new StringBuilder();
        sb42.append("surfaceChanged new view size ");
        sb42.append(i4);
        sb42.append("x");
        sb42.append(i5);
        Log.d(str42, sb42.toString());
        surfaceHolder.setFixedSize(i4, i5);
    }

    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        Log.v(TAG, "surfaceCreated called()");
        if (this.mSurfaceView != null) {
            this.mSurface = surfaceHolder.getSurface();
            if (this.mVideoEditor != null) {
                this.mVideoEditor.a(this.mSurface);
                this.mVideoEditor.w();
            }
        }
    }

    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        Log.v(TAG, "surfaceDestroyed called()");
        if (surfaceHolder != null && this.mSurface == surfaceHolder.getSurface()) {
            this.mSurface = null;
        }
        if (this.mVideoEditor != null) {
            this.mVideoEditor.a((Surface) null);
        }
    }

    public boolean transcodingStart(String str, String str2, int i, int i2, int i3, int i4, int i5, long j, int i6, int i7) {
        return !this.mVideoEditor.a(str, str2, i, i2, i3, i4, i5, j, i6, i7, EditorGlobal.b("up")).isError();
    }

    public boolean transcodingStop() {
        return !this.mVideoEditor.p().isError();
    }

    public void updateDrawInfo(nexDrawInfo nexdrawinfo) {
        if (this.mVideoEditor != null) {
            NexDrawInfo nexDrawInfo = new NexDrawInfo();
            nexDrawInfo.mID = nexdrawinfo.getID();
            nexDrawInfo.mTrackID = nexdrawinfo.getClipID();
            nexDrawInfo.mSubEffectID = nexdrawinfo.getSubEffectID();
            nexDrawInfo.mEffectID = nexdrawinfo.getEffectID();
            nexDrawInfo.mTitle = nexdrawinfo.getTitle();
            nexDrawInfo.mIsTransition = nexdrawinfo.getIsTransition();
            nexDrawInfo.mStartTime = nexdrawinfo.getStartTime();
            nexDrawInfo.mEndTime = nexdrawinfo.getEndTime();
            nexDrawInfo.mRotateState = nexdrawinfo.getRotateState();
            nexDrawInfo.mUserRotateState = nexdrawinfo.getUserRotateState();
            nexDrawInfo.mTranslateX = nexdrawinfo.getUserTranslateX();
            nexDrawInfo.mTranslateY = nexdrawinfo.getUserTranslateY();
            nexDrawInfo.mLUT = nexdrawinfo.getLUT();
            nexDrawInfo.mCustomLUT_A = nexdrawinfo.getCustomLUTA();
            nexDrawInfo.mCustomLUT_B = nexdrawinfo.getCustomLUTB();
            nexDrawInfo.mCustomLUT_Power = nexdrawinfo.getCustomLUTPower();
            nexDrawInfo.mBrightness = nexdrawinfo.getBrightness();
            nexDrawInfo.mContrast = nexdrawinfo.getContrast();
            nexDrawInfo.mSaturation = nexdrawinfo.getSaturation();
            nexDrawInfo.mTintcolor = nexdrawinfo.getTintcolor();
            nexDrawInfo.mStartRect.setRect(nexdrawinfo.getStartRect().left, nexdrawinfo.getStartRect().top, nexdrawinfo.getStartRect().right, nexdrawinfo.getStartRect().bottom);
            nexDrawInfo.mEndRect.setRect(nexdrawinfo.getEndRect().left, nexdrawinfo.getEndRect().top, nexdrawinfo.getEndRect().right, nexdrawinfo.getEndRect().bottom);
            nexDrawInfo.mFaceRect.setRect(nexdrawinfo.getFaceRect().left, nexdrawinfo.getFaceRect().top, nexdrawinfo.getFaceRect().right, nexdrawinfo.getFaceRect().bottom);
            this.mVideoEditor.updateDrawInfo(nexDrawInfo);
        }
    }

    public void updateProject() {
        if (this.mProject != null) {
            setOverlays(OverlayCommand.upload);
            int resolveProject = resolveProject(sLoadListAsync, false);
            if (this.mState != 2 && resolveProject == 1 && this.mProject.getTotalClipCount(true) > 0) {
                loadEffectsInEditor(false);
            }
        }
    }

    public boolean updateProject(boolean z) {
        if (z) {
            try {
                updateProject();
            } catch (Exception unused) {
                return false;
            }
        } else {
            updateProject();
        }
        return true;
    }

    public void updateScreenMode() {
        if (this.mVideoEditor != null) {
            NexEditor.a(nexApplicationConfig.getAspectProfile().getWidth(), nexApplicationConfig.getAspectProfile().getHeight(), nexApplicationConfig.getOverlayCoordinateMode());
            this.mVideoEditor.a(nexApplicationConfig.getScreenMode());
            NexThemeView.setAspectRatio(nexApplicationConfig.getAspectRatio());
            setMark();
        }
    }
}
