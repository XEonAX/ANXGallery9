.class public Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;
.super Lcom/miui/gallery/video/editor/ui/ProgressDialog;
.source "AutoTrimProgressDialog.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;
.implements Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;
    }
.end annotation


# instance fields
.field private mCurrentWorkState:I

.field private mFragmentManager:Landroid/app/FragmentManager;

.field private mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;

.field private mOutPutFilePath:Ljava/lang/String;

.field private mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mCurrentWorkState:I

    return-void
.end method

.method public static startAutoTrim(Lcom/miui/gallery/video/editor/VideoEditor;Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;Landroid/app/FragmentManager;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;-><init>()V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setVideoEditor(Lcom/miui/gallery/video/editor/VideoEditor;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setOnCompletedListener(Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setFragmentManager(Landroid/app/FragmentManager;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->autoTrim(Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;)V

    return-void
.end method


# virtual methods
.method public onCancelClicked()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mCurrentWorkState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->cancelExport(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setCancleButtonEnable(Z)V

    invoke-virtual {p0, p0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setProgressDialogInterface(Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;)V

    return-void
.end method

.method public onEncodeEnd(ZII)V
    .locals 2

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mOutPutFilePath:Ljava/lang/String;

    const-string v1, ""

    invoke-interface {p3, p1, v0, p2, v1}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;->onCompleted(ZLjava/lang/String;ILjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->dismissSafely()V

    return-void
.end method

.method public onEncodeProgress(I)V
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x42be0000    # 95.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    add-int/lit8 p1, p1, 0x5

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setProgress(I)V

    return-void
.end method

.method public onEncodeStart()V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mCurrentWorkState:I

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setProgress(I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setCancleButtonEnable(Z)V

    return-void
.end method

.method public onTrimEnd(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mOutPutFilePath:Ljava/lang/String;

    return-void
.end method

.method public onTrimProgress(I)V
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x40a00000    # 5.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setProgress(I)V

    return-void
.end method

.method public onTrimStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v1, "AutoTrimProgressDialog"

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mCurrentWorkState:I

    const v0, 0x7f10071f

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setMsg(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->setCancelable(Z)V

    return-void
.end method

.method public setFragmentManager(Landroid/app/FragmentManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mFragmentManager:Landroid/app/FragmentManager;

    return-void
.end method

.method public setOnCompletedListener(Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mOnCompletedListener:Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;

    return-void
.end method

.method public setVideoEditor(Lcom/miui/gallery/video/editor/VideoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-void
.end method
