.class public Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/miui/gallery/error/core/ErrorActionCallback;
.implements Lcom/miui/gallery/error/core/ErrorTranslateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "DownloadErrorDisplayer"
.end annotation


# instance fields
.field private mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

.field private mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

.field private mErrorTranslator:Lcom/miui/gallery/error/BaseErrorCodeTranslator;

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcom/miui/gallery/error/BaseErrorCodeTranslator;

    invoke-direct {p1}, Lcom/miui/gallery/error/BaseErrorCodeTranslator;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorTranslator:Lcom/miui/gallery/error/BaseErrorCodeTranslator;

    return-void
.end method


# virtual methods
.method public display(Landroid/content/Context;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->display(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorTip;)Z

    move-result p1

    return p1
.end method

.method public final display(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorTip;)Z
    .locals 3

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->dismissAllowingStateLoss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/error/core/ErrorTip;->getCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->NO_CTA_PERMISSION:Lcom/miui/gallery/error/core/ErrorCode;

    if-ne v0, v1, :cond_2

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$1;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/agreement/AgreementsUtils;->showNetworkingAgreement(Landroid/app/Activity;Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p2, p1}, Lcom/miui/gallery/error/core/ErrorTip;->getActionStr(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    invoke-virtual {p2, p1}, Lcom/miui/gallery/error/core/ErrorTip;->getTitle(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p2, p1}, Lcom/miui/gallery/error/core/ErrorTip;->getMessage(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1000d6

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$3;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$3;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p2, p1}, Lcom/miui/gallery/error/core/ErrorTip;->getActionStr(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;

    invoke-direct {v2, p0, p2, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer$2;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;Lcom/miui/gallery/error/core/ErrorTip;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

    goto :goto_0

    :cond_3
    invoke-virtual {p2, p1}, Lcom/miui/gallery/error/core/ErrorTip;->getTitle(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorDialog:Lcom/miui/gallery/widget/GalleryDialogFragment;

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v1, "error"

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2300(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V

    const/4 p1, 0x1

    return p1
.end method

.method public handleError(Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorTranslator:Lcom/miui/gallery/error/BaseErrorCodeTranslator;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p0}, Lcom/miui/gallery/error/BaseErrorCodeTranslator;->translate(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorCode;Lcom/miui/gallery/error/core/ErrorTranslateCallback;)V

    return-void
.end method

.method public onAction(Lcom/miui/gallery/error/core/ErrorCode;Z)V
    .locals 1

    if-nez p2, :cond_0

    sget-object p2, Lcom/miui/gallery/ui/PhotoPageItem$4;->$SwitchMap$com$miui$gallery$error$core$ErrorCode:[I

    invoke-virtual {p1}, Lcom/miui/gallery/error/core/ErrorCode;->ordinal()I

    move-result p1

    aget p1, p2, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->processDownload()V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    sget-object p2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->downloadOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->downloadOrigin()V

    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$2400(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onTranslate(Lcom/miui/gallery/error/core/ErrorTip;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->mErrorTip:Lcom/miui/gallery/error/core/ErrorTip;

    return-void
.end method
