.class Lcom/miui/gallery/provider/MediaSortDateHelper$SingletonHolder;
.super Ljava/lang/Object;
.source "MediaSortDateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/MediaSortDateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonHolder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/MediaSortDateHelper;->access$000()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/MediaSortDateHelper$SingletonHolder;->INSTANCE:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    return-void
.end method
