.class public final Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
.super Ljava/lang/Object;
.source "GallerySyncResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/base/GallerySyncResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
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
.field private code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field private data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private exception:Ljava/lang/Exception;

.field private retryAfter:J


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->retryAfter:J

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->retryAfter:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)Ljava/lang/Exception;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->exception:Ljava/lang/Exception;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->data:Ljava/lang/Object;

    return-object p0
.end method


# virtual methods
.method public build()Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 2

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult;-><init>(Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;Lcom/miui/gallery/cloud/base/GallerySyncResult$1;)V

    return-object v0
.end method

.method public clone(Lcom/miui/gallery/cloud/base/GallerySyncResult;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "TT;>;)",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;"
        }
    .end annotation

    iget-object v0, p1, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iget-wide v0, p1, Lcom/miui/gallery/cloud/base/GallerySyncResult;->retryAfter:J

    iput-wide v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->retryAfter:J

    iget-object v0, p1, Lcom/miui/gallery/cloud/base/GallerySyncResult;->exception:Ljava/lang/Exception;

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->exception:Ljava/lang/Exception;

    iget-object p1, p1, Lcom/miui/gallery/cloud/base/GallerySyncResult;->data:Ljava/lang/Object;

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->data:Ljava/lang/Object;

    return-object p0
.end method

.method public setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p0
.end method

.method public setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->data:Ljava/lang/Object;

    return-object p0
.end method

.method public setException(Ljava/lang/Exception;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->exception:Ljava/lang/Exception;

    return-object p0
.end method

.method public setRetryAfter(J)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->retryAfter:J

    return-object p0
.end method
