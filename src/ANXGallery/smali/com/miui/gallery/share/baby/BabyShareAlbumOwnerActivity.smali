.class public Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;
.super Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;
.source "BabyShareAlbumOwnerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;
    }
.end annotation


# static fields
.field private static final sDefaultRelationEntries:[Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    new-instance v1, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    const-string v2, "father"

    const v3, 0x7f1005d5

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    const-string v2, "mother"

    const v3, 0x7f1005da

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    const-string v2, "grandfather"

    const v3, 0x7f1005d6

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    const-string v2, "grandmother"

    const v3, 0x7f1005d7

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    const-string v2, "maternalGrandfather"

    const v3, 0x7f1005d8

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    const-string v2, "maternalGrandmother"

    const v3, 0x7f1005d9

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->sDefaultRelationEntries:[Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected createShareUserAdapter()Lcom/miui/gallery/share/ShareUserAdapterBase;
    .locals 2

    new-instance v0, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getContentView()I
    .locals 1

    const v0, 0x7f0b002d

    return v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album_baby_share_owner_info"

    return-object v0
.end method

.method protected getPreferencesResourceId()I
    .locals 1

    const v0, 0x7f140001

    return v0
.end method

.method protected getShareUsers()Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p0}, Lcom/miui/gallery/share/ShareAlbumOwnerBaseActivity;->getShareUsers()Ljava/util/List;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->getOwnerEntry(Ljava/lang/String;)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v2, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->sDefaultRelationEntries:[Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;

    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_3

    aget-object v6, v2, v5

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v9, v6, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;->relation:Ljava/lang/String;

    iget-object v8, v8, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    invoke-static {v9, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    :goto_1
    if-nez v7, :cond_2

    new-instance v7, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v9, v0, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->mAlbumId:Ljava/lang/String;

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    iget-object v13, v6, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;->relation:Ljava/lang/String;

    iget v6, v6, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;->relationTextId:I

    invoke-virtual {v0, v6}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v8, v7

    invoke-direct/range {v8 .. v16}, Lcom/miui/gallery/share/CloudUserCacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    new-instance v2, Lcom/miui/gallery/share/CloudUserCacheEntry;

    iget-object v7, v0, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->mAlbumId:Ljava/lang/String;

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-string v11, "family"

    const v3, 0x7f1003a3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v6, v2

    invoke-direct/range {v6 .. v14}, Lcom/miui/gallery/share/CloudUserCacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v1
.end method

.method protected requestInvitation(Lcom/miui/gallery/share/CloudUserCacheEntry;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelationText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    const-string v2, "family"

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v0, 0x7f1005d4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    move-object v3, v0

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->getOwnerEntry(Ljava/lang/String;)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object v0

    iget-object v2, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    iget-object v4, v0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    iget-object v5, v0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelationText:Ljava/lang/String;

    move-object v1, p0

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;->requestInvitation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    :cond_1
    return-void
.end method
