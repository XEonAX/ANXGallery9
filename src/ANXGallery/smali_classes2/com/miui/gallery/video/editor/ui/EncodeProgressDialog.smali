.class public Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;
.super Lcom/miui/gallery/video/editor/ui/ProgressDialog;
.source "EncodeProgressDialog.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;
.implements Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;
    }
.end annotation


# instance fields
.field private mFragmentManager:Landroid/app/FragmentManager;

.field private mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;

.field private mOutPutPath:Ljava/lang/String;

.field private mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;-><init>()V

    return-void
.end method

.method public static startEncode(Lcom/miui/gallery/video/editor/VideoEditor;Ljava/lang/String;Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;Landroid/app/FragmentManager;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "path"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setVideoEditor(Lcom/miui/gallery/video/editor/VideoEditor;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setOnCompletedListener(Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;)V

    invoke-virtual {v0, p3}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setFragmentManager(Landroid/app/FragmentManager;)V

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->export(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;)V

    return-void
.end method


# virtual methods
.method public onCancelClicked()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->cancelExport(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0, p0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setProgressDialogInterface(Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;)V

    const/16 p1, 0x64

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setMax(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "path"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mOutPutPath:Ljava/lang/String;

    return-void
.end method

.method public onEncodeEnd(ZII)V
    .locals 2

    const/16 v0, 0x64

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setProgress(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mOutPutPath:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2, p3}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;->onCompleted(Ljava/lang/String;ZII)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->dismissSafely()V

    return-void
.end method

.method public onEncodeProgress(I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setProgress(I)V

    return-void
.end method

.method public onEncodeStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v1, "EncodeProgressDialog"

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const v0, 0x7f10072c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->setMsg(I)V

    return-void
.end method

.method public setFragmentManager(Landroid/app/FragmentManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mFragmentManager:Landroid/app/FragmentManager;

    return-void
.end method

.method public setOnCompletedListener(Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;

    return-void
.end method

.method public setVideoEditor(Lcom/miui/gallery/video/editor/VideoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-void
.end method
