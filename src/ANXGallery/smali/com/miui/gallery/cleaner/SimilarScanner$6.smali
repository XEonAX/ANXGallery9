.class Lcom/miui/gallery/cleaner/SimilarScanner$6;
.super Ljava/lang/Object;
.source "SimilarScanner.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cleaner/SimilarScanner;->handleImagesByLimit(IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/util/List<",
        "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

.field final synthetic val$sqlLimit:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/SimilarScanner;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    iput p2, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->val$sqlLimit:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cleaner/SimilarScanner$6;->handle(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {v2}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$400(Lcom/miui/gallery/cleaner/SimilarScanner;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    :cond_0
    new-instance v3, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-direct {v3, p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    iget v3, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->val$sqlLimit:I

    if-lt p1, v3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    iget v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->val$sqlLimit:I

    add-int/lit8 v0, v0, -0x1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$702(Lcom/miui/gallery/cleaner/SimilarScanner;J)J

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$702(Lcom/miui/gallery/cleaner/SimilarScanner;J)J

    :goto_0
    return-object v2

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/SimilarScanner;->isLoadingValid()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$6;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$702(Lcom/miui/gallery/cleaner/SimilarScanner;J)J

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method
