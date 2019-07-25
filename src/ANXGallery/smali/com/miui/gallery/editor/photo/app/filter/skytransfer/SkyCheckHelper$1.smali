.class Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$1;
.super Ljava/lang/Object;
.source "SkyCheckHelper.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->startDownloadWithCheck(Landroid/app/Activity;)V
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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$100(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;ZI)V

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->access$000(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;Z)V

    return-void
.end method
