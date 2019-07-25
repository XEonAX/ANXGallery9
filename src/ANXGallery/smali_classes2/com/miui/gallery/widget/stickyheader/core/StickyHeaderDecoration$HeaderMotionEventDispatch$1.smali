.class Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;
.super Ljava/lang/Object;
.source "StickyHeaderDecoration.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->enqueueFakeEvent(Landroid/support/v7/widget/RecyclerView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;

.field final synthetic val$rv:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;

    iput-object p2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;->val$rv:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->access$002(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;Z)Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide v2, v4

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    const/16 v1, 0x1002

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setSource(I)V

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;->val$rv:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->access$002(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;Z)Z

    return-void
.end method
