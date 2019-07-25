.class Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;
.super Ljava/lang/Object;
.source "SkyResourceDownloadHelper.java"

# interfaces
.implements Lcom/miui/gallery/net/download/Request$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->lambda$downloadResource$98(Ljava/lang/String;Lcom/miui/gallery/net/resource/Resource;ZLio/reactivex/ObservableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

.field final synthetic val$cap$0:Ljava/lang/String;

.field final synthetic val$emitter:Lio/reactivex/ObservableEmitter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Lio/reactivex/ObservableEmitter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;->val$cap$0:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;->val$emitter:Lio/reactivex/ObservableEmitter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;->val$emitter:Lio/reactivex/ObservableEmitter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onProgressUpdate(I)V
    .locals 4

    const-string v0, "SkyResourceDownloadHelper"

    const-string v1, "download progress %s :%d"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;->val$cap$0:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->access$000(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;I)V

    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method
