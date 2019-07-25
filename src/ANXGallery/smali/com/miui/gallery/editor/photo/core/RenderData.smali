.class public abstract Lcom/miui/gallery/editor/photo/core/RenderData;
.super Ljava/lang/Object;
.source "RenderData.java"

# interfaces
.implements Landroid/os/Parcelable;


# instance fields
.field public mType:Lcom/miui/gallery/editor/photo/core/Effect;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/Effect;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/RenderData;->mType:Lcom/miui/gallery/editor/photo/core/Effect;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method final getType()Lcom/miui/gallery/editor/photo/core/Effect;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/RenderData;->mType:Lcom/miui/gallery/editor/photo/core/Effect;

    return-object v0
.end method

.method final merge(Lcom/miui/gallery/editor/photo/core/RenderData;)Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/RenderData;->onMerge(Lcom/miui/gallery/editor/photo/core/RenderData;)Lcom/miui/gallery/editor/photo/core/RenderData;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/RenderData;->mType:Lcom/miui/gallery/editor/photo/core/Effect;

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/core/RenderData;->mType:Lcom/miui/gallery/editor/photo/core/Effect;

    :cond_0
    return-object p1
.end method

.method protected onMerge(Lcom/miui/gallery/editor/photo/core/RenderData;)Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected onRelease()V
    .locals 0

    return-void
.end method

.method public final release()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/RenderData;->onRelease()V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/RenderData;->mType:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
