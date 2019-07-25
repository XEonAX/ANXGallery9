.class public Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "PeopleRelationCreatorDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;
    }
.end annotation


# static fields
.field private static final INVALID_NAMES:[Ljava/lang/String;


# instance fields
.field private mConfirmButton:Landroid/widget/Button;

.field private mConfirmListener:Landroid/view/View$OnClickListener;

.field private mDefaultName:Ljava/lang/String;

.field private mDialog:Landroid/app/AlertDialog;

.field private mInputView:Landroid/widget/EditText;

.field private mOnCreatedListener:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    const-string v0, "\u81ea\u5df1"

    const-string v1, "\u5b69\u5b50"

    const-string v2, "\u5bb6\u4eba"

    const-string v3, "\u540c\u4e8b"

    const-string v4, "\u540c\u5b66"

    const-string v5, "\u5bb6\u4eba"

    const-string v6, "\u670b\u53cb"

    const-string v7, "\u672a\u5206\u7ec4"

    const-string v8, "\u81ea\u5b9a\u4e49"

    const-string v9, "Me"

    const-string v10, "Child"

    const-string v11, "Family"

    const-string v12, "Collegues"

    const-string v13, "Classmates"

    const-string v14, "Friends"

    const-string v15, "Ungrouped"

    const-string v16, "Custom"

    filled-new-array/range {v0 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->INVALID_NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;-><init>(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mConfirmListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mConfirmButton:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;Landroid/widget/Button;)Landroid/widget/Button;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mConfirmButton:Landroid/widget/Button;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Landroid/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Landroid/view/View$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mConfirmListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->verify(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mOnCreatedListener:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;

    return-object p0
.end method

.method private selectAll()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    return-void
.end method

.method private verify(Ljava/lang/String;)Z
    .locals 7

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f100333

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDefaultName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->selectAll()V

    return v1

    :cond_0
    const-string v0, "._"

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f1004b9

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
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f1004b7

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-virtual {p0, v0, v3}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return v1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->INVALID_NAMES:[Ljava/lang/String;

    array-length v2, v0

    const/4 v4, 0x0

    :goto_1
    const v5, 0x7f1004b8

    if-ge v4, v2, :cond_6

    aget-object v6, v0, v4

    invoke-static {v6, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {p0, v5, v2}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->selectAll()V

    return v1

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_6
    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo$UserDefineRelation;->getUserDefineRelations()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {p0, v5, v2}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->selectAll()V

    return v1

    :cond_8
    return v3
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b006f

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    const v0, 0x7f100435

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(I)V

    const p1, 0x7f1002f0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDefaultName:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDefaultName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->selectAll()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f1002f0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v0, 0x0

    const v1, 0x104000a

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v1, 0x1040000

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDialog:Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDialog:Landroid/app/AlertDialog;

    new-instance v0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$1;-><init>(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method public setOnCreatedListener(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->mOnCreatedListener:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;

    return-void
.end method
