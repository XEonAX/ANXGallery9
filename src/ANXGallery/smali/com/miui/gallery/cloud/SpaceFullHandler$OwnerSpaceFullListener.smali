.class Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;
.super Ljava/lang/Object;
.source "SpaceFullHandler.java"

# interfaces
.implements Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/SpaceFullHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OwnerSpaceFullListener"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleSpaceFullError(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->setOwnerSpaceFull()V

    return-void
.end method

.method public handleSpaceNotFull(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->removeOwnerSpaceFull()V

    return-void
.end method

.method public isSpaceFull(Lcom/miui/gallery/cloud/RequestCloudItem;)Z
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result p1

    return p1
.end method
