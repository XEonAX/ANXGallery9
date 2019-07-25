.class public Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;
.super Ljava/lang/Object;
.source "ProduceCreationDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ProduceCreationDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CreationModel"
.end annotation


# instance fields
.field public creationId:I

.field public iconResourceId:I

.field public informationString:Ljava/lang/String;

.field public isRemainWhenClick:Z

.field public titleResourceId:I


# direct methods
.method public constructor <init>(III)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->isRemainWhenClick:Z

    iput p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->creationId:I

    iput p2, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->iconResourceId:I

    iput p3, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->titleResourceId:I

    return-void
.end method
