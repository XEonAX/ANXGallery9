.class final Lcom/nexstreaming/nexeditorsdk/c;
.super Ljava/lang/Object;
.source "nexTemplate.java"


# static fields
.field private static w:Ljava/lang/String; = "nexTemplate"


# instance fields
.field private A:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/e;",
            ">;"
        }
    .end annotation
.end field

.field private B:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/e;",
            ">;"
        }
    .end annotation
.end field

.field private C:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/e;",
            ">;>;"
        }
    .end annotation
.end field

.field private D:Z

.field private E:I

.field private F:Z

.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;

.field f:Ljava/lang/String;

.field g:F

.field h:I

.field i:I

.field j:I

.field k:I

.field l:I

.field m:I

.field n:I

.field o:Ljava/lang/String;

.field p:Z

.field q:F

.field r:Z

.field s:Ljava/lang/String;

.field t:Z

.field u:Lcom/nexstreaming/nexeditorsdk/g;

.field v:Z

.field private x:I

.field private y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/e;",
            ">;"
        }
    .end annotation
.end field

.field private z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/e;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->g:F

    const/16 v1, 0x9c4

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->h:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->i:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->j:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->k:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->l:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->m:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->p:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    const-string v2, ""

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->D:Z

    const v0, 0x9e3400

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->E:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->u:Lcom/nexstreaming/nexeditorsdk/g;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->v:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/nexeditorsdk/nexProject;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;)I"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTopDrawInfo()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getIsTransition()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartTime()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result v0

    goto :goto_0

    :cond_1
    return v0
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->e:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBackgroundMusicPath(Ljava/lang/String;)Z

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->g:F

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBGMMasterVolumeScale(F)V

    const/4 p1, 0x0

    return-object p1
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;ZZ)Ljava/lang/String;
    .locals 5

    iput-boolean p4, p0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    iput-boolean p5, p0, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "updateProjectWithTemplate(%b %b)"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    const/4 v4, 0x0

    aput-object p4, v3, v4

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    const/4 p5, 0x1

    aput-object p4, v3, p5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-static {v0, p4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/c;->b:Ljava/lang/String;

    const-string p5, "2.0"

    invoke-virtual {p4, p5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_0

    invoke-virtual {p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setTemplateApplyMode(I)V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clearDrawInfo()V

    invoke-virtual {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/c;->c(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/c;->b:Ljava/lang/String;

    const-string p5, "3.0"

    invoke-virtual {p4, p5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_3

    const/4 p4, 0x3

    invoke-virtual {p1, p4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setTemplateApplyMode(I)V

    invoke-virtual {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/c;->d(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p4

    iget p5, p0, Lcom/nexstreaming/nexeditorsdk/c;->i:I

    if-ltz p5, :cond_1

    iget p5, p0, Lcom/nexstreaming/nexeditorsdk/c;->i:I

    invoke-virtual {p1, p5}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeInTime(I)V

    :cond_1
    iget p5, p0, Lcom/nexstreaming/nexeditorsdk/c;->j:I

    if-ltz p5, :cond_2

    iget p5, p0, Lcom/nexstreaming/nexeditorsdk/c;->j:I

    invoke-virtual {p1, p5}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeOutTime(I)V

    :cond_2
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-virtual {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    return-object p4

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Unsupported Template version : "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;
    .locals 39

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v3, "Template imageProject Apply Start(%d %d)"

    const/4 v11, 0x2

    new-array v4, v11, [Ljava/lang/Object;

    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v13, 0x0

    aput-object v5, v4, v13

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v12

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/high16 v14, -0x80000000

    const v15, 0x7fffffff

    const/4 v7, 0x0

    if-nez v2, :cond_4

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v6, v12}, Lcom/nexstreaming/nexeditorsdk/e;->a(Z)I

    move-result v4

    if-lt v4, v2, :cond_0

    invoke-virtual {v6, v13, v13, v7}, Lcom/nexstreaming/nexeditorsdk/e;->a(IILjava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/e;->j()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    move-object/from16 v17, v7

    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/d;

    const/16 v18, 0x0

    iget v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    move-object v2, v4

    move/from16 v19, v3

    move-object/from16 v3, p2

    move-object/from16 v26, v4

    move-object/from16 v4, p3

    move-object v11, v5

    move-object v5, v6

    move-object/from16 v27, v6

    move/from16 v6, v18

    move/from16 v7, v19

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/e;IF)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v5, v11

    move-object/from16 v6, v27

    :goto_1
    const/4 v7, 0x0

    const/4 v11, 0x2

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-lez v2, :cond_2

    invoke-virtual {v1, v13, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v8, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    iput v15, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v14, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    move-object/from16 v17, v2

    :cond_2
    move-object/from16 v4, v27

    iget v2, v4, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v21

    const/16 v22, 0x0

    iget v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v18, v26

    move-object/from16 v19, v17

    move/from16 v20, v2

    move/from16 v23, v3

    invoke-virtual/range {v18 .. v25}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;IIIFLjava/lang/String;Z)V

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v2

    move-object/from16 v3, v26

    invoke-virtual {v3, v8, v13, v2}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;II)Ljava/lang/String;

    move-object v6, v4

    move-object v5, v11

    goto :goto_1

    :cond_3
    move-object v11, v5

    invoke-virtual {v0, v8, v11}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)I

    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-virtual {v0, v8, v9, v10}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v3, "Template imageProject Apply single effect(%d %d)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v8, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v13

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v12

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v11, 0x0

    return-object v11

    :cond_4
    move-object v11, v7

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/c;->f()I

    move-result v7

    const-string v2, ""

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    move-object v3, v11

    const/4 v2, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x1

    :goto_2
    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v4

    if-lez v4, :cond_17

    iget-boolean v4, v0, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    if-nez v4, :cond_17

    if-eqz v16, :cond_a

    move v4, v2

    const/4 v5, 0x0

    :goto_3
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v5, v2, :cond_8

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v2, v4, v13, v11}, Lcom/nexstreaming/nexeditorsdk/e;->a(IILjava/lang/String;)Ljava/util/List;

    move-result-object v14

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->j()Ljava/util/List;

    move-result-object v16

    iget-object v6, v2, Lcom/nexstreaming/nexeditorsdk/e;->c:Ljava/lang/String;

    iput-object v6, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    move-object/from16 v18, v3

    :goto_4
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/nexstreaming/nexeditorsdk/d;

    iget v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    move-object/from16 v28, v2

    move-object v2, v6

    move/from16 v19, v3

    move-object/from16 v3, p2

    move/from16 v29, v4

    move-object/from16 v4, p3

    move/from16 v26, v5

    move-object/from16 v5, v28

    move-object/from16 v30, v6

    const/4 v11, 0x3

    move/from16 v6, v29

    move v11, v7

    move/from16 v7, v19

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/e;IF)Z

    move-result v2

    if-eqz v2, :cond_5

    move v7, v11

    move/from16 v5, v26

    move-object/from16 v2, v28

    move/from16 v4, v29

    :goto_5
    const/4 v11, 0x0

    goto :goto_4

    :cond_5
    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-le v2, v11, :cond_6

    invoke-virtual {v1, v13, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v8, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    iput v15, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    const/high16 v3, -0x80000000

    iput v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    move-object v3, v2

    goto :goto_6

    :cond_6
    move-object/from16 v3, v18

    :goto_6
    move-object/from16 v2, v28

    iget v4, v2, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v21

    iget v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v18, v30

    move-object/from16 v19, v3

    move/from16 v20, v4

    move/from16 v22, v29

    move/from16 v23, v5

    invoke-virtual/range {v18 .. v25}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;IIIFLjava/lang/String;Z)V

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v4

    move/from16 v5, v29

    move-object/from16 v6, v30

    invoke-virtual {v6, v8, v5, v4}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;II)Ljava/lang/String;

    move-object/from16 v18, v3

    move v4, v5

    move v7, v11

    move/from16 v5, v26

    goto :goto_5

    :cond_7
    move/from16 v26, v5

    move v11, v7

    invoke-virtual {v0, v8, v14}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)I

    move-result v4

    add-int/lit8 v5, v26, 0x1

    move-object/from16 v3, v18

    const/4 v11, 0x0

    const/high16 v14, -0x80000000

    goto/16 :goto_3

    :cond_8
    move v5, v4

    move v11, v7

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-gt v2, v11, :cond_9

    const/16 v17, 0x0

    :cond_9
    sget-object v2, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v4, "Template imageProject Apply Intro End(%d %d) (%d)"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v8, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v13

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v14, 0x2

    aput-object v7, v6, v14

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v5

    move v7, v11

    const/4 v11, 0x0

    const/high16 v14, -0x80000000

    const/16 v16, 0x0

    goto/16 :goto_2

    :cond_a
    move v11, v7

    if-eqz v17, :cond_10

    move v7, v2

    const/4 v14, 0x0

    :goto_7
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v14, v2, :cond_f

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/nexstreaming/nexeditorsdk/e;

    const/4 v2, 0x0

    invoke-virtual {v6, v7, v13, v2}, Lcom/nexstreaming/nexeditorsdk/e;->a(IILjava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/e;->j()Ljava/util/List;

    move-result-object v2

    iget-object v4, v6, Lcom/nexstreaming/nexeditorsdk/e;->c:Ljava/lang/String;

    iput-object v4, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v26

    move-object/from16 v18, v3

    :goto_8
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/d;

    iget v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    move-object v2, v4

    move/from16 v19, v3

    move-object/from16 v3, p2

    move-object/from16 v31, v4

    move-object/from16 v4, p3

    move-object/from16 v32, v5

    move-object v5, v6

    move-object/from16 v33, v6

    move v6, v7

    move/from16 v34, v7

    move/from16 v7, v19

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/e;IF)Z

    move-result v2

    if-eqz v2, :cond_b

    move-object/from16 v5, v32

    move-object/from16 v6, v33

    move/from16 v7, v34

    goto :goto_8

    :cond_b
    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-le v2, v11, :cond_c

    invoke-virtual {v1, v13, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v8, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    iput v15, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    const/high16 v3, -0x80000000

    iput v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    move-object v3, v2

    goto :goto_9

    :cond_c
    move-object/from16 v3, v18

    :goto_9
    move-object/from16 v2, v33

    iget v4, v2, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v21

    iget v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v18, v31

    move-object/from16 v19, v3

    move/from16 v20, v4

    move/from16 v22, v34

    move/from16 v23, v5

    invoke-virtual/range {v18 .. v25}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;IIIFLjava/lang/String;Z)V

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v4

    move-object/from16 v6, v31

    move/from16 v5, v34

    invoke-virtual {v6, v8, v5, v4}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;II)Ljava/lang/String;

    move-object v6, v2

    move-object/from16 v18, v3

    move v7, v5

    move-object/from16 v5, v32

    goto :goto_8

    :cond_d
    move-object v3, v5

    invoke-virtual {v0, v8, v3}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)I

    move-result v7

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-gt v2, v11, :cond_e

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v3, "Template imageProject Apply Loop End(%d %d) (%d)"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v8, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v13

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v7

    move-object/from16 v3, v18

    const/16 v17, 0x0

    goto :goto_a

    :cond_e
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v3, v18

    goto/16 :goto_7

    :cond_f
    move v5, v7

    move v2, v5

    :goto_a
    move v7, v11

    const/4 v11, 0x0

    const/high16 v14, -0x80000000

    goto/16 :goto_2

    :cond_10
    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    if-eqz v4, :cond_12

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-lez v4, :cond_12

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v5, "Template imageProject select Outro(%s)"

    new-array v6, v12, [Ljava/lang/Object;

    iget-object v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    aput-object v7, v6, v13

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    :cond_11
    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    :cond_12
    :goto_b
    move-object v14, v3

    move v6, v2

    const/4 v7, 0x0

    :goto_c
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v7, v2, :cond_16

    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/nexstreaming/nexeditorsdk/e;

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v5, v6, v13, v2}, Lcom/nexstreaming/nexeditorsdk/e;->a(IILjava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/e;->j()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    const/16 v16, 0x0

    :goto_d
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/d;

    iget v2, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    move/from16 v17, v2

    move-object v2, v3

    move-object/from16 v35, v3

    move-object/from16 v3, p2

    move-object/from16 v36, v4

    move-object/from16 v4, p3

    move-object/from16 v37, v5

    move/from16 v38, v6

    move/from16 v25, v7

    move/from16 v7, v17

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/e;IF)Z

    move-result v2

    if-eqz v2, :cond_13

    move/from16 v7, v25

    move-object/from16 v4, v36

    move-object/from16 v5, v37

    move/from16 v6, v38

    goto :goto_d

    :cond_13
    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-lez v2, :cond_14

    invoke-virtual {v1, v13, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v8, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    iput v15, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    const/high16 v3, -0x80000000

    iput v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    move-object v4, v2

    goto :goto_e

    :cond_14
    const/high16 v3, -0x80000000

    move-object/from16 v4, v16

    :goto_e
    move-object/from16 v2, v37

    iget v5, v2, Lcom/nexstreaming/nexeditorsdk/e;->a:I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v19

    iget v6, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-object v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    const/16 v23, 0x0

    move-object/from16 v16, v35

    move-object/from16 v17, v4

    move/from16 v18, v5

    move/from16 v20, v38

    move/from16 v21, v6

    move-object/from16 v22, v7

    invoke-virtual/range {v16 .. v23}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexClip;IIIFLjava/lang/String;Z)V

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->i()I

    move-result v5

    move-object/from16 v7, v35

    move/from16 v6, v38

    invoke-virtual {v7, v8, v6, v5}, Lcom/nexstreaming/nexeditorsdk/d;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;II)Ljava/lang/String;

    move-object v5, v2

    move-object/from16 v16, v4

    move/from16 v7, v25

    move-object/from16 v4, v36

    goto :goto_d

    :cond_15
    move/from16 v25, v7

    const/high16 v3, -0x80000000

    invoke-virtual {v0, v8, v4}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)I

    move-result v6

    add-int/lit8 v7, v25, 0x1

    goto/16 :goto_c

    :cond_16
    sget-object v2, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v3, "Template imageProject Apply Outro End(%d %d) (%d)"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v8, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v13

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v12

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v5, 0x2

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_17
    iget-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    if-eqz v1, :cond_18

    const-string v1, "apply Template user canceled"

    return-object v1

    :cond_18
    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-virtual {v0, v8, v9, v10}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    const/4 v1, 0x0

    return-object v1
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Ljava/util/ArrayList;Z)Ljava/lang/String;
    .locals 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/nexeditorsdk/nexProject;",
            "Lcom/nexstreaming/nexeditorsdk/nexProject;",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/e;",
            ">;Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move/from16 v4, p5

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/c;->c()I

    move-result v5

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v6, :cond_1d

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->h()I

    move-result v10

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->c()I

    move-result v11

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->d()I

    move-result v12

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->e()I

    move-result v13

    add-int/2addr v11, v10

    add-int/2addr v12, v10

    add-int/2addr v10, v13

    if-gt v10, v11, :cond_0

    move v10, v11

    :cond_0
    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->f()Z

    move-result v16

    iget v15, v9, Lcom/nexstreaming/nexeditorsdk/e;->r:I

    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v13

    if-gtz v13, :cond_1

    if-nez v4, :cond_1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "setProjectWithEffects clip apply end"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    :cond_1
    iget v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    move-object/from16 v14, p3

    invoke-virtual {v9, v2, v14, v7}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;F)Z

    move-result v7

    if-eqz v7, :cond_4

    if-nez v4, :cond_3

    iget-object v7, v9, Lcom/nexstreaming/nexeditorsdk/e;->c:Ljava/lang/String;

    iput-object v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    :cond_2
    :goto_1
    move/from16 v24, v5

    move v5, v6

    move/from16 v28, v8

    goto/16 :goto_d

    :cond_3
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v10

    sub-int/2addr v10, v7

    invoke-virtual {v2, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    if-eqz v7, :cond_2

    iget-object v10, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v7, v10, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    goto :goto_1

    :cond_4
    if-gtz v13, :cond_5

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "setProjectWithEffects clip apply end"

    const/4 v7, 0x0

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    :cond_5
    const/4 v7, 0x0

    iget v13, v0, Lcom/nexstreaming/nexeditorsdk/c;->m:I

    const/4 v7, 0x1

    if-ne v13, v7, :cond_6

    if-nez v4, :cond_6

    const/4 v13, 0x0

    invoke-virtual {v1, v13, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v17

    sub-int v13, v17, v11

    if-ge v13, v5, :cond_6

    iput-boolean v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->v:Z

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "setProjectWithEffects clip apply end for outro on single video"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    :cond_6
    if-nez v4, :cond_7

    iget-object v7, v9, Lcom/nexstreaming/nexeditorsdk/e;->c:Ljava/lang/String;

    iput-object v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    :cond_7
    move v13, v11

    move v7, v12

    move v12, v10

    :goto_2
    const/4 v10, 0x1

    :goto_3
    invoke-virtual {v1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v17

    if-lez v17, :cond_2

    move/from16 v24, v5

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v5

    move/from16 v25, v12

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v12

    if-ne v12, v10, :cond_10

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v10

    invoke-virtual {v10, v15}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFaceDetectSpeed(I)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v10

    invoke-virtual {v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v10

    if-eqz v10, :cond_8

    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v14

    invoke-virtual {v14, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v14

    invoke-virtual {v14, v12}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v17

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v20

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v21

    move-object/from16 v18, v10

    move-object/from16 v19, v12

    move/from16 v22, v15

    move/from16 v23, v5

    invoke-virtual/range {v17 .. v23}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v14

    move/from16 v26, v15

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v15

    invoke-virtual {v14, v10, v15}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v14

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v15

    invoke-virtual {v14, v12, v15}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v14

    invoke-virtual {v14, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v10

    invoke-virtual {v10, v12}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_4

    :cond_8
    move/from16 v26, v15

    :goto_4
    if-gt v5, v13, :cond_e

    if-lt v5, v7, :cond_9

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    const-string v11, "0"

    const/4 v13, 0x1

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v15, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v3

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v5, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    :goto_5
    move v5, v6

    move/from16 v28, v8

    goto/16 :goto_a

    :cond_9
    const/16 v10, 0x1388

    if-le v13, v10, :cond_c

    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v10

    if-eq v10, v14, :cond_c

    if-nez v16, :cond_a

    goto :goto_6

    :cond_a
    sub-int v5, v11, v5

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    if-gtz v5, :cond_b

    const-string v11, "1"

    const/4 v13, 0x1

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v15, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v3

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v5, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    goto :goto_5

    :cond_b
    const-string v11, "1"

    const/4 v15, 0x0

    iget v12, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v10, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move/from16 v17, v10

    move-object v10, v9

    move/from16 v27, v6

    move/from16 v18, v12

    move/from16 v6, v25

    move-object v12, v3

    move/from16 v28, v8

    move v8, v13

    move v13, v15

    const/4 v15, 0x1

    move/from16 v14, v18

    move/from16 v29, v6

    move/from16 v22, v26

    const/4 v6, 0x1

    move/from16 v15, v17

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v10, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v10, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    move-object/from16 v14, p3

    move v11, v5

    goto/16 :goto_7

    :cond_c
    :goto_6
    move/from16 v27, v6

    move/from16 v28, v8

    move/from16 v22, v26

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v5

    if-eqz v5, :cond_d

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v17

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v20

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v21

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getImageClipDuration()I

    move-result v23

    move-object/from16 v18, v5

    move-object/from16 v19, v6

    invoke-virtual/range {v17 .. v23}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v8

    invoke-virtual {v7, v5, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v8

    invoke-virtual {v7, v6, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :cond_d
    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    const-string v11, "0"

    const/4 v13, 0x1

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v15, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v3

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v5, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    goto/16 :goto_9

    :cond_e
    move/from16 v27, v6

    move/from16 v28, v8

    move v8, v13

    move/from16 v22, v26

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v5

    if-eqz v5, :cond_f

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v17

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v20

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v21

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getImageClipDuration()I

    move-result v23

    move-object/from16 v18, v5

    move-object/from16 v19, v6

    invoke-virtual/range {v17 .. v23}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v8

    invoke-virtual {v7, v5, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v8

    invoke-virtual {v7, v6, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :cond_f
    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    const-string v11, "0"

    const/4 v13, 0x1

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v15, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v3

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v5, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    goto/16 :goto_9

    :cond_10
    move/from16 v27, v6

    move/from16 v28, v8

    move v8, v13

    move/from16 v22, v15

    move/from16 v29, v25

    const/4 v6, 0x1

    const/16 v15, 0x64

    if-ge v5, v7, :cond_14

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->g()Z

    move-result v10

    if-nez v10, :cond_11

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    move-object/from16 v14, p3

    :goto_7
    move v13, v8

    move/from16 v15, v22

    move/from16 v5, v24

    move/from16 v6, v27

    move/from16 v8, v28

    move/from16 v12, v29

    move-object/from16 v3, p4

    goto/16 :goto_2

    :cond_11
    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    const-string v12, "2"

    const/4 v13, 0x0

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v10, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move/from16 v17, v10

    move-object v10, v9

    move/from16 v18, v11

    move-object v11, v12

    move-object v12, v3

    const/16 v6, 0x64

    move/from16 v15, v17

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v10, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v10, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    iget-boolean v10, v0, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    if-nez v10, :cond_12

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v10

    invoke-virtual {v10, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v6

    if-gtz v6, :cond_13

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTemplateEffectID()I

    move-result v6

    const/high16 v11, 0x1000000

    and-int/2addr v6, v11

    invoke-virtual {v3, v6}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateEffectID(I)V

    goto :goto_8

    :cond_12
    const/4 v10, 0x1

    :cond_13
    :goto_8
    sub-int/2addr v7, v5

    sub-int v12, v29, v5

    sub-int v13, v8, v5

    move-object/from16 v14, p3

    move/from16 v11, v18

    move/from16 v15, v22

    move/from16 v5, v24

    move/from16 v6, v27

    move/from16 v8, v28

    move-object/from16 v3, p4

    goto/16 :goto_3

    :cond_14
    move/from16 v12, v29

    const/16 v6, 0x64

    if-gt v5, v12, :cond_16

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    const-string v11, "3"

    const/4 v13, 0x1

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v15, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v3

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v3, v5, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    iget-boolean v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    if-nez v5, :cond_15

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->c(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    :cond_15
    :goto_9
    move/from16 v5, v27

    :goto_a
    move-object/from16 v3, p4

    goto/16 :goto_d

    :cond_16
    add-int/lit8 v10, v28, 0x1

    move/from16 v15, v27

    if-lt v10, v15, :cond_17

    move-object v14, v3

    move-object/from16 v3, p4

    const/4 v10, 0x0

    goto :goto_b

    :cond_17
    move-object v14, v3

    move-object/from16 v3, p4

    :goto_b
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/nexstreaming/nexeditorsdk/e;

    sub-int v11, v5, v8

    sub-int/2addr v5, v7

    invoke-virtual {v10}, Lcom/nexstreaming/nexeditorsdk/e;->d()I

    move-result v12

    invoke-virtual {v10}, Lcom/nexstreaming/nexeditorsdk/e;->h()I

    move-result v13

    add-int/2addr v12, v13

    if-gt v11, v12, :cond_18

    invoke-virtual {v10}, Lcom/nexstreaming/nexeditorsdk/e;->a()Z

    move-result v10

    if-nez v10, :cond_18

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/e;->g()Z

    move-result v10

    if-eqz v10, :cond_18

    if-lt v5, v12, :cond_19

    move v8, v7

    :cond_18
    move-object v7, v14

    move v5, v15

    goto :goto_c

    :cond_19
    invoke-virtual {v1, v14}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v2, v14}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    const-string v11, "3"

    const/4 v13, 0x1

    iget v5, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v14

    move-object v8, v14

    move v14, v5

    move v5, v15

    move v15, v7

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v8}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v8, v7, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    iget-boolean v7, v0, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    if-nez v7, :cond_1c

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->c(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    goto/16 :goto_d

    :goto_c
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v10

    invoke-virtual {v10}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v10

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v15

    invoke-virtual {v2, v15}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v11

    invoke-virtual {v15, v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    invoke-virtual {v15}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    if-eq v10, v6, :cond_1a

    mul-int v8, v8, v10

    div-int/2addr v8, v6

    :cond_1a
    invoke-virtual {v15}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v10

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v11

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v11

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v12

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v12

    add-int/2addr v12, v8

    invoke-virtual {v10, v11, v12}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v10

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v11

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v11

    add-int/2addr v11, v8

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v8

    invoke-virtual {v10, v11, v8}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    const-string v11, "4"

    const/4 v13, 0x1

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-boolean v8, v0, Lcom/nexstreaming/nexeditorsdk/c;->r:Z

    move-object v10, v9

    move-object v12, v15

    move-object v6, v15

    move v15, v8

    invoke-virtual/range {v10 .. v15}, Lcom/nexstreaming/nexeditorsdk/e;->a(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip;ZFZ)Ljava/lang/String;

    invoke-virtual {v9, v2, v6}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;)Ljava/lang/String;

    iget-object v8, v0, Lcom/nexstreaming/nexeditorsdk/c;->s:Ljava/lang/String;

    invoke-virtual {v9, v2, v6, v8, v4}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;Z)V

    iget-boolean v8, v0, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    if-nez v8, :cond_1b

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v7

    const/16 v8, 0x64

    invoke-virtual {v7, v8}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->c(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    goto :goto_d

    :cond_1b
    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    :cond_1c
    :goto_d
    add-int/lit8 v8, v28, 0x1

    move v6, v5

    move/from16 v5, v24

    const/4 v7, 0x0

    goto/16 :goto_0

    :cond_1d
    :goto_e
    const/4 v1, 0x0

    return-object v1
.end method

.method a(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 9

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v3, "Template templateFile path(%s)"

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    const-string v2, "txt"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    :cond_0
    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Template header parse error : "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    :try_start_0
    const-string p1, "template_intro"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    invoke-static {v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/e;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const-string p1, "Template intro parse error"

    return-object p1

    :cond_3
    const-string p1, "template_loop"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_5

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    invoke-static {v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/e;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    const-string p1, "Template Loop parse error"

    return-object p1

    :cond_5
    const-string p1, "template_outro"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    :goto_2
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_b

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_6

    goto :goto_4

    :cond_6
    const-string v3, "alternative_id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    const-string v3, "alternative_outro"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    const-string v3, "alternative_id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "alternative_outro"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    :goto_3
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_8

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    iget v7, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    invoke-static {v6, v7}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/e;

    move-result-object v6

    if-nez v6, :cond_7

    const-string p1, "Template Outro parse error(alternative outro)"

    return-object p1

    :cond_7
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_8
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_9
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    invoke-static {v2, v3}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/e;

    move-result-object v2

    if-eqz v2, :cond_a

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_a
    const-string p1, "Template Outro parse error"

    return-object p1

    :cond_b
    const-string p1, "template_single"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_d

    const-string p1, "template_single"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    :goto_5
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-ge v0, p2, :cond_d

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p2

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/c;->x:I

    invoke-static {p2, v1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Lorg/json/JSONObject;I)Lcom/nexstreaming/nexeditorsdk/e;

    move-result-object p2

    if-eqz p2, :cond_c

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_c
    const-string p1, "Template Single parse error"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_d
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string p2, "parseTemplate end"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "parseTemplate failed : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "parseTemplate failed : "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method a(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    :try_start_0
    const-string v0, "template_name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->a:Ljava/lang/String;

    const-string v0, "template_version"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->b:Ljava/lang/String;

    const-string v0, "template_desc"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->c:Ljava/lang/String;

    const-string v0, "template_mode"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->d:Ljava/lang/String;

    const v0, 0x3fe38e39

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/c;->d:Ljava/lang/String;

    const-string v2, "16v9"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->d:Ljava/lang/String;

    const-string v1, "9v16"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 v0, 0x3f100000    # 0.5625f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->d:Ljava/lang/String;

    const-string v1, "1v1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->d:Ljava/lang/String;

    const-string v1, "2v1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->d:Ljava/lang/String;

    const-string v1, "1v2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->q:F

    :cond_4
    :goto_0
    const-string v0, "template_bgm"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->e:Ljava/lang/String;

    const-string v0, "template_single_bgm"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "template_single_bgm"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->f:Ljava/lang/String;

    :cond_5
    const-string v0, "template_bgm_volume"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "template_bgm_volume"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->g:F

    :cond_6
    const-string v0, "template_min_duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "template_min_duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->n:I

    :cond_7
    const-string v0, "template_default_effect"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "template_default_effect"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->o:Ljava/lang/String;

    :cond_8
    const-string v0, "template_default_effect_scale"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "template_default_effect_scale"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->p:Z

    :cond_9
    const-string v0, "template_default_image_duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "template_default_image_duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "template_default_image_duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->h:I

    :cond_a
    const-string v0, "template_project_vol_fade_in_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "template_project_vol_fade_in_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "template_project_vol_fade_in_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->i:I

    :cond_b
    const-string v0, "template_project_vol_fade_out_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "template_project_vol_fade_out_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "template_project_vol_fade_out_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->j:I

    :cond_c
    const-string v0, "template_single_project_vol_fade_in_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "template_single_project_vol_fade_in_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "template_single_project_vol_fade_in_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->k:I

    :cond_d
    const-string v0, "template_single_project_vol_fade_out_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "template_single_project_vol_fade_out_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "template_single_project_vol_fade_out_time"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->l:I

    :cond_e
    const-string v0, "template_single_video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "template_single_video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/c;->m:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_f
    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parse Template failed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "case1 1"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_3
    return-void
.end method

.method a(Lcom/nexstreaming/nexeditorsdk/nexProject;)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    if-ge v1, v3, :cond_1

    invoke-virtual {p1, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    if-ne v3, v2, :cond_0

    return v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method b()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->n:I

    return v0
.end method

.method b(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->f:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBackgroundMusicPath(Ljava/lang/String;)Z

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/c;->g:F

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBGMMasterVolumeScale(F)V

    const/4 p1, 0x0

    return-object p1
.end method

.method b(Lcom/nexstreaming/nexeditorsdk/nexProject;)V
    .locals 8

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v1

    if-gt v1, v0, :cond_0

    return-void

    :cond_0
    add-int/lit8 v2, v1, -0x2

    invoke-virtual {p1, v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTemplateEffectID()I

    move-result v3

    const v4, -0xf000001

    and-int/2addr v3, v4

    sub-int/2addr v1, v0

    invoke-virtual {p1, v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTemplateEffectID()I

    move-result v1

    and-int/2addr v1, v4

    const/4 v4, 0x0

    if-eq v3, v1, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getDuration()I

    move-result v5

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v6

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v7

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getDuration()I

    move-result v7

    sub-int/2addr v6, v7

    if-lt v5, v6, :cond_1

    invoke-virtual {v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setEffectNone()V

    invoke-virtual {v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V

    :cond_1
    if-eq v3, v1, :cond_2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getDuration()I

    move-result v2

    if-gt v1, v2, :cond_2

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setEffectNone()V

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V

    :cond_2
    return-void
.end method

.method c()I
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_video"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_image"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_solid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->c()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_video"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_image"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_solid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_1

    :cond_6
    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->c()I

    move-result v3

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->h()I

    move-result v2

    add-int/2addr v3, v2

    add-int/2addr v1, v3

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v1
.end method

.method c(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;
    .locals 14

    move-object v6, p0

    move-object v7, p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "applyTemplate20_Project ( ProjectTime:%d TemplateMinDur:%d)"

    const/4 v8, 0x2

    new-array v3, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v9, 0x0

    aput-object v4, v3, v9

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/c;->b()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v10, 0x1

    aput-object v4, v3, v10

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clone(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v11

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/c;->e()I

    move-result v1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/c;->c()I

    move-result v2

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, v6, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    if-ne v3, v10, :cond_0

    invoke-virtual {v11, v9, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    if-eq v3, v10, :cond_1

    :cond_0
    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v3

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/c;->d()I

    move-result v4

    if-ge v3, v4, :cond_6

    invoke-virtual {p0, v11}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_1
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "Template Apply Single Start(%d %d)"

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, v6, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, v11

    move-object v2, p1

    move-object/from16 v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Ljava/util/ArrayList;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    return-object v0

    :cond_2
    invoke-virtual {p1, v9}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateTimeLine(Z)V

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->k:I

    if-ltz v1, :cond_3

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->k:I

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeInTime(I)V

    :cond_3
    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->l:I

    if-ltz v1, :cond_4

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->l:I

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeOutTime(I)V

    :cond_4
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    iget-object v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->f:Ljava/lang/String;

    if-eqz v1, :cond_5

    invoke-virtual/range {p0 .. p3}, Lcom/nexstreaming/nexeditorsdk/c;->b(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    goto :goto_0

    :cond_5
    invoke-virtual/range {p0 .. p3}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_6
    iget v3, v6, Lcom/nexstreaming/nexeditorsdk/c;->m:I

    if-ne v3, v10, :cond_7

    goto/16 :goto_3

    :cond_7
    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    sub-int/2addr v3, v10

    :goto_1
    if-ltz v3, :cond_d

    const/16 v4, 0x320

    if-lt v2, v4, :cond_d

    if-gtz v1, :cond_8

    goto/16 :goto_3

    :cond_8
    invoke-virtual {v11, v3, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v5

    if-ne v5, v10, :cond_9

    invoke-virtual {v12, v9, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v11, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v4

    sub-int/2addr v2, v4

    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    :cond_9
    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v5

    if-gt v5, v2, :cond_a

    invoke-virtual {v12, v9, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v11, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v4

    sub-int/2addr v2, v4

    goto :goto_2

    :cond_a
    sub-int v5, v0, v2

    iget-object v13, v6, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/e;->d()I

    move-result v13

    if-le v13, v5, :cond_b

    invoke-virtual {v12, v9, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v11, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    :goto_2
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    :cond_b
    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v0

    invoke-static {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v11, v3, v10, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(IZLcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    const/16 v3, 0x64

    if-eq v0, v3, :cond_c

    mul-int v2, v2, v0

    div-int/2addr v2, v3

    :cond_c
    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v0

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v3

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    sub-int v2, v3, v2

    invoke-virtual {v5, v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "Template Apply 1(%d %d %d) 2(%d %d %d)"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v9

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v10

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v8

    const/4 v1, 0x3

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v1

    const/4 v1, 0x4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v1

    const/4 v1, 0x5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v1

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v12, v9, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v11, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->remove(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    :cond_d
    :goto_3
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "Template Apply Intro Start(%d %d)"

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, v6, Lcom/nexstreaming/nexeditorsdk/c;->y:Ljava/util/ArrayList;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v11

    move-object v2, p1

    move-object/from16 v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Ljava/util/ArrayList;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e

    return-object v0

    :cond_e
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "Template Apply Intro End(%d %d)"

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f
    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v0

    if-lez v0, :cond_11

    iget-boolean v0, v6, Lcom/nexstreaming/nexeditorsdk/c;->v:Z

    if-nez v0, :cond_11

    iget-object v4, v6, Lcom/nexstreaming/nexeditorsdk/c;->z:Ljava/util/ArrayList;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v11

    move-object v2, p1

    move-object/from16 v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Ljava/util/ArrayList;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_10

    return-object v0

    :cond_10
    iget-boolean v0, v6, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    if-eqz v0, :cond_f

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "cancel template"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "cancel template"

    return-object v0

    :cond_11
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "Template Apply Loop End(%d %d)"

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_12

    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v11, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_4

    :cond_12
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "Template Apply Outpro Start(%d %d)"

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, v6, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, v11

    move-object v2, p1

    move-object/from16 v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Ljava/util/ArrayList;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_13

    return-object v0

    :cond_13
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "Template Apply Outro End(%d %d)"

    new-array v3, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v10

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v9}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateTimeLine(Z)V

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->i:I

    if-ltz v1, :cond_14

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->i:I

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeInTime(I)V

    :cond_14
    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->j:I

    if-ltz v1, :cond_15

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->j:I

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeOutTime(I)V

    :cond_15
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    iget-boolean v1, v6, Lcom/nexstreaming/nexeditorsdk/c;->t:Z

    if-nez v1, :cond_17

    invoke-virtual {p1, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v1

    :goto_5
    if-ge v9, v1, :cond_17

    invoke-virtual {p1, v9, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getId()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".force_effect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    add-int/lit8 v3, v9, -0x1

    invoke-virtual {p1, v3, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {p1, v9, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPositionRaw(Landroid/graphics/Rect;)V

    add-int/lit8 v3, v9, 0x1

    if-ge v3, v1, :cond_16

    invoke-virtual {p1, v3, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {p1, v9, v10}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPositionRaw(Landroid/graphics/Rect;)V

    :cond_16
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    :cond_17
    invoke-virtual/range {p0 .. p3}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    return-object v0
.end method

.method c(Lcom/nexstreaming/nexeditorsdk/nexProject;)V
    .locals 8

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v1

    if-gtz v1, :cond_0

    return-void

    :cond_0
    sub-int/2addr v1, v0

    invoke-virtual {p1, v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getId()Ljava/lang/String;

    move-result-object v2

    const-string v3, "none"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getDuration()I

    move-result v2

    if-gtz v2, :cond_2

    goto/16 :goto_0

    :cond_2
    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getDuration()I

    move-result v2

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v3

    const/16 v4, 0x64

    if-eq v3, v4, :cond_3

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v3

    mul-int v2, v2, v3

    div-int/2addr v2, v4

    :cond_3
    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object p1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v4

    invoke-virtual {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setSpeedControl(I)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getColorEffect()Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getBrightness()I

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setBrightness(I)Z

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getContrast()I

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setContrast(I)Z

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSaturation()I

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setSaturation(I)Z

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTemplateEffectID()I

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setTemplateEffectID(I)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipVolume()I

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setClipVolume(I)Z

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioOnOff()Z

    move-result p1

    invoke-virtual {v3, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAudioOnOff(Z)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object p1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".force_effect"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p1

    const-string v4, "none"

    invoke-virtual {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setTransitionEffect(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p1

    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p1

    const-string v5, "none"

    invoke-virtual {p1, v5}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setTransitionEffect(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setDuration(I)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object p1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v6

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object p1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v5

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v6

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v6

    sub-int/2addr v6, v2

    invoke-virtual {p1, v5, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v5, "Template split clip(%d %d) next(%d %d %s)"

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v4

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v0

    const/4 v0, 0x2

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v1

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v0

    const/4 v0, 0x3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectEndTime()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v0

    const/4 v0, 0x4

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getId()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v0

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_4
    :goto_0
    return-void
.end method

.method d()I
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->B:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_video"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_image"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_solid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->c()I

    move-result v3

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->h()I

    move-result v2

    add-int/2addr v3, v2

    add-int/2addr v1, v3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_1
    return v1
.end method

.method d(Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;
    .locals 9

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v2, "applyTemplate30_Project ( ProjectTime:%d TemplateMinDur:%d)"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/c;->b()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x1

    aput-object v0, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p1, v6}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v7

    if-ge v0, v7, :cond_2

    invoke-virtual {p1, v0, v6}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v8

    if-ne v8, v6, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v8

    if-ge v4, v8, :cond_1

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v4

    :cond_1
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    add-int/lit8 v2, v2, 0x1

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v4, "applyTemplate30_Project(I:%d V:%d)"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v6

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-gtz v1, :cond_3

    if-gtz v2, :cond_3

    const-string p1, "Not support project on 3.0 template"

    return-object p1

    :cond_3
    if-gtz v2, :cond_4

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clone(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    invoke-virtual {p1, v6}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTopDrawInfo()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/c;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;Lcom/nexstreaming/nexeditorsdk/nexProject;Landroid/content/Context;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v5}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateTimeLine(Z)V

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Template3.0 make Project end with only images: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object p2

    :cond_4
    const-string p1, "Template applying failed(variable content) with preprocessing fail"

    return-object p1
.end method

.method e()I
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_video"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "res_image"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v2

    const-string v3, "res_solid"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method f()I
    .locals 6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->C:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v3, v1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Z)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_0

    :cond_0
    return v2

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->A:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/e;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v4

    const-string v5, "res_video"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v4

    const-string v5, "res_image"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/e;->b()Ljava/lang/String;

    move-result-object v4

    const-string v5, "res_solid"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v3, v1}, Lcom/nexstreaming/nexeditorsdk/e;->a(Z)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_1

    :cond_4
    return v2
.end method

.method g()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->h:I

    return v0
.end method

.method h()V
    .locals 2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/c;->w:Ljava/lang/String;

    const-string v1, "setCancel"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/c;->F:Z

    return-void
.end method
