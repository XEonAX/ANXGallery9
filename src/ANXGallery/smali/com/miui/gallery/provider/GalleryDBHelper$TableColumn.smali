.class public Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;
.super Ljava/lang/Object;
.source "GalleryDBHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/GalleryDBHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TableColumn"
.end annotation


# instance fields
.field public isUnique:Z

.field public mColumnType:Ljava/lang/String;

.field public mDefault:Ljava/lang/String;

.field public mName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->isUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mName:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mColumnType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->isUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mName:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mColumnType:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mDefault:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->isUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mName:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->mColumnType:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;->isUnique:Z

    return-void
.end method
