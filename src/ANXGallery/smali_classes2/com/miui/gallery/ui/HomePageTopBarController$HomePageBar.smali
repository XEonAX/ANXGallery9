.class public abstract Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;
.super Ljava/lang/Object;
.source "HomePageTopBarController.java"

# interfaces
.implements Lcom/miui/gallery/widget/PanelItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/HomePageTopBarController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "HomePageBar"
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final mPanelManager:Lcom/miui/gallery/widget/PanelManager;

.field protected mPermanent:Z

.field protected mPriority:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mPanelManager:Lcom/miui/gallery/widget/PanelManager;

    iput p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mPriority:I

    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mPriority:I

    return v0
.end method

.method public isPermanent()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mPermanent:Z

    return v0
.end method

.method public setPermanent(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;->mPermanent:Z

    return-void
.end method
