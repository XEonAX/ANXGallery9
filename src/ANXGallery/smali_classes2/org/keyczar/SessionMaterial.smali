.class public Lorg/keyczar/SessionMaterial;
.super Ljava/lang/Object;
.source "SessionMaterial.java"


# annotations
.annotation build Lorg/keyczar/annotations/Experimental;
.end annotation


# instance fields
.field private key:Lorg/keyczar/AesKey;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field private nonce:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/keyczar/SessionMaterial;->key:Lorg/keyczar/AesKey;

    const-string v0, ""

    iput-object v0, p0, Lorg/keyczar/SessionMaterial;->nonce:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/keyczar/AesKey;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/keyczar/SessionMaterial;->key:Lorg/keyczar/AesKey;

    const-string v0, ""

    iput-object v0, p0, Lorg/keyczar/SessionMaterial;->nonce:Ljava/lang/String;

    iput-object p1, p0, Lorg/keyczar/SessionMaterial;->key:Lorg/keyczar/AesKey;

    iput-object p2, p0, Lorg/keyczar/SessionMaterial;->nonce:Ljava/lang/String;

    return-void
.end method

.method public static read(Ljava/lang/String;)Lorg/keyczar/SessionMaterial;
    .locals 2

    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    const-class v1, Lorg/keyczar/SessionMaterial;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/keyczar/SessionMaterial;

    return-object p0
.end method


# virtual methods
.method public getKey()Lorg/keyczar/AesKey;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/SessionMaterial;->key:Lorg/keyczar/AesKey;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/keyczar/SessionMaterial;->key:Lorg/keyczar/AesKey;

    return-object v0

    :cond_0
    new-instance v0, Lorg/keyczar/exceptions/KeyczarException;

    const-string v1, "Key has not been initialized"

    invoke-direct {v0, v1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNonce()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/SessionMaterial;->nonce:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/gson_nex/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
