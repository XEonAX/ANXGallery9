.class Lcom/xiaomi/measite/smack/AndroidDebugger$1;
.super Ljava/lang/Object;
.source "AndroidDebugger.java"

# interfaces
.implements Lcom/xiaomi/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/measite/smack/AndroidDebugger;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;


# direct methods
.method constructor <init>(Lcom/xiaomi/measite/smack/AndroidDebugger;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed(Lcom/xiaomi/smack/Connection;ILjava/lang/Exception;)V
    .locals 0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "[Slim] "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {p2}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$000(Lcom/xiaomi/measite/smack/AndroidDebugger;)Ljava/text/SimpleDateFormat;

    move-result-object p2

    new-instance p3, Ljava/util/Date;

    invoke-direct {p3}, Ljava/util/Date;-><init>()V

    invoke-virtual {p2, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " Connection closed ("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {p2}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$100(Lcom/xiaomi/measite/smack/AndroidDebugger;)Lcom/xiaomi/smack/Connection;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    return-void
.end method

.method public connectionStarted(Lcom/xiaomi/smack/Connection;)V
    .locals 2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "[Slim] "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {v0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$000(Lcom/xiaomi/measite/smack/AndroidDebugger;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " Connection started ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {v0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$100(Lcom/xiaomi/measite/smack/AndroidDebugger;)Lcom/xiaomi/smack/Connection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    return-void
.end method

.method public reconnectionFailed(Lcom/xiaomi/smack/Connection;Ljava/lang/Exception;)V
    .locals 2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "[Slim] "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {v0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$000(Lcom/xiaomi/measite/smack/AndroidDebugger;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " Reconnection failed due to an exception ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {v0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$100(Lcom/xiaomi/measite/smack/AndroidDebugger;)Lcom/xiaomi/smack/Connection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public reconnectionSuccessful(Lcom/xiaomi/smack/Connection;)V
    .locals 2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "[Slim] "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {v0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$000(Lcom/xiaomi/measite/smack/AndroidDebugger;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " Connection reconnected ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/measite/smack/AndroidDebugger$1;->this$0:Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-static {v0}, Lcom/xiaomi/measite/smack/AndroidDebugger;->access$100(Lcom/xiaomi/measite/smack/AndroidDebugger;)Lcom/xiaomi/smack/Connection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    return-void
.end method
