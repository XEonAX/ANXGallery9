.class public Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;
.super Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;
.source "ScreenTextDrawNode.java"


# instance fields
.field private mIsSaved:Z

.field private textDialogConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;-><init>()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->textDialogConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->textDialogConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method public isSaved()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->mIsSaved:Z

    return v0
.end method

.method public setSaved(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->mIsSaved:Z

    return-void
.end method

.method public setTextDialogConfig(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->textDialogConfig:Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    return-object p0
.end method
