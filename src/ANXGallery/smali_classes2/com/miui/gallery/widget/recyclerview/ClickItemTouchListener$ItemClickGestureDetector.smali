.class Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;
.super Ljava/lang/Object;
.source "ClickItemTouchListener.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$GestureDetectorHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemClickGestureDetector"
.end annotation


# instance fields
.field private mGestureDetectorCompat:Landroid/support/v4/view/GestureDetectorCompat;

.field private final mGestureListener:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;

.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;Landroid/content/Context;Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;->this$0:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/support/v4/view/GestureDetectorCompat;

    invoke-direct {p1, p2, p3}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureDetectorCompat:Landroid/support/v4/view/GestureDetectorCompat;

    iput-object p3, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureListener:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureDetectorCompat:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureListener:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->dispatchSingleTapUpIfNeeded(Landroid/view/MotionEvent;)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureListener:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->dispatchResetPressState(Landroid/view/MotionEvent;)V

    :goto_0
    return v0
.end method
