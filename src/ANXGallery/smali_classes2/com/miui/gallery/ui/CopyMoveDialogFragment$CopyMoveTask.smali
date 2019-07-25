.class Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;
.super Landroid/os/AsyncTask;
.source "CopyMoveDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CopyMoveDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CopyMoveTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "[J>;"
    }
.end annotation


# instance fields
.field private mCloudPhotoCount:I

.field final synthetic this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private copyOrMove()[J
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$400(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$700(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)I

    move-result v2

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$800(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)J

    move-result-wide v3

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$900(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Z

    move-result v5

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J

    move-result-object v6

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/provider/CloudUtils;->move(Landroid/content/Context;IJZ[J)[J

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$700(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$800(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/CloudUtils;->copy(Landroid/content/Context;IJ[J)[J

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$1000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$400(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$800(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$1000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/provider/CloudUtils;->move(Landroid/content/Context;JLjava/util/ArrayList;)[J

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$800(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$1000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/provider/CloudUtils;->copy(Landroid/content/Context;JLjava/util/ArrayList;)[J

    move-result-object v0

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private getCloudPhotoCount()I
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_4

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id IN ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    iget-object v4, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/MiscUtil;->arrayToList([J)Ljava/util/List;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ") AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_LOCAL_MEDIA:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v2, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    new-array v6, v1, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J

    move-result-object v0

    array-length v0, v0

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-int/2addr v0, v3

    move v1, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    goto :goto_1

    :catch_0
    move-object v0, v2

    goto :goto_2

    :cond_1
    :goto_0
    invoke-static {v2}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_3

    :catchall_1
    move-exception v1

    :goto_1
    invoke-static {v0}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/database/Cursor;)V

    throw v1

    :catch_1
    :goto_2
    invoke-static {v0}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/database/Cursor;)V

    :goto_3
    return v1

    :cond_2
    :goto_4
    return v1
.end method

.method private getFailReason(Landroid/content/res/Resources;II)Ljava/lang/String;
    .locals 1

    const/16 v0, -0x6f

    if-eq p2, v0, :cond_0

    const p2, 0x7f100653

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const p2, 0x7f0e002a

    invoke-virtual {p1, p2, p3}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private outputResult([J)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_c

    array-length v2, v1

    const/4 v3, 0x1

    if-ge v2, v3, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v2, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v4, ""

    array-length v5, v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_0
    if-ge v7, v5, :cond_5

    aget-wide v12, v1, v7

    const-wide/16 v14, 0x0

    cmp-long v16, v12, v14

    if-lez v16, :cond_1

    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_1
    const-wide/16 v14, -0x67

    cmp-long v16, v12, v14

    if-eqz v16, :cond_3

    const-wide/16 v14, -0x68

    cmp-long v16, v12, v14

    if-nez v16, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v8, v8, 0x1

    if-nez v10, :cond_4

    long-to-int v10, v12

    goto :goto_2

    :cond_3
    :goto_1
    add-int/lit8 v11, v11, 0x1

    :cond_4
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_5
    if-lez v8, :cond_6

    invoke-direct {v0, v2, v10, v8}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->getFailReason(Landroid/content/res/Resources;II)Ljava/lang/String;

    move-result-object v4

    :cond_6
    array-length v5, v1

    const v7, 0x7f100009

    const v10, 0x7f10000c

    if-le v5, v3, :cond_9

    if-eqz v8, :cond_7

    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    const v5, 0x7f0e0002

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v7, v3

    invoke-virtual {v2, v5, v8, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_3

    :cond_7
    array-length v1, v1

    if-ne v1, v11, :cond_8

    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v7}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_3

    :cond_8
    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v10}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_3

    :cond_9
    if-ne v9, v3, :cond_a

    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v10}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_3

    :cond_a
    if-ne v11, v3, :cond_b

    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v7}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_3

    :cond_b
    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    const v5, 0x7f10000b

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v4, v3, v6

    invoke-virtual {v2, v5, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_3
    return-void

    :cond_c
    :goto_4
    iget-object v1, v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f10000a

    invoke-static {v1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void
.end method

.method private showCloudPhotoCountDialog(I)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0001

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f10000d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->doInBackground([Ljava/lang/Void;)[J

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)[J
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->getCloudPhotoCount()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->mCloudPhotoCount:I

    :cond_0
    const/4 p1, 0x1

    new-array p1, p1, [J

    const/4 v0, 0x0

    const-wide/16 v1, -0x70

    aput-wide v1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->copyOrMove()[J

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [J

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->onPostExecute([J)V

    return-void
.end method

.method protected onPostExecute([J)V
    .locals 5

    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    aget-wide v0, p1, v0

    const-wide/16 v2, -0x70

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Lmiui/app/ProgressDialog;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/ProgressDialog;->dismiss()V

    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->outputResult([J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Lmiui/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    iget v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->mCloudPhotoCount:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->mCloudPhotoCount:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->showCloudPhotoCountDialog(I)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$300(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$300(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->this$0:Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->access$400(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Z

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;->onComplete([JZ)V

    :cond_2
    return-void
.end method
