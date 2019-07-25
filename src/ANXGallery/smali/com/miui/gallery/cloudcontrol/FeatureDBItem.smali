.class public Lcom/miui/gallery/cloudcontrol/FeatureDBItem;
.super Lcom/miui/gallery/cloudcontrol/FeatureProfile;
.source "FeatureDBItem.java"


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mId:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "_id"

    const-string v1, "featureName"

    const-string v2, "status"

    const-string v3, "strategy"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;-><init>()V

    return-void
.end method

.method public static fromCursor(Landroid/database/Cursor;)Lcom/miui/gallery/cloudcontrol/FeatureDBItem;
    .locals 3

    new-instance v0, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;-><init>()V

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->setId(J)V

    const/4 v1, 0x1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->setName(Ljava/lang/String;)V

    const/4 v1, 0x2

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->setStatus(Ljava/lang/String;)V

    const/4 v1, 0x3

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->setStrategy(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public setId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->mId:J

    return-void
.end method
