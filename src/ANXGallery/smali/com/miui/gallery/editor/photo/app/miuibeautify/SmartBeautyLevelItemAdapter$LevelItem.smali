.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;
.super Ljava/lang/Object;
.source "SmartBeautyLevelItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LevelItem"
.end annotation


# instance fields
.field private mResourceNormal:I

.field private mResourcePressed:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;->mResourceNormal:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;->mResourcePressed:I

    return-void
.end method


# virtual methods
.method public getNormalResource()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;->mResourceNormal:I

    return v0
.end method

.method public getPressedResource()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;->mResourcePressed:I

    return v0
.end method
