.class public abstract Lcom/miui/gallery/editor/photo/app/MenuFragment;
.super Lcom/miui/gallery/editor/photo/app/EditorFragment;
.source "MenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<F:",
        "Lcom/miui/gallery/editor/photo/core/RenderFragment;",
        "P:",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "*TF;>;>",
        "Lcom/miui/gallery/editor/photo/app/EditorFragment;"
    }
.end annotation


# static fields
.field private static final VIEW_RELATIVE_Y:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static sAnimAppearDelay:I

.field private static sAnimAppearDuration:I

.field private static sAnimDisappearDuration:I

.field private static sAnimOffset:I


# instance fields
.field mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

.field private mDiscardBtn:Landroid/view/View;

.field mEffect:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "*>;"
        }
    .end annotation
.end field

.field private mGestureFragment:Landroid/app/Fragment;

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mRenderCallbacks:Lcom/miui/gallery/editor/photo/core/RenderFragment$Callbacks;

.field private mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TF;"
        }
    .end annotation
.end field

.field private mSaveBtn:Landroid/view/View;

.field protected final mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/app/MenuFragment$4;

    const-class v1, Ljava/lang/Float;

    const-string v2, "relative_y"

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/MenuFragment$4;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->VIEW_RELATIVE_Y:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "TP;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/EditorFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/MenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mOnClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/MenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderCallbacks:Lcom/miui/gallery/editor/photo/core/RenderFragment$Callbacks;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->getProvider(Lcom/miui/gallery/editor/photo/core/Effect;)Lcom/miui/gallery/editor/photo/core/SdkProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    return-void
.end method


# virtual methods
.method protected createGestureFragment()Landroid/app/Fragment;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method createRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TF;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->createFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    return-object v0
.end method

.method protected final decodeOrigin()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;->onLoadOrigin()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected final genProgressDialog(Ljava/lang/String;)Lmiui/app/ProgressDialog;
    .locals 2

    new-instance v0, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setCancelable(Z)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    return-object v0
.end method

.method protected final getGestureFragment()Landroid/app/Fragment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mGestureFragment:Landroid/app/Fragment;

    return-object v0
.end method

.method protected final getPreRenderData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;->onLoadRenderData()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected final getPreview()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;->onLoadPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected final getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TF;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    return-object v0
.end method

.method protected hideProcessDialog()V
    .locals 0

    return-void
.end method

.method protected notifyDiscard()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    invoke-interface {v0, p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;->onDiscard(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    return-void
.end method

.method protected notifySave()V
    .locals 4

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/app/MenuFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    invoke-interface {v0, p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;->onSave(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/EditorFragment;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "MenuFragment"

    const-string v0, "MenuFragment onCreate"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "MenuFragment:display_fragment"

    invoke-virtual {p1, v0, v1}, Landroid/app/FragmentManager;->getFragment(Landroid/os/Bundle;Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/RenderFragment;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "MenuFragment:gesture_fragment"

    invoke-virtual {p1, v0, v1}, Landroid/app/FragmentManager;->getFragment(Landroid/os/Bundle;Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mGestureFragment:Landroid/app/Fragment;

    sget p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimOffset:I

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060334

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimOffset:I

    :cond_0
    sget p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimAppearDuration:I

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0037

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimAppearDuration:I

    :cond_1
    sget p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimDisappearDuration:I

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0038

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimDisappearDuration:I

    :cond_2
    sget p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimAppearDelay:I

    if-nez p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0036

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimAppearDelay:I

    :cond_3
    return-void
.end method

.method public onCreateAnimator(IZI)Landroid/animation/Animator;
    .locals 5

    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    const/4 p3, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p2, :cond_0

    sget-object p2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v3, v2, [F

    sget v4, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimOffset:I

    int-to-float v4, v4

    aput v4, v3, v1

    aput p3, v3, v0

    invoke-static {p2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    sget-object p3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    invoke-static {p3, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p3

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, v2, v1

    aput-object p3, v2, v0

    invoke-virtual {p1, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    sget p2, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimAppearDuration:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    sget p2, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimAppearDelay:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/miui/gallery/editor/photo/app/MenuFragment;->VIEW_RELATIVE_Y:Landroid/util/Property;

    new-array v3, v2, [F

    aput p3, v3, v1

    sget p3, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimOffset:I

    int-to-float p3, p3

    aput p3, v3, v0

    invoke-static {p2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    sget-object p3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v3, v2, [F

    fill-array-data v3, :array_1

    invoke-static {p3, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p3

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, v2, v1

    aput-object p3, v2, v0

    invoke-virtual {p1, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    sget p2, Lcom/miui/gallery/editor/photo/app/MenuFragment;->sAnimDisappearDuration:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    :goto_0
    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    return-object p1

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/EditorFragment;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    return-void
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/EditorFragment;->onDestroyView()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    invoke-virtual {v0, v1}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mGestureFragment:Landroid/app/Fragment;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mGestureFragment:Landroid/app/Fragment;

    invoke-virtual {v0, v1}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_1
    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/EditorFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    const p2, 0x7f0901f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mSaveBtn:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mSaveBtn:Landroid/view/View;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mSaveBtn:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    const p2, 0x7f090073

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mDiscardBtn:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mDiscardBtn:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mDiscardBtn:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getPreview()Landroid/graphics/Bitmap;

    move-result-object p1

    const-string p2, "MenuFragment"

    const-string v0, "MenuFragment onViewCreated and preview bitmap : %s width : %d height : %d"

    const/4 v1, -0x1

    if-nez p1, :cond_2

    const/4 v2, -0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, p1, v2, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->setBitmapRatio(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mRenderFragment:Lcom/miui/gallery/editor/photo/core/RenderFragment;

    invoke-virtual {p1, p2}, Landroid/app/FragmentTransaction;->attach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mGestureFragment:Landroid/app/Fragment;

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mGestureFragment:Landroid/app/Fragment;

    invoke-virtual {p1, p2}, Landroid/app/FragmentTransaction;->attach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_4
    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method protected showProcessDialog()V
    .locals 0

    return-void
.end method
