.class final Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;
.super Lcom/google/gson_nex/TypeAdapter;
.source "TypeAdapterRuntimeTypeWrapper.java"


# annotations
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
.field private final context:Lcom/google/gson_nex/Gson;

.field private final delegate:Lcom/google/gson_nex/TypeAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/gson_nex/TypeAdapter<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final type:Ljava/lang/reflect/Type;


# direct methods
.method constructor <init>(Lcom/google/gson_nex/Gson;Lcom/google/gson_nex/TypeAdapter;Ljava/lang/reflect/Type;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson_nex/Gson;",
            "Lcom/google/gson_nex/TypeAdapter<",
            "TT;>;",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/gson_nex/TypeAdapter;-><init>()V

    iput-object p1, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->context:Lcom/google/gson_nex/Gson;

    iput-object p2, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->delegate:Lcom/google/gson_nex/TypeAdapter;

    iput-object p3, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->type:Ljava/lang/reflect/Type;

    return-void
.end method

.method private getRuntimeTypeIfMoreSpecific(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/reflect/Type;
    .locals 1

    if-eqz p2, :cond_1

    const-class v0, Ljava/lang/Object;

    if-eq p1, v0, :cond_0

    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    :cond_1
    return-object p1
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

    iget-object v0, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->delegate:Lcom/google/gson_nex/TypeAdapter;

    invoke-virtual {v0, p1}, Lcom/google/gson_nex/TypeAdapter;->read(Lcom/google/gson_nex/stream/JsonReader;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 3
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

    iget-object v0, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->delegate:Lcom/google/gson_nex/TypeAdapter;

    iget-object v1, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->type:Ljava/lang/reflect/Type;

    invoke-direct {p0, v1, p2}, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->getRuntimeTypeIfMoreSpecific(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/reflect/Type;

    move-result-object v1

    iget-object v2, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->type:Ljava/lang/reflect/Type;

    if-eq v1, v2, :cond_1

    iget-object v0, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->context:Lcom/google/gson_nex/Gson;

    invoke-static {v1}, Lcom/google/gson_nex/reflect/TypeToken;->get(Ljava/lang/reflect/Type;)Lcom/google/gson_nex/reflect/TypeToken;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/gson_nex/Gson;->getAdapter(Lcom/google/gson_nex/reflect/TypeToken;)Lcom/google/gson_nex/TypeAdapter;

    move-result-object v0

    instance-of v1, v0, Lcom/google/gson_nex/internal/bind/ReflectiveTypeAdapterFactory$Adapter;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->delegate:Lcom/google/gson_nex/TypeAdapter;

    instance-of v1, v1, Lcom/google/gson_nex/internal/bind/ReflectiveTypeAdapterFactory$Adapter;

    if-nez v1, :cond_1

    iget-object v0, p0, Lcom/google/gson_nex/internal/bind/TypeAdapterRuntimeTypeWrapper;->delegate:Lcom/google/gson_nex/TypeAdapter;

    :cond_1
    :goto_0
    invoke-virtual {v0, p1, p2}, Lcom/google/gson_nex/TypeAdapter;->write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Object;)V

    return-void
.end method
