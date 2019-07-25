.class public abstract Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "BaseAlbumOperationDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;,
        Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;
    }
.end annotation


# instance fields
.field protected mConfirmButton:Landroid/widget/Button;

.field private mConfirmListener:Landroid/view/View$OnClickListener;

.field protected mDefaultName:Ljava/lang/String;

.field protected mDialog:Lmiui/app/AlertDialog;

.field protected mInputView:Landroid/widget/EditText;

.field protected mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

.field protected mServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

.field protected mServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

.field protected mTextWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;-><init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mConfirmListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$3;-><init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mTextWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)Landroid/view/View$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mConfirmListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->verify(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->selectAll()V

    return-void
.end method

.method private selectAll()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    return-void
.end method

.method private verify(Ljava/lang/String;)Z
    .locals 5

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->selectAll()V

    return v1

    :cond_0
    const-string v0, "._"

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f1004b6

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v1

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ge v0, v2, :cond_4

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const-string v4, "/\\:@*?<>\r\n\t"

    invoke-virtual {v4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_3

    const-string p1, "\r\n\t"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_2

    const/16 v2, 0x20

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f1004b4

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-virtual {p0, v0, v3}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return v1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->containsName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;->containsName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_1

    :cond_5
    return v3

    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v2, 0x7f1004b5

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v1

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->selectAll()V

    return v1
.end method


# virtual methods
.method protected abstract execAlbumOperation(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
.end method

.method protected abstract getDialogTitle()I
.end method

.method protected abstract getOperationFailedString()I
.end method

.method protected abstract getOperationSucceededString()I
.end method

.method protected abstract getResultId(Landroid/os/Bundle;)J
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->parseArguments()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b006f

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    const v0, 0x7f100038

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDefaultName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->selectAll()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getServerReservedAlbumNamesStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getServerUnModifyAlbumsStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setView(Landroid/view/View;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getDialogTitle()I

    move-result v0

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v0, 0x0

    const v1, 0x104000a

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v1, 0x1040000

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    new-instance v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$1;-><init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    return-object p1
.end method

.method protected parseArguments()V
    .locals 0

    return-void
.end method

.method public setOnAlbumOperationDoneListener(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-void
.end method
