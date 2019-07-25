.class public Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;
.super Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$Option;
.source "nexEffectOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RangeOpt"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected default_value:I

.field protected mValue:I

.field protected max_value:I

.field protected min_value:I

.field final synthetic this$0:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;


# direct methods
.method private constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)V
    .locals 1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->this$0:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$Option;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$1;)V

    return-void
.end method

.method protected constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;III)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->this$0:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$Option;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Ljava/lang/String;Ljava/lang/String;)V

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->default_value:I

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->max_value:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->min_value:I

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->mValue:I

    return-void
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->mValue:I

    return v0
.end method

.method public max()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->max_value:I

    return v0
.end method

.method public min()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->min_value:I

    return v0
.end method

.method public setValue(I)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->min_value:I

    if-ge p1, v0, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->min_value:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->max_value:I

    if-le p1, v0, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->max_value:I

    :cond_1
    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->mValue:I

    if-eq v0, p1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->this$0:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->access$102(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Z)Z

    :cond_2
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->mValue:I

    return-void
.end method
