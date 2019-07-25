.class Lcom/miui/gallery/projection/ConnectController$4;
.super Ljava/lang/Object;
.source "ConnectController.java"

# interfaces
.implements Lcom/milink/api/v1/MilinkClientManagerDataSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/projection/ConnectController;
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

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController$4;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getNextPhoto(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$4;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$300(Lcom/miui/gallery/projection/ConnectController;)Lcom/miui/gallery/projection/SlidingWindow;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/projection/SlidingWindow;->getNext(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPrevPhoto(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController$4;->this$0:Lcom/miui/gallery/projection/ConnectController;

    invoke-static {v0}, Lcom/miui/gallery/projection/ConnectController;->access$300(Lcom/miui/gallery/projection/ConnectController;)Lcom/miui/gallery/projection/SlidingWindow;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/projection/SlidingWindow;->getPrevious(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
