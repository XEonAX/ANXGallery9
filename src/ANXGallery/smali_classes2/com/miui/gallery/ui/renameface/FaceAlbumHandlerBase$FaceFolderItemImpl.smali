.class public Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;
.super Ljava/lang/Object;
.source "FaceAlbumHandlerBase.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FaceFolderItemImpl"
.end annotation


# instance fields
.field private mLocalGroupId:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object p1, p2, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;->name:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->mName:Ljava/lang/String;

    iget-object p1, p2, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;->localGroupId:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->mLocalGroupId:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->this$0:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->mName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->mLocalGroupId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->mLocalGroupId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;->mName:Ljava/lang/String;

    return-object v0
.end method
