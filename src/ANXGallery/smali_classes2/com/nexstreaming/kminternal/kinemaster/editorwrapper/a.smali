.class public Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
.super Ljava/lang/Object;
.source "KMIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$b;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$g;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$a;
    }
.end annotation


# instance fields
.field private a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    return-void
.end method


# virtual methods
.method public a()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$g;
    .locals 2

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;->project:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;->visualClips:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$g;

    invoke-direct {v1, v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$g;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    return-object v1
.end method

.method public b()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$b;
    .locals 2

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;->project:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;->visualClips:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$b;

    invoke-direct {v1, v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$b;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    return-object v1
.end method

.method public c()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;
    .locals 2

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;->project:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;->visualClips:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;

    invoke-direct {v1, v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$e;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    return-object v1
.end method

.method public d()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$a;
    .locals 2

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$AudioClip;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$AudioClip;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;->project:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;->audioClips:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$a;

    invoke-direct {v1, v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$a;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$AudioClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    return-object v1
.end method

.method public e()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;
    .locals 2

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;-><init>()V

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Text:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    iput-object v1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;->layerType:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;->project:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Project;->layers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;

    invoke-direct {v1, v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$f;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$Layer;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V

    return-object v1
.end method

.method public f()Landroid/content/Intent;
    .locals 4

    new-instance v0, Lcom/google/gson_nex/Gson;

    invoke-direct {v0}, Lcom/google/gson_nex/Gson;-><init>()V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.kinemaster.intent.NEW_PROJECT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.nexstreaming.app.kinemasterfree"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.kinemaster.intent.projectData"

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;

    invoke-virtual {v0, v3}, Lcom/google/gson_nex/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const v0, 0x10008000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object v1
.end method
