.class public Lcom/xiaomi/push/service/NotificationIconHelper$GetDataResult;
.super Ljava/lang/Object;
.source "NotificationIconHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/NotificationIconHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GetDataResult"
.end annotation


# instance fields
.field data:[B

.field downloadSize:I


# direct methods
.method public constructor <init>([BI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/push/service/NotificationIconHelper$GetDataResult;->data:[B

    iput p2, p0, Lcom/xiaomi/push/service/NotificationIconHelper$GetDataResult;->downloadSize:I

    return-void
.end method
