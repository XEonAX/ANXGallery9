.class public Lcom/miui/gallery/dao/base/TableColumn;
.super Ljava/lang/Object;
.source "TableColumn.java"


# instance fields
.field protected defaultValue:Ljava/lang/String;

.field protected isUnique:Z

.field protected name:Ljava/lang/String;

.field protected type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/dao/base/TableColumn;->isUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/dao/base/TableColumn;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/dao/base/TableColumn;->type:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/dao/base/TableColumn;->isUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/dao/base/TableColumn;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/dao/base/TableColumn;->type:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/dao/base/TableColumn;->defaultValue:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/dao/base/TableColumn;->isUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/dao/base/TableColumn;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/dao/base/TableColumn;->type:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/miui/gallery/dao/base/TableColumn;->isUnique:Z

    return-void
.end method
