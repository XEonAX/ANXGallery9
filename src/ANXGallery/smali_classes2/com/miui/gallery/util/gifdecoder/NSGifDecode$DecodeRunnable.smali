.class Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;
.super Ljava/lang/Object;
.source "NSGifDecode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/gifdecoder/NSGifDecode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecodeRunnable"
.end annotation


# instance fields
.field private mIndex:I

.field private mNSGif:Lcom/miui/gallery/util/gifdecoder/NSGif;

.field final synthetic this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;Lcom/miui/gallery/util/gifdecoder/NSGif;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mNSGif:Lcom/miui/gallery/util/gifdecoder/NSGif;

    iput p3, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v0}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$000(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0x14

    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mNSGif:Lcom/miui/gallery/util/gifdecoder/NSGif;

    iget v2, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/util/gifdecoder/NSGif;->getFrameDelay(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v0, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v0

    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v0}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$000(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mNSGif:Lcom/miui/gallery/util/gifdecoder/NSGif;

    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$100(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/gifdecoder/NSGif;->writeTo(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_3

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v0}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$200(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$100(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;->onUpdateGifFrame(Landroid/graphics/Bitmap;)V

    :cond_2
    iget v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    iget v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mNSGif:Lcom/miui/gallery/util/gifdecoder/NSGif;

    invoke-virtual {v1}, Lcom/miui/gallery/util/gifdecoder/NSGif;->getFrameCount()I

    move-result v1

    if-lt v0, v1, :cond_3

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v0}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$000(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mNSGif:Lcom/miui/gallery/util/gifdecoder/NSGif;

    iget v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/gifdecoder/NSGif;->decodeFrame(I)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v0}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$000(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v0}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$300(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$400(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v1, v4, v2

    if-gez v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$400(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Landroid/os/Handler;

    move-result-object v1

    const/4 v6, 0x0

    sub-long/2addr v2, v4

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->this$0:Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    invoke-static {v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->access$400(Lcom/miui/gallery/util/gifdecoder/NSGifDecode;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_6
    :goto_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_7
    :goto_1
    return-void

    :cond_8
    :goto_2
    return-void

    :cond_9
    :goto_3
    const-string v0, "NSGifDecode"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "write frame "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/miui/gallery/util/gifdecoder/NSGifDecode$DecodeRunnable;->mIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
