.class Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;
.super Lcom/miui/gallery/agreement/core/Agreement;
.source "AgreementDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/agreement/AgreementDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AgreementWrapper"
.end annotation


# instance fields
.field private final isSelectItem:Z

.field private mChecked:Z


# direct methods
.method public constructor <init>(Lcom/miui/gallery/agreement/core/Agreement;Z)V
    .locals 2

    iget-object v0, p1, Lcom/miui/gallery/agreement/core/Agreement;->mText:Ljava/lang/String;

    iget-object v1, p1, Lcom/miui/gallery/agreement/core/Agreement;->mLink:Ljava/lang/String;

    iget-boolean p1, p1, Lcom/miui/gallery/agreement/core/Agreement;->mRequired:Z

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/agreement/core/Agreement;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-boolean p2, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->isSelectItem:Z

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mChecked:Z

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mChecked:Z

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->isSelectItem:Z

    return p0
.end method
