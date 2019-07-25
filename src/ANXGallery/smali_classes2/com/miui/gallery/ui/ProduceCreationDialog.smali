.class public Lcom/miui/gallery/ui/ProduceCreationDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "ProduceCreationDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;,
        Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;,
        Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;
    }
.end annotation


# instance fields
.field private mCreationModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;",
            ">;"
        }
    .end annotation
.end field

.field private mDialog:Lmiui/app/AlertDialog;

.field private mDownloadStateListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;

.field private mInstallStateListener:Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

.field private mOnOperationSelectedListener:Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;

.field private mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;


# direct methods
.method public constructor <init>()V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/ProduceCreationDialog$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ProduceCreationDialog$1;-><init>(Lcom/miui/gallery/ui/ProduceCreationDialog;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mInstallStateListener:Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

    new-instance v0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ProduceCreationDialog$2;-><init>(Lcom/miui/gallery/ui/ProduceCreationDialog;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mDownloadStateListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mCreationModels:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getCreationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->isCollageEntryEnable()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mCreationModels:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    const/4 v3, 0x0

    const v4, 0x7f07015e

    const v5, 0x7f100410

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;-><init>(III)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->isPhotoMovieEntryEnable()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/PhotoMovieEntranceUtils;->isPhotoMovieAvailable()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mCreationModels:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    const/4 v3, 0x1

    const v4, 0x7f07015f

    const v5, 0x7f100411

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;-><init>(III)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/util/PrintInstallHelper;->isPhotoPrintEnable()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->isPrintEntryEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mCreationModels:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    const/4 v2, 0x2

    const v3, 0x7f070160

    const v4, 0x7f100412

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;-><init>(III)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/ProduceCreationDialog;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mCreationModels:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mOnOperationSelectedListener:Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;

    return-object p0
.end method

.method public static checkCreationCondition(Landroid/content/Context;ILjava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;)Z"
        }
    .end annotation

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p0, "ProduceCreationDialog"

    const-string p1, "Checked Items is null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {p2}, Lcom/miui/gallery/ui/ProduceCreationDialog;->containVideo(Ljava/util/List;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    const p2, 0x7f100703

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->getCreationName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return v1

    :cond_1
    if-nez p1, :cond_2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->getCollageMaxImageSize()I

    move-result v3

    if-le v0, v3, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->getCollageMaxImageSize()I

    move-result p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0e0017

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, v0, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return v1

    :cond_2
    if-ne p1, v2, :cond_4

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/16 v3, 0x14

    if-gt v0, v3, :cond_3

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x3

    if-ge v0, v3, :cond_4

    :cond_3
    const p1, 0x7f100565

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v1

    :cond_4
    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getCreationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->getPrintMaxImageCount()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-le p2, v0, :cond_5

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e0018

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p1, p2, v0, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return v1

    :cond_5
    check-cast p0, Landroid/app/Activity;

    invoke-static {p0, p1}, Lcom/miui/gallery/util/IntentUtil;->checkCreationCondition(Landroid/app/Activity;I)Z

    move-result p0

    return p0
.end method

.method private static containVideo(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;)Z"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static getCreationName(Landroid/content/Context;I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    const p1, 0x7f100412

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    const p1, 0x7f100411

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    const p1, 0x7f100410

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mCreationModels:Ljava/util/List;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;-><init>(Lcom/miui/gallery/ui/ProduceCreationDialog;Ljava/util/List;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/PrintInstallHelper;->isPrintInstalling()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setRemainWhenClick(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f100568

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setInformation(ILjava/lang/String;)V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getLoaderState()I

    move-result p1

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    invoke-virtual {p1, v0, v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setRemainWhenClick(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f100561

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setInformation(ILjava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mProduceCreationAdapter:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mDialog:Lmiui/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mDialog:Lmiui/app/AlertDialog;

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mInstallStateListener:Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/PrintInstallHelper;->addInstallStateListener(Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)V

    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mDownloadStateListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->addDownloadStateListener(Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;)V

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDestroyView()V

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mInstallStateListener:Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/PrintInstallHelper;->removeInstallStateListener(Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)V

    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mDownloadStateListener:Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->removeDownloadStateListener(Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;)V

    return-void
.end method

.method public setOnOperationSelectedListener(Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog;->mOnOperationSelectedListener:Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;

    return-void
.end method
