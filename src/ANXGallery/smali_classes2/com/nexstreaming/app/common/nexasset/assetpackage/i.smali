.class public Lcom/nexstreaming/app/common/nexasset/assetpackage/i;
.super Ljava/lang/Object;
.source "XMLItemDefReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;,
        Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;
    }
.end annotation


# static fields
.field private static a:Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

.field private static b:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/app/common/nexasset/assetpackage/h;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->b:Landroid/util/LruCache;

    return-void
.end method

.method private static a(Ljava/lang/String;I)I
    .locals 0

    if-nez p0, :cond_0

    return p1

    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    return p1
.end method

.method private static a(Ljava/lang/String;Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 5

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    :try_start_0
    const-string v0, " +"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    return-object p1

    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/4 v2, 0x1

    aget-object v2, p0, v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    const/4 v3, 0x2

    aget-object v3, p0, v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    const/4 v4, 0x3

    aget-object p0, p0, v4

    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    invoke-direct {v0, v1, v2, v3, p0}, Landroid/graphics/RectF;-><init>(FFFF)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    return-object p1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p1, :cond_0

    sget-object p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    return-object p0

    :cond_0
    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->b:Landroid/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-nez v0, :cond_2

    sget-object p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    return-object p0

    :cond_2
    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$2;->a:[I

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    sget-object p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    return-object p0

    :pswitch_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getPackageURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v2

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetId()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    move-result-object p0

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/io/InputStream;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    move-result-object p0

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->b:Landroid/util/LruCache;

    invoke-virtual {v0, p1, p0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Ljava/io/InputStream;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v0
.end method

.method public static a(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;)V

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_a

    const-string v3, "effect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "renderitem"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "overlay"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    :cond_0
    const-string v3, "effect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const/16 v5, 0x64

    if-eqz v3, :cond_2

    const-string v2, "transition"

    const-string v3, "type"

    invoke-interface {p0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "effectoffset"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;I)I

    const-string v2, "effectoverlap"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v2, "videooverlap"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_1
    invoke-static {v2, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->b(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;I)I

    goto :goto_0

    :cond_2
    const-string v3, "renderitem"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "transition"

    const-string v3, "type"

    invoke-interface {p0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "transitionoffset"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;I)I

    const-string v2, "transitionoverlap"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->b(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;I)I

    :cond_3
    const-string v2, "width"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->c(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;I)I

    const-string v2, "height"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->d(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;I)I

    :cond_4
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;Ljava/util/List;)Ljava/util/List;

    :cond_5
    :goto_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_9

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    if-eq v1, v4, :cond_6

    goto :goto_1

    :cond_6
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "parameter"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;)Ljava/util/List;

    move-result-object v1

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->c(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_7
    const-string v2, "userfield"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->b(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$c;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_8
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    :cond_9
    return-object v0

    :cond_a
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "expected <effect>, <overlay> or <renderitem>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static a(Ljava/lang/String;Z)Z
    .locals 1

    if-nez p0, :cond_0

    return p1

    :cond_0
    const-string v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string v0, "false"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x0

    return p0

    :cond_2
    return p1
.end method

.method private static b(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "userfield"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;

    invoke-direct {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;)V

    const-string v3, "id"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->e:Ljava/lang/String;

    const-string v3, "default"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->b:Ljava/lang/String;

    const v3, 0x7fffffff

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->f:I

    const-string v3, "maxlines"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x0

    if-le v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    iput-boolean v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->g:Z

    iput-boolean v5, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->h:Z

    iput v5, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->i:I

    const/16 v3, 0x64

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->j:I

    iput v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->k:I

    const-string v3, "step"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->l:Landroid/graphics/RectF;

    const-string v3, "label"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    iget-object v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    const-string v5, "label"

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    const-string v5, "label"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    const-string v5, ""

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v3, "type"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "selection"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->CHOICE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_1

    :cond_2
    const-string v4, "color"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGB:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_1

    :cond_3
    const-string v4, "text"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->TEXT:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_1

    :cond_4
    const-string v4, "overlay"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->IMAGE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    :cond_5
    :goto_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_e

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v1, :cond_6

    goto :goto_1

    :cond_6
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "fieldlabel"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    if-nez v3, :cond_7

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    :cond_7
    const-string v3, "label"

    const-string v4, "locale"

    invoke-interface {p0, v2, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "value"

    invoke-interface {p0, v2, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    if-eqz v4, :cond_5

    if-eqz v5, :cond_5

    iget-object v6, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-nez v6, :cond_8

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iget-object v7, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    invoke-interface {v7, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_9
    const-string v4, "option"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->n:Ljava/util/List;

    if-nez v3, :cond_a

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->n:Ljava/util/List;

    :cond_a
    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->n:Ljava/util/List;

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->e(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_b
    const-string v4, "icon"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->o:Ljava/lang/String;

    if-nez v3, :cond_c

    const-string v3, "src"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->o:Ljava/lang/String;

    goto/16 :goto_1

    :cond_c
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "multiple <icon> tags not allowed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_1

    :cond_e
    return-object v0

    :cond_f
    const-string v0, "undefined"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    return-object v2

    :cond_10
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unrecognized parameter type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static c(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "parameter"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;

    invoke-direct {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;)V

    const-string v3, "id"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->e:Ljava/lang/String;

    const-string v3, "default"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->b:Ljava/lang/String;

    const-string v3, "maxlen"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7fffffff

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->f:I

    const-string v3, "multiline"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->g:Z

    const-string v3, "private"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->h:Z

    const-string v3, "minvalue"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->i:I

    const-string v3, "maxvalue"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x64

    invoke-static {v3, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->j:I

    const-string v3, "step"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    invoke-static {v3, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->k:I

    const-string v3, "bounds"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->l:Landroid/graphics/RectF;

    const-string v3, "type"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "choice"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x3

    if-eqz v5, :cond_0

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->CHOICE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto/16 :goto_0

    :cond_0
    const-string v5, "point"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v3, "dimensions"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_1

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->XY:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto/16 :goto_0

    :cond_1
    if-ne v3, v6, :cond_2

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->XYZ:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto/16 :goto_0

    :cond_2
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unsupported number of parameter dimensions: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    const-string v5, "color"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v3, "alpha"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGBA:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_0

    :cond_4
    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGB:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_0

    :cond_5
    const-string v4, "range"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RANGE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_0

    :cond_6
    const-string v4, "rect"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RECT:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_0

    :cond_7
    const-string v4, "text"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->TEXT:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    goto :goto_0

    :cond_8
    const-string v4, "switch"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->SWITCH:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    const-string v3, "off"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->c:Ljava/lang/String;

    const-string v3, "on"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->d:Ljava/lang/String;

    goto :goto_0

    :cond_9
    const-string v4, "image"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->IMAGE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->a:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    :cond_a
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    if-eq v3, v6, :cond_13

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v1, :cond_b

    goto :goto_0

    :cond_b
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "string"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    if-nez v3, :cond_c

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    :cond_c
    const-string v3, "name"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "lang"

    invoke-interface {p0, v2, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->g(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v5

    if-eqz v3, :cond_a

    if-eqz v4, :cond_a

    if-eqz v5, :cond_a

    iget-object v7, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    if-nez v7, :cond_d

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iget-object v8, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->m:Ljava/util/Map;

    invoke-interface {v8, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    invoke-interface {v7, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_e
    const-string v4, "option"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->n:Ljava/util/List;

    if-nez v3, :cond_f

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->n:Ljava/util/List;

    :cond_f
    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->n:Ljava/util/List;

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->d(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_10
    const-string v4, "icon"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->o:Ljava/lang/String;

    if-nez v3, :cond_11

    const-string v3, "src"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$a;->o:Ljava/lang/String;

    goto/16 :goto_0

    :cond_11
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "multiple <icon> tags not allowed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    :cond_13
    return-object v0

    :cond_14
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unrecognized parameter type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static d(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "option"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;

    invoke-direct {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;)V

    const-string v3, "value"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->c:Ljava/lang/String;

    :cond_0
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_7

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "string"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v3, "name"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "lang"

    invoke-interface {p0, v2, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->g(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v5

    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    if-eqz v5, :cond_0

    iget-object v6, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    if-nez v6, :cond_2

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    :cond_2
    iget-object v6, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-nez v6, :cond_3

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iget-object v7, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    invoke-interface {v7, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    const-string v4, "icon"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->b:Ljava/lang/String;

    if-nez v3, :cond_5

    const-string v3, "src"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->b:Ljava/lang/String;

    goto :goto_0

    :cond_5
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "multiple <icon> tags not allowed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    :cond_7
    return-object v0
.end method

.method private static e(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "option"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;

    invoke-direct {v0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/i$1;)V

    const-string v3, "value"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->c:Ljava/lang/String;

    const-string v3, "icon"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->b:Ljava/lang/String;

    const-string v3, "label"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    iget-object v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    const-string v5, "label"

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    const-string v5, "label"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    const-string v5, ""

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_5

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "fieldlabel"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    if-nez v3, :cond_2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    :cond_2
    const-string v3, "label"

    const-string v4, "locale"

    invoke-interface {p0, v2, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "value"

    invoke-interface {p0, v2, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    if-eqz v4, :cond_0

    if-eqz v5, :cond_0

    iget-object v6, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-nez v6, :cond_3

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iget-object v7, v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/i$b;->a:Ljava/util/Map;

    invoke-interface {v7, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->f(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_5
    return-object v0
.end method

.method private static f(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :pswitch_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static g(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-nez v1, :cond_0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :pswitch_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :pswitch_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object v1

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
