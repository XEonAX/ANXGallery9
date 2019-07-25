.class public final synthetic Lcom/miui/gallery/search/core/display/icon/-$$Lambda$IconLoaderTask$UxTINscP_uqbDcJIpWKwLLsFbtY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

.field private final synthetic f$1:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/icon/-$$Lambda$IconLoaderTask$UxTINscP_uqbDcJIpWKwLLsFbtY;->f$0:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    iput-object p2, p0, Lcom/miui/gallery/search/core/display/icon/-$$Lambda$IconLoaderTask$UxTINscP_uqbDcJIpWKwLLsFbtY;->f$1:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/icon/-$$Lambda$IconLoaderTask$UxTINscP_uqbDcJIpWKwLLsFbtY;->f$0:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/icon/-$$Lambda$IconLoaderTask$UxTINscP_uqbDcJIpWKwLLsFbtY;->f$1:Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;

    invoke-static {v0, v1}, Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;->lambda$consumeResult$32(Lcom/miui/gallery/search/core/display/icon/IconLoaderTask;Lcom/miui/gallery/search/core/display/icon/IconLoaderTask$IconLoaderResult;)V

    return-void
.end method
