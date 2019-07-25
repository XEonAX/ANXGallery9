.class public final Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;
.super Ljava/lang/Object;
.source "nexEffectOptions.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;,
        Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;,
        Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;,
        Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;,
        Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;,
        Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$Option;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private mColorOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;",
            ">;"
        }
    .end annotation
.end field

.field mEffectID:Ljava/lang/String;

.field mEffectType:I

.field private mOptionIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRangeOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;",
            ">;"
        }
    .end annotation
.end field

.field private mSelectOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;",
            ">;"
        }
    .end annotation
.end field

.field private mSwitchOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;",
            ">;"
        }
    .end annotation
.end field

.field private mTextOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;",
            ">;"
        }
    .end annotation
.end field

.field private m_externalView_colors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;",
            ">;"
        }
    .end annotation
.end field

.field private m_externalView_ranges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;",
            ">;"
        }
    .end annotation
.end field

.field private m_externalView_selects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;",
            ">;"
        }
    .end annotation
.end field

.field private m_externalView_switch:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;",
            ">;"
        }
    .end annotation
.end field

.field private m_externalView_texts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;",
            ">;"
        }
    .end annotation
.end field

.field private updated:Z


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_texts:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_colors:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_selects:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_ranges:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_switch:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_texts:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_colors:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_selects:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_ranges:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_switch:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectID:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    return-void
.end method

.method static synthetic access$102(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->updated:Z

    return p1
.end method


# virtual methods
.method protected addColorOpt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected addRangeOpt(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 9

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    new-instance v8, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;III)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected addSelectOpt(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 9

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    new-instance v8, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;I)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected addSwitchOpt(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected addTextOpt(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method clearUpadted()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->updated:Z

    return-void
.end method

.method public getColorOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_colors:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_colors:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_colors:Ljava/util/List;

    return-object v0
.end method

.method public getEffectID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectID:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionById(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$Option;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    return-object v1

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_4

    return-object v1

    :cond_5
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_6

    return-object v1

    :cond_7
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    return-object v1

    :cond_9
    const/4 p1, 0x0

    return-object p1
.end method

.method public getOptionIds()[Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mOptionIds:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getRangeOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_ranges:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_ranges:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_ranges:Ljava/util/List;

    return-object v0
.end method

.method public getSelectOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_selects:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_selects:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_selects:Ljava/util/List;

    return-object v0
.end method

.method public getSwitchOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_switch:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_switch:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_switch:Ljava/util/List;

    return-object v0
.end method

.method public getTextFieldCount()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getTextOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_texts:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mTextOptions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_texts:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->m_externalView_texts:Ljava/util/List;

    return-object v0
.end method

.method isUpdated()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->updated:Z

    return v0
.end method

.method public setDefaultValue()V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mColorOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->default_argb_color:I

    iput v2, v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->argb_color:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSelectOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->default_select_index:I

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->setSelectIndex(I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mRangeOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->default_value:I

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->setValue(I)V

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mSwitchOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;

    iget-boolean v2, v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->default_on:Z

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->setValue(Z)V

    goto :goto_3

    :cond_3
    return-void
.end method

.method setEffectType(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    return-void
.end method
