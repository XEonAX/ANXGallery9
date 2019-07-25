.class public Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "RecommendFacePageActivity.java"


# instance fields
.field mRecommendFaceFragment:Lcom/miui/gallery/ui/RecommendFacePageFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;->mRecommendFaceFragment:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->onActivityFinish()V

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0124

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090253

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/RecommendFacePageFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;->mRecommendFaceFragment:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p2, 0x4

    if-ne p1, p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;->finish()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
