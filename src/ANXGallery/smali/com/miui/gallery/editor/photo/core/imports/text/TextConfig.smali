.class public Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;
.super Lcom/miui/gallery/editor/photo/core/common/model/TextData;
.source "TextConfig.java"


# instance fields
.field private mBaseDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

.field private mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;


# direct methods
.method constructor <init>(SLcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;)V
    .locals 2

    iget-object v0, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->name:Ljava/lang/String;

    iget-object v1, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->icon:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/common/model/TextData;-><init>(SLjava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    return-void
.end method

.method constructor <init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V
    .locals 2

    iget-object v0, p3, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->dialogSmallIconPath:Ljava/lang/String;

    iget v1, p3, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->backgroundColor:I

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/core/common/model/TextData;-><init>(SLjava/lang/String;Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->mBaseDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    return-void
.end method


# virtual methods
.method public getBaseDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->mBaseDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    return-object v0
.end method

.method public getWatermarkInfo()Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    return-object v0
.end method

.method public isWatermark()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
