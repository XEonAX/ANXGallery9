.class public Lcom/miui/gallery/loader/CloudSetLoader$UnfoldBurstCloudDataSet;
.super Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;
.source "CloudSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/CloudSetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "UnfoldBurstCloudDataSet"
.end annotation


# direct methods
.method public constructor <init>(Landroid/database/Cursor;IIJLjava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected burstKeyIndex()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected foldBurst()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
