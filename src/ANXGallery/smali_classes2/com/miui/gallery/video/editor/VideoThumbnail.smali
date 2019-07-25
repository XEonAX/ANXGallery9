.class public Lcom/miui/gallery/video/editor/VideoThumbnail;
.super Ljava/lang/Object;
.source "VideoThumbnail.java"


# instance fields
.field private endTime:I

.field private intrinsicTime:I

.field private startTime:I

.field private thumbnail:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIILandroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->startTime:I

    iput p2, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->endTime:I

    iput p3, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->intrinsicTime:I

    iput-object p4, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->thumbnail:Landroid/graphics/Bitmap;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->thumbnail:Landroid/graphics/Bitmap;

    iput p2, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->intrinsicTime:I

    return-void
.end method


# virtual methods
.method public getIntrinsicTime()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->intrinsicTime:I

    return v0
.end method

.method public getThumbnail()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/VideoThumbnail;->thumbnail:Landroid/graphics/Bitmap;

    return-object v0
.end method
