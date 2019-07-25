.class public Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;
.super Lcom/miui/gallery/search/transitions/SearchTransitionHelper;
.source "SearchTransitionHelperImp.java"


# instance fields
.field private mSharedElementCallback:Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;


# direct methods
.method public constructor <init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/transitions/SearchTransitionHelper;-><init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;)V

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$1;-><init>(Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;)V

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mSharedElementCallback:Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;

    return-void
.end method

.method private generateTransition(Z)Landroid/transition/Transition;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mFragment:Lmiui/app/Fragment;

    const v1, 0x7f100641

    invoke-virtual {v0, v1}, Lmiui/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mFragment:Lmiui/app/Fragment;

    const v2, 0x7f100640

    invoke-virtual {v1, v2}, Lmiui/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mFragment:Lmiui/app/Fragment;

    const v3, 0x7f100642

    invoke-virtual {v2, v3}, Lmiui/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/transition/TransitionSet;

    invoke-direct {v3}, Landroid/transition/TransitionSet;-><init>()V

    iget-object v4, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v4}, Lmiui/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0a0041

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Landroid/transition/TransitionSet;->setDuration(J)Landroid/transition/TransitionSet;

    new-instance v4, Landroid/transition/ChangeTransform;

    invoke-direct {v4}, Landroid/transition/ChangeTransform;-><init>()V

    invoke-virtual {v3, v4}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    new-instance v4, Landroid/transition/ChangeBounds;

    invoke-direct {v4}, Landroid/transition/ChangeBounds;-><init>()V

    invoke-virtual {v3, v4}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    new-instance v4, Landroid/transition/ChangeClipBounds;

    invoke-direct {v4}, Landroid/transition/ChangeClipBounds;-><init>()V

    invoke-virtual {v3, v4}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    new-instance v4, Lcom/miui/gallery/search/transitions/FadeOutInTransform;

    invoke-direct {v4}, Lcom/miui/gallery/search/transitions/FadeOutInTransform;-><init>()V

    invoke-virtual {v4, v1}, Lcom/miui/gallery/search/transitions/FadeOutInTransform;->addTarget(Ljava/lang/String;)Landroid/transition/Transition;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/search/transitions/FadeOutInTransform;->addTarget(Ljava/lang/String;)Landroid/transition/Transition;

    invoke-virtual {v3, v4}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    new-instance v4, Lcom/miui/gallery/search/transitions/ChangeImage;

    invoke-direct {v4}, Lcom/miui/gallery/search/transitions/ChangeImage;-><init>()V

    invoke-virtual {v4, v1}, Lcom/miui/gallery/search/transitions/ChangeImage;->addTarget(Ljava/lang/String;)Landroid/transition/Transition;

    invoke-virtual {v4, v0}, Lcom/miui/gallery/search/transitions/ChangeImage;->addTarget(Ljava/lang/String;)Landroid/transition/Transition;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/search/transitions/ChangeImage;->addTarget(Ljava/lang/String;)Landroid/transition/Transition;

    invoke-virtual {v3, v4}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    new-instance v1, Lcom/miui/gallery/search/transitions/ChangeTextView;

    invoke-direct {v1}, Lcom/miui/gallery/search/transitions/ChangeTextView;-><init>()V

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/transitions/ChangeTextView;->addTarget(Ljava/lang/String;)Landroid/transition/Transition;

    invoke-virtual {v3, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$2;-><init>(Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;)V

    invoke-virtual {v3, p1}, Landroid/transition/TransitionSet;->addListener(Landroid/transition/Transition$TransitionListener;)Landroid/transition/TransitionSet;

    :cond_0
    return-object v3

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static supportSharedElementTransition()Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public configTransition()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v0}, Lmiui/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->generateTransition(Z)Landroid/transition/Transition;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSharedElementEnterTransition(Landroid/transition/Transition;)V

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v0}, Lmiui/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->generateTransition(Z)Landroid/transition/Transition;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSharedElementReturnTransition(Landroid/transition/Transition;)V

    :cond_0
    return-void
.end method

.method public getSharedElementCallback()Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mSharedElementCallback:Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;

    return-object v0
.end method
