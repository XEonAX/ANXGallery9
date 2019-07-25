.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionBarHelper"
.end annotation


# instance fields
.field private final ATTRS:[I

.field private final TITLE_ANIM_DURATION:J

.field private mBackView:Landroid/widget/ImageView;

.field private mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

.field private final mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

.field private mMenuView:Landroid/widget/Button;

.field private mPhoneImmersionMenu:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

.field private mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

.field private mTitleView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    new-array p1, p1, [I

    sget v0, Lmiui/R$attr;->actionBarBackground:I

    const/4 v1, 0x0

    aput v0, p1, v1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->ATTRS:[I

    const-wide/16 v0, 0x96

    iput-wide v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->TITLE_ANIM_DURATION:J

    new-instance p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$3;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->inflateTitle()V

    return-void
.end method

.method static synthetic access$3300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->refreshActionBar()V

    return-void
.end method

.method static synthetic access$4400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mPhoneImmersionMenu:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    return-object p0
.end method

.method static synthetic access$5200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->renameCard()V

    return-void
.end method

.method static synthetic access$5300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->showDeleteCardConfirmDialog()V

    return-void
.end method

.method static synthetic access$6200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->deleteCard()V

    return-void
.end method

.method private deleteCard()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$6;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "scenarioId"

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    const-string v2, "assistant_card_deleted"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private inflateTitle()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->ATTRS:[I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0166

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/app/ActionBar$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/app/ActionBar$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v1, 0x7f090054

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mBackView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mBackView:Landroid/widget/ImageView;

    new-instance v2, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$1;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0902fa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    const v1, 0x7f0901e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mMenuView:Landroid/widget/Button;

    new-instance v1, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;-><init>(Landroid/content/Context;Lcom/miui/gallery/widget/menu/ImmersionMenuListener;)V

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mPhoneImmersionMenu:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mMenuView:Landroid/widget/Button;

    new-instance v2, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$2;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2, v2}, Lmiui/app/ActionBar;->setDisplayOptions(II)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v0}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4702(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->refreshActionBar()V

    return-void
.end method

.method private refreshActionBar()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lmiui/app/Activity;

    invoke-virtual {v0, v1}, Lmiui/app/Activity;->setTranslucentStatus(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mBackView:Landroid/widget/ImageView;

    sget v1, Lmiui/R$drawable;->action_bar_back_light:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f05000a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mMenuView:Landroid/widget/Button;

    sget v1, Lmiui/R$drawable;->action_mode_immersion_more_light:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lmiui/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x2

    :goto_1
    invoke-virtual {v0, v1}, Lmiui/app/Activity;->setTranslucentStatus(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mBackView:Landroid/widget/ImageView;

    sget v1, Lmiui/R$drawable;->action_bar_back_dark:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050009

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mMenuView:Landroid/widget/Button;

    sget v1, Lmiui/R$drawable;->action_mode_immersion_more_dark:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

    :goto_2
    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_3
    return-void
.end method

.method private renameCard()V
    .locals 4

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    invoke-direct {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "card_name"

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->setArguments(Landroid/os/Bundle;)V

    new-instance v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$4;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->setOnRenameDoneListener(Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$OnRenameDoneListener;)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "StoryAlbumRenameDialog"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showDeleteCardConfirmDialog()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$5700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$5800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    const v2, 0x7f1000df

    invoke-virtual {v0, v2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$5900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    const v3, 0x7f1000dc

    invoke-virtual {v0, v3}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    const v4, 0x7f1000dd

    invoke-virtual {v0, v4}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$6100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    const v5, 0x7f1000de

    invoke-virtual {v0, v5}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$5;

    invoke-direct {v6, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper$5;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    return-void
.end method


# virtual methods
.method public getActionBarHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    return v0
.end method

.method public setActionBarTitle(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public startActionBarTitleAnim(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    const-string v3, "alpha"

    new-array v2, v2, [F

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getAlpha()F

    move-result v4

    aput v4, v2, v1

    const/high16 v1, 0x3f800000    # 1.0f

    aput v1, v2, v0

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    const-string v3, "alpha"

    new-array v2, v2, [F

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getAlpha()F

    move-result v4

    aput v4, v2, v1

    const/4 v1, 0x0

    aput v1, v2, v0

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->mTitleAlphaAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method
