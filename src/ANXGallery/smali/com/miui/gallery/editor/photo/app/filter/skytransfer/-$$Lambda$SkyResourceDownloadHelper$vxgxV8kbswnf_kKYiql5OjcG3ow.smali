.class public final synthetic Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

.field private final synthetic f$1:Ljava/lang/String;

.field private final synthetic f$2:Lcom/miui/gallery/net/resource/Resource;

.field private final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Lcom/miui/gallery/net/resource/Resource;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$2:Lcom/miui/gallery/net/resource/Resource;

    iput-boolean p4, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$3:Z

    return-void
.end method


# virtual methods
.method public final subscribe(Lio/reactivex/ObservableEmitter;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$2:Lcom/miui/gallery/net/resource/Resource;

    iget-boolean v3, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;->f$3:Z

    invoke-static {v0, v1, v2, v3, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->lambda$downloadResource$98(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Lcom/miui/gallery/net/resource/Resource;ZLio/reactivex/ObservableEmitter;)V

    return-void
.end method
