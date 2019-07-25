.class public Lcom/miui/gallery/cloud/base/GallerySyncResult;
.super Ljava/lang/Object;
.source "GallerySyncResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final exception:Ljava/lang/Exception;

.field public final retryAfter:J


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder<",
            "TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->access$000(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)Lcom/miui/gallery/cloud/base/GallerySyncCode;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->access$100(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->retryAfter:J

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->access$200(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)Ljava/lang/Exception;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->exception:Ljava/lang/Exception;

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->access$300(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->data:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;Lcom/miui/gallery/cloud/base/GallerySyncResult$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult;-><init>(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "code %s, exception %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->exception:Ljava/lang/Exception;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
