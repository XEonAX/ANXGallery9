.class public abstract Lcom/miui/gallery/editor/photo/core/Metadata;
.super Ljava/lang/Object;
.source "Metadata.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/editor/photo/core/Metadata;",
        ">;"
    }
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field public final priority:I


# direct methods
.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->name:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->priority:I

    return-void
.end method

.method public constructor <init>(SLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->name:Ljava/lang/String;

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->priority:I

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/editor/photo/core/Metadata;)I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->priority:I

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/Metadata;->priority:I

    sub-int/2addr v0, p1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/core/Metadata;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/Metadata;->compareTo(Lcom/miui/gallery/editor/photo/core/Metadata;)I

    move-result p1

    return p1
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/Metadata;->priority:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
