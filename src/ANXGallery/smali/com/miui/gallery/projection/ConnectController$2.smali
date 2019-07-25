.class Lcom/miui/gallery/projection/ConnectController$2;
.super Ljava/lang/Object;
.source "ConnectController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/projection/ConnectController;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/projection/ConnectController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/projection/ConnectController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController$2;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "delayed disconnected"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$2;->this$0:Lcom/miui/gallery/projection/ConnectController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/ConnectController;->access$200(Lcom/miui/gallery/projection/ConnectController;Z)V

    return-void
.end method
