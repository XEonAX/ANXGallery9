.class Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;
.super Ljava/lang/Object;
.source "CropperActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/CropperActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DecodeResult"
.end annotation


# instance fields
.field mBitmap:Landroid/graphics/Bitmap;

.field mException:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;->mBitmap:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;->mException:Ljava/lang/Exception;

    return-void
.end method
