.class Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$3400(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->doRemove(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V

    return-void
.end method

.method private doRemove(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->doMoveFacesToAnother(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;[J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->access$3500(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;)Landroid/view/ActionMode;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    const-string p1, "face"

    const-string v0, "face_remove"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onGetFolderItem(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_1

    new-instance v2, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2$1;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2$1;-><init>(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V

    new-instance v3, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2$2;-><init>(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;)V

    const-string v0, ""

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1005de

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f1004e3

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f1005dd

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    move-object v4, p1

    move-object v6, v0

    move-object v5, v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v4, 0x104000a

    invoke-virtual {v1, v4}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object v4, v4, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v4, v4, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v5, 0x7f1002d2

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-interface {p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;->getName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v7

    invoke-virtual {v4, v5, v6}, Lcom/miui/gallery/activity/BaseActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    move-object v5, p1

    move-object v4, v0

    move-object v6, v1

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/high16 v7, 0x1040000

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showConfirmAlertWithCancel(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;I)Landroid/app/AlertDialog;

    :cond_1
    return-void
.end method
