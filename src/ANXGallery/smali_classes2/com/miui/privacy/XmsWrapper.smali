.class Lcom/miui/privacy/XmsWrapper;
.super Ljava/lang/Object;
.source "XmsWrapper.java"

# interfaces
.implements Lcom/miui/privacy/IPrivacyWrapper;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/privacy/XmsWrapper;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public isPrivacyPasswordEnabled()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/privacy/XmsWrapper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "privacy_password_is_open"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isPrivateGalleryEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setPrivateGalleryEnabled(Z)V
    .locals 0

    return-void
.end method
