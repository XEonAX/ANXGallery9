.class public Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;
.super Ljava/lang/Object;
.source "FaceAlbumHandlerBase.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FaceNewFolerItem"
.end annotation


# instance fields
.field isCreatedInDb:Z

.field mContactJson:Ljava/lang/String;

.field mId:Ljava/lang/String;

.field mName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->isCreatedInDb:Z

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->mName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getContactjson()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->mContactJson:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public isCreatedInDb()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->isCreatedInDb:Z

    return v0
.end method

.method public setContactjson(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->mContactJson:Ljava/lang/String;

    return-void
.end method

.method public setCreatedInDb()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->isCreatedInDb:Z

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;->mId:Ljava/lang/String;

    return-void
.end method
