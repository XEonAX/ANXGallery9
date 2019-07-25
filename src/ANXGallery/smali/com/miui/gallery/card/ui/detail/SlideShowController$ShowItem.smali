.class public Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;
.super Ljava/lang/Object;
.source "SlideShowController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/SlideShowController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShowItem"
.end annotation


# instance fields
.field private final mBit:Landroid/graphics/Bitmap;

.field private final mIndex:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;->mBit:Landroid/graphics/Bitmap;

    iput p2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;->mIndex:I

    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;->mBit:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;->mIndex:I

    return v0
.end method
