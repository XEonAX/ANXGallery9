.class Lcom/miui/gallery/ui/SlimPhotoPickFragment$5;
.super Ljava/lang/Object;
.source "SlimPhotoPickFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SlimPhotoPickFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/SlimPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;->access$400(Lcom/miui/gallery/ui/SlimPhotoPickFragment;)Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method
