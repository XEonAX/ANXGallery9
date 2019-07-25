.class public Lcom/miui/gallery/search/core/display/DefaultActionClickListener;
.super Ljava/lang/Object;
.source "DefaultActionClickListener.java"

# interfaces
.implements Lcom/miui/gallery/search/core/display/OnActionClickListener;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->mContext:Landroid/content/Context;

    return-void
.end method

.method private extractFrom(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    const-string v1, "search_event_keys"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const-string v2, "search_event_values"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz v1, :cond_2

    if-eqz p1, :cond_2

    array-length v2, v1

    array-length v3, p1

    if-ne v2, v3, :cond_2

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    const-string v3, "from"

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    aget-object p1, p1, v2

    return-object p1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0

    :cond_3
    :goto_1
    return-object v0
.end method

.method private recordHistoryIfNeeded(Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchConfig;->getHistoryConfig()Lcom/miui/gallery/search/SearchConfig$HistoryConfig;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/miui/gallery/search/SearchConfig$HistoryConfig;->shouldRecordHistory(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->mContext:Landroid/content/Context;

    invoke-static {p2, p1}, Lcom/miui/gallery/search/history/SearchHistoryService;->addHistory(Landroid/content/Context;Lcom/miui/gallery/search/core/suggestion/Suggestion;)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method public onClick(Landroid/view/View;ILjava/lang/Object;Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0, p4}, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->extractFrom(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    packed-switch p2, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    iget-object p2, p0, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/miui/gallery/search/history/SearchHistoryService;->clearHistory(Landroid/content/Context;)V

    const-string p2, "clear_search_history"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_1
    const/4 p2, 0x0

    instance-of v0, p3, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    if-eqz v0, :cond_0

    check-cast p3, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    invoke-direct {p0, p3, p1}, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->recordHistoryIfNeeded(Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/lang/String;)V

    invoke-interface {p3}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_1
    :goto_0
    :try_start_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->mContext:Landroid/content/Context;

    check-cast p3, Landroid/app/Activity;

    invoke-virtual {p0, p3, p2, p4}, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    const-string p2, "DefaultActionClickListener"

    const-string p3, "Action uri parse failed for extra [%s] from %s"

    if-nez p4, :cond_2

    const-string p4, "null"

    goto :goto_1

    :cond_2
    invoke-virtual {p4}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object p4

    :goto_1
    if-nez p1, :cond_3

    const-string p1, "null"

    :cond_3
    invoke-static {p2, p3, p4, p1}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
