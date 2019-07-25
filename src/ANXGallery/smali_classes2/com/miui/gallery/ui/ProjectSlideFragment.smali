.class public Lcom/miui/gallery/ui/ProjectSlideFragment;
.super Landroid/app/Fragment;
.source "ProjectSlideFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/ProjectSlideFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ProjectSlideFragment;->setResult()V

    return-void
.end method

.method private setResult()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectSlideFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectSlideFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    const/16 v1, 0x18

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static showProjectSlideFragment(Lcom/miui/gallery/activity/BaseActivity;Lmiui/app/Fragment;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/ProjectSlideFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ProjectSlideFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "photo_connected_device"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const/16 p2, 0x18

    invoke-virtual {v0, p1, p2}, Landroid/app/Fragment;->setTargetFragment(Landroid/app/Fragment;I)V

    :cond_0
    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-virtual {p0, v0, p1, p2, p2}, Lcom/miui/gallery/activity/BaseActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x0

    const v0, 0x7f0b011b

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090238

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectSlideFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectSlideFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "photo_connected_device"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, p3

    const p3, 0x7f1005b3

    invoke-virtual {v0, p3, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p2, 0x7f090237

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/ProjectSlideFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/ProjectSlideFragment$1;-><init>(Lcom/miui/gallery/ui/ProjectSlideFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ProjectSlideFragment;->setResult()V

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    return-void
.end method
