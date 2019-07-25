.class Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;
.super Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;
.source "HeaderItemClickHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;,
        Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;
    }
.end annotation


# instance fields
.field private mGestureDetector:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;-><init>()V

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;-><init>(Landroid/content/Context;Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;->mGestureDetector:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;

    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;->mGestureDetector:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 p1, 0x0

    return p1
.end method

.method public onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public setHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;->mGestureDetector:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->setOnHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V

    return-void
.end method
