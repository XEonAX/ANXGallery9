.class public interface abstract Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;
.super Ljava/lang/Object;
.source "IScreenEditorController.java"


# virtual methods
.method public abstract checkTextEditor(Z)V
.end method

.method public abstract doRevert()V
.end method

.method public abstract doRevoke()V
.end method

.method public abstract isModified()Z
.end method

.method public abstract isModifiedBaseLast()Z
.end method

.method public abstract onExport()Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;
.end method

.method public abstract setCurrentScreenEditor(I)Z
.end method

.method public abstract setLongCrop(Z)V
.end method

.method public abstract setLongCropEntry(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;)V
.end method

.method public abstract setOperationUpdateListener(Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;)V
.end method

.method public abstract setPreviewBitmap(Landroid/graphics/Bitmap;)V
.end method

.method public abstract startScreenThumbnailAnimate(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V
.end method
