.class Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;
.super Ljava/lang/Object;
.source "BabyAlbumDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BabyAlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ActionBarHelper"
.end annotation


# instance fields
.field private final ATTRS:[I

.field private mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

.field private mHomeIcon:Landroid/widget/ImageView;

.field private mHomeText:Landroid/widget/TextView;

.field private mIsShowTranslucentStatusBar:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    new-array v0, p1, [I

    sget v1, Lmiui/R$attr;->actionBarBackground:I

    const/4 v2, 0x0

    aput v1, v0, v2

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->ATTRS:[I

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mIsShowTranslucentStatusBar:Z

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mIsShowTranslucentStatusBar:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->setNullStyleActionBar()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->setNormalStyleActionBar()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)Landroid/view/View;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->inflateTitle()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private inflateTitle()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->ATTRS:[I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0027

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/app/ActionBar$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/app/ActionBar$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v1, 0x7f090160

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeIcon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeIcon:Landroid/widget/ImageView;

    new-instance v2, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper$1;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f090164

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeText:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2, v2}, Lmiui/app/ActionBar;->setDisplayOptions(II)V

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v0}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;)V

    return-object v0
.end method

.method private refreshHomeIconAndColor()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mIsShowTranslucentStatusBar:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$000(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeIcon:Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeIcon:Landroid/widget/ImageView;

    sget v1, Lmiui/R$drawable;->action_bar_back_light:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f05000a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeIcon:Landroid/widget/ImageView;

    sget v1, Lmiui/R$drawable;->action_bar_back_dark:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mHomeText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050009

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method private refreshTopBar(Z)V
    .locals 1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mIsShowTranslucentStatusBar:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->refreshHomeIconAndColor()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->getTopBarBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private setNormalStyleActionBar()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->refreshTopBar(Z)V

    return-void
.end method

.method private setNullStyleActionBar()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->refreshTopBar(Z)V

    return-void
.end method


# virtual methods
.method public getTopBarBackground()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mIsShowTranslucentStatusBar:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->mDefaultActionBarBg:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method
