.class public Lcom/miui/gallery/provider/ContentProviderBatchOperator;
.super Ljava/lang/Object;
.source "ContentProviderBatchOperator.java"


# instance fields
.field private mAuthority:Ljava/lang/String;

.field private mBatchSize:I

.field private mOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/content/ContentProviderOperation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x32

    iput v0, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mBatchSize:I

    iput-object p1, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mAuthority:Ljava/lang/String;

    new-instance p1, Ljava/util/ArrayList;

    iget v0, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mBatchSize:I

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mOperations:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public add(Landroid/content/Context;Landroid/content/ContentProviderOperation;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    iget v0, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mBatchSize:I

    if-lt p2, v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public apply(Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mAuthority:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "ContentProviderBatchOperator"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method
