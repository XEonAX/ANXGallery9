.class Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;
.super Ljava/lang/Object;
.source "AlbumDetailFragmentBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onEnableAutoUpload(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

.field final synthetic val$sharePending:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iput-boolean p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;->val$sharePending:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    new-instance p1, Landroid/content/Intent;

    const-string p2, "com.xiaomi.action.MICLOUD_MAIN"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/activity/BaseActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$202(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-boolean p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;->val$sharePending:Z

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$302(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)Z

    return-void
.end method
