.class public Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "FeedbackPolicyNoticeFragment.java"


# instance fields
.field private mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method private buildUserNotice(Landroid/app/Activity;II)Landroid/text/SpannableStringBuilder;
    .locals 2

    invoke-virtual {p1, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    invoke-virtual {p1, p2, v0}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$3;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$3;-><init>(Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;Landroid/app/Activity;)V

    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    new-instance v1, Lcom/miui/gallery/text/UrlSpan;

    invoke-direct {v1, v0}, Lcom/miui/gallery/text/UrlSpan;-><init>(Lcom/miui/gallery/text/UrlSpan$UrlSpanOnClickListener;)V

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    add-int/2addr p3, p2

    const/16 v0, 0x21

    invoke-virtual {p1, v1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object p1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f100621

    const v1, 0x7f100622

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->buildUserNotice(Landroid/app/Activity;II)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f100709

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$2;-><init>(Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;)V

    const v1, 0x7f100704

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment$1;-><init>(Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;)V

    const/high16 v1, 0x1040000

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f10030d

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStart()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    return-void
.end method

.method public setOnPositiveButtonClickListener(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/feedback/FeedbackPolicyNoticeFragment;->mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method
