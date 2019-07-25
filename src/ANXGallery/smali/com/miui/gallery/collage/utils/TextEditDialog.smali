.class public Lcom/miui/gallery/collage/utils/TextEditDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "TextEditDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;
    }
.end annotation


# instance fields
.field private mContainerView:Landroid/widget/FrameLayout;

.field private mEditText:Landroid/widget/EditText;

.field private mMax:I

.field private mScreenHeight:I

.field private mTextWatcher:Landroid/text/TextWatcher;

.field private mWholeView:Landroid/view/View;

.field private mWillEditText:Ljava/lang/String;

.field private mWillSelection:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWillSelection:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mMax:I

    iput v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mScreenHeight:I

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mEditText:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/utils/TextEditDialog;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWillEditText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/utils/TextEditDialog;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWillSelection:Z

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/text/TextWatcher;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/collage/utils/TextEditDialog;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mMax:I

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/FrameLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/collage/utils/TextEditDialog;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mScreenHeight:I

    return p0
.end method

.method static synthetic access$800(Landroid/view/View;ILandroid/graphics/Rect;)I
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getHeightDifference(Landroid/view/View;ILandroid/graphics/Rect;)I

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/collage/utils/TextEditDialog;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->setBottomMargin(I)V

    return-void
.end method

.method private static getHeightDifference(Landroid/view/View;ILandroid/graphics/Rect;)I
    .locals 2

    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v1, 0x1

    aget v0, v0, v1

    sub-int v0, p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0, p2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    iget p2, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr p0, p2

    sub-int/2addr p1, p0

    sub-int/2addr p1, v0

    return p1
.end method

.method private setBottomMargin(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    move-result v0

    if-eq v0, p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, p1}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    :cond_0
    return-void
.end method


# virtual methods
.method public isShowing()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mEditText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f110003

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/utils/TextEditDialog$3;-><init>(Lcom/miui/gallery/collage/utils/TextEditDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/Window;->requestFeature(I)Z

    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    invoke-virtual {v0}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    iget v2, v2, Landroid/graphics/Point;->y:I

    iput v2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mScreenHeight:I

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    :cond_0
    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    iget-object p2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    new-instance p3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p3, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/collage/utils/TextEditDialog$LayoutListener;-><init>(Lcom/miui/gallery/collage/utils/TextEditDialog;Lcom/miui/gallery/collage/utils/TextEditDialog$1;)V

    invoke-virtual {p2, p3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object p2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    const p3, 0x7f0b016c

    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWholeView:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWholeView:Landroid/view/View;

    const p2, 0x7f0902d8

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mEditText:Landroid/widget/EditText;

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWholeView:Landroid/view/View;

    const p2, 0x7f0902d9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/collage/utils/TextEditDialog$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/collage/utils/TextEditDialog$1;-><init>(Lcom/miui/gallery/collage/utils/TextEditDialog;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWholeView:Landroid/view/View;

    const p2, 0x7f0902db

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/collage/utils/TextEditDialog$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/collage/utils/TextEditDialog$2;-><init>(Lcom/miui/gallery/collage/utils/TextEditDialog;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mEditText:Landroid/widget/EditText;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setFocusable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mEditText:Landroid/widget/EditText;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    return-object p1
.end method

.method public onPause()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->dismissSafely()V

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onPause()V

    return-void
.end method

.method public onStart()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStart()V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/4 v2, -0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v2, -0x2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/4 v2, 0x0

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/collage/utils/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    :cond_1
    return-void
.end method

.method public setMaxEditLength(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mMax:I

    return-void
.end method

.method public setTextWatch(Landroid/text/TextWatcher;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method public setWillEditText(Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWillEditText:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/miui/gallery/collage/utils/TextEditDialog;->mWillSelection:Z

    return-void
.end method
