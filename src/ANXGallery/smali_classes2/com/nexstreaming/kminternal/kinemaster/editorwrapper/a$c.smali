.class public Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
.super Ljava/lang/Object;
.source "KMIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
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
.field protected final a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

.field protected final b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d<",
            "TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;

    return-void
.end method


# virtual methods
.method public a(F)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;->time:F

    return-object p0
.end method

.method public a(FF)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF)",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;->x:F

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput p2, p1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;->y:F

    return-object p0
.end method

.method public a()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$d;

    return-object v0
.end method

.method public b(F)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;->angle:F

    return-object p0
.end method

.method public c(F)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;->alpha:F

    return-object p0
.end method

.method public d(F)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/a$c;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;

    iput p1, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$KeyFrame;->scale:F

    return-object p0
.end method
