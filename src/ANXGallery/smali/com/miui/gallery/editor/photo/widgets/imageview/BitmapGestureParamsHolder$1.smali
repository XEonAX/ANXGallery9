.class Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$1;
.super Ljava/lang/Object;
.source "BitmapGestureParamsHolder.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd()V
    .locals 0

    return-void
.end method

.method public onAnimationStart()V
    .locals 0

    return-void
.end method

.method public onMatrixUpdate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performCanvasMatrixChange()V

    return-void
.end method
