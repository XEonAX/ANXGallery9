.class public Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;
.super Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;
.source "ScreenLongCropEditView.java"


# instance fields
.field private mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method protected drawChild(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    :cond_0
    return-void
.end method

.method public setScreenDrawEntry(Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropEditView;->mScreenDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    return-void
.end method
