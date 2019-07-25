.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;


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

.field final synthetic val$secretIds:Ljava/util/ArrayList;

.field final synthetic val$secretItems:Ljava/util/ArrayList;

.field final synthetic val$secretKeys:Ljava/util/List;

.field final synthetic val$shareUris:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$shareUris:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretItems:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretKeys:Ljava/util/List;

    iput-object p5, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretIds:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepareComplete(Ljava/util/List;Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/Collection<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$shareUris:Ljava/util/ArrayList;

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-static/range {p4 .. p4}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface/range {p4 .. p4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    iget-object v3, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$shareUris:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_4

    invoke-static/range {p5 .. p5}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    invoke-static/range {p3 .. p3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0e002b

    invoke-interface/range {p3 .. p3}, Ljava/util/Collection;->size()I

    move-result v5

    new-array v6, v3, [Ljava/lang/Object;

    invoke-interface/range {p3 .. p3}, Ljava/util/Collection;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {v1, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_3
    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$shareUris:Ljava/util/ArrayList;

    iget-object v4, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->val$secretItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    xor-int/2addr v3, v4

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->access$1000(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/util/ArrayList;Z)V

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onContentChanged()V

    goto/16 :goto_3

    :cond_4
    :goto_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_5

    move-object/from16 v6, p2

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_5
    invoke-static/range {p3 .. p3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_6

    move-object/from16 v6, p3

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_6
    invoke-static/range {p5 .. p5}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_7

    move-object/from16 v6, p5

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v7, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v7, v7, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v8, v7, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v7, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v7, v7, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v7}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x7f0e0028

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v10

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v2

    invoke-virtual {v7, v9, v10, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iget-object v2, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100319

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    const v11, 0x7f100318

    const/high16 v12, 0x1040000

    new-instance v13, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;

    invoke-direct {v13, v0, v1, v4, v5}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    new-instance v14, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$2;

    invoke-direct {v14, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;)V

    new-instance v15, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$3;

    invoke-direct {v15, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1$3;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;)V

    invoke-static/range {v8 .. v15}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;

    :cond_7
    :goto_3
    return-void
.end method
