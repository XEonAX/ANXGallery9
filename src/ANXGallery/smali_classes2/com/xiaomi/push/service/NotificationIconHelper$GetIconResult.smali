.class public Lcom/xiaomi/push/service/NotificationIconHelper$GetIconResult;
.super Ljava/lang/Object;
.source "NotificationIconHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/NotificationIconHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GetIconResult"
.end annotation


# instance fields
.field public bitmap:Landroid/graphics/Bitmap;

.field public downloadSize:J


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/push/service/NotificationIconHelper$GetIconResult;->bitmap:Landroid/graphics/Bitmap;

    iput-wide p2, p0, Lcom/xiaomi/push/service/NotificationIconHelper$GetIconResult;->downloadSize:J

    return-void
.end method
