.class Lcom/miui/gallery/ui/PhotoSlimFragment$5;
.super Ljava/lang/Object;
.source "PhotoSlimFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoSlimFragment;->showExitConfirmDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoSlimFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoSlimFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoSlimFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoSlimFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoSlimFragment;->access$200(Lcom/miui/gallery/ui/PhotoSlimFragment;)V

    const-string p1, "cleaner"

    const-string p2, "slim_exit_confirm"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
