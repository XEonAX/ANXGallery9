.class Luk/co/senab/photoview/PhotoViewAttacher$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PhotoViewAttacher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Luk/co/senab/photoview/PhotoViewAttacher;->ensureTapDetector()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 1

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;

    move-result-object p1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$1;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    :cond_0
    return-void
.end method
