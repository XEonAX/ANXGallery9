.class public final enum Lcom/nexstreaming/app/common/util/FileType;
.super Ljava/lang/Enum;
.source "FileType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/util/FileType$a;,
        Lcom/nexstreaming/app/common/util/FileType$FileCategory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nexstreaming/app/common/util/FileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum AAC:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum ACC:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum AVI:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum BMP:Lcom/nexstreaming/app/common/util/FileType;

.field private static final CHECK_SIZE:I = 0x20

.field public static final enum F_3GP:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum GIF:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum JPEG:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum K3G:Lcom/nexstreaming/app/common/util/FileType;

.field private static final LOG_TAG:Ljava/lang/String; = "FileType"

.field public static final enum M4A:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum M4V:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum MOV:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum MP3:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum MP4:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum PNG:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum SVG:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum TTF:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum WBMP:Lcom/nexstreaming/app/common/util/FileType;

.field public static final enum WEBP:Lcom/nexstreaming/app/common/util/FileType;

.field private static final WEBP_HEADER:[B

.field public static final enum WMV:Lcom/nexstreaming/app/common/util/FileType;

.field private static final extensionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/app/common/util/FileType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

.field private final extensionOnly:Z

.field private final extensions:[Ljava/lang/String;

.field private final imp:Lcom/nexstreaming/app/common/util/FileType$a;

.field private final isSupportedFormat:Z


# direct methods
.method static constructor <clinit>()V
    .locals 29

    new-instance v6, Lcom/nexstreaming/app/common/util/FileType;

    const-string v1, "JPEG"

    sget-object v3, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v0, "jpeg"

    const-string v2, "jpg"

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x1

    new-array v5, v7, [[I

    const/4 v8, 0x3

    new-array v0, v8, [I

    fill-array-data v0, :array_0

    const/4 v9, 0x0

    aput-object v0, v5, v9

    const/4 v2, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v6, Lcom/nexstreaming/app/common/util/FileType;->JPEG:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v11, "PNG"

    sget-object v13, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v1, "png"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v14

    new-array v15, v7, [[I

    const/16 v1, 0x8

    new-array v2, v1, [I

    fill-array-data v2, :array_1

    aput-object v2, v15, v9

    const/4 v12, 0x1

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->PNG:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v17, "SVG"

    sget-object v19, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v2, "svg"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v20

    const/4 v2, 0x2

    new-array v3, v2, [[I

    const/4 v4, 0x4

    new-array v5, v4, [I

    fill-array-data v5, :array_2

    aput-object v5, v3, v9

    new-array v5, v4, [I

    fill-array-data v5, :array_3

    aput-object v5, v3, v7

    const/16 v18, 0x2

    move-object/from16 v16, v0

    move-object/from16 v21, v3

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->SVG:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v11, "WEBP"

    sget-object v13, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v3, "webp"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v14

    new-array v15, v7, [[I

    const/16 v3, 0xc

    new-array v5, v3, [I

    fill-array-data v5, :array_4

    aput-object v5, v15, v9

    const/4 v12, 0x3

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->WEBP:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v17, "GIF"

    sget-object v19, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "gif"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v20

    new-array v5, v2, [[I

    const/4 v6, 0x6

    new-array v10, v6, [I

    fill-array-data v10, :array_5

    aput-object v10, v5, v9

    new-array v10, v6, [I

    fill-array-data v10, :array_6

    aput-object v10, v5, v7

    const/16 v18, 0x4

    move-object/from16 v16, v0

    move-object/from16 v21, v5

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->GIF:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v11, "M4A"

    sget-object v13, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Audio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "m4a"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v14

    new-array v15, v2, [[I

    new-array v5, v3, [I

    fill-array-data v5, :array_7

    aput-object v5, v15, v9

    new-array v5, v3, [I

    fill-array-data v5, :array_8

    aput-object v5, v15, v7

    const/4 v12, 0x5

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->M4A:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v17, "M4V"

    sget-object v19, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "m4v"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v20

    new-array v5, v2, [[I

    new-array v10, v3, [I

    fill-array-data v10, :array_9

    aput-object v10, v5, v9

    new-array v10, v3, [I

    fill-array-data v10, :array_a

    aput-object v10, v5, v7

    const/16 v18, 0x6

    move-object/from16 v16, v0

    move-object/from16 v21, v5

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->M4V:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v11, "MP4"

    sget-object v13, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "mp4"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v14

    new-array v15, v1, [[I

    new-array v5, v3, [I

    fill-array-data v5, :array_b

    aput-object v5, v15, v9

    new-array v5, v3, [I

    fill-array-data v5, :array_c

    aput-object v5, v15, v7

    new-array v5, v3, [I

    fill-array-data v5, :array_d

    aput-object v5, v15, v2

    const/16 v5, 0x18

    new-array v5, v5, [I

    fill-array-data v5, :array_e

    aput-object v5, v15, v8

    new-array v5, v3, [I

    fill-array-data v5, :array_f

    aput-object v5, v15, v4

    new-array v5, v3, [I

    fill-array-data v5, :array_10

    const/16 v16, 0x5

    aput-object v5, v15, v16

    new-array v5, v3, [I

    fill-array-data v5, :array_11

    aput-object v5, v15, v6

    new-array v5, v3, [I

    fill-array-data v5, :array_12

    const/16 v17, 0x7

    aput-object v5, v15, v17

    const/4 v12, 0x7

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->MP4:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v19, "F_3GP"

    sget-object v21, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->VideoOrAudio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "3gp"

    const-string v10, "3gpp"

    const-string v11, "3g2"

    filled-new-array {v5, v10, v11}, [Ljava/lang/String;

    move-result-object v22

    new-array v5, v2, [[I

    const/16 v10, 0xb

    new-array v11, v10, [I

    fill-array-data v11, :array_13

    aput-object v11, v5, v9

    new-array v11, v10, [I

    fill-array-data v11, :array_14

    aput-object v11, v5, v7

    const/16 v20, 0x8

    move-object/from16 v18, v0

    move-object/from16 v23, v5

    invoke-direct/range {v18 .. v23}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->F_3GP:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v5, "K3G"

    sget-object v11, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v12, "k3g"

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x9

    invoke-direct {v0, v5, v13, v11, v12}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->K3G:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v5, "ACC"

    sget-object v11, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v12, "acc"

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v12

    const/16 v14, 0xa

    invoke-direct {v0, v5, v14, v11, v12}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->ACC:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v19, "AVI"

    sget-object v21, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "avi"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v22

    new-array v5, v7, [[I

    const/16 v11, 0x10

    new-array v12, v11, [I

    fill-array-data v12, :array_15

    aput-object v12, v5, v9

    const/16 v20, 0xb

    move-object/from16 v18, v0

    move-object/from16 v23, v5

    invoke-direct/range {v18 .. v23}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->AVI:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v24, "MOV"

    sget-object v26, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "mov"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v27

    new-array v5, v8, [[I

    new-array v12, v3, [I

    fill-array-data v12, :array_16

    aput-object v12, v5, v9

    new-array v12, v1, [I

    fill-array-data v12, :array_17

    aput-object v12, v5, v7

    new-array v12, v1, [I

    fill-array-data v12, :array_18

    aput-object v12, v5, v2

    const/16 v25, 0xc

    move-object/from16 v23, v0

    move-object/from16 v28, v5

    invoke-direct/range {v23 .. v28}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->MOV:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v19, "WMV"

    sget-object v21, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "wmv"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v22

    new-array v5, v7, [[I

    new-array v12, v11, [I

    fill-array-data v12, :array_19

    aput-object v12, v5, v9

    const/16 v20, 0xd

    move-object/from16 v18, v0

    move-object/from16 v23, v5

    invoke-direct/range {v18 .. v23}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->WMV:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v24, "MP3"

    sget-object v26, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Audio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "mp3"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v27

    new-array v5, v2, [[I

    new-array v12, v8, [I

    fill-array-data v12, :array_1a

    aput-object v12, v5, v9

    new-array v12, v2, [I

    fill-array-data v12, :array_1b

    aput-object v12, v5, v7

    const/16 v25, 0xe

    move-object/from16 v23, v0

    move-object/from16 v28, v5

    invoke-direct/range {v23 .. v28}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->MP3:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v19, "AAC"

    sget-object v21, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Audio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "aac"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v22

    new-array v5, v2, [[I

    new-array v12, v2, [I

    fill-array-data v12, :array_1c

    aput-object v12, v5, v9

    new-array v12, v2, [I

    fill-array-data v12, :array_1d

    aput-object v12, v5, v7

    const/16 v20, 0xf

    move-object/from16 v18, v0

    move-object/from16 v23, v5

    invoke-direct/range {v18 .. v23}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->AAC:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v24, "BMP"

    sget-object v26, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "bmp"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v27

    new-array v5, v7, [[I

    new-array v12, v2, [I

    fill-array-data v12, :array_1e

    aput-object v12, v5, v9

    const/16 v25, 0x10

    move-object/from16 v23, v0

    move-object/from16 v28, v5

    invoke-direct/range {v23 .. v28}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->BMP:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v5, "TTF"

    sget-object v12, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Font:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v15, "ttf"

    const-string v11, "otf"

    filled-new-array {v15, v11}, [Ljava/lang/String;

    move-result-object v11

    const/16 v15, 0x11

    invoke-direct {v0, v5, v15, v12, v11}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->TTF:Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Lcom/nexstreaming/app/common/util/FileType;

    const-string v19, "WBMP"

    sget-object v21, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    const-string v5, "wbmp"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v22

    const/16 v20, 0x12

    const/16 v23, 0x0

    move-object/from16 v18, v0

    invoke-direct/range {v18 .. v23}, Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;Z)V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->WBMP:Lcom/nexstreaming/app/common/util/FileType;

    const/16 v0, 0x13

    new-array v0, v0, [Lcom/nexstreaming/app/common/util/FileType;

    sget-object v5, Lcom/nexstreaming/app/common/util/FileType;->JPEG:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v5, v0, v9

    sget-object v5, Lcom/nexstreaming/app/common/util/FileType;->PNG:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v5, v0, v7

    sget-object v5, Lcom/nexstreaming/app/common/util/FileType;->SVG:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v5, v0, v2

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->WEBP:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v8

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->GIF:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v4

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->M4A:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v16

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->M4V:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v6

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->MP4:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v17

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->F_3GP:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v1

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->K3G:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v13

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->ACC:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v14

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->AVI:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v10

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->MOV:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v3

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->WMV:Lcom/nexstreaming/app/common/util/FileType;

    const/16 v3, 0xd

    aput-object v2, v0, v3

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->MP3:Lcom/nexstreaming/app/common/util/FileType;

    const/16 v3, 0xe

    aput-object v2, v0, v3

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->AAC:Lcom/nexstreaming/app/common/util/FileType;

    const/16 v3, 0xf

    aput-object v2, v0, v3

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->BMP:Lcom/nexstreaming/app/common/util/FileType;

    const/16 v3, 0x10

    aput-object v2, v0, v3

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->TTF:Lcom/nexstreaming/app/common/util/FileType;

    aput-object v2, v0, v15

    sget-object v2, Lcom/nexstreaming/app/common/util/FileType;->WBMP:Lcom/nexstreaming/app/common/util/FileType;

    const/16 v3, 0x12

    aput-object v2, v0, v3

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->$VALUES:[Lcom/nexstreaming/app/common/util/FileType;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    new-array v0, v1, [B

    fill-array-data v0, :array_1f

    sput-object v0, Lcom/nexstreaming/app/common/util/FileType;->WEBP_HEADER:[B

    return-void

    nop

    :array_0
    .array-data 4
        0xff
        0xd8
        0xff
    .end array-data

    :array_1
    .array-data 4
        0x89
        0x50
        0x4e
        0x47
        0xd
        0xa
        0x1a
        0xa
    .end array-data

    :array_2
    .array-data 4
        0x3c
        0x73
        0x76
        0x67
    .end array-data

    :array_3
    .array-data 4
        0x3c
        0x53
        0x56
        0x47
    .end array-data

    :array_4
    .array-data 4
        0x52
        0x49
        0x46
        0x46
        -0x1
        -0x1
        -0x1
        -0x1
        0x57
        0x45
        0x42
        0x50
    .end array-data

    :array_5
    .array-data 4
        0x47
        0x49
        0x46
        0x38
        0x37
        0x61
    .end array-data

    :array_6
    .array-data 4
        0x47
        0x49
        0x46
        0x38
        0x39
        0x61
    .end array-data

    :array_7
    .array-data 4
        0x0
        0x0
        0x0
        0x20
        0x66
        0x74
        0x79
        0x70
        0x4d
        0x34
        0x41
        0x20
    .end array-data

    :array_8
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x4d
        0x34
        0x41
        0x20
    .end array-data

    :array_9
    .array-data 4
        0x0
        0x0
        0x0
        0x18
        0x66
        0x74
        0x79
        0x70
        0x6d
        0x70
        0x34
        0x32
    .end array-data

    :array_a
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x6d
        0x70
        0x34
        0x32
    .end array-data

    :array_b
    .array-data 4
        0x0
        0x0
        0x0
        0x14
        0x66
        0x74
        0x79
        0x70
        0x69
        0x73
        0x6f
        0x6d
    .end array-data

    :array_c
    .array-data 4
        0x0
        0x0
        0x0
        0x18
        0x66
        0x74
        0x79
        0x70
        0x69
        0x73
        0x6f
        0x6d
    .end array-data

    :array_d
    .array-data 4
        0x0
        0x0
        0x0
        0x18
        0x66
        0x74
        0x79
        0x70
        0x33
        0x67
        0x70
        0x35
    .end array-data

    :array_e
    .array-data 4
        0x0
        0x0
        0x0
        0x1c
        0x66
        0x74
        0x79
        0x70
        0x4d
        0x53
        0x4e
        0x56
        0x1
        0x29
        0x0
        0x46
        0x4d
        0x53
        0x4e
        0x56
        0x6d
        0x70
        0x34
        0x32
    .end array-data

    :array_f
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x33
        0x67
        0x70
        0x35
    .end array-data

    :array_10
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x4d
        0x53
        0x4e
        0x56
    .end array-data

    :array_11
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x69
        0x73
        0x6f
        0x6d
    .end array-data

    :array_12
    .array-data 4
        0x0
        0x0
        0x0
        0x18
        0x66
        0x74
        0x79
        0x70
        0x6d
        0x70
        0x34
        0x31
    .end array-data

    :array_13
    .array-data 4
        0x0
        0x0
        0x0
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x33
        0x67
        0x70
    .end array-data

    :array_14
    .array-data 4
        0x0
        0x0
        0x0
        -0x1
        0x66
        0x74
        0x79
        0x70
        0x33
        0x67
        0x32
    .end array-data

    :array_15
    .array-data 4
        0x52
        0x49
        0x46
        0x46
        -0x1
        -0x1
        -0x1
        -0x1
        0x41
        0x56
        0x49
        0x20
        0x4c
        0x49
        0x53
        0x54
    .end array-data

    :array_16
    .array-data 4
        0x0
        0x0
        0x0
        0x14
        0x66
        0x74
        0x79
        0x70
        0x71
        0x74
        0x20
        0x20
    .end array-data

    :array_17
    .array-data 4
        0x66
        0x74
        0x79
        0x70
        0x71
        0x74
        0x20
        0x20
    .end array-data

    :array_18
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x6d
        0x6f
        0x6f
        0x76
    .end array-data

    :array_19
    .array-data 4
        0x30
        0x26
        0xb2
        0x75
        0x8e
        0x66
        0xcf
        0x11
        0xa6
        0xd9
        0x0
        0xaa
        0x0
        0x62
        0xce
        0x6c
    .end array-data

    :array_1a
    .array-data 4
        0x49
        0x44
        0x33
    .end array-data

    :array_1b
    .array-data 4
        0xff
        0xfb
    .end array-data

    :array_1c
    .array-data 4
        0xff
        0xf1
    .end array-data

    :array_1d
    .array-data 4
        0xff
        0xf9
    .end array-data

    :array_1e
    .array-data 4
        0x42
        0x4d
    .end array-data

    :array_1f
    .array-data 1
        0x52t
        0x49t
        0x46t
        0x46t
        0x57t
        0x45t
        0x42t
        0x50t
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/app/common/util/FileType$FileCategory;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance p1, Lcom/nexstreaming/app/common/util/FileType$2;

    invoke-direct {p1, p0}, Lcom/nexstreaming/app/common/util/FileType$2;-><init>(Lcom/nexstreaming/app/common/util/FileType;)V

    iput-object p1, p0, Lcom/nexstreaming/app/common/util/FileType;->imp:Lcom/nexstreaming/app/common/util/FileType$a;

    iput-object p3, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    iput-object p4, p0, Lcom/nexstreaming/app/common/util/FileType;->extensions:[Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/util/FileType;->extensionOnly:Z

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/util/FileType;->isSupportedFormat:Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/app/common/util/FileType$FileCategory;",
            "[",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance p1, Lcom/nexstreaming/app/common/util/FileType$1;

    invoke-direct {p1, p0}, Lcom/nexstreaming/app/common/util/FileType$1;-><init>(Lcom/nexstreaming/app/common/util/FileType;)V

    iput-object p1, p0, Lcom/nexstreaming/app/common/util/FileType;->imp:Lcom/nexstreaming/app/common/util/FileType$a;

    iput-object p3, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    iput-object p4, p0, Lcom/nexstreaming/app/common/util/FileType;->extensions:[Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/util/FileType;->extensionOnly:Z

    iput-boolean p5, p0, Lcom/nexstreaming/app/common/util/FileType;->isSupportedFormat:Z

    return-void
.end method

.method private varargs constructor <init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/app/common/util/FileType$FileCategory;",
            "[",
            "Ljava/lang/String;",
            "[[I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance p1, Lcom/nexstreaming/app/common/util/FileType$3;

    invoke-direct {p1, p0, p5}, Lcom/nexstreaming/app/common/util/FileType$3;-><init>(Lcom/nexstreaming/app/common/util/FileType;[[I)V

    iput-object p1, p0, Lcom/nexstreaming/app/common/util/FileType;->imp:Lcom/nexstreaming/app/common/util/FileType$a;

    iput-object p3, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    iput-object p4, p0, Lcom/nexstreaming/app/common/util/FileType;->extensions:[Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/util/FileType;->extensionOnly:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/util/FileType;->isSupportedFormat:Z

    return-void
.end method

.method private static a()V
    .locals 10

    sget-object v0, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/nexstreaming/app/common/util/FileType;->values()[Lcom/nexstreaming/app/common/util/FileType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, v0, v3

    iget-object v5, v4, Lcom/nexstreaming/app/common/util/FileType;->extensions:[Ljava/lang/String;

    array-length v6, v5

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v6, :cond_1

    aget-object v8, v5, v7

    sget-object v9, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    invoke-interface {v9, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static fromExtension(Ljava/io/File;)Lcom/nexstreaming/app/common/util/FileType;
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ltz v1, :cond_1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    move-object p0, v0

    :goto_0
    if-eqz p0, :cond_3

    sget-object v0, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/nexstreaming/app/common/util/FileType;->a()V

    :cond_2
    sget-object v0, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/app/common/util/FileType;

    return-object p0

    :cond_3
    return-object v0
.end method

.method public static fromExtension(Ljava/lang/String;)Lcom/nexstreaming/app/common/util/FileType;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-gez v1, :cond_1

    return-object v0

    :cond_1
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-ge v1, v2, :cond_2

    return-object v0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/nexstreaming/app/common/util/FileType;->a()V

    :cond_3
    sget-object v0, Lcom/nexstreaming/app/common/util/FileType;->extensionMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/app/common/util/FileType;

    return-object p0
.end method

.method public static fromFile(Ljava/io/File;)Lcom/nexstreaming/app/common/util/FileType;
    .locals 12

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-ltz v2, :cond_1

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    const/4 v2, 0x0

    if-eqz v1, :cond_4

    invoke-static {}, Lcom/nexstreaming/app/common/util/FileType;->values()[Lcom/nexstreaming/app/common/util/FileType;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_4

    aget-object v6, v3, v5

    iget-object v7, v6, Lcom/nexstreaming/app/common/util/FileType;->extensions:[Ljava/lang/String;

    array-length v8, v7

    const/4 v9, 0x0

    :goto_2
    if-ge v9, v8, :cond_3

    aget-object v10, v7, v9

    iget-boolean v11, v6, Lcom/nexstreaming/app/common/util/FileType;->extensionOnly:Z

    if-eqz v11, :cond_2

    invoke-virtual {v10, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string p0, "FileType"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FileType extension match: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/nexstreaming/app/common/util/FileType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v6

    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x20

    cmp-long v7, v3, v5

    if-ltz v7, :cond_8

    const/16 v3, 0x20

    new-array v4, v3, [B

    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v5, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catchall_0
    move-exception p0

    :try_start_3
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    throw p0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    const/4 p0, 0x0

    :catch_1
    move-object v4, v0

    :goto_3
    if-eqz v4, :cond_9

    if-lt p0, v3, :cond_9

    invoke-static {}, Lcom/nexstreaming/app/common/util/FileType;->values()[Lcom/nexstreaming/app/common/util/FileType;

    move-result-object p0

    array-length v3, p0

    move-object v6, v0

    const/4 v5, 0x0

    :goto_4
    if-ge v5, v3, :cond_7

    aget-object v7, p0, v5

    iget-object v8, v7, Lcom/nexstreaming/app/common/util/FileType;->imp:Lcom/nexstreaming/app/common/util/FileType$a;

    invoke-virtual {v8, v4}, Lcom/nexstreaming/app/common/util/FileType$a;->a([B)Z

    move-result v8

    if-eqz v8, :cond_6

    const-string v8, "FileType"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FileType analysis match: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lcom/nexstreaming/app/common/util/FileType;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v6, :cond_5

    const-string p0, "FileType"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FileType analysis MULTIPLE match: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lcom/nexstreaming/app/common/util/FileType;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " (fall back to file extension)"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v6, v0

    goto :goto_5

    :cond_5
    move-object v6, v7

    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_7
    :goto_5
    if-eqz v6, :cond_9

    return-object v6

    :cond_8
    move-object v4, v0

    :cond_9
    if-eqz v1, :cond_d

    invoke-static {}, Lcom/nexstreaming/app/common/util/FileType;->values()[Lcom/nexstreaming/app/common/util/FileType;

    move-result-object p0

    array-length v3, p0

    const/4 v5, 0x0

    :goto_6
    if-ge v5, v3, :cond_d

    aget-object v6, p0, v5

    iget-object v7, v6, Lcom/nexstreaming/app/common/util/FileType;->extensions:[Ljava/lang/String;

    array-length v8, v7

    const/4 v9, 0x0

    :goto_7
    if-ge v9, v8, :cond_c

    aget-object v10, v7, v9

    invoke-virtual {v10, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    const-string p0, "FileType"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FileType extension match: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/nexstreaming/app/common/util/FileType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v4, :cond_a

    const-string v1, "null"

    goto :goto_8

    :cond_a
    invoke-static {v4}, Lcom/nexstreaming/app/common/util/n;->a([B)Ljava/lang/String;

    move-result-object v1

    :goto_8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v6

    :cond_b
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    :cond_c
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    :cond_d
    return-object v0
.end method

.method public static fromFile(Ljava/lang/String;)Lcom/nexstreaming/app/common/util/FileType;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/nexstreaming/app/common/util/FileType;->fromFile(Ljava/io/File;)Lcom/nexstreaming/app/common/util/FileType;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nexstreaming/app/common/util/FileType;
    .locals 1

    const-class v0, Lcom/nexstreaming/app/common/util/FileType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/app/common/util/FileType;

    return-object p0
.end method

.method public static values()[Lcom/nexstreaming/app/common/util/FileType;
    .locals 1

    sget-object v0, Lcom/nexstreaming/app/common/util/FileType;->$VALUES:[Lcom/nexstreaming/app/common/util/FileType;

    invoke-virtual {v0}, [Lcom/nexstreaming/app/common/util/FileType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/app/common/util/FileType;

    return-object v0
.end method


# virtual methods
.method public getCategory()Lcom/nexstreaming/app/common/util/FileType$FileCategory;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    return-object v0
.end method

.method public isAudio()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    sget-object v1, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Audio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    sget-object v1, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->VideoOrAudio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isImage()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    sget-object v1, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Image:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSupportedFormat()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/FileType;->isSupportedFormat:Z

    return v0
.end method

.method public isVideo()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    sget-object v1, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->Video:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/app/common/util/FileType;->category:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    sget-object v1, Lcom/nexstreaming/app/common/util/FileType$FileCategory;->VideoOrAudio:Lcom/nexstreaming/app/common/util/FileType$FileCategory;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
