.class public Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout;
.super Landroid/widget/LinearLayout;
.source "TouchTransLinearLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;
    }
.end annotation


# instance fields
.field mOnTouchEvent:Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getOnTouchEvent()Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout;->mOnTouchEvent:Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;

    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout;->mOnTouchEvent:Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout;->mOnTouchEvent:Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setOnTouchEvent(Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout;->mOnTouchEvent:Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;

    return-void
.end method
