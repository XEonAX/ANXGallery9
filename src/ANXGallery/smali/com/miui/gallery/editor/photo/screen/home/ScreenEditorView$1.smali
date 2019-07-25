.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;
.super Ljava/lang/Object;
.source "ScreenEditorView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOriginBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getShowRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public onAnimationStart()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->onAnimationStart()V

    :cond_0
    return-void
.end method

.method public onAnimationUpdate(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->onAnimationUpdate(F)V

    :cond_0
    return-void
.end method

.method public onInvalidate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    return-void
.end method
