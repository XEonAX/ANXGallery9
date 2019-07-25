.class Lcom/miui/gallery/ui/FacePageFragment$15;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->addRecommendGroupHeader()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$15;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->isShowRecommendConfirmDialog()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$15;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$2600(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->getMergeFaceCount()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->setShowRecommendConfirmDialog(Z)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment$15;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f1002ce

    new-instance v3, Lcom/miui/gallery/ui/FacePageFragment$15$1;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/FacePageFragment$15$1;-><init>(Lcom/miui/gallery/ui/FacePageFragment$15;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment$15;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const v3, 0x7f1005dc

    invoke-virtual {v2, v3}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment$15;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0040

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, p1, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$15;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/FacePageFragment;->changeToNextPage()V

    :goto_0
    return-void
.end method
