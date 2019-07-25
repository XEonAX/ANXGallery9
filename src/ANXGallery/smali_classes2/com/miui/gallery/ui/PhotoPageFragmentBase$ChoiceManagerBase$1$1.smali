.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;
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

.field final synthetic val$compressItems:Ljava/util/ArrayList;

.field final synthetic val$downloadItems:Ljava/util/ArrayList;

.field final synthetic val$renderItems:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->val$compressItems:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->val$downloadItems:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->val$renderItems:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iget-object v0, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->val$compressItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->val$downloadItems:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->val$renderItems:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iget-object v4, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretItems:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iget-object v5, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretKeys:Ljava/util/List;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iget-object v6, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$shareUris:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;->this$2:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    iget-object v7, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretIds:Ljava/util/ArrayList;

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->access$900(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method
