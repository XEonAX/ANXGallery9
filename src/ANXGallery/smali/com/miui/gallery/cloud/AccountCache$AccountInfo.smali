.class public Lcom/miui/gallery/cloud/AccountCache$AccountInfo;
.super Ljava/lang/Object;
.source "AccountCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/AccountCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AccountInfo"
.end annotation


# instance fields
.field public final mAccount:Landroid/accounts/Account;

.field public final mToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;


# direct methods
.method public constructor <init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    iput-object p2, p0, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    return-void
.end method
