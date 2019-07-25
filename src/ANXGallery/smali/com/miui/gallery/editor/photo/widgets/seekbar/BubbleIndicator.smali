.class public Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;
.super Ljava/lang/Object;
.source "BubbleIndicator.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;"
    }
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
            "TV;>;"
        }
    .end annotation
.end field

.field private mContentView:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field private mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mLocation:[I

.field private mOffsetY:I

.field private mPopup:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;I",
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
            "TV;>;",
            "Landroid/widget/SeekBar$OnSeekBarChangeListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mLocation:[I

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mOffsetY:I

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;Landroid/widget/SeekBar;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->computeX(Landroid/widget/SeekBar;)I

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;Landroid/widget/SeekBar;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->computeY(Landroid/widget/SeekBar;)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;)Landroid/widget/PopupWindow;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    return-object p0
.end method

.method private computeX(Landroid/widget/SeekBar;)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mLocation:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getThumbOffset()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    add-int/2addr v0, p1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr v0, p1

    return v0
.end method

.method private computeY(Landroid/widget/SeekBar;)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getHeight()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr v0, p1

    iget p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mOffsetY:I

    sub-int/2addr v0, p1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr v0, p1

    return v0
.end method

.method private updateProgress(Landroid/view/View;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;I)V"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->onProgressUpdate(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    invoke-interface {p1, v0, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;->updateProgress(Landroid/view/View;I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method

.method public isShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->updateProgress(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->computeX(Landroid/widget/SeekBar;)I

    move-result v1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->computeY(Landroid/widget/SeekBar;)I

    move-result v2

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/widget/PopupWindow;->update(IIII)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    :cond_1
    return-void
.end method

.method protected onProgressUpdate(Landroid/view/View;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;I)V"
        }
    .end annotation

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Landroid/widget/PopupWindow;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3, v3, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mContentView:Landroid/view/View;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$1;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;Landroid/widget/SeekBar;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mLocation:[I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->getLocationInWindow([I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    const v2, 0x7f1100b0

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->computeX(Landroid/widget/SeekBar;)I

    move-result v2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->computeY(Landroid/widget/SeekBar;)I

    move-result v3

    invoke-virtual {v0, p1, v1, v2, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-interface {v0, p1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Landroid/widget/SeekBar;)V

    :cond_1
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->mDelegate:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-interface {v0, p1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStopTrackingTouch(Landroid/widget/SeekBar;)V

    :cond_0
    return-void
.end method
