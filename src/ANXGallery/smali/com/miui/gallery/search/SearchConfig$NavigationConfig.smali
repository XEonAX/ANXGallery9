.class public Lcom/miui/gallery/search/SearchConfig$NavigationConfig;
.super Ljava/lang/Object;
.source "SearchConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/SearchConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NavigationConfig"
.end annotation


# instance fields
.field private peopleItemCount:I

.field private recommendItemCount:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a004b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->recommendItemCount:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0049

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->peopleItemCount:I

    return-void
.end method


# virtual methods
.method public getSectionMaxItemCount(Lcom/miui/gallery/search/SearchConstants$SectionType;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/SearchConfig$1;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const p1, 0x7fffffff

    return p1

    :cond_0
    iget p1, p0, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->recommendItemCount:I

    return p1

    :cond_1
    iget p1, p0, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->peopleItemCount:I

    return p1
.end method

.method public isFatalCondition(I)Z
    .locals 1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/16 v0, 0xa

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :cond_0
    :pswitch_0
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public useBatchContent(Lcom/miui/gallery/search/SearchConstants$SectionType;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/SearchConfig$1;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :cond_0
    :pswitch_0
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
