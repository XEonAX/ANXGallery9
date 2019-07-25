.class public final Lorg/apache/thrift/protocol/TMap;
.super Ljava/lang/Object;
.source "TMap.java"


# instance fields
.field public final keyType:B

.field public final size:I

.field public final valueType:B


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v0}, Lorg/apache/thrift/protocol/TMap;-><init>(BBI)V

    return-void
.end method

.method public constructor <init>(BBI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lorg/apache/thrift/protocol/TMap;->keyType:B

    iput-byte p2, p0, Lorg/apache/thrift/protocol/TMap;->valueType:B

    iput p3, p0, Lorg/apache/thrift/protocol/TMap;->size:I

    return-void
.end method
