.class public Lcn/kuaipan/android/http/KscSpeedMonitor;
.super Ljava/lang/Object;
.source "KscSpeedMonitor.java"


# instance fields
.field private final mHost:Ljava/lang/String;

.field private mLatestUpdate:J

.field private final mManager:Lcn/kuaipan/android/http/KscSpeedManager;


# direct methods
.method public constructor <init>(Lcn/kuaipan/android/http/KscSpeedManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mManager:Lcn/kuaipan/android/http/KscSpeedManager;

    iput-object p2, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mHost:Ljava/lang/String;

    invoke-static {}, Lcn/kuaipan/android/http/KscSpeedManager;->current()J

    move-result-wide p1

    iput-wide p1, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mLatestUpdate:J

    return-void
.end method


# virtual methods
.method public recode(J)V
    .locals 10

    iget-object v0, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mManager:Lcn/kuaipan/android/http/KscSpeedManager;

    if-eqz v0, :cond_0

    invoke-static {}, Lcn/kuaipan/android/http/KscSpeedManager;->current()J

    move-result-wide v8

    iget-object v1, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mManager:Lcn/kuaipan/android/http/KscSpeedManager;

    iget-object v2, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mHost:Ljava/lang/String;

    iget-wide v3, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mLatestUpdate:J

    long-to-float v7, p1

    move-wide v5, v8

    invoke-virtual/range {v1 .. v7}, Lcn/kuaipan/android/http/KscSpeedManager;->recoder(Ljava/lang/String;JJF)V

    iput-wide v8, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mLatestUpdate:J

    :cond_0
    return-void
.end method

.method public recode(JJJ)V
    .locals 8

    iget-object v0, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mManager:Lcn/kuaipan/android/http/KscSpeedManager;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mManager:Lcn/kuaipan/android/http/KscSpeedManager;

    iget-object v2, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mHost:Ljava/lang/String;

    long-to-float v7, p5

    move-wide v3, p1

    move-wide v5, p3

    invoke-virtual/range {v1 .. v7}, Lcn/kuaipan/android/http/KscSpeedManager;->recoder(Ljava/lang/String;JJF)V

    iget-wide p1, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mLatestUpdate:J

    cmp-long p5, p3, p1

    if-lez p5, :cond_0

    iput-wide p3, p0, Lcn/kuaipan/android/http/KscSpeedMonitor;->mLatestUpdate:J

    :cond_0
    return-void
.end method
