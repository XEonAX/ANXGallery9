.class public Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;
.super Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;
.source "RemoveFromFaceAlbumHandler.java"


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V

    return-void
.end method


# virtual methods
.method public finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/model/PeopleContactInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;

    iget-object v1, p1, Lcom/miui/gallery/model/PeopleContactInfo;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/miui/gallery/model/PeopleContactInfo;->formatContactJson()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->setContactjson(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;->onGetFolderItem(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V

    :cond_0
    return-void
.end method

.method public show()V
    .locals 4

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mActivity:Landroid/app/Activity;

    const v2, 0x7f1005df

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mActivity:Landroid/app/Activity;

    const v2, 0x7f1005e6

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mActivity:Landroid/app/Activity;

    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lmiui/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler$1;-><init>(Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;)V

    const/4 v3, -0x1

    invoke-virtual {v1, v0, v3, v2}, Lmiui/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public showRemoveDialog()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "people_face_Merge_title"

    iget-object v3, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mActivity:Landroid/app/Activity;

    const v4, 0x7f1005e5

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "merge_action_from_album"

    iget-object v3, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "PeopleFaceMergeDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler$2;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler$2;-><init>(Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->setPeopleSelectListener(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;)V

    return-void
.end method
