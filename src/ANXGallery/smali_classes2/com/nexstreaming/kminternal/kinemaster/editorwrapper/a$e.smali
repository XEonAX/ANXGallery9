.class public Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;
.super Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;
.source "KMIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h<",
        "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    return-void
.end method


# virtual methods
.method public a(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;
    .locals 4

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    const-wide v2, 0x1000000000L

    or-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "@solid:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x8

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".jpg"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->path:Ljava/lang/String;

    return-object p0
.end method

.method public a()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;

    return-object v0
.end method
