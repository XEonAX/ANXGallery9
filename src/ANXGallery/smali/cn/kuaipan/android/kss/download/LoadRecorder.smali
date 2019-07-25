.class public Lcn/kuaipan/android/kss/download/LoadRecorder;
.super Ljava/lang/Object;
.source "LoadRecorder.java"


# instance fields
.field private map:Lcn/kuaipan/android/kss/download/LoadMap;

.field private final space:Lcn/kuaipan/android/kss/download/LoadMap$Space;


# direct methods
.method constructor <init>(Lcn/kuaipan/android/kss/download/LoadMap;Lcn/kuaipan/android/kss/download/LoadMap$Space;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->map:Lcn/kuaipan/android/kss/download/LoadMap;

    iput-object p2, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->space:Lcn/kuaipan/android/kss/download/LoadMap$Space;

    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->map:Lcn/kuaipan/android/kss/download/LoadMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->space:Lcn/kuaipan/android/kss/download/LoadMap$Space;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->remove(I)V

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->map:Lcn/kuaipan/android/kss/download/LoadMap;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/kss/download/LoadMap;->onSpaceRemoved(I)V

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "The recoder has been recycled"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/LoadRecorder;->recycle()V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method getSpace()Lcn/kuaipan/android/kss/download/LoadMap$Space;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->space:Lcn/kuaipan/android/kss/download/LoadMap$Space;

    return-object v0
.end method

.method getStart()J
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->space:Lcn/kuaipan/android/kss/download/LoadMap$Space;

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->getStart()J

    move-result-wide v0

    return-wide v0
.end method

.method public recycle()V
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->map:Lcn/kuaipan/android/kss/download/LoadMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->map:Lcn/kuaipan/android/kss/download/LoadMap;

    invoke-virtual {v0, p0}, Lcn/kuaipan/android/kss/download/LoadMap;->recycleRecorder(Lcn/kuaipan/android/kss/download/LoadRecorder;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->map:Lcn/kuaipan/android/kss/download/LoadMap;

    :cond_0
    return-void
.end method

.method public size()J
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadRecorder;->space:Lcn/kuaipan/android/kss/download/LoadMap$Space;

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->size()J

    move-result-wide v0

    return-wide v0
.end method
