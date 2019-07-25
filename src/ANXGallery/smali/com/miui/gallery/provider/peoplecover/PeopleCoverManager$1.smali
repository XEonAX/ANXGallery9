.class Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;
.super Ljava/lang/Object;
.source "PeopleCoverManager.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->startChooseCoverForAllPeople()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;->this$0:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 11

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_3

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v9

    const-class v10, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    new-array v7, v7, [Ljava/lang/String;

    aput-object v6, v7, v3

    invoke-virtual {v9, v10, v7}, Lcom/miui/gallery/dao/base/EntityManager;->find(Ljava/lang/Class;[Ljava/lang/String;)Lcom/miui/gallery/dao/base/Entity;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    if-eqz v7, :cond_3

    invoke-virtual {v7}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getServerTag()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v7}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getCoverScore()I

    move-result v6

    goto :goto_2

    :cond_3
    :goto_1
    iget-object v9, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;->this$0:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    invoke-static {v9, v6, v8, v7}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->access$000(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/provider/peoplecover/PeopleCover;)I

    move-result v6

    :goto_2
    iget-object v7, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;->this$0:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    invoke-static {v7, v6}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->access$100(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;I)I

    move-result v7

    add-int/2addr v4, v7

    if-lez v6, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    const-string v1, "PeopleCoverManager"

    const-string v2, "finish choose cover for all people, cost time: %d"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;->this$0:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    int-to-float v2, v4

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float v2, v2, v3

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v2, p1

    invoke-static {v1, v2, v5}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->access$200(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;FI)V

    iget-object p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;->this$0:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    invoke-static {p1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->access$300(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;)V

    return-object v0

    :cond_5
    :goto_3
    return-object v0
.end method
