.class public Lcom/miui/privacy/LockSettingsHelper;
.super Ljava/lang/Object;
.source "LockSettingsHelper.java"


# static fields
.field private static final IMPL:Lcom/miui/privacy/IPrivacyHelper;


# instance fields
.field private final mImpl:Lcom/miui/privacy/IPrivacyWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/privacy/MiuiHelper;

    invoke-direct {v0}, Lcom/miui/privacy/MiuiHelper;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/privacy/XmsHelper;

    invoke-direct {v0}, Lcom/miui/privacy/XmsHelper;-><init>()V

    :goto_0
    sput-object v0, Lcom/miui/privacy/LockSettingsHelper;->IMPL:Lcom/miui/privacy/IPrivacyHelper;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/privacy/MiuiWrapper;

    invoke-direct {v0, p1}, Lcom/miui/privacy/MiuiWrapper;-><init>(Landroid/app/Activity;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/privacy/XmsWrapper;

    invoke-direct {v0, p1}, Lcom/miui/privacy/XmsWrapper;-><init>(Landroid/content/Context;)V

    :goto_0
    iput-object v0, p0, Lcom/miui/privacy/LockSettingsHelper;->mImpl:Lcom/miui/privacy/IPrivacyWrapper;

    return-void
.end method

.method public static confirmPrivateGalleryPassword(Landroid/app/Fragment;I)V
    .locals 1

    sget-object v0, Lcom/miui/privacy/LockSettingsHelper;->IMPL:Lcom/miui/privacy/IPrivacyHelper;

    invoke-interface {v0, p0, p1}, Lcom/miui/privacy/IPrivacyHelper;->confirmPrivateGalleryPassword(Landroid/app/Fragment;I)V

    return-void
.end method

.method public static startAuthenticatePasswordActivity(Landroid/app/Activity;I)V
    .locals 1

    sget-object v0, Lcom/miui/privacy/LockSettingsHelper;->IMPL:Lcom/miui/privacy/IPrivacyHelper;

    invoke-interface {v0, p0, p1}, Lcom/miui/privacy/IPrivacyHelper;->startAuthenticatePasswordActivity(Landroid/app/Activity;I)V

    return-void
.end method

.method public static startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V
    .locals 1

    sget-object v0, Lcom/miui/privacy/LockSettingsHelper;->IMPL:Lcom/miui/privacy/IPrivacyHelper;

    invoke-interface {v0, p0, p1}, Lcom/miui/privacy/IPrivacyHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    return-void
.end method

.method public static startSetPrivacyPasswordActivity(Landroid/app/Fragment;I)V
    .locals 1

    sget-object v0, Lcom/miui/privacy/LockSettingsHelper;->IMPL:Lcom/miui/privacy/IPrivacyHelper;

    invoke-interface {v0, p0, p1}, Lcom/miui/privacy/IPrivacyHelper;->startSetPrivacyPasswordActivity(Landroid/app/Fragment;I)V

    return-void
.end method


# virtual methods
.method public isPrivacyPasswordEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/privacy/LockSettingsHelper;->mImpl:Lcom/miui/privacy/IPrivacyWrapper;

    invoke-interface {v0}, Lcom/miui/privacy/IPrivacyWrapper;->isPrivacyPasswordEnabled()Z

    move-result v0

    return v0
.end method

.method public isPrivateGalleryEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/privacy/LockSettingsHelper;->mImpl:Lcom/miui/privacy/IPrivacyWrapper;

    invoke-interface {v0}, Lcom/miui/privacy/IPrivacyWrapper;->isPrivateGalleryEnabled()Z

    move-result v0

    return v0
.end method

.method public setPrivateGalleryEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/privacy/LockSettingsHelper;->mImpl:Lcom/miui/privacy/IPrivacyWrapper;

    invoke-interface {v0, p1}, Lcom/miui/privacy/IPrivacyWrapper;->setPrivateGalleryEnabled(Z)V

    return-void
.end method
