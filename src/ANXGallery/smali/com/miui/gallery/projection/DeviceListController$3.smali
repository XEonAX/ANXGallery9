.class Lcom/miui/gallery/projection/DeviceListController$3;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/projection/DeviceListController;->showDeviceNotFoundDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/projection/DeviceListController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/projection/DeviceListController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/DeviceListController$3;->this$0:Lcom/miui/gallery/projection/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/projection/DeviceListController$3;->this$0:Lcom/miui/gallery/projection/DeviceListController;

    invoke-static {p1}, Lcom/miui/gallery/projection/DeviceListController;->access$200(Lcom/miui/gallery/projection/DeviceListController;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method
