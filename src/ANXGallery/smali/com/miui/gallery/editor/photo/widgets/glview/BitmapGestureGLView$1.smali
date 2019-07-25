.class Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;
.super Ljava/lang/Object;
.source "BitmapGestureGLView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapMatrixChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->onBitmapMatrixChange()V

    return-void
.end method

.method public onCanvasMatrixChange()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->onCanvasMatrixChange()V

    return-void
.end method
