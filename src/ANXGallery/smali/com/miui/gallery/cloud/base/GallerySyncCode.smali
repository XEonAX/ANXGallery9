.class public final enum Lcom/miui/gallery/cloud/base/GallerySyncCode;
.super Ljava/lang/Enum;
.source "GallerySyncCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/cloud/base/GallerySyncCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum ALBUM_NOT_EMPTY:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum ALBUM_NOT_EXIST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum CANCEL:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum NEED_RE_REQUEST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum NOT_RETRY_CURRENT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum RESET_FACE_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum RESET_SYNC_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum TIMEOUT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public static final enum UNKNOWN:Lcom/miui/gallery/cloud/base/GallerySyncCode;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "CANCEL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CANCEL:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "TIMEOUT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->TIMEOUT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "RETRY_ERROR"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "NOT_RETRY_ERROR"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "NEED_RE_REQUEST"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NEED_RE_REQUEST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "ALBUM_NOT_EXIST"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EXIST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "ALBUM_NOT_EMPTY"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EMPTY:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "NOT_CONTINUE_ERROR"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "NOT_RETRY_CURRENT"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_CURRENT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "RESET_SYNC_TAG"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RESET_SYNC_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "RESET_FACE_TAG"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RESET_FACE_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "CONDITION_INTERRUPTED"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v1, "UNKNOWN"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15}, Lcom/miui/gallery/cloud/base/GallerySyncCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->UNKNOWN:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const/16 v0, 0xe

    new-array v0, v0, [Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CANCEL:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->TIMEOUT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NEED_RE_REQUEST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EXIST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v8

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EMPTY:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v9

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v10

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_CURRENT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v11

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RESET_SYNC_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v12

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RESET_FACE_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v13

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v14

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->UNKNOWN:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    aput-object v1, v0, v15

    sput-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->$VALUES:[Lcom/miui/gallery/cloud/base/GallerySyncCode;

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

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 1

    const-class v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->$VALUES:[Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0}, [Lcom/miui/gallery/cloud/base/GallerySyncCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object v0
.end method
