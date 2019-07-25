.class public Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;
.super Ljava/lang/Object;
.source "nexBeatTemplateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;,
        Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;,
        Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "nexMusicTempMan"

.field private static mAppContext:Landroid/content/Context;

.field private static sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;


# instance fields
.field private externalView_musicTemplates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;",
            ">;"
        }
    .end annotation
.end field

.field private m_musicTemplateLock:Ljava/lang/Object;

.field private musicTemplates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->externalView_musicTemplates:Ljava/util/List;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->m_musicTemplateLock:Ljava/lang/Object;

    sput-object p1, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->mAppContext:Landroid/content/Context;

    return-void
.end method

.method public static getBeatTemplateManager(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;
    .locals 2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->mAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    if-nez v0, :cond_1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    :cond_1
    sget-object p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;

    return-object p0
.end method

.method static internalApplyTemplateToProjectById(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;)Z
    .locals 18

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexTemplateComposer;->AssetPackageTemplateJsonToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;->Max:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    const v4, 0xa4cb80

    new-instance v5, Lcom/google/gson_nex/Gson;

    invoke-direct {v5}, Lcom/google/gson_nex/Gson;-><init>()V

    const-class v6, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;

    invoke-virtual {v5, v1, v6}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;

    iget-object v5, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, -0x1

    const/4 v7, 0x1

    const/4 v4, 0x0

    const/4 v8, 0x1

    const v9, 0xa4cb80

    const/4 v10, 0x0

    const/4 v11, -0x1

    const/4 v12, 0x0

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    if-lez v4, :cond_1

    iget v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    sub-int/2addr v14, v4

    if-le v9, v14, :cond_1

    iget v9, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    sub-int/2addr v9, v4

    :cond_1
    iget v4, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    add-int/lit8 v11, v11, 0x1

    iget-boolean v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    if-nez v14, :cond_6

    iget v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-lez v14, :cond_2

    goto :goto_1

    :cond_2
    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    if-eqz v14, :cond_4

    iget-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    if-nez v14, :cond_3

    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v14, v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->color_filter_id:Ljava/lang/String;

    iput-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    :cond_3
    iget-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    if-nez v14, :cond_4

    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v14, v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->clip_effect_id:Ljava/lang/String;

    iput-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    :cond_4
    iget-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    if-eqz v14, :cond_0

    iget v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    const/16 v15, 0x32

    if-ne v14, v6, :cond_5

    iput v15, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    :cond_5
    iget v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    if-ne v14, v6, :cond_0

    iput v15, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    goto :goto_0

    :cond_6
    :goto_1
    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    if-eqz v14, :cond_8

    iget-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    if-nez v14, :cond_7

    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v14, v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->sc_color_effect_id:Ljava/lang/String;

    iput-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    :cond_7
    iget-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    if-nez v14, :cond_8

    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v14, v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->sc_clip_effect_id:Ljava/lang/String;

    iput-object v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    :cond_8
    iget v14, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-lez v14, :cond_9

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_9
    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->internal_clip_id:Ljava/lang/String;

    if-eqz v13, :cond_a

    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_b
    iget-object v4, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iput v3, v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    iget-object v4, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iput v3, v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    iget-object v4, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    const/4 v5, 0x0

    iput-object v5, v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    iget-object v4, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    iget-object v6, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v7

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iput v3, v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    iget-object v4, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    iget-object v6, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v7

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iput v3, v4, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    invoke-virtual {v0, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v4

    if-le v4, v8, :cond_c

    sub-int v6, v4, v8

    if-le v6, v10, :cond_d

    sub-int/2addr v6, v10

    move v9, v6

    move v6, v10

    goto :goto_2

    :cond_c
    const/4 v6, 0x0

    :cond_d
    const/4 v9, 0x0

    :goto_2
    sget-object v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;->Extends:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;

    if-ne v2, v13, :cond_e

    :goto_3
    const/4 v9, 0x0

    goto :goto_4

    :cond_e
    sget-object v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;->Recommend:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;

    if-ne v2, v13, :cond_f

    const/4 v6, 0x0

    goto :goto_3

    :cond_f
    :goto_4
    const-string v2, "nexMusicTempMan"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "sourceClipCount="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", recommend="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", extends="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " ,max="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", priorityLevel="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", eventLevel="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", internal="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iget-object v8, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_10
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v11, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-lez v11, :cond_11

    iget v11, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-gt v11, v6, :cond_10

    iput-boolean v7, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    const-string v11, "nexMusicTempMan"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "t="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v13, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, ", priority="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v13, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_11
    iget-boolean v11, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    if-nez v11, :cond_12

    if-lez v9, :cond_12

    iget-object v11, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->internal_clip_id:Ljava/lang/String;

    if-nez v11, :cond_12

    iget v11, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    if-lez v11, :cond_12

    iput-boolean v7, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    add-int/lit8 v9, v9, -0x1

    const-string v11, "nexMusicTempMan"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "t="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v13, v10, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, ", event="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12
    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_13
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_6
    if-ge v8, v6, :cond_1a

    new-instance v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    invoke-direct {v10, v5}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$1;)V

    iput v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v9, v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    iput-object v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v9, v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->internal_clip_id:Ljava/lang/String;

    iput-object v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    add-int/lit8 v9, v8, 0x1

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-boolean v11, v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    if-eqz v11, :cond_14

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v11, v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    iput v11, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    goto :goto_7

    :cond_14
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v11, v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v12, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    sub-int/2addr v11, v12

    iput v11, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    :goto_7
    iget v11, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v12, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v12, v13

    const/16 v13, 0x64

    if-ge v12, v13, :cond_15

    const-string v14, "nexMusicTempMan"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "W["

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "]("

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ") lower duration ("

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ")"

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v14, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_15
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-boolean v5, v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    if-eqz v5, :cond_16

    iput-boolean v7, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    goto/16 :goto_8

    :cond_16
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v5, v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    iput-object v5, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    iput v3, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->g:I

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v5, v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v14, v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    add-int/2addr v5, v14

    iput v5, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    iget v5, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    if-ge v5, v13, :cond_17

    if-eqz v8, :cond_17

    const-string v5, "nexMusicTempMan"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "W["

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, "]("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, ") lower effect duration ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, ")"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v5, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_17
    iget v5, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    if-ge v12, v5, :cond_18

    const-string v5, "nexMusicTempMan"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "W["

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "]("

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ") higher effect duration ("

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " < "

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ")"

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v12, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    :cond_18
    :goto_8
    iget v5, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget v8, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    if-ge v5, v8, :cond_19

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_19
    move v8, v9

    move v9, v11

    const/4 v5, 0x0

    goto/16 :goto_6

    :cond_1a
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    const-string v6, "nexMusicTempMan"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "st="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ",et="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ",sc="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v9, ",ei="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ", cf="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ", et="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", is="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :cond_1b
    invoke-static/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clone(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v4

    invoke-virtual {v0, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    invoke-virtual {v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getInternalPresetList()[Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v6

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_a
    if-ge v9, v8, :cond_2f

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    iget-boolean v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    if-eqz v13, :cond_1c

    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    if-nez v13, :cond_1c

    add-int/lit8 v10, v10, 0x1

    if-lt v10, v5, :cond_1c

    const/4 v10, 0x0

    :cond_1c
    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    if-eqz v13, :cond_1d

    new-instance v13, Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget-object v14, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "@assetItem:"

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v13, v14, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v13}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    goto :goto_b

    :cond_1d
    invoke-virtual {v4, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v4, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v13

    invoke-virtual {v3, v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    if-ne v3, v7, :cond_23

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    iget v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v14, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v13, v14

    invoke-virtual {v3, v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    sget-object v13, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    const/4 v14, 0x0

    invoke-virtual {v3, v14, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    if-eqz v3, :cond_20

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    const-string v13, "rand"

    invoke-virtual {v3, v13}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_1e

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    aget-object v13, v6, v11

    invoke-virtual {v3, v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v3, v11, 0x1

    array-length v11, v6

    if-lt v3, v11, :cond_21

    const/4 v3, 0x0

    goto :goto_c

    :cond_1e
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_20

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetName()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_1f

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3, v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_20
    move v3, v11

    :cond_21
    :goto_c
    iget-object v11, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    if-eqz v11, :cond_22

    iget-object v11, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    const-string v13, "none"

    invoke-virtual {v11, v13}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v11

    if-eqz v11, :cond_22

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v11

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v11

    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    invoke-virtual {v11, v13}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v11

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v11

    iget v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->g:I

    iget v12, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    invoke-virtual {v11, v13, v12}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffectShowTime(II)V

    :cond_22
    move-object/from16 v17, v1

    move v11, v3

    goto/16 :goto_12

    :cond_23
    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    const/4 v13, 0x4

    if-ne v3, v13, :cond_2d

    invoke-virtual {v4, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v3

    invoke-virtual {v4, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v13

    iget v14, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v15, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v14, v15

    add-int v15, v3, v14

    if-le v15, v13, :cond_24

    goto/16 :goto_11

    :cond_24
    move v15, v9

    const/4 v9, 0x0

    :goto_d
    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v7

    add-int/2addr v14, v3

    invoke-virtual {v7, v3, v14}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    sget-object v7, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    move-object/from16 v17, v1

    const/4 v1, 0x0

    invoke-virtual {v3, v1, v7}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    if-eqz v9, :cond_26

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    aget-object v3, v6, v11

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v3, v11, 0x1

    array-length v1, v6

    if-lt v3, v1, :cond_25

    :goto_e
    const/4 v11, 0x0

    goto :goto_f

    :cond_25
    move v11, v3

    goto :goto_f

    :cond_26
    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    if-eqz v1, :cond_29

    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    const-string v3, "rand"

    invoke-virtual {v1, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    aget-object v3, v6, v11

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v3, v11, 0x1

    array-length v1, v6

    if-lt v3, v1, :cond_25

    goto :goto_e

    :cond_27
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetName()Ljava/lang/String;

    move-result-object v7

    iget-object v9, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_28

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_29
    :goto_f
    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    if-eqz v1, :cond_2a

    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    const-string v3, "none"

    invoke-virtual {v1, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2a

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v1

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v1

    iget v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->g:I

    iget v7, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->h:I

    invoke-virtual {v1, v3, v7}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffectShowTime(II)V

    :cond_2a
    const/4 v1, 0x1

    add-int/2addr v15, v1

    if-lt v15, v8, :cond_2b

    goto :goto_10

    :cond_2b
    iget-boolean v9, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    iget v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v1, v3

    add-int v3, v14, v1

    if-le v3, v13, :cond_2c

    :goto_10
    add-int/lit8 v10, v10, 0x1

    if-lt v10, v5, :cond_2e

    const/4 v1, 0x1

    const/4 v10, 0x0

    goto :goto_13

    :cond_2c
    const/4 v3, 0x1

    invoke-virtual {v4, v10, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    invoke-virtual {v4, v10, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v3

    invoke-virtual {v7, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    move v3, v14

    const/4 v7, 0x1

    move v14, v1

    move-object/from16 v1, v17

    goto/16 :goto_d

    :cond_2d
    :goto_11
    move-object/from16 v17, v1

    :goto_12
    move v15, v9

    :cond_2e
    const/4 v1, 0x1

    :goto_13
    add-int/lit8 v9, v15, 0x1

    move-object/from16 v1, v17

    const/4 v3, 0x0

    const/4 v7, 0x1

    goto/16 :goto_a

    :cond_2f
    move-object v3, v1

    const/4 v1, 0x1

    iget-object v2, v3, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->string_audio_id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBackgroundMusicPath(Ljava/lang/String;)Z

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeInTime(I)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeOutTime(I)V

    return v1

    :cond_30
    const/4 v2, 0x0

    return v2
.end method

.method private resolve(Z)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->m_musicTemplateLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->mAppContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageManager(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;->beattemplate:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getInstalledAssetItems(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->hidden()Z

    move-result v3

    if-nez v3, :cond_0

    if-eqz p1, :cond_1

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->mAppContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageManager(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->checkExpireAsset(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;

    invoke-direct {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;-><init>(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)V

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public applyTemplateToProjectById(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->getBeatTemplate(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->checkExpireAsset(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    invoke-static {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->internalApplyTemplateToProjectById(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public applyTemplateToProjectById2(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;)Z
    .locals 18

    move-object/from16 v0, p1

    invoke-static/range {p2 .. p2}, Lcom/nexstreaming/nexeditorsdk/nexTemplateComposer;->AssetPackageTemplateJsonToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;->Max:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;

    const/4 v3, 0x0

    if-eqz v1, :cond_2a

    const v4, 0xa4cb80

    new-instance v5, Lcom/google/gson_nex/Gson;

    invoke-direct {v5}, Lcom/google/gson_nex/Gson;-><init>()V

    const-class v6, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;

    invoke-virtual {v5, v1, v6}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;

    iget-object v5, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, -0x1

    const/4 v7, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x1

    const v8, 0xa4cb80

    const/4 v9, 0x0

    const/4 v10, -0x1

    const/4 v11, 0x0

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    if-lez v4, :cond_1

    iget v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    sub-int/2addr v13, v4

    if-le v8, v13, :cond_1

    iget v8, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    sub-int/2addr v8, v4

    :cond_1
    iget v4, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    add-int/lit8 v10, v10, 0x1

    iget-boolean v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    if-nez v13, :cond_6

    iget v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-lez v13, :cond_2

    goto :goto_1

    :cond_2
    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    if-eqz v13, :cond_4

    iget-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    if-nez v13, :cond_3

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->color_filter_id:Ljava/lang/String;

    iput-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    :cond_3
    iget-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    if-nez v13, :cond_4

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->clip_effect_id:Ljava/lang/String;

    iput-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    :cond_4
    iget-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    if-eqz v13, :cond_0

    iget-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    const-string v14, "none"

    invoke-virtual {v13, v14}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v13

    if-eqz v13, :cond_0

    iget v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    const/16 v14, 0x32

    if-nez v13, :cond_5

    iput v14, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    :cond_5
    iget v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    if-nez v13, :cond_0

    iput v14, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    goto :goto_0

    :cond_6
    :goto_1
    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    if-eqz v13, :cond_8

    iget-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    if-nez v13, :cond_7

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->sc_color_effect_id:Ljava/lang/String;

    iput-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    :cond_7
    iget-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    if-nez v13, :cond_8

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->default_effect:Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$DefaultEffects;->sc_clip_effect_id:Ljava/lang/String;

    iput-object v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    :cond_8
    iget v13, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-lez v13, :cond_9

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_9
    iget-object v12, v12, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->internal_clip_id:Ljava/lang/String;

    if-eqz v12, :cond_a

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    :cond_a
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    :cond_b
    invoke-virtual {v0, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v4

    if-le v4, v6, :cond_c

    sub-int v5, v4, v6

    if-le v5, v9, :cond_d

    sub-int/2addr v5, v9

    move v12, v5

    move v5, v9

    goto :goto_2

    :cond_c
    const/4 v5, 0x0

    :cond_d
    const/4 v12, 0x0

    :goto_2
    sget-object v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;->Extends:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;

    if-ne v2, v13, :cond_e

    :goto_3
    const/4 v12, 0x0

    goto :goto_4

    :cond_e
    sget-object v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;->Recommend:Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$Level;

    if-ne v2, v13, :cond_f

    const/4 v5, 0x0

    goto :goto_3

    :cond_f
    :goto_4
    const-string v2, "nexMusicTempMan"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "sourceClipCount="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", recommend="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", extends="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " ,max="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", priorityLevel="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", eventLevel="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", internal="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x1

    const/4 v9, 0x0

    :goto_5
    add-int/lit8 v10, v2, -0x1

    const/4 v11, 0x0

    if-ge v6, v10, :cond_16

    new-instance v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    invoke-direct {v10, v11}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$1;)V

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-boolean v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->b_source_change:Z

    iput-boolean v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-lez v13, :cond_11

    if-nez v5, :cond_10

    goto/16 :goto_7

    :cond_10
    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    if-gt v13, v5, :cond_11

    iput-boolean v7, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    const-string v13, "nexMusicTempMan"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "num="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, ", priority="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v15, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v15, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v15, v15, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_priority:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_11
    iget-boolean v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    if-nez v13, :cond_12

    if-lez v12, :cond_12

    iget-object v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    if-nez v13, :cond_12

    iput-boolean v7, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    add-int/lit8 v12, v12, -0x1

    const-string v13, "nexMusicTempMan"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "num="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, ", event="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12
    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    iput-object v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    iput-object v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    iget-object v13, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v13, v13, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->internal_clip_id:Ljava/lang/String;

    iput-object v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    iget-boolean v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    if-nez v13, :cond_13

    new-instance v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    invoke-direct {v13, v11}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$1;)V

    iput v9, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    const-string v9, "none"

    iput-object v9, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    const-string v9, "none"

    iput-object v9, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    iget-object v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    iput-object v9, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    iget-object v9, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v9, v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    iget-object v11, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v11, v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    sub-int/2addr v9, v11

    iput v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget-object v9, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v9, v9, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    iput-object v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    iget v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iput v9, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget-object v11, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v11, v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_in_duration:I

    iget-object v14, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v14, v14, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_effect_out_duration:I

    add-int/2addr v11, v14

    add-int/2addr v9, v11

    iput v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v11, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget v14, v13, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    if-ge v11, v14, :cond_15

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_13
    iput v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget-object v11, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v11, v11, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    iput v11, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v11, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget v13, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    if-lt v11, v13, :cond_14

    goto :goto_7

    :cond_14
    iget v9, v10, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    :cond_15
    :goto_6
    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_7
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_5

    :cond_16
    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    invoke-direct {v2, v11}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$1;)V

    iput-boolean v3, v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    iput v9, v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    iget-object v5, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget v5, v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->int_time:I

    iput v5, v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget-object v5, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v5, v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->clip_effect_id:Ljava/lang/String;

    iput-object v5, v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    iget-object v5, v1, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->list_effectEntries:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;

    iget-object v5, v5, Lcom/nexstreaming/kminternal/json/TemplateMetaData$EffectEntry;->color_filter_id:Ljava/lang/String;

    iput-object v5, v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "nexMusicTempMan"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "s= ,gap duration="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    const-string v6, "nexMusicTempMan"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "s="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ",e="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ",c="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v9, ",ee="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ", sc="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v5, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    :cond_17
    invoke-static/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clone(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v2

    invoke-virtual {v0, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    invoke-virtual {v2, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getInternalPresetList()[Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v6

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_9
    if-ge v9, v8, :cond_29

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    if-eqz v13, :cond_18

    new-instance v13, Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget-object v14, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    invoke-direct {v13, v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v13}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    goto :goto_a

    :cond_18
    invoke-virtual {v2, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-static {v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-virtual {v0, v13}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    :goto_a
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v13

    if-ne v13, v7, :cond_1c

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    iget v14, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v15, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v14, v15

    invoke-virtual {v13, v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v13

    sget-object v14, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {v13, v3, v14}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    if-eqz v13, :cond_1b

    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    const-string v14, "rand"

    invoke-virtual {v13, v14}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v13

    if-nez v13, :cond_19

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    aget-object v14, v6, v11

    invoke-virtual {v13, v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v11, v11, 0x1

    array-length v13, v6

    if-lt v11, v13, :cond_1b

    const/4 v11, 0x0

    goto :goto_c

    :cond_19
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetList()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_b
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetName()Ljava/lang/String;

    move-result-object v15

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_1a

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3, v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    goto :goto_c

    :cond_1a
    const/4 v3, 0x0

    goto :goto_b

    :cond_1b
    :goto_c
    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    if-eqz v3, :cond_27

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    const-string v13, "none"

    invoke-virtual {v3, v13}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_27

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v3

    iget-object v13, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    invoke-virtual {v3, v13}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_1c
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    const/4 v13, 0x4

    if-ne v3, v13, :cond_27

    invoke-virtual {v2, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v3

    invoke-virtual {v2, v10, v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v13

    invoke-virtual {v13}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v13

    iget v14, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v15, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v14, v15

    add-int v15, v3, v14

    if-le v15, v13, :cond_1d

    move-object/from16 v17, v1

    goto/16 :goto_13

    :cond_1d
    move v15, v9

    const/4 v9, 0x0

    :goto_d
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v7

    add-int/2addr v14, v3

    invoke-virtual {v7, v3, v14}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    sget-object v7, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    move-object/from16 v17, v1

    const/4 v1, 0x0

    invoke-virtual {v3, v1, v7}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    if-eqz v9, :cond_1f

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    aget-object v3, v6, v11

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v3, v11, 0x1

    array-length v1, v6

    if-lt v3, v1, :cond_1e

    :goto_e
    const/4 v11, 0x0

    goto :goto_f

    :cond_1e
    move v11, v3

    goto :goto_f

    :cond_1f
    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    if-eqz v1, :cond_22

    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    const-string v3, "rand"

    invoke-virtual {v1, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_20

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    aget-object v3, v6, v11

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v3, v11, 0x1

    array-length v1, v6

    if-lt v3, v1, :cond_1e

    goto :goto_e

    :cond_20
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetName()Ljava/lang/String;

    move-result-object v7

    iget-object v9, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->c:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_21

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_22
    :goto_f
    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    if-eqz v1, :cond_23

    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    const-string v3, "none"

    invoke-virtual {v1, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_23

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v1

    iget-object v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setEffect(Ljava/lang/String;)V

    :cond_23
    const/4 v1, 0x1

    add-int/2addr v15, v1

    if-lt v15, v8, :cond_24

    goto :goto_10

    :cond_24
    iget-boolean v9, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;

    iget v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->b:I

    iget v3, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->a:I

    sub-int/2addr v1, v3

    add-int v3, v14, v1

    if-le v3, v13, :cond_26

    :goto_10
    add-int/lit8 v10, v10, 0x1

    if-lt v10, v5, :cond_25

    move v9, v15

    :goto_11
    const/4 v1, 0x1

    const/4 v10, 0x0

    goto :goto_14

    :cond_25
    move v9, v15

    goto :goto_13

    :cond_26
    const/4 v3, 0x1

    invoke-virtual {v2, v10, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    move v3, v14

    const/4 v7, 0x1

    move v14, v1

    move-object/from16 v1, v17

    goto/16 :goto_d

    :cond_27
    :goto_12
    move-object/from16 v17, v1

    iget-boolean v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->e:Z

    if-eqz v1, :cond_28

    iget-object v1, v12, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$a;->f:Ljava/lang/String;

    if-nez v1, :cond_28

    add-int/lit8 v10, v10, 0x1

    if-lt v10, v5, :cond_28

    goto :goto_11

    :cond_28
    :goto_13
    const/4 v1, 0x1

    :goto_14
    add-int/2addr v9, v1

    move-object/from16 v1, v17

    const/4 v3, 0x0

    const/4 v7, 0x1

    goto/16 :goto_9

    :cond_29
    move-object v3, v1

    const/4 v1, 0x1

    iget-object v2, v3, Lcom/nexstreaming/kminternal/json/TemplateMetaData$Music;->string_audio_id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBackgroundMusicPath(Ljava/lang/String;)Z

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeInTime(I)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setProjectAudioFadeOutTime(I)V

    return v1

    :cond_2a
    const/4 v2, 0x0

    return v2
.end method

.method public getBeatTemplate(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->m_musicTemplateLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;->id()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v0

    return-object v2

    :cond_1
    const/4 p1, 0x0

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getBeatTemplates()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->m_musicTemplateLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->externalView_musicTemplates:Ljava/util/List;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->externalView_musicTemplates:Ljava/util/List;

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->externalView_musicTemplates:Ljava/util/List;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public loadTemplate()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->resolve(Z)V

    return-void
.end method

.method public loadTemplate(Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->resolve(Z)V

    return-void
.end method

.method updateBeatTemplate(ZLcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)Z
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->m_musicTemplateLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "nexMusicTempMan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateMusicTemplate("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v4

    invoke-interface {v4}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetIdx()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_0

    invoke-interface {p2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->hidden()Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;

    invoke-direct {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;-><init>(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)V

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager$BeatTemplate;->id()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->id()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexBeatTemplateManager;->musicTemplates:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
