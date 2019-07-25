.class public Lcom/xiaomi/slim/PacketParser;
.super Ljava/lang/Object;
.source "PacketParser.java"


# instance fields
.field private mParser:Lorg/xmlpull/v1/XmlPullParser;


# direct methods
.method constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    iget-object v0, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method parse([BLcom/xiaomi/smack/Connection;)Lcom/xiaomi/smack/packet/Packet;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result p1

    iget-object v0, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    if-ne p1, v1, :cond_6

    const-string p1, "message"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {p1}, Lcom/xiaomi/smack/util/PacketParserUtils;->parseMessage(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/smack/packet/Packet;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "iq"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {p1, p2}, Lcom/xiaomi/smack/util/PacketParserUtils;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;Lcom/xiaomi/smack/Connection;)Lcom/xiaomi/smack/packet/IQ;

    move-result-object p1

    return-object p1

    :cond_1
    const-string p1, "presence"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {p1}, Lcom/xiaomi/smack/util/PacketParserUtils;->parsePresence(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/smack/packet/Presence;

    move-result-object p1

    return-object p1

    :cond_2
    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "stream"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "error"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "warning"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "multi-login"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "bind"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    new-instance p1, Lcom/xiaomi/smack/XMPPException;

    iget-object p2, p0, Lcom/xiaomi/slim/PacketParser;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-static {p2}, Lcom/xiaomi/smack/util/PacketParserUtils;->parseStreamError(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/smack/packet/StreamError;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/xiaomi/smack/XMPPException;-><init>(Lcom/xiaomi/smack/packet/StreamError;)V

    throw p1

    :cond_6
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method
