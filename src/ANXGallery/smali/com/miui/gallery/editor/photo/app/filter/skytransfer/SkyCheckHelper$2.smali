.class Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;
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
.field private isLibFinish:Z

.field private isResFinish:Z

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(I)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$200(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;)V

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->isLibFinish:Z

    goto :goto_0

    :cond_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->isResFinish:Z

    :goto_0
    return-void
.end method

.method public onDownloading(II)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$300(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;I)V

    :cond_0
    return-void
.end method

.method public onFinish(IZI)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->isResFinish:Z

    :cond_0
    if-ne p1, v0, :cond_1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->isLibFinish:Z

    :cond_1
    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->isResFinish:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->isLibFinish:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$100(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;ZI)V

    :cond_2
    return-void
.end method
