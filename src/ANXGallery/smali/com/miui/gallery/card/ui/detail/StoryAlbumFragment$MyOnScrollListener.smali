.class public Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "StoryAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyOnScrollListener"
.end annotation


# instance fields
.field private mActionBarBackgroundChangedPosition:I

.field private mActionBarTitleChangedPosition:I

.field private mFirstVisisbleItem:Landroid/view/View;

.field private mHeaderViewBottomPrePosition:I

.field private mIsChangedPositionInited:Z

.field private mPlayIconChangedPosition:I

.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method

.method private initChangedPosition()V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mIsChangedPositionInited:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mIsChangedPositionInited:Z

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->getBottom()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->getActionBarHeight()I

    move-result v2

    add-int/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->getPlayIcon()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v2, v0

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0604a2

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v2, v1

    iput v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mPlayIconChangedPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarBackgroundChangedPosition:I

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060499

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarTitleChangedPosition:I

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 0

    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 2

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mFirstVisisbleItem:Landroid/view/View;

    const/4 p3, 0x0

    if-nez p2, :cond_0

    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mFirstVisisbleItem:Landroid/view/View;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mFirstVisisbleItem:Landroid/view/View;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mFirstVisisbleItem:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    if-lez p2, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->initChangedPosition()V

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mPlayIconChangedPosition:I

    const/4 v1, 0x1

    if-lt p2, v0, :cond_1

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mPlayIconChangedPosition:I

    if-gt p1, p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2, p3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7302(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    goto :goto_0

    :cond_1
    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mPlayIconChangedPosition:I

    if-gt p2, v0, :cond_2

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mPlayIconChangedPosition:I

    if-lt p1, p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$7302(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    :cond_2
    :goto_0
    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarBackgroundChangedPosition:I

    if-lt p2, v0, :cond_3

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarBackgroundChangedPosition:I

    if-gt p1, p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2, p3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4702(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    goto :goto_1

    :cond_3
    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarBackgroundChangedPosition:I

    if-gt p2, v0, :cond_4

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarBackgroundChangedPosition:I

    if-lt p1, p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$4702(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    :cond_4
    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->access$3300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarTitleChangedPosition:I

    if-lt p2, v0, :cond_5

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarTitleChangedPosition:I

    if-gt p1, p2, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    move-result-object p2

    invoke-virtual {p2, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->startActionBarTitleAnim(Z)V

    goto :goto_2

    :cond_5
    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarTitleChangedPosition:I

    if-gt p2, v0, :cond_6

    iget p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mActionBarTitleChangedPosition:I

    if-lt p1, p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->startActionBarTitleAnim(Z)V

    :cond_6
    :goto_2
    iput p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;->mHeaderViewBottomPrePosition:I

    :cond_7
    return-void
.end method
