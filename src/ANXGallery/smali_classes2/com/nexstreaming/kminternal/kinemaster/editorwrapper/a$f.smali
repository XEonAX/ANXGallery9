.class public Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
.super Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;
.source "KMIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d<",
        "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    new-instance p2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    invoke-direct {p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;-><init>()V

    iput-object p2, p1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    return-void
.end method


# virtual methods
.method public bridge synthetic a()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
    .locals 1

    invoke-super {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;->a()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;

    move-result-object v0

    return-object v0
.end method

.method public a(F)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->textSize:F

    return-object p0
.end method

.method public b()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;

    return-object v0
.end method

.method public d(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput-object p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->text:Ljava/lang/String;

    return-object p0
.end method

.method public e(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->textColor:I

    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput-object p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->fontId:Ljava/lang/String;

    return-object p0
.end method

.method public f(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->shadowColor:I

    return-object p0
.end method

.method public g(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->glowColor:I

    return-object p0
.end method

.method public h(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->textLayerAttributes:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$TextLayerAttributes;->outlineColor:I

    return-object p0
.end method
