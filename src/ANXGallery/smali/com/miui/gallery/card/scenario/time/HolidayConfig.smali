.class public Lcom/miui/gallery/card/scenario/time/HolidayConfig;
.super Ljava/lang/Object;
.source "HolidayConfig.java"


# instance fields
.field final mHoliday:I

.field final mMaxContinuousDay:I

.field final mPreviousMaxDay:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->mHoliday:I

    iput p2, p0, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->mPreviousMaxDay:I

    iput p3, p0, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->mMaxContinuousDay:I

    return-void
.end method


# virtual methods
.method public getHoliday()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->mHoliday:I

    return v0
.end method

.method public getMaxContinuousDay()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->mMaxContinuousDay:I

    return v0
.end method

.method public getPreviousMaxDay()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/scenario/time/HolidayConfig;->mPreviousMaxDay:I

    return v0
.end method
