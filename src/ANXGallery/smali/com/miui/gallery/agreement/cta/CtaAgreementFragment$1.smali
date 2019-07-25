.class Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$1;
.super Ljava/lang/Object;
.source "CtaAgreementFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getPositiveListener()Landroid/content/DialogInterface$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$1;->this$0:Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    invoke-static {p1}, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->setCanConnectNetwork(Z)V

    iget-object p2, p0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$1;->this$0:Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;

    invoke-static {p2}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->access$000(Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;)Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$1;->this$0:Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;

    invoke-static {p2}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->access$000(Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;)Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;->onAgreementInvoked(Z)V

    :cond_0
    return-void
.end method
