.class Lcom/miui/gallery/activity/HomePageActivity$4$1;
.super Ljava/lang/Object;
.source "HomePageActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/HomePageActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/activity/HomePageActivity$4;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/HomePageActivity$4;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$4$1;->this$1:Lcom/miui/gallery/activity/HomePageActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    const-string p1, "HomePageActivity"

    const-string p2, "CameraRemoteService connected"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "HomePageActivity"

    const-string v0, "CameraRemoteService disconnected"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
