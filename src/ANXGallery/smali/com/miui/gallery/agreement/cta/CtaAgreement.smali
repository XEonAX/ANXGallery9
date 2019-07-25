.class public Lcom/miui/gallery/agreement/cta/CtaAgreement;
.super Ljava/lang/Object;
.source "CtaAgreement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;
    }
.end annotation


# direct methods
.method public static buildUserNotice(Landroid/content/Context;I)Landroid/text/SpannableStringBuilder;
    .locals 5

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/permission/R$string;->user_agreement2:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/miui/gallery/permission/R$string;->user_agreement4:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-virtual {v0, p1, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1, v2}, Lcom/miui/gallery/agreement/cta/CtaAgreement;->buildUserNotice(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static buildUserNotice(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 4

    new-instance v0, Lcom/miui/gallery/agreement/cta/CtaAgreement$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/agreement/cta/CtaAgreement$1;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/miui/gallery/agreement/cta/CtaAgreement$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/agreement/cta/CtaAgreement$2;-><init>(Landroid/content/Context;)V

    new-instance p0, Landroid/text/SpannableStringBuilder;

    invoke-direct {p0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    new-instance v3, Lcom/miui/gallery/text/UrlSpan;

    invoke-direct {v3, v0}, Lcom/miui/gallery/text/UrlSpan;-><init>(Lcom/miui/gallery/text/UrlSpan$UrlSpanOnClickListener;)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p2, v2

    const/16 v0, 0x21

    invoke-virtual {p0, v3, v2, p2, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    new-instance p2, Lcom/miui/gallery/text/UrlSpan;

    invoke-direct {p2, v1}, Lcom/miui/gallery/text/UrlSpan;-><init>(Lcom/miui/gallery/text/UrlSpan$UrlSpanOnClickListener;)V

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    add-int/2addr p3, p1

    invoke-virtual {p0, p2, p1, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object p0
.end method
