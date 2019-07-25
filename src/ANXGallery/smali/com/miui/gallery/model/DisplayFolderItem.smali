.class public Lcom/miui/gallery/model/DisplayFolderItem;
.super Ljava/lang/Object;
.source "DisplayFolderItem.java"


# instance fields
.field public count:I

.field public coverImagePath:Ljava/lang/String;

.field public imageJob:Ljava/lang/String;

.field public isNewlyCreate:Z

.field public localGroupId:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public thumbnailPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/model/DisplayFolderItem;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/model/DisplayFolderItem;->imageJob:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/model/DisplayFolderItem;->count:I

    iput-object p4, p0, Lcom/miui/gallery/model/DisplayFolderItem;->localGroupId:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/model/DisplayFolderItem;->coverImagePath:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/model/DisplayFolderItem;->isNewlyCreate:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/model/DisplayFolderItem;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/model/DisplayFolderItem;->thumbnailPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/model/DisplayFolderItem;->localGroupId:Ljava/lang/String;

    return-void
.end method
