.class Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;
.super Ljava/lang/Object;
.source "CollageStitchingLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$300(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$400(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$500(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->disableDragMode()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->access$602(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Z)Z

    return-void
.end method
