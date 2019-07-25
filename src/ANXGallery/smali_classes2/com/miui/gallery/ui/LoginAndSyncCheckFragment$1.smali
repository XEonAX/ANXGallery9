.class Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$1;
.super Ljava/lang/Object;
.source "LoginAndSyncCheckFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkSystemSync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$1;->this$0:Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    new-instance p1, Landroid/content/Intent;

    const-string p2, "com.xiaomi.action.MICLOUD_MAIN"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$1;->this$0:Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
