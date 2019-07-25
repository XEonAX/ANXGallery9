.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;
.super Ljava/lang/Object;
.source "EditableListViewWrapperDeprecated.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Scroll2PickHelper"
.end annotation


# instance fields
.field private mHasEverPickLongTouchPosition:Z

.field private mLastPosition:I

.field private mLastX:F

.field private mLastY:F

.field private mLongTouchPosition:I

.field private mMathStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mMotionPosition:I

.field private mMotionX:F

.field private mScollXMode2PickEnable:Z

.field private mScollYMode2PickEnable:Z

.field private mScollYMode2PickEnableAfterLeft:Z

.field private mScollYMode2PickEnableAfterRight:Z

.field final synthetic this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->setLongPressPosition(I)V

    return-void
.end method

.method private ifScrollYModeEnable(FF)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnable:Z

    if-nez v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionX:F

    sub-float v0, p1, v0

    const/high16 v1, 0x41200000    # 10.0f

    cmpl-float v0, v0, v1

    const/4 v1, 0x1

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterRight:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterRight:Z

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionX:F

    sub-float v0, p1, v0

    const/high16 v2, -0x3ee00000    # -10.0f

    cmpg-float v0, v0, v2

    if-gez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterLeft:Z

    if-nez v0, :cond_1

    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterLeft:Z

    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterRight:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterLeft:Z

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :cond_3
    :goto_1
    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnable:Z

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnable:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v0, v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v0

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-virtual {v0, p1, p2}, Landroid/widget/AbsListView;->pointToPosition(II)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    iget p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void
.end method

.method private interceptEvent()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollXMode2PickEnable:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnable:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private onTouchMove(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastX:F

    sub-float v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastY:F

    sub-float v2, p1, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v1, v1, v2

    const/high16 v2, 0x41200000    # 10.0f

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-ltz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastX:F

    sub-float v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v1

    float-to-int v2, v0

    float-to-int v5, p1

    invoke-virtual {v1, v2, v5}, Landroid/widget/AbsListView;->pointToPosition(II)I

    move-result v1

    if-eq v1, v3, :cond_1

    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastPosition:I

    if-eq v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v2, v2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemIndexByItemPosition(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v3, v3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckState(I)Z

    move-result v3

    xor-int/2addr v3, v4

    invoke-direct {p0, v1, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->pickOrNotByPosition(IZ)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v3, v3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v3, v3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v3

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v5, v5, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/view/ActionMode;

    move-result-object v5

    invoke-interface {v3, v5, v4}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    iput-boolean v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollXMode2PickEnable:Z

    iget v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    if-ne v2, v3, :cond_0

    iput-boolean v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mHasEverPickLongTouchPosition:Z

    :cond_0
    iput v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastPosition:I

    :cond_1
    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->ifScrollYModeEnable(FF)V

    goto/16 :goto_8

    :cond_2
    iget-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnable:Z

    if-eqz v1, :cond_f

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastY:F

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_f

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastX:F

    sub-float v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastY:F

    sub-float v2, p1, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_f

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v1

    float-to-int v2, v0

    float-to-int v5, p1

    invoke-virtual {v1, v2, v5}, Landroid/widget/AbsListView;->pointToPosition(II)I

    move-result v1

    if-eq v1, v3, :cond_f

    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastPosition:I

    if-eq v1, v2, :cond_f

    invoke-direct {p0, v1, v4}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->pickOrNotByPosition(IZ)Z

    iput v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastPosition:I

    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    const/4 v3, 0x0

    if-ge v1, v2, :cond_8

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v1, v2, :cond_3

    goto :goto_1

    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v2, v1, :cond_7

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->pickOrNotByPosition(IZ)Z

    goto :goto_0

    :cond_4
    :goto_1
    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    sub-int/2addr v2, v4

    :goto_2
    if-lt v2, v1, :cond_7

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v2, v3, :cond_6

    :cond_5
    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    :cond_7
    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    :goto_3
    if-lt v2, v1, :cond_e

    invoke-direct {p0, v2, v4}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->pickOrNotByPosition(IZ)Z

    add-int/lit8 v2, v2, -0x1

    goto :goto_3

    :cond_8
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_a

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_9

    goto :goto_5

    :cond_9
    :goto_4
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v2, v1, :cond_d

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->pickOrNotByPosition(IZ)Z

    goto :goto_4

    :cond_a
    :goto_5
    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    add-int/2addr v2, v4

    :goto_6
    if-gt v2, v1, :cond_d

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_b

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v2, v3, :cond_c

    :cond_b
    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_d
    iget v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionPosition:I

    :goto_7
    if-gt v2, v1, :cond_e

    invoke-direct {p0, v2, v4}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->pickOrNotByPosition(IZ)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_e
    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v2, v2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/view/ActionMode;

    move-result-object v2

    invoke-interface {v1, v2, v4}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    :cond_f
    :goto_8
    iput v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastX:F

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastY:F

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->interceptEvent()Z

    move-result p1

    return p1
.end method

.method private pickOrNotByPosition(IZ)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v0, v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {v1}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v2, v2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemIndexByItemPosition(I)I

    move-result p1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-virtual {v2, v1, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startScaleItemImageViewAnimationByScrollPicked(Landroid/widget/ImageView;IZ)V

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setCheckState(IZ)V

    check-cast v0, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {v0, p2}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private setLongPressPosition(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mHasEverPickLongTouchPosition:Z

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isInChoiceMode()Z

    move-result p1

    if-nez p1, :cond_0

    return v1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->interceptEvent()Z

    move-result p1

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->onTouchMove(Landroid/view/MotionEvent;)Z

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v3, v3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)I

    move-result v3

    if-eqz v3, :cond_1

    if-nez p1, :cond_1

    if-eqz v2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p1

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/AbsListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->requestDisallowInterceptTouchEvent(Z)V

    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p2, p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/AbsListView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/AbsListView;->requestDisallowInterceptTouchEvent(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p2, p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/AbsListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_1
    return v2

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isInChoiceMode()Z

    move-result p1

    if-nez p1, :cond_2

    return v1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->clear()V

    iget-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mHasEverPickLongTouchPosition:Z

    if-nez p1, :cond_3

    iget p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    const/4 p2, -0x1

    if-eq p1, p2, :cond_3

    iput-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mHasEverPickLongTouchPosition:Z

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;

    move-result-object p1

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildViewByItemIndex(I)Landroid/view/View;

    move-result-object p1

    instance-of p2, p1, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz p2, :cond_3

    move-object p2, p1

    check-cast p2, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {p2}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object v2

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v6, 0xc8

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZII)V

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p2, p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    move-result-object p2

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLongTouchPosition:I

    invoke-virtual {p2, v1, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setCheckState(IZ)V

    check-cast p1, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p1, p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object p2, p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-static {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/view/ActionMode;

    move-result-object p2

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->interceptEvent()Z

    move-result p1

    return p1

    :pswitch_2
    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollXMode2PickEnable:Z

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMotionX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastY:F

    iput v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mLastPosition:I

    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnable:Z

    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterLeft:Z

    iput-boolean v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mScollYMode2PickEnableAfterRight:Z

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$Scroll2PickHelper;->mMathStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->clear()V

    :cond_4
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
