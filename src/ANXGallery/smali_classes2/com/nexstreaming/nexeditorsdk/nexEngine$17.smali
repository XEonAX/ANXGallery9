.class Lcom/nexstreaming/nexeditorsdk/nexEngine$17;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;
.source "nexEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;->startCollectCache(ILcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;

.field final synthetic b:Lcom/nexstreaming/nexeditorsdk/nexEngine;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->b:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public a(II)V
    .locals 0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;->onComplete(I)V

    :cond_0
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->b:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$302(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;->onComplete(I)V

    :cond_0
    return-void
.end method
