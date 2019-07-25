.class public Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;
.super Ljava/lang/Object;
.source "BlockSdkUtils.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "gallery_block_sdk"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public static native bindBitmap(Landroid/graphics/Bitmap;)Z
.end method

.method public static native readPixelsAndMerge(IIIII)V
.end method

.method public static native unbindBitmap(Landroid/graphics/Bitmap;)Z
.end method

.method public static native updateTextureWidthStride(IIIII)V
.end method
