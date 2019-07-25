.class public Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;
.super Ljava/lang/Object;
.source "CtaAgreement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/agreement/cta/CtaAgreement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Licence"
.end annotation


# static fields
.field public static URL_MIUI_PRIVACY_POLICY:Ljava/lang/String; = "http://www.miui.com/res/doc/privacy.html"

.field public static URL_MIUI_USER_AGREEMENT:Ljava/lang/String; = "http://www.miui.com/res/doc/eula.html"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static getPrivacyIntent()Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;->URL_MIUI_PRIVACY_POLICY:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;->getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method

.method private static getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s?region=%s&lang=%s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {}, Lcom/miui/settings/Settings;->getRegion()Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x2

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUserAgreementIntent()Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;->URL_MIUI_USER_AGREEMENT:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;->getUrlByLocale(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method
