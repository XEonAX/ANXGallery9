.class public Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;
.super Ljava/lang/Object;
.source "OverlaySpec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;,
        Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;,
        Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;
    }
.end annotation


# instance fields
.field public duration:I

.field public fps:I

.field public height:I

.field public layers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;",
            ">;"
        }
    .end annotation
.end field

.field public minFps:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fromInputStream(Ljava/io/InputStream;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;
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

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseSpec(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p0}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {p0}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw v0
.end method

.method private static parseBoolean(Ljava/lang/String;Z)Z
    .locals 1

    if-nez p0, :cond_0

    return p1

    :cond_0
    const-string v0, "true"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string v0, "false"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x0

    return p0

    :cond_2
    return p1
.end method

.method private static parseFrame(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "frame"

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-interface {p0, v2, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;-><init>()V

    const-string v2, "src"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;->src:Ljava/lang/String;

    const-string v2, "blank"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;->blank:Z

    const-string v2, "hold"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;->hold:I

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->skip(Lorg/xmlpull/v1/XmlPullParser;)V

    return-object v0
.end method

.method private static parseInt(Ljava/lang/String;I)I
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

.method private static parseLayer(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "layer"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;-><init>()V

    const-string v3, "iteration-count"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->iterationCount:I

    const-string v3, "direction"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    const-string v4, "normal"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;->NORMAL:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->direction:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    goto :goto_0

    :cond_1
    const-string v4, "reverse"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;->REVERSE:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->direction:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    goto :goto_0

    :cond_2
    const-string v4, "alternate"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;->ALTERNATE:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->direction:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    goto :goto_0

    :cond_3
    const-string v4, "alternate-reverse"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;->ALTERNATE_REVERSE:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->direction:Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$AnimDirection;

    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->frames:Ljava/util/List;

    :cond_4
    :goto_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_7

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    if-eq v2, v1, :cond_5

    goto :goto_1

    :cond_5
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "frame"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseFrame(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->frames:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->duration:I

    iget v2, v2, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Frame;->hold:I

    add-int/2addr v3, v2

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;->duration:I

    goto :goto_1

    :cond_6
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->skip(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    :cond_7
    return-object v0

    :cond_8
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognized direction: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static parseSpec(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "overlay"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;-><init>()V

    const-string v3, "width"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->width:I

    const-string v3, "height"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v4}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->height:I

    const-string v3, "fps"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0xf

    invoke-static {v3, v5}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->fps:I

    const-string v3, "min-fps"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget v5, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->fps:I

    invoke-static {v3, v5}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->minFps:I

    const-string v3, "duration"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->duration:I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->layers:Ljava/util/List;

    :cond_0
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    if-eq v2, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "layer"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->parseLayer(Lorg/xmlpull/v1/XmlPullParser;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec$Layer;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->layers:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-static {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlaySpec;->skip(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private static skip(Lorg/xmlpull/v1/XmlPullParser;)V
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
