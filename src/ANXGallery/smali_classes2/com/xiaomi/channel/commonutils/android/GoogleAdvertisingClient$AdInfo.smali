.class final Lcom/xiaomi/channel/commonutils/android/GoogleAdvertisingClient$AdInfo;
.super Ljava/lang/Object;
.source "GoogleAdvertisingClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/channel/commonutils/android/GoogleAdvertisingClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AdInfo"
.end annotation


# instance fields
.field private final advertisingId:Ljava/lang/String;

.field private final limitAdTrackingEnabled:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/android/GoogleAdvertisingClient$AdInfo;->advertisingId:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/xiaomi/channel/commonutils/android/GoogleAdvertisingClient$AdInfo;->limitAdTrackingEnabled:Z

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/GoogleAdvertisingClient$AdInfo;->advertisingId:Ljava/lang/String;

    return-object v0
.end method
