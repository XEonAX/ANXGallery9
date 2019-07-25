.class public Lcom/xiaomi/mipush/sdk/ManifestChecker$ServiceCheckInfo;
.super Ljava/lang/Object;
.source "ManifestChecker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/ManifestChecker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ServiceCheckInfo"
.end annotation


# instance fields
.field public enabled:Z

.field public exported:Z

.field public permission:Ljava/lang/String;

.field public serviceName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/ManifestChecker$ServiceCheckInfo;->serviceName:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/xiaomi/mipush/sdk/ManifestChecker$ServiceCheckInfo;->enabled:Z

    iput-boolean p3, p0, Lcom/xiaomi/mipush/sdk/ManifestChecker$ServiceCheckInfo;->exported:Z

    iput-object p4, p0, Lcom/xiaomi/mipush/sdk/ManifestChecker$ServiceCheckInfo;->permission:Ljava/lang/String;

    return-void
.end method
