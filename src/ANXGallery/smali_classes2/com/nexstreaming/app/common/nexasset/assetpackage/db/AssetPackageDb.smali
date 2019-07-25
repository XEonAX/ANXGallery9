.class public Lcom/nexstreaming/app/common/nexasset/assetpackage/db/AssetPackageDb;
.super Lcom/nexstreaming/app/common/norm/a;
.source "AssetPackageDb.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const-string v0, "com.kinemaster.asset_package.db"

    const/16 v1, 0xd

    invoke-direct {p0, p1, v0, v1}, Lcom/nexstreaming/app/common/norm/a;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method protected getTableClasses()[Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class<",
            "+",
            "Lcom/nexstreaming/app/common/norm/b;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/AssetPackageRecord;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-class v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/ItemRecord;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-class v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/CategoryRecord;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-class v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/SubCategoryRecord;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-class v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/InstallSourceRecord;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method
