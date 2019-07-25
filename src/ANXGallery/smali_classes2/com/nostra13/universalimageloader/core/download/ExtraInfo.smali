.class public final Lcom/nostra13/universalimageloader/core/download/ExtraInfo;
.super Ljava/lang/Object;
.source "ExtraInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;
    }
.end annotation


# instance fields
.field private final implicitObj:Ljava/lang/Object;

.field private final requestThumbnail:Z


# direct methods
.method private constructor <init>(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->access$000(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo;->requestThumbnail:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->access$100(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo;->implicitObj:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;Lcom/nostra13/universalimageloader/core/download/ExtraInfo$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo;-><init>(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;)V

    return-void
.end method


# virtual methods
.method public requestThumbnail()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo;->requestThumbnail:Z

    return v0
.end method
