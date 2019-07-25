.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;
.super Ljava/lang/Object;
.source "PhotoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TransitionConfiguration"
.end annotation


# instance fields
.field private mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

.field private mEnterDuration:I

.field private mExitDuration:I

.field private mImageHeight:I

.field private mImageWidth:I

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMenuOffset:I

.field private mPhotoViewName:Ljava/lang/String;

.field private mRunTransition:Z

.field private mTransitionListener:Landroid/transition/Transition$TransitionListener;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$2;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mTransitionListener:Landroid/transition/Transition$TransitionListener;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)Lcom/miui/gallery/editor/photo/app/PhotoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    return-object p0
.end method

.method private configureEnterTransition()V
    .locals 6

    new-instance v0, Landroid/transition/TransitionSet;

    invoke-direct {v0}, Landroid/transition/TransitionSet;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/app/ImageTransition;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMatrix:Landroid/graphics/Matrix;

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mImageWidth:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mImageHeight:I

    const/4 v5, 0x1

    invoke-direct {v1, v5, v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/ImageTransition;-><init>(ZLandroid/graphics/Matrix;II)V

    new-instance v2, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/app/ImageTransition;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/transition/Transition;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mPhotoViewName:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/miui/gallery/compat/transition/TransitionCompat;->addTarget(Landroid/transition/Transition;Ljava/lang/String;)V

    new-instance v2, Lcom/miui/gallery/editor/photo/app/MenuTransition;

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMenuOffset:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/app/MenuTransition;-><init>(FZLandroid/content/res/Resources;)V

    new-instance v3, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Lcom/miui/gallery/editor/photo/app/MenuTransition;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/transition/Transition;

    const v3, 0x7f0901cd

    invoke-virtual {v2, v3}, Lcom/miui/gallery/editor/photo/app/MenuTransition;->addTarget(I)Landroid/transition/Transition;

    invoke-virtual {v0, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEnterDuration:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/transition/TransitionSet;->setDuration(J)Landroid/transition/TransitionSet;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mTransitionListener:Landroid/transition/Transition$TransitionListener;

    invoke-virtual {v1, v2}, Landroid/transition/TransitionSet;->addListener(Landroid/transition/Transition$TransitionListener;)Landroid/transition/TransitionSet;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/compat/view/WindowCompat;->setSharedElementEnterTransition(Landroid/view/Window;Landroid/transition/Transition;)V

    return-void
.end method

.method private configureExitTransition(Z)V
    .locals 5

    new-instance v0, Landroid/transition/TransitionSet;

    invoke-direct {v0}, Landroid/transition/TransitionSet;-><init>()V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    new-instance p1, Landroid/transition/ChangeBounds;

    invoke-direct {p1}, Landroid/transition/ChangeBounds;-><init>()V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/editor/photo/app/ImageTransition;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMatrix:Landroid/graphics/Matrix;

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mImageWidth:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mImageHeight:I

    invoke-direct {p1, v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/ImageTransition;-><init>(ZLandroid/graphics/Matrix;II)V

    :goto_0
    new-instance v2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v2}, Landroid/transition/Transition;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/transition/Transition;

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mExitDuration:I

    int-to-long v2, v2

    invoke-virtual {p1, v2, v3}, Landroid/transition/Transition;->setDuration(J)Landroid/transition/Transition;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mPhotoViewName:Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/miui/gallery/compat/transition/TransitionCompat;->addTarget(Landroid/transition/Transition;Ljava/lang/String;)V

    new-instance v2, Lcom/miui/gallery/editor/photo/app/MenuTransition;

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMenuOffset:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lcom/miui/gallery/editor/photo/app/MenuTransition;-><init>(FZLandroid/content/res/Resources;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/app/MenuTransition;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/transition/Transition;

    const v1, 0x7f0901cd

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/app/MenuTransition;->addTarget(I)Landroid/transition/Transition;

    invoke-virtual {v0, p1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/miui/gallery/compat/view/WindowCompat;->setSharedElementReturnTransition(Landroid/view/Window;Landroid/transition/Transition;)V

    return-void
.end method


# virtual methods
.method onActivityCreate(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/compat/view/WindowCompat;->requestActivityTransition(Landroid/view/Window;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v1, "extra_custom_transition"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    const/4 v2, 0x1

    :cond_0
    iput-boolean v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mRunTransition:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/SystemUiUtil;->setDrawSystemBarBackground(Landroid/view/Window;)V

    return-void
.end method

.method onExit(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setRemoveWatermarkEnable(Z)V

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mRunTransition:Z

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->configureExitTransition(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$1;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)V

    invoke-static {p1, v0}, Lcom/miui/gallery/compat/app/ActivityCompat;->setEnterSharedElementCallback(Landroid/app/Activity;Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->closeExportDialog()V

    :goto_0
    return-void
.end method

.method onImageLoaded()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mRunTransition:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/compat/app/ActivityCompat;->startPostponedEnterTransition(Landroid/app/Activity;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$2100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    :goto_0
    return-void
.end method

.method postActivityCreate()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mRunTransition:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra_image_width"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mImageWidth:I

    const-string v1, "extra_image_height"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mImageHeight:I

    const-string v1, "extra_image_matrix"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getFloatArrayExtra(Ljava/lang/String;)[F

    move-result-object v0

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->setValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060360

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mMenuOffset:I

    const v1, 0x7f10055b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mPhotoViewName:Ljava/lang/String;

    const v1, 0x7f0a002e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEnterDuration:I

    const v1, 0x7f0a002f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mExitDuration:I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->configureEnterTransition()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->mEditor:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/compat/app/ActivityCompat;->postponeEnterTransition(Landroid/app/Activity;)V

    return-void
.end method
