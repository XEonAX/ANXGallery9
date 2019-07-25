.class abstract Lcom/miui/gallery/ui/SyncBar$ChildManager;
.super Ljava/lang/Object;
.source "SyncBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SyncBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ChildManager"
.end annotation


# instance fields
.field private final mBar:Lcom/miui/gallery/ui/SyncBar;

.field private final mKey:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/SyncBar;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$ChildManager;->mBar:Lcom/miui/gallery/ui/SyncBar;

    iput p2, p0, Lcom/miui/gallery/ui/SyncBar$ChildManager;->mKey:I

    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$ChildManager;->mBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method protected final getKey()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SyncBar$ChildManager;->mKey:I

    return v0
.end method

.method public isPermanent()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$ChildManager;->mBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar;->isPermanent()Z

    move-result v0

    return v0
.end method

.method public refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$ChildManager;->mBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$ChildManager;->getKey()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/ui/SyncBar;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;ZI)Z

    move-result p1

    return p1
.end method
