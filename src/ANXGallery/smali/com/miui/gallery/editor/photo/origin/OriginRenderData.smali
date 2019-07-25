.class public Lcom/miui/gallery/editor/photo/origin/OriginRenderData;
.super Ljava/lang/Object;
.source "OriginRenderData.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/origin/OriginRenderData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mBundle:Landroid/os/Bundle;

.field mOut:Landroid/net/Uri;

.field mRenderDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;"
        }
    .end annotation
.end field

.field mSource:Landroid/net/Uri;

.field mWithWatermark:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/origin/OriginRenderData$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->readList(Landroid/os/Parcel;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mRenderDataList:Ljava/util/List;

    const-class v0, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mSource:Landroid/net/Uri;

    const-class v0, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mOut:Landroid/net/Uri;

    const-class v0, Landroid/os/Bundle;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mBundle:Landroid/os/Bundle;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mWithWatermark:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/net/Uri;Landroid/net/Uri;Landroid/os/Bundle;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            "Landroid/os/Bundle;",
            "Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mRenderDataList:Ljava/util/List;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mSource:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mOut:Landroid/net/Uri;

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mBundle:Landroid/os/Bundle;

    iput-boolean p5, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mWithWatermark:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mRenderDataList:Ljava/util/List;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->writeList(Landroid/os/Parcel;ILjava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mSource:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mOut:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mBundle:Landroid/os/Bundle;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mWithWatermark:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    return-void
.end method
