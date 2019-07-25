.class public Lcom/miui/gallery/share/CloudUserCacheEntry;
.super Ljava/lang/Object;
.source "CloudUserCacheEntry.java"


# instance fields
.field public final mAlbumId:Ljava/lang/String;

.field public final mCreateTime:J

.field public final mPhone:Ljava/lang/String;

.field public final mRelation:Ljava/lang/String;

.field public final mRelationText:Ljava/lang/String;

.field public final mServerStatus:Ljava/lang/String;

.field public final mUserId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mAlbumId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    iput-wide p3, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mCreateTime:J

    iput-object p5, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    iput-object p6, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelationText:Ljava/lang/String;

    iput-object p7, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mServerStatus:Ljava/lang/String;

    iput-object p8, p0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mPhone:Ljava/lang/String;

    return-void
.end method
