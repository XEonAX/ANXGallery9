.class abstract Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;
.super Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;
.source "ClickItemTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;,
        Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;,
        Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$GestureDetectorHelper;
    }
.end annotation


# instance fields
.field private final mGestureDetector:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$GestureDetectorHelper;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;-><init>()V

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;-><init>(Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {v0, p0, v1, v2}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;-><init>(Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;Landroid/content/Context;Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->mGestureDetector:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$GestureDetectorHelper;

    return-void
.end method

.method private hasAdapter(Landroid/support/v7/widget/RecyclerView;)Z
    .locals 0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method static isAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isAttachedToWindow()Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHandler()Landroid/os/Handler;

    move-result-object p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->isAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->hasAdapter(Landroid/support/v7/widget/RecyclerView;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->mGestureDetector:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$GestureDetectorHelper;

    invoke-interface {p1, p2}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$GestureDetectorHelper;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return v1

    :cond_1
    :goto_0
    return v1
.end method

.method public onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method abstract performItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
.end method

.method abstract performItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
.end method
