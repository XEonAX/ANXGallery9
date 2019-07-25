.class Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;
.super Ljava/lang/Object;
.source "LongScreenshotCropEditorView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPreBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->access$000(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getShowRect()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;)Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method public onInvalidate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->invalidate()V

    return-void
.end method
