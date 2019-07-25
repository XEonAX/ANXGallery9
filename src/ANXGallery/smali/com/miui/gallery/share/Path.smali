.class public Lcom/miui/gallery/share/Path;
.super Ljava/lang/Object;
.source "Path.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/share/Path;",
            ">;"
        }
    .end annotation
.end field

.field static sSetCache:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/CloudSharerMediaSet;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mId:J

.field private mIsBabyAlbum:Z

.field private mIsOtherShared:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/share/Path;->sSetCache:Ljava/util/WeakHashMap;

    new-instance v0, Lcom/miui/gallery/share/Path$1;

    invoke-direct {v0}, Lcom/miui/gallery/share/Path$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/share/Path;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/miui/gallery/share/Path;->mId:J

    iput-boolean p3, p0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    return-void
.end method

.method public constructor <init>(JZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/miui/gallery/share/Path;->mId:J

    iput-boolean p3, p0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    iput-boolean p4, p0, Lcom/miui/gallery/share/Path;->mIsBabyAlbum:Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lcom/miui/gallery/share/Path;->mIsBabyAlbum:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/share/Path;->mId:J

    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/miui/gallery/share/Path;
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/share/Path;

    invoke-direct {v0}, Lcom/miui/gallery/share/Path;-><init>()V

    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const-string v3, "other"

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, v0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    add-int/2addr v2, v4

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/share/Path;->mId:J

    return-object v0

    :cond_2
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/share/Path;->mId:J

    return-wide v0
.end method

.method public getMediaSet()Lcom/miui/gallery/share/CloudSharerMediaSet;
    .locals 2

    sget-object v0, Lcom/miui/gallery/share/Path;->sSetCache:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/share/Path;->sSetCache:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/share/CloudSharerMediaSet;

    return-object v0

    :cond_0
    new-instance v0, Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;-><init>(Lcom/miui/gallery/share/Path;)V

    sget-object v1, Lcom/miui/gallery/share/Path;->sSetCache:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public isBabyAlbum()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/share/Path;->mIsBabyAlbum:Z

    return v0
.end method

.method public isOtherShared()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v1, p0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    if-eqz v1, :cond_0

    const-string v1, "other"

    goto :goto_0

    :cond_0
    const-string v1, "owner"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/share/Path;->mId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    iget-boolean p2, p0, Lcom/miui/gallery/share/Path;->mIsOtherShared:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean p2, p0, Lcom/miui/gallery/share/Path;->mIsBabyAlbum:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget-wide v0, p0, Lcom/miui/gallery/share/Path;->mId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    return-void
.end method
