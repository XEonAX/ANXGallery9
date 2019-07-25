.class Lcom/miui/gallery/ui/RecommendFacePageFragment$3;
.super Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;
.source "RecommendFacePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/RecommendFacePageFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;Lcom/miui/gallery/ui/BaseMediaFragment;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$3;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-direct {p0, p2, p3, p4}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;-><init>(Lcom/miui/gallery/ui/BaseMediaFragment;Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public getColumnsCount()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method protected getLayoutId()I
    .locals 1

    const v0, 0x7f0b0121

    return v0
.end method

.method public getRowsCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method
