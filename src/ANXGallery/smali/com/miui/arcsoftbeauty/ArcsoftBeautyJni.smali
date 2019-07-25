.class public Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;
.super Ljava/lang/Object;
.source "ArcsoftBeautyJni.java"


# static fields
.field private static sLoaded:Z

.field private static final sWhiteList:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "jason"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sWhiteList:[Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sLoaded:Z

    sget-object v1, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sWhiteList:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    sget-object v5, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x1

    sput-boolean v4, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sLoaded:Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    sget-boolean v1, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sLoaded:Z

    if-eqz v1, :cond_2

    :try_start_0
    const-string v1, "image_arcsoft_4plus"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    sput-boolean v0, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sLoaded:Z

    const-string v0, "ArcsoftBeautyJni"

    const-string v1, "Failed to load library(image_arcsoft_4plus)"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public static native beautifyProcessBitmap(Landroid/graphics/Bitmap;II[I[I[I[I[I[I[I[I[I[I[I[I)V
.end method

.method public static native detectFaceNum(Landroid/graphics/Bitmap;II)I
.end method

.method public static native encodeYUV420SP(Landroid/graphics/Bitmap;II[B)V
.end method

.method public static idBeautyAvailable()Z
    .locals 1

    sget-boolean v0, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->sLoaded:Z

    return v0
.end method

.method public static smartBeauty(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEngine;->preProcessBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->smartBeauty(Landroid/graphics/Bitmap;I)V

    return-void
.end method

.method public static smartBeauty(Landroid/graphics/Bitmap;I)V
    .locals 2

    sget-object v0, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->INSTANCE:Lcom/miui/filtersdk/beauty/BeautyProcessorManager;

    invoke-virtual {v0}, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->getBeautyProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getIntelligentLevelParams(I)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {v0, p0, p1, v1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->beautify(Landroid/graphics/Bitmap;II)V

    return-void
.end method

.method public static native updateBmpWithYuvBuffer(Landroid/graphics/Bitmap;II[B)V
.end method
