.class Lcom/miui/gallery/cleaner/VideoScanner$VideoMediaItem;
.super Ljava/lang/Object;
.source "VideoScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/VideoScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VideoMediaItem"
.end annotation


# instance fields
.field public mId:J

.field public mPath:Ljava/lang/String;

.field public mSha1:Ljava/lang/String;

.field public mSize:J


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cleaner/VideoScanner$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/VideoScanner$VideoMediaItem;-><init>()V

    return-void
.end method
