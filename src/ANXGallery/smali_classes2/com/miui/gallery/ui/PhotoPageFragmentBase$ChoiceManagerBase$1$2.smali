.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$2;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->onPrepareComplete(Ljava/util/List;Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$2;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$2;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    return-void
.end method
