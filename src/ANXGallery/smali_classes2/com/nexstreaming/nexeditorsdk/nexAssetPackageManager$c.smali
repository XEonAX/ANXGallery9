.class Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;
.super Ljava/lang/Object;
.source "nexAssetPackageManager.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation


# instance fields
.field protected category:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

.field private getNamesMap:Z

.field protected id:Ljava/lang/String;

.field protected isDelete:Z

.field protected isHidden:Z

.field protected name:Ljava/lang/String;

.field private namesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected packInfo:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

.field protected type:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->id()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->packInfo:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->category()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->category:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->isDelete()Z

    move-result v0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->isDelete:Z

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->hidden()Z

    move-result v0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->isHidden:Z

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->category()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->category:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->type()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->type:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    return-void
.end method

.method private loadLabels()V
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->getNamesMap:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->getNamesMap:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "nexAssetPackageMan"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No ItemInfo! id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    if-nez v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    :cond_1
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public category()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->category:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    return-object v0
.end method

.method public getSupportedLocales()[Ljava/lang/String;
    .locals 4

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->loadLabels()V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-array v0, v1, [Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_1

    new-array v0, v1, [Ljava/lang/String;

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public hidden()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->isHidden:Z

    return v0
.end method

.method public icon()Landroid/graphics/Bitmap;
    .locals 5

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0, v2, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/e;->a(Landroid/content/Context;Lcom/nexstreaming/app/common/nexasset/assetpackage/f;II)Landroid/graphics/Bitmap;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v3, v1

    :goto_0
    if-nez v3, :cond_0

    :try_start_1
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v0, v2, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/e;->b(Landroid/content/Context;Lcom/nexstreaming/app/common/nexasset/assetpackage/f;II)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    :cond_0
    move-object v0, v3

    :goto_1
    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    return-object v1
.end method

.method public id()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    return-object v0
.end method

.method public isDelete()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->isDelete:Z

    return v0
.end method

.method public name(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->loadLabels()V

    if-nez p1, :cond_0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/nexstreaming/app/common/util/n;->a(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    :cond_0
    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    return-object p1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->namesMap:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_3

    return-object p1

    :cond_3
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    return-object p1

    :cond_4
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->name:Ljava/lang/String;

    return-object p1
.end method

.method public packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->packInfo:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    return-object v0
.end method

.method public thumbnail()Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->packInfo:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getThumbPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v1

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->packInfo:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->getThumbnailPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_3
    return-object v1
.end method

.method public type()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->type:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    return-object v0
.end method

.method public validate()Z
    .locals 2

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$c;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
