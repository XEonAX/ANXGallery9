.class Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;
.super Ljava/lang/Object;
.source "KMIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

.field protected final b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;

.field protected final c:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;

    return-void
.end method


# virtual methods
.method public a(Z)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput-boolean p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->mute:Z

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public b(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput-object p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->clipEffectId:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public b(Z)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput-boolean p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->vignette:Z

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public c(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput-object p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->transitionEffectId:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public d(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->rotation:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public d(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput-object p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->colorFilterId:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public e(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->duration:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public f(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->transitionDuration:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public g(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->volume:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public h(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->brightness:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public i(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->contrast:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method

.method public j(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$VisualClip;->saturation:I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$h;->c:Ljava/lang/Object;

    return-object p1
.end method
