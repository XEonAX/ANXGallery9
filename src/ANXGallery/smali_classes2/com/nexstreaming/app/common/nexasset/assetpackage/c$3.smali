.class Lcom/nexstreaming/app/common/nexasset/assetpackage/c$3;
.super Ljava/lang/Object;
.source "AssetPackageManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/nexstreaming/app/common/nexasset/assetpackage/a;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/app/common/nexasset/assetpackage/c;


# direct methods
.method constructor <init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/c;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/c$3;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/nexstreaming/app/common/nexasset/assetpackage/a;Lcom/nexstreaming/app/common/nexasset/assetpackage/a;)I
    .locals 0

    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/a;->getCategoryAlias()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/a;->getCategoryAlias()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/a;

    check-cast p2, Lcom/nexstreaming/app/common/nexasset/assetpackage/a;

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c$3;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/a;Lcom/nexstreaming/app/common/nexasset/assetpackage/a;)I

    move-result p1

    return p1
.end method
