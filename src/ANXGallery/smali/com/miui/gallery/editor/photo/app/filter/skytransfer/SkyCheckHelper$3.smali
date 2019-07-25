.class Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$3;
.super Ljava/lang/Object;
.source "SkyCheckHelper.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$3;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$3;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$200(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;)V

    return-void
.end method

.method public onDownloading(II)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$3;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$300(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;I)V

    return-void
.end method

.method public onFinish(IZI)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$3;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$100(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;ZI)V

    return-void
.end method
