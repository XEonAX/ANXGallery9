.class Lcom/miui/gallery/ui/JumpDialogFragment$1;
.super Ljava/lang/Object;
.source "JumpDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/JumpDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/JumpDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/JumpDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$1;->this$0:Lcom/miui/gallery/ui/JumpDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHandleIntent(Landroid/content/Intent;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/JumpDialogFragment$1$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/JumpDialogFragment$1$1;-><init>(Lcom/miui/gallery/ui/JumpDialogFragment$1;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onJumpFailed(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/ui/JumpDialogFragment$1$2;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/ui/JumpDialogFragment$1$2;-><init>(Lcom/miui/gallery/ui/JumpDialogFragment$1;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
