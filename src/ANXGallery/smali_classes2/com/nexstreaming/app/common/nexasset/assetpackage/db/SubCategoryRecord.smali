.class public Lcom/nexstreaming/app/common/nexasset/assetpackage/db/SubCategoryRecord;
.super Lcom/nexstreaming/app/common/norm/b;
.source "SubCategoryRecord.java"

# interfaces
.implements Lcom/nexstreaming/app/common/nexasset/assetpackage/d;


# instance fields
.field public _id:J

.field public subCategoryAlias:Ljava/lang/String;

.field public subCategoryId:J
    .annotation runtime Lcom/nexstreaming/app/common/norm/b$e;
    .end annotation

    .annotation runtime Lcom/nexstreaming/app/common/norm/b$g;
    .end annotation
.end field

.field public subCategoryName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/nexstreaming/app/common/norm/b;-><init>()V

    return-void
.end method


# virtual methods
.method public getSubCategoryAlias()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/SubCategoryRecord;->subCategoryAlias:Ljava/lang/String;

    return-object v0
.end method

.method public getSubCategoryId()J
    .locals 2

    iget-wide v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/SubCategoryRecord;->subCategoryId:J

    return-wide v0
.end method

.method public getSubCategoryName()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/db/SubCategoryRecord;->subCategoryName:Ljava/util/Map;

    return-object v0
.end method
