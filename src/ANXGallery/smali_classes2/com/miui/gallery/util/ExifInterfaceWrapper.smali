.class Lcom/miui/gallery/util/ExifInterfaceWrapper;
.super Ljava/lang/Object;
.source "ExifUtil.java"


# instance fields
.field private mExifI:Lcom/miui/gallery3d/exif/ExifInterface;

.field private mMediaExif:Landroid/media/ExifInterface;

.field private mSupportExifI:Landroid/support/media/ExifInterface;


# direct methods
.method public constructor <init>(Landroid/media/ExifInterface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mMediaExif:Landroid/media/ExifInterface;

    return-void
.end method

.method public constructor <init>(Landroid/support/media/ExifInterface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mSupportExifI:Landroid/support/media/ExifInterface;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery3d/exif/ExifInterface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mExifI:Lcom/miui/gallery3d/exif/ExifInterface;

    return-void
.end method


# virtual methods
.method public getUserComment()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mExifI:Lcom/miui/gallery3d/exif/ExifInterface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mExifI:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getUserCommentAsASCII()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mSupportExifI:Landroid/support/media/ExifInterface;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mSupportExifI:Landroid/support/media/ExifInterface;

    const-string v1, "UserComment"

    invoke-virtual {v0, v1}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mMediaExif:Landroid/media/ExifInterface;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mMediaExif:Landroid/media/ExifInterface;

    const-string v1, "UserComment"

    invoke-virtual {v0, v1}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public setUserComment(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mExifI:Lcom/miui/gallery3d/exif/ExifInterface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mExifI:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-virtual {v0, p1}, Lcom/miui/gallery3d/exif/ExifInterface;->addUserComment(Ljava/lang/String;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mSupportExifI:Landroid/support/media/ExifInterface;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mSupportExifI:Landroid/support/media/ExifInterface;

    const-string v1, "UserComment"

    invoke-virtual {v0, v1, p1}, Landroid/support/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mMediaExif:Landroid/media/ExifInterface;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/util/ExifInterfaceWrapper;->mMediaExif:Landroid/media/ExifInterface;

    const-string v1, "UserComment"

    invoke-virtual {v0, v1, p1}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
