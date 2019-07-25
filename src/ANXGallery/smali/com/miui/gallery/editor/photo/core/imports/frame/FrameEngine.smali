.class Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEngine;
.super Lcom/miui/gallery/editor/photo/core/RenderEngine;
.source "FrameEngine.java"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderEngine;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
    .locals 1

    instance-of v0, p2, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameRenderData;

    if-eqz v0, :cond_0

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameRenderData;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameRenderData;->mFrameEntry:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
