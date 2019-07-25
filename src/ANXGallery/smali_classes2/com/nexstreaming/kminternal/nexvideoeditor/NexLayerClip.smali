.class public final Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;
.super Ljava/lang/Object;
.source "NexLayerClip.java"


# instance fields
.field public mBrightness:I

.field public mClipPath:Ljava/lang/String;

.field public mContrast:I

.field public mDisplayOptions:Ljava/lang/String;

.field public mEndTime:I

.field public mEndTrimTime:I

.field public mExistVideo:I

.field public mHeight:I

.field public mID:I

.field public mRotateState:I

.field public mSaturation:I

.field public mSpeedControl:I

.field public mStartTime:I

.field public mStartTrimTime:I

.field public mTintcolor:I

.field public mTotalTime:I

.field public mType:I

.field public mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mID:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mType:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mTotalTime:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mStartTime:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mEndTime:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mStartTrimTime:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mEndTrimTime:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mWidth:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mHeight:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mExistVideo:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mRotateState:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mBrightness:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mContrast:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mSaturation:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mTintcolor:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexLayerClip;->mSpeedControl:I

    return-void
.end method
