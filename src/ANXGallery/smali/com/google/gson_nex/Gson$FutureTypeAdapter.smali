.class Lcom/google/gson_nex/Gson$FutureTypeAdapter;
.super Lcom/google/gson_nex/TypeAdapter;
.source "Gson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson_nex/Gson;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FutureTypeAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/gson_nex/TypeAdapter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private delegate:Lcom/google/gson_nex/TypeAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/gson_nex/TypeAdapter<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/gson_nex/TypeAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Lcom/google/gson_nex/stream/JsonReader;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson_nex/stream/JsonReader;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson_nex/Gson$FutureTypeAdapter;->delegate:Lcom/google/gson_nex/TypeAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/gson_nex/Gson$FutureTypeAdapter;->delegate:Lcom/google/gson_nex/TypeAdapter;

    invoke-virtual {v0, p1}, Lcom/google/gson_nex/TypeAdapter;->read(Lcom/google/gson_nex/stream/JsonReader;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public setDelegate(Lcom/google/gson_nex/TypeAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson_nex/TypeAdapter<",
            "TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson_nex/Gson$FutureTypeAdapter;->delegate:Lcom/google/gson_nex/TypeAdapter;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/google/gson_nex/Gson$FutureTypeAdapter;->delegate:Lcom/google/gson_nex/TypeAdapter;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method

.method public write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson_nex/stream/JsonWriter;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson_nex/Gson$FutureTypeAdapter;->delegate:Lcom/google/gson_nex/TypeAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/gson_nex/Gson$FutureTypeAdapter;->delegate:Lcom/google/gson_nex/TypeAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/google/gson_nex/TypeAdapter;->write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Object;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method
