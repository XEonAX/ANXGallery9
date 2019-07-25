.class public Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SelectableDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;,
        Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;
    }
.end annotation


# static fields
.field private static final STATE_ACTIVATED:[I

.field private static final STATE_SELECTED:[I


# instance fields
.field private mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

.field private mChildrenCallback:Landroid/graphics/drawable/Drawable$Callback;

.field private mDuration:J

.field private mFromAlpha:I

.field private mInterpolator:Landroid/animation/TimeInterpolator;

.field private mMutated:Z

.field private mSelected:Z

.field private mStart:J

.field private mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

.field private mToAlpha:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const v3, 0x10100a1

    aput v3, v1, v2

    sput-object v1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->STATE_SELECTED:[I

    new-array v0, v0, [I

    const v1, 0x10102fe

    aput v1, v0, v2

    sput-object v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->STATE_ACTIVATED:[I

    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;-><init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)V

    return-void
.end method

.method private constructor <init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mDuration:J

    new-instance v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;-><init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mChildrenCallback:Landroid/graphics/drawable/Drawable$Callback;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mChildrenCallback:Landroid/graphics/drawable/Drawable$Callback;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mChildrenCallback:Landroid/graphics/drawable/Drawable$Callback;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;-><init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    return-object p0
.end method

.method private static calculateAlpha(FIILandroid/animation/TimeInterpolator;)I
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p0, v0

    if-lez v1, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    :cond_0
    if-eqz p3, :cond_1

    invoke-interface {p3, p0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result p0

    :cond_1
    int-to-float p3, p1

    sub-int/2addr p2, p1

    int-to-float p1, p2

    mul-float p1, p1, p0

    add-float/2addr p3, p1

    float-to-int p0, p3

    return p0
.end method


# virtual methods
.method public clearColorFilter()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->IDLE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    sget-object v3, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->PREPARE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    if-ne v2, v3, :cond_1

    iput-wide v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mStart:J

    sget-object v2, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->RUNNING:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v2

    iget-wide v3, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mStart:J

    sub-long/2addr v0, v3

    long-to-float v0, v0

    iget-wide v3, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mDuration:J

    long-to-float v1, v3

    div-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mFromAlpha:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mToAlpha:I

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mInterpolator:Landroid/animation/TimeInterpolator;

    invoke-static {v0, v1, v3, v4}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->calculateAlpha(FIILandroid/animation/TimeInterpolator;)I

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    const/high16 p1, 0x3f800000    # 1.0f

    cmpg-float p1, v0, p1

    if-gez p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->invalidateSelf()V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->IDLE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    :goto_0
    return-void
.end method

.method public getAlpha()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getChangingConfigurations()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->getChangingConfigurations()I

    move-result v0

    return v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    return-object v0
.end method

.method public getCurrent()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mSelected:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public getTransparentRegion()Landroid/graphics/Region;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getTransparentRegion()Landroid/graphics/Region;

    move-result-object v0

    return-object v0
.end method

.method public isAutoMirrored()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isAutoMirrored()Z

    move-result v0

    return v0
.end method

.method public isStateful()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public jumpToCurrentState()V
    .locals 2

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->IDLE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    if-eq v0, v1, :cond_0

    sget-object v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->IDLE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->invalidateSelf()V

    return-void
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mMutated:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->mutate()Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mMutated:Z

    :cond_0
    return-object p0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method protected onLevelChange(I)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result p1

    if-nez p1, :cond_1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method protected onStateChange([I)Z
    .locals 4

    sget-object v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->STATE_SELECTED:[I

    invoke-static {v0, p1}, Landroid/util/StateSet;->stateSetMatches([I[I)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    sget-object v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->STATE_ACTIVATED:[I

    invoke-static {v0, p1}, Landroid/util/StateSet;->stateSetMatches([I[I)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mSelected:Z

    if-ne v0, p1, :cond_2

    return v2

    :cond_2
    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mSelected:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    sget-object v3, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->PREPARE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    if-ne v0, v3, :cond_6

    if-eqz p1, :cond_3

    iget v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mToAlpha:I

    if-eqz v0, :cond_4

    :cond_3
    if-nez p1, :cond_5

    iget p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mFromAlpha:I

    if-nez p1, :cond_5

    :cond_4
    sget-object p1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->IDLE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    :cond_5
    return v2

    :cond_6
    if-eqz p1, :cond_7

    iput v2, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mFromAlpha:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mToAlpha:I

    goto :goto_2

    :cond_7
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mFromAlpha:I

    iput v2, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mToAlpha:I

    :goto_2
    sget-object p1, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;->PREPARE:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mAnimateState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$State;

    return v1
.end method

.method public setAlpha(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->invalidateSelf()V

    return-void
.end method

.method public setAutoMirrored(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    return-void
.end method

.method public setChangingConfigurations(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$202(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;I)I

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->invalidateSelf()V

    return-void
.end method

.method public setDither(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    return-void
.end method

.method public setDuration(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mDuration:J

    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    return-void
.end method

.method public setInterpolator(Landroid/animation/TimeInterpolator;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mInterpolator:Landroid/animation/TimeInterpolator;

    return-void
.end method

.method public setVisible(ZZ)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->mState:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    if-nez p1, :cond_1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method
