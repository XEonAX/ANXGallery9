.class final Lcom/miui/gallery/agreement/AgreementsUtils$1;
.super Ljava/lang/Object;
.source "AgreementsUtils.java"

# interfaces
.implements Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/agreement/AgreementsUtils;->showUserAgreements(Landroid/app/Activity;Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$listener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/agreement/AgreementsUtils$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/agreement/AgreementsUtils$1;->val$listener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAgreementInvoked(Z)V
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/preference/BaseGalleryPreferences$Agreement;->setRequiredAgreementsAllowed(Z)V

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->setCanConnectNetwork(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementsUtils$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementsUtils$1;->val$listener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementsUtils$1;->val$listener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;->onAgreementInvoked(Z)V

    :cond_1
    return-void
.end method
