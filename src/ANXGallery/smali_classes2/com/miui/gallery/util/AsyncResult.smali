.class public Lcom/miui/gallery/util/AsyncResult;
.super Ljava/lang/Object;
.source "AsyncResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final mData:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final mError:I


# direct methods
.method private constructor <init>(ILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/util/AsyncResult;->mError:I

    iput-object p2, p0, Lcom/miui/gallery/util/AsyncResult;->mData:Ljava/lang/Object;

    return-void
.end method

.method public static create(I)Lcom/miui/gallery/util/AsyncResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lcom/miui/gallery/util/AsyncResult<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/util/AsyncResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/util/AsyncResult;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method

.method public static create(ILjava/lang/Object;)Lcom/miui/gallery/util/AsyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)",
            "Lcom/miui/gallery/util/AsyncResult<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/util/AsyncResult;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/AsyncResult;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "[error code=%d, data=%s]"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/miui/gallery/util/AsyncResult;->mError:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/util/AsyncResult;->mData:Ljava/lang/Object;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
