.class public Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;
.super Lcom/miui/gallery/editor/photo/core/RenderData;
.source "RemoverRenderData.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mPaintData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/RenderData;-><init>(Landroid/os/Parcel;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->mPaintData:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->mPaintData:Ljava/util/List;

    const-class v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderData;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->mPaintData:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onRelease()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->mPaintData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    iget-object v2, v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;->mRemoverNNFData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverNNFData;

    if-eqz v2, :cond_0

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;->mRemoverNNFData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverNNFData;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverNNFData;->releaseMemoryFile()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/RenderData;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->mPaintData:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    return-void
.end method
