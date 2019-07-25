.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$2;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doPrepareFiles(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    return-void
.end method
