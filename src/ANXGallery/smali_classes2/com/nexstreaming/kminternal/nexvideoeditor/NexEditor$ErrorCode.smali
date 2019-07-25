.class public final enum Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
.super Ljava/lang/Enum;
.source "NexEditor.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/Task$TaskError;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ErrorCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;",
        ">;",
        "Lcom/nexstreaming/app/common/task/Task$TaskError;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum ADD_CLIP_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum ALREADY_EXPORTING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum ARGUMENT_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum AUDIORESAMPLER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CAPTURE_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CAPTURE_FAIL_ENOSPC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CAPTURE_FAIL_OTHER:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CAPTURE_FAIL_SCANNING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CODEC_DECODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CODEC_INIT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum CREATE_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DESTINATION_FILE_ALREADY_EXISTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_CHECK_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_CLIPLIST_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_DEC_DECODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_DEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_DEC_INIT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_ENC_DSI_DIFF_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_ENC_ENCODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_ENC_FRAME_CONVERT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_ENC_FUNCTION_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_ENC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_ENC_INPUT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_FILEWRITER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_WRITER_UNKNOWN_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum DIRECTEXPORT_WRITER_WRITE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EDITOR_INSTANCE_DESTROYED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EMPTY_PROJECT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum ENCODE_VIDEO_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EVENTHANDLER:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_AUDIO_DEC_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_NOT_ENOUGHT_DISK_SPACE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_NO_SUCCESS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_UNEXPECTED_STOP:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_VIDEO_DEC_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_VIDEO_ENC_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_VIDEO_RENDER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_WRITER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_WRITER_INVAILED_HANDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum EXPORT_WRITER_START_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_CLIPLIST_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_DEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_DEC_INIT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_FIND_CLIP_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_FIND_READER_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_OUTPUTSURFACE_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_TIME_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FASTPREVIEW_VIDEO_RENDERER_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FILEREADER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FILEREADER_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FILEWRITER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FILE_INVALID_SYNTAX:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FILE_IO_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum FILE_MISSING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum GENERAL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_CODEC_DECODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_CODEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_GET_INDEX_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_TOO_SHORT_CONTENTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_WRITER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HIGHLIGHT_WRITER_WRITE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum HW_NOT_ENOUGH_MEMORY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum IMAGE_PROCESS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum INPROGRESS_GETCLIPINFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum INVALID_INFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum INVALID_STATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum MEMALLOC_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum MISSING_RESOURCES:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum NOT_ENOUGH_NEMORY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum NOT_READY_TO_PLAY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum NO_ACTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum NO_INSTANCE_AVAILABLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum NO_PROJECT_LOADED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum PLAYSTART_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum PLAYSTOP_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum PLAY_SUPERCEEDED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum PROJECT_NOT_CREATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum PROJECT_NOT_OPEN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum RENAME_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum RENDERER_AUDIO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum RENDERER_INIT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum SEEKING_LOCKED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum SET_TIME_CANCELED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum SET_TIME_IGNORED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum SOURCE_FILE_NOT_FOUND:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TEMP_FILE_ALREADY_EXISTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum THEMESET_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum THUMBNAIL_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum THUMBNAIL_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TRANSCODING_ABORTED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TRANSCODING_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TRANSCODING_CODEC_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TRANSCODING_NOT_ENOUGHT_DISK_SPACE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TRANSCODING_NOT_SUPPORTED_FORMAT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum TRANSCODING_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNKNOWN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNRECOGNIZED_ERROR_CODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_AUDIO_CODEC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_AUDIO_PROFILE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_AUDIO_SAMPLINGRATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_FORMAT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_MAX_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_MIN_DURATION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_MIN_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_VIDEIO_PROFILE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_VIDEO_CODEC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_VIDEO_FPS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum UNSUPPORT_VIDEO_LEVEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum VERSION_MISMATCH:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field public static final enum WRAPPER_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;


# instance fields
.field private final mDescription:Ljava/lang/String;

.field private final mDescriptionRsrcId:I

.field private final mFromEngine:Z

.field private final mValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 27

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "GENERAL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GENERAL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNKNOWN"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNKNOWN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "NO_ACTION"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_ACTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "INVALID_INFO"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INVALID_INFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "INVALID_STATE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7, v7}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INVALID_STATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "VERSION_MISMATCH"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8, v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->VERSION_MISMATCH:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "CREATE_FAILED"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9, v9}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CREATE_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v11, "MEMALLOC_FAILED"

    const-string v14, "Memory allocation failed"

    const/16 v12, 0x8

    const/16 v13, 0x8

    const/4 v15, 0x0

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->MEMALLOC_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "ARGUMENT_FAILED"

    const/16 v10, 0x9

    invoke-direct {v0, v1, v10, v10}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v12, "NOT_ENOUGH_NEMORY"

    const-string v15, "Insufficient memory"

    const/16 v13, 0xa

    const/16 v14, 0xa

    const/16 v16, 0x0

    move-object v11, v0

    invoke-direct/range {v11 .. v16}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NOT_ENOUGH_NEMORY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EVENTHANDLER"

    const/16 v11, 0xb

    invoke-direct {v0, v1, v11, v11}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EVENTHANDLER:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v13, "FILE_IO_FAILED"

    const-string v16, "Error accessing file"

    const/16 v14, 0xc

    const/16 v15, 0xc

    const/16 v17, 0x0

    move-object v12, v0

    invoke-direct/range {v12 .. v17}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILE_IO_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FILE_INVALID_SYNTAX"

    const/16 v12, 0xd

    invoke-direct {v0, v1, v12, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILE_INVALID_SYNTAX:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v14, "FILEREADER_CREATE_FAIL"

    const-string v17, "Could not open file"

    const/16 v15, 0xe

    const/16 v16, 0xe

    const/16 v18, 0x0

    move-object v13, v0

    invoke-direct/range {v13 .. v18}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILEREADER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FILEWRITER_CREATE_FAIL"

    const/16 v13, 0xf

    invoke-direct {v0, v1, v13, v13}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILEWRITER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "AUDIORESAMPLER_CREATE_FAIL"

    const/16 v14, 0x10

    invoke-direct {v0, v1, v14, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->AUDIORESAMPLER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v16, "UNSUPPORT_FORMAT"

    const-string v19, "Unsupported format"

    const/16 v17, 0x11

    const/16 v18, 0x11

    const/16 v20, 0x0

    move-object v15, v0

    invoke-direct/range {v15 .. v20}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_FORMAT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v22, "FILEREADER_FAILED"

    const-string v25, "Error reading file format"

    const/16 v23, 0x12

    const/16 v24, 0x12

    const/16 v26, 0x0

    move-object/from16 v21, v0

    invoke-direct/range {v21 .. v26}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILEREADER_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "PLAYSTART_FAILED"

    const/16 v15, 0x13

    invoke-direct {v0, v1, v15, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PLAYSTART_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "PLAYSTOP_FAILED"

    const/16 v15, 0x14

    invoke-direct {v0, v1, v15, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PLAYSTOP_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "PROJECT_NOT_CREATE"

    const/16 v15, 0x15

    const/16 v14, 0x15

    invoke-direct {v0, v1, v15, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PROJECT_NOT_CREATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "PROJECT_NOT_OPEN"

    const/16 v14, 0x16

    const/16 v15, 0x16

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PROJECT_NOT_OPEN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v17, "CODEC_INIT"

    const-string v20, "Codec init failed"

    const/16 v18, 0x17

    const/16 v19, 0x17

    const/16 v21, 0x0

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CODEC_INIT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "RENDERER_INIT"

    const/16 v14, 0x18

    const/16 v15, 0x18

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->RENDERER_INIT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "THEMESET_CREATE_FAIL"

    const/16 v14, 0x19

    const/16 v15, 0x19

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THEMESET_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v17, "ADD_CLIP_FAIL"

    const-string v20, "Unable to add clip"

    const/16 v18, 0x1a

    const/16 v19, 0x1a

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ADD_CLIP_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "ENCODE_VIDEO_FAIL"

    const/16 v14, 0x1b

    const/16 v15, 0x1b

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ENCODE_VIDEO_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "INPROGRESS_GETCLIPINFO"

    const/16 v14, 0x1c

    const/16 v15, 0x1c

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INPROGRESS_GETCLIPINFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "THUMBNAIL_BUSY"

    const/16 v14, 0x1d

    const/16 v15, 0x1d

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THUMBNAIL_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_MIN_DURATION"

    const/16 v14, 0x1e

    const/16 v15, 0x1e

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MIN_DURATION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_MAX_RESOLUTION"

    const/16 v14, 0x1f

    const/16 v15, 0x1f

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MAX_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_MIN_RESOLUTION"

    const/16 v14, 0x20

    const/16 v15, 0x20

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MIN_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_VIDEIO_PROFILE"

    const/16 v14, 0x21

    const/16 v15, 0x21

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEIO_PROFILE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_VIDEO_LEVEL"

    const/16 v14, 0x22

    const/16 v15, 0x22

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEO_LEVEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_VIDEO_FPS"

    const/16 v14, 0x23

    const/16 v15, 0x23

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEO_FPS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TRANSCODING_BUSY"

    const/16 v14, 0x24

    const/16 v15, 0x24

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TRANSCODING_NOT_SUPPORTED_FORMAT"

    const/16 v14, 0x25

    const/16 v15, 0x25

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_NOT_SUPPORTED_FORMAT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TRANSCODING_USER_CANCEL"

    const/16 v14, 0x26

    const/16 v15, 0x26

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TRANSCODING_NOT_ENOUGHT_DISK_SPACE"

    const/16 v14, 0x27

    const/16 v15, 0x27

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_NOT_ENOUGHT_DISK_SPACE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TRANSCODING_CODEC_FAILED"

    const/16 v14, 0x28

    const/16 v15, 0x28

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_CODEC_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_WRITER_INVAILED_HANDLE"

    const/16 v14, 0x29

    const/16 v15, 0x29

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_INVAILED_HANDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_WRITER_INIT_FAIL"

    const/16 v14, 0x2a

    const/16 v15, 0x2a

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_WRITER_START_FAIL"

    const/16 v14, 0x2b

    const/16 v15, 0x2b

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_START_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_AUDIO_DEC_INIT_FAIL"

    const/16 v14, 0x2c

    const/16 v15, 0x2c

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_AUDIO_DEC_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_VIDEO_DEC_INIT_FAIL"

    const/16 v14, 0x2d

    const/16 v15, 0x2d

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_VIDEO_DEC_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_VIDEO_ENC_FAIL"

    const/16 v14, 0x2e

    const/16 v15, 0x2e

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_VIDEO_ENC_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_VIDEO_RENDER_INIT_FAIL"

    const/16 v14, 0x2f

    const/16 v15, 0x2f

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_VIDEO_RENDER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v17, "EXPORT_NOT_ENOUGHT_DISK_SPACE"

    const-string v20, "Not enough space"

    const/16 v18, 0x30

    const/16 v19, 0x30

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_NOT_ENOUGHT_DISK_SPACE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_AUDIO_PROFILE"

    const/16 v14, 0x31

    const/16 v15, 0x31

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_AUDIO_PROFILE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "THUMBNAIL_INIT_FAIL"

    const/16 v14, 0x32

    const/16 v15, 0x32

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THUMBNAIL_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_AUDIO_CODEC"

    const/16 v14, 0x33

    const/16 v15, 0x33

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_AUDIO_CODEC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_VIDEO_CODEC"

    const/16 v14, 0x34

    const/16 v15, 0x34

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEO_CODEC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_FILEREADER_INIT_ERROR"

    const/16 v14, 0x35

    const/16 v15, 0x35

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_TOO_SHORT_CONTENTS"

    const/16 v14, 0x36

    const/16 v15, 0x36

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_TOO_SHORT_CONTENTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_CODEC_INIT_ERROR"

    const/16 v14, 0x37

    const/16 v15, 0x37

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_CODEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_CODEC_DECODE_ERROR"

    const/16 v14, 0x38

    const/16 v15, 0x38

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_CODEC_DECODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_RENDER_INIT_ERROR"

    const/16 v14, 0x39

    const/16 v15, 0x39

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_WRITER_INIT_ERROR"

    const/16 v14, 0x3a

    const/16 v15, 0x3a

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_WRITER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_WRITER_WRITE_ERROR"

    const/16 v14, 0x3b

    const/16 v15, 0x3b

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_WRITER_WRITE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_GET_INDEX_ERROR"

    const/16 v14, 0x3c

    const/16 v15, 0x3c

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_GET_INDEX_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HIGHLIGHT_USER_CANCEL"

    const/16 v14, 0x3d

    const/16 v15, 0x3d

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "GETCLIPINFO_USER_CANCEL"

    const/16 v14, 0x3e

    const/16 v15, 0x3e

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_CLIPLIST_ERROR"

    const/16 v14, 0x3f

    const/16 v15, 0x3f

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_CLIPLIST_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_CHECK_ERROR"

    const/16 v14, 0x40

    const/16 v15, 0x40

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_CHECK_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_FILEREADER_INIT_ERROR"

    const/16 v14, 0x41

    const/16 v15, 0x41

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_FILEWRITER_INIT_ERROR"

    const/16 v14, 0x42

    const/16 v15, 0x42

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_FILEWRITER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_DEC_INIT_ERROR"

    const/16 v14, 0x43

    const/16 v15, 0x43

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_DEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_DEC_INIT_SURFACE_ERROR"

    const/16 v14, 0x44

    const/16 v15, 0x44

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_DEC_INIT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_DEC_DECODE_ERROR"

    const/16 v14, 0x45

    const/16 v15, 0x45

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_DEC_DECODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_ENC_INIT_ERROR"

    const/16 v14, 0x46

    const/16 v15, 0x46

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_ENC_ENCODE_ERROR"

    const/16 v14, 0x47

    const/16 v15, 0x47

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_ENCODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_ENC_INPUT_SURFACE_ERROR"

    const/16 v14, 0x48

    const/16 v15, 0x48

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_INPUT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_ENC_FUNCTION_ERROR"

    const/16 v14, 0x49

    const/16 v15, 0x49

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_FUNCTION_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_ENC_DSI_DIFF_ERROR"

    const/16 v14, 0x4a

    const/16 v15, 0x4a

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_DSI_DIFF_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_ENC_FRAME_CONVERT_ERROR"

    const/16 v14, 0x4b

    const/16 v15, 0x4b

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_FRAME_CONVERT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_RENDER_INIT_ERROR"

    const/16 v14, 0x4c

    const/16 v15, 0x4c

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_WRITER_WRITE_ERROR"

    const/16 v14, 0x4d

    const/16 v15, 0x4d

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_WRITER_WRITE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DIRECTEXPORT_WRITER_UNKNOWN_ERROR"

    const/16 v14, 0x4e

    const/16 v15, 0x4e

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_WRITER_UNKNOWN_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_USER_CANCEL"

    const/16 v14, 0x4f

    const/16 v15, 0x4f

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_CLIPLIST_ERROR"

    const/16 v14, 0x50

    const/16 v15, 0x50

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_CLIPLIST_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_FIND_CLIP_ERROR"

    const/16 v14, 0x51

    const/16 v15, 0x51

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_FIND_CLIP_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_FIND_READER_ERROR"

    const/16 v14, 0x52

    const/16 v15, 0x52

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_FIND_READER_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_VIDEO_RENDERER_ERROR"

    const/16 v14, 0x53

    const/16 v15, 0x53

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_VIDEO_RENDERER_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_DEC_INIT_SURFACE_ERROR"

    const/16 v14, 0x54

    const/16 v15, 0x54

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_DEC_INIT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "HW_NOT_ENOUGH_MEMORY"

    const/16 v14, 0x55

    const/16 v15, 0x55

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HW_NOT_ENOUGH_MEMORY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_USER_CANCEL"

    const/16 v14, 0x56

    const/16 v15, 0x56

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_DEC_INIT_ERROR"

    const/16 v14, 0x57

    const/16 v15, 0x57

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_DEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_FILEREADER_INIT_ERROR"

    const/16 v14, 0x58

    const/16 v15, 0x58

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_TIME_ERROR"

    const/16 v14, 0x59

    const/16 v15, 0x59

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_TIME_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_RENDER_INIT_ERROR"

    const/16 v14, 0x5a

    const/16 v15, 0x5a

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_OUTPUTSURFACE_INIT_ERROR"

    const/16 v14, 0x5b

    const/16 v15, 0x5b

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_OUTPUTSURFACE_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FASTPREVIEW_BUSY"

    const/16 v14, 0x5c

    const/16 v15, 0x5c

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v17, "CODEC_DECODE"

    const-string v20, "Codec decode failed"

    const/16 v18, 0x5d

    const/16 v19, 0x5d

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CODEC_DECODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "RENDERER_AUDIO"

    const/16 v14, 0x5e

    const/16 v15, 0x5e

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->RENDERER_AUDIO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNSUPPORT_AUDIO_SAMPLINGRATE"

    const/16 v14, 0x5f

    const/16 v15, 0x5f

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_AUDIO_SAMPLINGRATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "IMAGE_PROCESS"

    const/16 v14, 0x60

    const/16 v15, 0x1001

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->IMAGE_PROCESS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "SET_TIME_IGNORED"

    const-string v14, "Set time ignored"

    const/16 v15, 0x61

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SET_TIME_IGNORED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "SET_TIME_CANCELED"

    const-string v14, "Set time canceled"

    const/16 v15, 0x62

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SET_TIME_CANCELED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "CAPTURE_FAILED"

    const-string v14, "Capture failed"

    const/16 v15, 0x63

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "SOURCE_FILE_NOT_FOUND"

    const/16 v14, 0x64

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SOURCE_FILE_NOT_FOUND:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TRANSCODING_ABORTED"

    const/16 v14, 0x65

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_ABORTED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "DESTINATION_FILE_ALREADY_EXISTS"

    const/16 v14, 0x66

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DESTINATION_FILE_ALREADY_EXISTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "TEMP_FILE_ALREADY_EXISTS"

    const/16 v14, 0x67

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TEMP_FILE_ALREADY_EXISTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "NO_INSTANCE_AVAILABLE"

    const/16 v14, 0x68

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_INSTANCE_AVAILABLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_NO_SUCCESS"

    const/16 v14, 0x69

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_NO_SUCCESS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "PLAY_SUPERCEEDED"

    const/16 v14, 0x6a

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PLAY_SUPERCEEDED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "WRAPPER_BUSY"

    const/16 v14, 0x6b

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->WRAPPER_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "NOT_READY_TO_PLAY"

    const/16 v14, 0x6c

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NOT_READY_TO_PLAY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "SEEKING_LOCKED"

    const/16 v14, 0x6d

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SEEKING_LOCKED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "NO_PROJECT_LOADED"

    const/16 v14, 0x6e

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_PROJECT_LOADED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "ALREADY_EXPORTING"

    const/16 v14, 0x6f

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ALREADY_EXPORTING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EMPTY_PROJECT"

    const/16 v14, 0x70

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EMPTY_PROJECT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "MISSING_RESOURCES"

    const/16 v14, 0x71

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->MISSING_RESOURCES:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EXPORT_UNEXPECTED_STOP"

    const/16 v14, 0x72

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_UNEXPECTED_STOP:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "RENAME_FAIL"

    const/16 v14, 0x73

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->RENAME_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "CAPTURE_FAIL_ENOSPC"

    const-string v14, "Not enough space"

    const/16 v15, 0x74

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAIL_ENOSPC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "CAPTURE_FAIL_OTHER"

    const-string v14, "Capture failed"

    const/16 v15, 0x75

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAIL_OTHER:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "CAPTURE_FAIL_SCANNING"

    const-string v14, "Media scanner failed"

    const/16 v15, 0x76

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAIL_SCANNING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "UNRECOGNIZED_ERROR_CODE"

    const-string v14, "Unrecognized error code"

    const/16 v15, 0x77

    invoke-direct {v0, v1, v15, v14, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNRECOGNIZED_ERROR_CODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "EDITOR_INSTANCE_DESTROYED"

    const/16 v14, 0x78

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EDITOR_INSTANCE_DESTROYED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v1, "FILE_MISSING"

    const/16 v14, 0x79

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILE_MISSING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v0, 0x7a

    new-array v0, v0, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GENERAL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNKNOWN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_ACTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INVALID_INFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INVALID_STATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->VERSION_MISMATCH:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v8

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CREATE_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v9

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->MEMALLOC_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v10

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NOT_ENOUGH_NEMORY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EVENTHANDLER:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v11

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILE_IO_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILE_INVALID_SYNTAX:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v12

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILEREADER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILEWRITER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    aput-object v1, v0, v13

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->AUDIORESAMPLER_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_FORMAT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILEREADER_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PLAYSTART_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PLAYSTOP_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PROJECT_NOT_CREATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PROJECT_NOT_OPEN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CODEC_INIT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->RENDERER_INIT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THEMESET_CREATE_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ADD_CLIP_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ENCODE_VIDEO_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INPROGRESS_GETCLIPINFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THUMBNAIL_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MIN_DURATION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MAX_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MIN_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x20

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEIO_PROFILE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x21

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEO_LEVEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x22

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEO_FPS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x23

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x24

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_NOT_SUPPORTED_FORMAT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x25

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x26

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_NOT_ENOUGHT_DISK_SPACE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x27

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_CODEC_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x28

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_INVAILED_HANDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x29

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_START_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_AUDIO_DEC_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_VIDEO_DEC_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_VIDEO_ENC_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x2e

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_VIDEO_RENDER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x2f

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_NOT_ENOUGHT_DISK_SPACE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x30

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_AUDIO_PROFILE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x31

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THUMBNAIL_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x32

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_AUDIO_CODEC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x33

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_VIDEO_CODEC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x34

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x35

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_TOO_SHORT_CONTENTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x36

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_CODEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x37

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_CODEC_DECODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x38

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x39

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_WRITER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x3a

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_WRITER_WRITE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x3b

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_GET_INDEX_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x3c

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HIGHLIGHT_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x3d

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x3e

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_CLIPLIST_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x3f

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_CHECK_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x40

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x41

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_FILEWRITER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x42

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_DEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x43

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_DEC_INIT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x44

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_DEC_DECODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x45

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x46

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_ENCODE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x47

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_INPUT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x48

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_FUNCTION_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x49

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_DSI_DIFF_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x4a

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_ENC_FRAME_CONVERT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x4b

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x4c

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_WRITER_WRITE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x4d

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DIRECTEXPORT_WRITER_UNKNOWN_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x4e

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x4f

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_CLIPLIST_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x50

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_FIND_CLIP_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x51

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_FIND_READER_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x52

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_VIDEO_RENDERER_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x53

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_DEC_INIT_SURFACE_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x54

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->HW_NOT_ENOUGH_MEMORY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x55

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x56

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_DEC_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x57

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_FILEREADER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x58

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_TIME_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x59

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_RENDER_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x5a

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_OUTPUTSURFACE_INIT_ERROR:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x5b

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FASTPREVIEW_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x5c

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CODEC_DECODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x5d

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->RENDERER_AUDIO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x5e

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_AUDIO_SAMPLINGRATE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x5f

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->IMAGE_PROCESS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x60

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SET_TIME_IGNORED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x61

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SET_TIME_CANCELED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x62

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAILED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x63

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SOURCE_FILE_NOT_FOUND:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x64

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TRANSCODING_ABORTED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x65

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->DESTINATION_FILE_ALREADY_EXISTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x66

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->TEMP_FILE_ALREADY_EXISTS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x67

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_INSTANCE_AVAILABLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x68

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_NO_SUCCESS:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x69

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->PLAY_SUPERCEEDED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x6a

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->WRAPPER_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x6b

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NOT_READY_TO_PLAY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x6c

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->SEEKING_LOCKED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x6d

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_PROJECT_LOADED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x6e

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ALREADY_EXPORTING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x6f

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EMPTY_PROJECT:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x70

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->MISSING_RESOURCES:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x71

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_UNEXPECTED_STOP:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x72

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->RENAME_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x73

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAIL_ENOSPC:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x74

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAIL_OTHER:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x75

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->CAPTURE_FAIL_SCANNING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x76

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNRECOGNIZED_ERROR_CODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x77

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EDITOR_INSTANCE_DESTROYED:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x78

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->FILE_MISSING:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/16 v2, 0x79

    aput-object v1, v0, v2

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->$VALUES:[Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescriptionRsrcId:I

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mFromEngine:Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescriptionRsrcId:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mFromEngine:Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    iput-object p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    iput p5, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescriptionRsrcId:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mFromEngine:Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    iput-object p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescriptionRsrcId:I

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mFromEngine:Z

    return-void
.end method

.method public static fromValue(I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
    .locals 5

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->values()[Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget-boolean v4, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mFromEngine:Z

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const-string v0, "NexEditor.java"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized error code : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNRECOGNIZED_ERROR_CODE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
    .locals 1

    const-class v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return-object p0
.end method

.method public static values()[Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->$VALUES:[Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return-object v0
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getException()Ljava/lang/Exception;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getLocalizedDescription(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescriptionRsrcId:I

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescriptionRsrcId:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->name()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mDescription:Ljava/lang/String;

    return-object p1
.end method

.method public getLocalizedMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getLocalizedDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    return v0
.end method

.method public isError()Z
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-ne p0, v0, :cond_0

    const-string v0, "NONE(0)"

    return-object v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->mValue:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
