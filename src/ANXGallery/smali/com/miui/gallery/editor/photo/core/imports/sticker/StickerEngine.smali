.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEngine;
.super Lcom/miui/gallery/editor/photo/core/RenderEngine;
.source "StickerEngine.java"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderEngine;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
    .locals 2

    const-string v0, "StickerEngine"

    const-string v1, "rendering sticker data"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    instance-of v0, p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerRenderData;

    if-eqz v0, :cond_0

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerRenderData;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerRenderData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$StickerEntry;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$StickerEntry;->apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
