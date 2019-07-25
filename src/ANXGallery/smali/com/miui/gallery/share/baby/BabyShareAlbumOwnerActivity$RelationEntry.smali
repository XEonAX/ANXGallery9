.class Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;
.super Ljava/lang/Object;
.source "BabyShareAlbumOwnerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RelationEntry"
.end annotation


# instance fields
.field relation:Ljava/lang/String;

.field relationTextId:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;->relation:Ljava/lang/String;

    iput p2, p0, Lcom/miui/gallery/share/baby/BabyShareAlbumOwnerActivity$RelationEntry;->relationTextId:I

    return-void
.end method
