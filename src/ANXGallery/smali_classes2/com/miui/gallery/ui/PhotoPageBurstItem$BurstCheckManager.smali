.class public Lcom/miui/gallery/ui/PhotoPageBurstItem$BurstCheckManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
.source "PhotoPageBurstItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageBurstItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "BurstCheckManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageBurstItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageBurstItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageBurstItem$BurstCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageBurstItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method


# virtual methods
.method protected originChecked()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
