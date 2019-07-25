.class public Lcom/miui/gallery/model/OtherAlbum;
.super Lcom/miui/gallery/model/Album;
.source "OtherAlbum.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/model/OtherAlbum;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAlbumNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/OtherAlbum$1;

    invoke-direct {v0}, Lcom/miui/gallery/model/OtherAlbum$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/model/OtherAlbum;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const-wide/32 v0, 0x7ffffff9

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/model/Album;-><init>(J)V

    sget-object v0, Lcom/miui/gallery/model/Album$AlbumType;->OTHER_ALBUMS:Lcom/miui/gallery/model/Album$AlbumType;

    invoke-super {p0, v0}, Lcom/miui/gallery/model/Album;->setAlbumType(Lcom/miui/gallery/model/Album$AlbumType;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/model/Album;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/model/OtherAlbum;->mAlbumNames:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAlbumNames()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/model/OtherAlbum;->mAlbumNames:Ljava/util/ArrayList;

    return-object v0
.end method

.method public setAlbumNames(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/model/OtherAlbum;->mAlbumNames:Ljava/util/ArrayList;

    return-void
.end method

.method public final setAlbumType(Lcom/miui/gallery/model/Album$AlbumType;)V
    .locals 0

    sget-object p1, Lcom/miui/gallery/model/Album$AlbumType;->OTHER_ALBUMS:Lcom/miui/gallery/model/Album$AlbumType;

    invoke-super {p0, p1}, Lcom/miui/gallery/model/Album;->setAlbumType(Lcom/miui/gallery/model/Album$AlbumType;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/model/Album;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lcom/miui/gallery/model/OtherAlbum;->mAlbumNames:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    return-void
.end method
