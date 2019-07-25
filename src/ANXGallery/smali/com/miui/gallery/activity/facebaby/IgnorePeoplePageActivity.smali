.class public Lcom/miui/gallery/activity/facebaby/IgnorePeoplePageActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "IgnorePeoplePageActivity.java"


# instance fields
.field private mFragment:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/IgnorePeoplePageActivity;->mFragment:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0097

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/IgnorePeoplePageActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/IgnorePeoplePageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f09016e

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/IgnorePeoplePageActivity;->mFragment:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    return-void
.end method
