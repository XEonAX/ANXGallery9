.class Lcom/miui/gallery/model/CloudItem$1;
.super Ljava/lang/Object;
.source "CloudItem.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/model/CloudItem;->getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/model/CloudItem;

.field final synthetic val$info:Lcom/miui/gallery/model/PhotoDetailInfo;


# direct methods
.method constructor <init>(Lcom/miui/gallery/model/CloudItem;Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/CloudItem$1;->this$0:Lcom/miui/gallery/model/CloudItem;

    iput-object p2, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 4

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->this$0:Lcom/miui/gallery/model/CloudItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/CloudItem;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v2, 0x65

    const/4 v3, 0x1

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v2, 0x64

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v1, 0x69

    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v2, 0x67

    invoke-static {v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->wrapFocalLength(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v1, 0x6c

    const/4 v2, 0x5

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v1, 0x6b

    const/4 v2, 0x6

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v1, 0x66

    const/4 v2, 0x7

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    const/16 v1, 0xa

    const/16 v2, 0x8

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/model/CloudItem$1;->val$info:Lcom/miui/gallery/model/PhotoDetailInfo;

    return-object p1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method
