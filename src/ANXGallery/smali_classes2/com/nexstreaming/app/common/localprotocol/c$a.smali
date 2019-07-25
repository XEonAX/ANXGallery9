.class public Lcom/nexstreaming/app/common/localprotocol/c$a;
.super Lcom/nexstreaming/app/common/localprotocol/c$b;
.source "nexProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/app/common/localprotocol/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:[B


# direct methods
.method constructor <init>(Lcom/nexstreaming/app/common/localprotocol/c$b;)V
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/app/common/localprotocol/c$b;-><init>()V

    iget-boolean v0, p1, Lcom/nexstreaming/app/common/localprotocol/c$b;->b:Z

    iput-boolean v0, p0, Lcom/nexstreaming/app/common/localprotocol/c$a;->b:Z

    iget-boolean v0, p1, Lcom/nexstreaming/app/common/localprotocol/c$b;->c:Z

    iput-boolean v0, p0, Lcom/nexstreaming/app/common/localprotocol/c$a;->c:Z

    iget v0, p1, Lcom/nexstreaming/app/common/localprotocol/c$b;->d:I

    iput v0, p0, Lcom/nexstreaming/app/common/localprotocol/c$a;->d:I

    iget v0, p1, Lcom/nexstreaming/app/common/localprotocol/c$b;->e:I

    iput v0, p0, Lcom/nexstreaming/app/common/localprotocol/c$a;->e:I

    iget v0, p1, Lcom/nexstreaming/app/common/localprotocol/c$b;->f:I

    iput v0, p0, Lcom/nexstreaming/app/common/localprotocol/c$a;->f:I

    iget p1, p1, Lcom/nexstreaming/app/common/localprotocol/c$b;->g:I

    iput p1, p0, Lcom/nexstreaming/app/common/localprotocol/c$a;->g:I

    return-void
.end method
