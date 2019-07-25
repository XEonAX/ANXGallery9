.class public Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;
.super Ljava/lang/Object;
.source "OriginUrlRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OriginUrlRequestTask"
.end annotation


# instance fields
.field mDownloadUri:Landroid/net/Uri;

.field mMediaType:I

.field mOriginHeight:I

.field mOriginWidth:I

.field mPosition:I


# direct methods
.method public constructor <init>(ILandroid/net/Uri;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;->mPosition:I

    iput-object p2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;->mDownloadUri:Landroid/net/Uri;

    iput p3, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;->mOriginHeight:I

    iput p4, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;->mOriginWidth:I

    iput p5, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;->mMediaType:I

    return-void
.end method
