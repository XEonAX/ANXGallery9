.class public Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;
.super Ljava/lang/Object;
.source "LookUpTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

.field private b:I

.field private c:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;


# direct methods
.method public constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;ILcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->b:I

    iput-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->c:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    return-void
.end method


# virtual methods
.method public a()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->b:I

    return v0
.end method

.method public b()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->c:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    return-object v0
.end method
