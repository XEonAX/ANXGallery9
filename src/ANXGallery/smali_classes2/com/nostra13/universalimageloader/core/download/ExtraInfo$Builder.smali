.class public final Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;
.super Ljava/lang/Object;
.source "ExtraInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/download/ExtraInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private implicitObj:Ljava/lang/Object;

.field private requestThumbnail:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->requestThumbnail:Z

    return p0
.end method

.method static synthetic access$100(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->implicitObj:Ljava/lang/Object;

    return-object p0
.end method


# virtual methods
.method public build()Lcom/nostra13/universalimageloader/core/download/ExtraInfo;
    .locals 2

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo;-><init>(Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;Lcom/nostra13/universalimageloader/core/download/ExtraInfo$1;)V

    return-object v0
.end method

.method public requestThumbnail(Z)Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->requestThumbnail:Z

    return-object p0
.end method
